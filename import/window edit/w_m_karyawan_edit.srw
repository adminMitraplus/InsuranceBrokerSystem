$PBExportHeader$w_m_karyawan_edit.srw
forward
global type w_m_karyawan_edit from w_input
end type
end forward

global type w_m_karyawan_edit from w_input
integer width = 3867
integer height = 1812
string title = "MASTER KARYAWAN"
end type
global w_m_karyawan_edit w_m_karyawan_edit

on w_m_karyawan_edit.create
int iCurrent
call super::create
end on

on w_m_karyawan_edit.destroy
call super::destroy
end on

event ue_update;call super::ue_update;//Datawindow adw_data[]
//n_interlocal ln_interlocal
//
//ln_interlocal = Create n_interlocal
//
//adw_data = {dw_1}
//
//ln_interlocal.of_DispatchInterlocal(ActionInterLocal,adw_data)
//
//Destroy ln_interlocal
//
//If f_cek_valueinterlocal() = Failure Then Return Failure

Datetime ldt_today
String ls_kd_karyawan
String ls_kd_security_access_1
String ls_kd_security_access_login
String ls_sql
dwItemStatus ldw_status

ldw_status = dw_1.GetItemStatus(1, 0, Primary!)

// untuk keperluan GL
If ldw_status = New! or ldw_status = NewModified! Then
	ldt_today = f_Get_Server_Date()
	
	f_get_pk("m_security_access_login", ls_kd_security_access_login)
	ls_kd_karyawan = dw_1.GetItemString(1, "kd_karyawan")
	
	Select kd_security_access_1
	Into :ls_kd_security_access_1
	From m_security_access_1
	Where no_security_access = "<NONE>";
	
	If IsNull(ls_kd_security_access_1) or SQLCA.SQLCODE <> 0 Then ls_kd_security_access_1 = ""
	
	ls_sql = " Insert Into m_security_access_login " + &
				" ( kd_security_access_login, kd_security_access_1, kd_karyawan, kd_user_input, tgl_input, kd_user_update, tgl_update ) Values " + &
				" ( '" + ls_kd_security_access_login + "', '" + ls_kd_security_access_1 + "', '" + ls_kd_karyawan + "', '" + gs_kd_user + "', '" + string(ldt_today) + "', '" + gs_kd_user + "', '" + string(ldt_today) + "' ) "
				
	Execute Immediate :ls_sql;
	
	If f_cek_sqlcode(ls_sql, sqlca) = -1 Then Return -1
End If

Return AncestorReturnValue

end event

event ue_presave;call super::ue_presave;long ll_count

string ls_hp1
String ls_no_npwp
String ls_nm_karyawan
String ls_kd_karyawan
string ls_Kd_bank

dw_1.Accepttext()

ls_kd_karyawan = dw_1.Getitemstring(dw_1.Getrow(),"kd_karyawan")
ls_no_npwp = dw_1.Getitemstring(dw_1.Getrow(),"no_npwp")
ls_kd_bank = dw_1.getitemstring(dw_1.getrow(),'kd_bank')
ls_hp1 = trim(dw_1.getitemstring(1,'hp1'))

if ls_Kd_bank <> '' then
	if trim(dw_1.getitemstring(1,'no_rekening')) = '' then
		Messagebox('Informasi','No Rekening tidak boleh kosong !')
		return -1
	elseif trim(dw_1.getitemstring(1,'atas_nama')) = '' then
		Messagebox('Informasi','Atas Nama tidak boleh kosong !')
		return -1
	end if
end if

If ls_kd_karyawan = gs_user_admin Then 
	MessageBox("Informasi","Karyawan Admin atau Administrator tidak bisa di edit!",Information!)
	Return Failure
End If	

If ls_no_npwp <> "" And dw_1.Getitemstring(dw_1.getrow(),"nm_npwp")  = "" Then 
	MessageBox("Informasi","Nama NPWP Masih Kosong!",Information!)
	Return Failure
End If

If ls_no_npwp <> "" And dw_1.Getitemstring(dw_1.getrow(),"alamat_npwp")  = "" Then 
	MessageBox("Informasi","Alamat NPWP Masih Kosong!",Information!)
	Return Failure
End IF

If ls_no_npwp = "" And dw_1.Getitemstring(dw_1.getrow(),"alamat_npwp")  <> "" And dw_1.Getitemstring(dw_1.getrow(),"nm_npwp")  <> ""Then 
	MessageBox("Informasi","No NPWP Masih Kosong!",Information!)
	Return Failure
End IF

ls_nm_karyawan  = dw_1.Getitemstring(1,"nm_karyawan")
If wordcap(Trim(Left(ls_nm_karyawan,5)))  = "Admin" Then 
	MessageBox("Informasi","Tidak bisa input nama karyawan like %Admin%!",Information!)
	Return Failure
End If	

select count(1)
into :ll_count
from m_karyawan
where m_karyawan.nm_karyawan = :ls_nm_karyawan
	and m_karyawan.hp1 = :ls_hp1
	and m_karyawan.kd_karyawan <> :ls_Kd_karyawan;
	
if isnull(ll_count) or sqlca.sqlcode<> 0 then ll_Count = 0

if ll_Count > 0 then
	messagebox('Informasi','Karyawan ini sudah ada !')
	return -1
end if

Return AncestorReturnValue
end event

