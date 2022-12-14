$PBExportHeader$w_m_login_password_edit.srw
forward
global type w_m_login_password_edit from w_input
end type
type dw_2 from datawindow within w_m_login_password_edit
end type
end forward

global type w_m_login_password_edit from w_input
integer width = 1751
integer height = 616
string title = "Input Master Produk"
dw_2 dw_2
end type
global w_m_login_password_edit w_m_login_password_edit

type variables
integer ii_index

string is_action
string is_password_ori
end variables

on w_m_login_password_edit.create
int iCurrent
call super::create
this.dw_2=create dw_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
end on

on w_m_login_password_edit.destroy
call super::destroy
destroy(this.dw_2)
end on

event ue_update;call super::ue_update;Datawindow adw_data[]
n_interlocal ln_interlocal

ln_interlocal = Create n_interlocal

adw_data = {dw_1}

ln_interlocal.of_DispatchInterlocal(ActionInterLocal,adw_data)

Destroy ln_interlocal

If f_cek_valueinterlocal() = Failure Then Return Failure

Return AncestorReturnValue

end event

event ue_save;// =============================================
// Author			: Mr. Harianto ( Programmer Sejati )
// Create date	: 11/9/2011
// Description	: ue_save Window Script
// =============================================
Datetime ldt_today
Integer li_msgbox
String ls_kd_karyawan
String ls_kd_login
String ls_nm_login
String ls_password
String ls_password_decrypted
String ls_password_encrypted
String ls_sql
n_cryptoapi luo_crypt
n_cst_string lnv_string
DWItemStatus ldw_status

ldt_today = f_Get_Server_Date()
		
dw_1.AcceptText()

If f_cek_required(dw_1) = -1 Then Return -1

If this.Event ue_presave() = -1 Then Return -1

li_msgbox = MessageBox("Konfirmasi", "Simpan Data ?", Question!, OKCancel!, 2)

If li_msgbox = 2 Then Return -1

ldw_status = dw_1.GetItemStatus(1, 0, Primary!)
	
If ldw_status = New! Or ldw_status = NewModified! Then
	f_get_pk("m_login", ls_kd_login)
Else
	ls_kd_login = dw_1.GetItemString(1, "kd_user")
End If

ls_kd_karyawan = dw_1.GetItemString(1, "kd_karyawan")
ls_nm_login = Trim(dw_1.GetItemString(1, "nm_login"))
ls_password = dw_1.GetItemString(1, "password")

luo_crypt.iCryptoProvider = "Microsoft Strong Cryptographic Provider"
ls_password_encrypted = luo_crypt.of_Encrypt(ls_password, String(ldt_today, "yyyymmddhhmmss"))	
ls_password_decrypted = luo_crypt.of_Decrypt(ls_password_encrypted, String(ldt_today, "yyyymmddhhmmss"))

Do While ls_password_decrypted <> ls_password
	ldt_today = f_get_server_date()
	
	ls_password_encrypted = luo_crypt.of_Encrypt(ls_password, String(ldt_today, "yyyymmddhhmmss"))
	ls_password_decrypted = luo_crypt.of_Decrypt(ls_password_encrypted, String(ldt_today, "yyyymmddhhmmss"))
Loop

ls_password_encrypted = lnv_string.of_globalreplace(ls_password_encrypted, "'", "''")

Execute Immediate "Begin Transaction";

If ldw_status = New! Or ldw_status = NewModified! Then
	ls_sql = " Insert Into m_login " + &
				" ( kd_user, kd_karyawan, nm_login, password, kd_user_input, tgl_input, kd_user_update, tgl_update, status ) Values " + &
				" ( '" + ls_kd_login + "', '" + ls_kd_karyawan + "', '" + ls_nm_login + "', '" + ls_password_encrypted + "', '" + gs_kd_user + "', '" + string(ldt_today) + "', '" + gs_kd_user + "', '" + string(ldt_today) + "','T' ) "
				
	Execute Immediate :ls_sql;
	
	If f_cek_sqlcode(ls_sql, sqlca) = -1 Then Return -1
Else
	ls_sql = " Update m_login Set " + &
					" nm_login = '" + ls_nm_login + "', " + &
					" password = '" + ls_password_encrypted + "', " + &
					" kd_karyawan = '" + ls_kd_karyawan + "', " + &
					" kd_user_update = '" + gs_kd_user + "', " + &
					" tgl_update = '" + string(ldt_today) + "' " + &
				" Where kd_user = '" + ls_kd_login + "'"
				
	Execute Immediate :ls_sql;
	
	If f_cek_sqlcode(ls_sql, sqlca) = -1 Then Return -1
End If

Execute Immediate "Commit Transaction";

Commit Using SQLCA;

MessageBox('Informasi', 'Data Telah Tersimpan.', Information!)

Return Success
end event

type dw_1 from w_input`dw_1 within w_m_login_password_edit
integer width = 1737
integer height = 432
string title = "INPUT MASTER LOGIN"
string dataobject = "d_m_login_password_edit"
boolean controlmenu = true
end type

event dw_1::ue_preconstructor;call super::ue_preconstructor;istr_dddw[1].ss_buttonname = "cb_kd_karyawan"
istr_dddw[1].ss_columnfrom = "kd_karyawan|nm_karyawan"
istr_dddw[1].ss_columnto = "kd_karyawan|kd_karyawan_txt"
istr_dddw[1].ss_dddwname = "dddw_m_karyawan"
istr_dddw[1].ss_tag = ""
istr_dddw[1].ss_where = ""
end event

event dw_1::ue_postedit;call super::ue_postedit;String ls_password, ls_kd_karyawan,ls_access,ls_real_password_decrypted
Long ll_row,ll_row_count
DateTime ldt_tgl_update
n_cryptoapi luo_crypt

ls_access = f_security_access(gs_kd_user,'Login','Menu')

If ls_access = "Fullaccess" Then 
	ls_password = dw_1.getitemstring(1, 'password')
	ls_kd_karyawan = dw_1.getitemstring(1,'kd_karyawan')
	ldt_tgl_update = dw_1.getitemdatetime(1,'tgl_update')
	luo_crypt.iCryptoProvider = "Microsoft Strong Cryptographic Provider"
	
	
	ls_real_password_decrypted = luo_crypt.of_decrypt(ls_password, String(ldt_tgl_update, "yyyymmddhhmmss"))

	dw_1.setitem(1,'password',ls_real_password_decrypted)
	
	dw_1.Modify("Password.Edit.Password=NO")
End If

end event

type uo_1 from w_input`uo_1 within w_m_login_password_edit
end type

type dw_2 from datawindow within w_m_login_password_edit
boolean visible = false
integer y = 548
integer width = 1403
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_login_web_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