type dw_1 from w_input`dw_1 within w_m_karyawan_edit
integer width = 3849
integer height = 1628
string title = "INPUT MASTER KARYAWAN"
string dataobject = "d_m_karyawan_edit"
boolean setupdatesyntax = false
boolean setnodocument = true
string nodocument = "no_karyawan"
end type

event dw_1::ue_preconstructor;call super::ue_preconstructor;istr_dddw[1].ss_buttonname = "cb_kd_negara"
istr_dddw[1].ss_columnfrom = "kd_negara|nm_negara"
istr_dddw[1].ss_columnto = "kd_negara|kd_negara_txt"
istr_dddw[1].ss_dddwname = "dddw_m_negara"
istr_dddw[1].ss_tag = "w_m_negara_edit|m_negara"
istr_dddw[1].ss_where = ""

istr_dddw[2].ss_buttonname = "cb_kd_agama"
istr_dddw[2].ss_columnfrom = "kd_agama|nm_agama"
istr_dddw[2].ss_columnto = "kd_agama|kd_agama_txt"
istr_dddw[2].ss_dddwname = "dddw_m_agama"
istr_dddw[2].ss_tag = "w_m_agama_edit|m_agama"
istr_dddw[2].ss_where = ""

istr_dddw[3].ss_buttonname = "cb_kd_divisi"
istr_dddw[3].ss_columnfrom = "kd_divisi|nm_divisi"
istr_dddw[3].ss_columnto = "kd_divisi|kd_divisi_txt"
istr_dddw[3].ss_dddwname = "dddw_m_divisi"
istr_dddw[3].ss_tag = "w_m_divisi_edit|m_divisi"
istr_dddw[3].ss_where = ""

istr_dddw[4].ss_buttonname = "cb_kd_jabatan"
istr_dddw[4].ss_columnfrom = "kd_jabatan|nm_jabatan"
istr_dddw[4].ss_columnto = "kd_jabatan|kd_jabatan_txt"
istr_dddw[4].ss_dddwname = "dddw_m_jabatan"
istr_dddw[4].ss_tag = "w_m_jabatan_edit|m_jabatan"
istr_dddw[4].ss_where = ""

istr_dddw[5].ss_buttonname = "cb_kd_propinsi"
istr_dddw[5].ss_columnfrom = "kd_propinsi|nm_propinsi"
istr_dddw[5].ss_columnto = "kd_propinsi|kd_propinsi_txt"
istr_dddw[5].ss_dddwname = "dddw_m_propinsi"
istr_dddw[5].ss_tag = "w_m_propinsi_edit|m_propinsi"
istr_dddw[5].ss_where = ""

istr_dddw[6].ss_buttonname = "cb_kd_kota"
istr_dddw[6].ss_columnfrom = "kd_kota|nm_kota"
istr_dddw[6].ss_columnto = "kd_kota|kd_kota_txt"
istr_dddw[6].ss_dddwname = "dddw_m_kota"
istr_dddw[6].ss_tag = "w_m_kota_edit|m_kota"
istr_dddw[6].ss_where = ""

istr_dddw[7].ss_buttonname = "cb_kd_group_karyawan"
istr_dddw[7].ss_columnfrom = "kd_group_karyawan|nm_databank"
istr_dddw[7].ss_columnto = "kd_group_karyawan|nm_group_karyawan"
istr_dddw[7].ss_dddwname = "dddw_m_group_karyawan"
istr_dddw[7].ss_tag = ""
istr_dddw[7].ss_where = ""

istr_dddw[8].ss_buttonname = "cb_kd_bank"
istr_dddw[8].ss_columnfrom = "kd_bank|nm_bank"
istr_dddw[8].ss_columnto = "kd_bank|kd_bank_txt"
istr_dddw[8].ss_dddwname = "dddw_m_bank"
istr_dddw[8].ss_tag = "w_m_bank_edit|m_bank"
istr_dddw[8].ss_where = ""
end event

event dw_1::ue_postadd;call super::ue_postadd;//This.Setitem(This.getrow(),"kd_negara",f_setnone("m_negara"))
//This.Setitem(This.getrow(),"kd_negara_txt","(None)")
//
//This.Setitem(This.getrow(),"kd_propinsi",f_setnone("m_propinsi"))
//This.Setitem(This.getrow(),"kd_propinsi_txt","(None)")
// 
//This.Setitem(This.getrow(),"kd_kota",f_setnone("m_kota"))
//This.Setitem(This.getrow(),"kd_kota_txt","(None)")

This.Setitem(This.getrow(),"kd_agama",f_setnone("m_agama"))
This.Setitem(This.getrow(),"kd_agama_txt","(None)")

This.Setitem(This.getrow(),"kd_divisi",f_setnone("m_divisi"))
This.Setitem(This.getrow(),"kd_divisi_txt","(None)")

This.Setitem(This.getrow(),"kd_jabatan",f_setnone("m_jabatan"))
This.Setitem(This.getrow(),"kd_jabatan_txt","(None)")

This.Setitem(This.getrow(),"kd_cabang",f_setnone("m_cabang"))
This.Setitem(This.getrow(),"kd_cabang_txt","(None)")

//This.Setitem(This.getrow(),"kd_group_karyawan",f_setnone("m_group_karyawan"))
//This.Setitem(This.getrow(),"nm_group_karyawan","(None)")

This.Setitem(This.Getrow(),"tgl_lahir",f_get_server_date())
This.Setitem(This.Getrow(),"tgl_masuk",f_get_server_date())
end event

type uo_1 from w_input`uo_1 within w_m_karyawan_edit
end type

