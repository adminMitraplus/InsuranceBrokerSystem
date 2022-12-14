$PBExportHeader$u_cst_m_login_password.sru
forward
global type u_cst_m_login_password from u_cst_tabpage_1dw
end type
type st_1 from statictext within u_cst_m_login_password
end type
end forward

global type u_cst_m_login_password from u_cst_tabpage_1dw
integer width = 631
integer height = 616
st_1 st_1
end type
global u_cst_m_login_password u_cst_m_login_password

on u_cst_m_login_password.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_m_login_password.destroy
call super::destroy
destroy(this.st_1)
end on

type uo_1_alt from u_cst_tabpage_1dw`uo_1_alt within u_cst_m_login_password
end type

type dw_1 from u_cst_tabpage_1dw`dw_1 within u_cst_m_login_password
string tag = "Login"
integer y = 216
integer width = 640
integer height = 404
string title = "MASTER LOGIN PASSWORD"
string dataobject = "d_m_login_password"
string windowedit = "w_m_login_password_edit"
string tableedit = "m_login"
end type

event dw_1::ue_retrieve;call super::ue_retrieve;If  f_security_access(gs_kd_user,dw_1.tag,'Menu') = "Fullaccess" Then  
	of_retrieve()
Else
	of_retrieve(gs_kd_user)
End If
 
 
end event

event dw_1::ue_postconstructor;call super::ue_postconstructor;string ls_password, ls_kd_karyawan
long ll_row,ll_row_count
n_cryptoapi luo_crypt

//dw_1.retrieve()
ll_row_count = dw_1.rowcount()

if dw_1.rowcount() > 0 then
	for ll_row = 1 to dw_1.rowcount()
		ls_password = dw_1.getitemstring(ll_row, 'password')
		ls_kd_karyawan = dw_1.getitemstring(ll_row,'kd_karyawan')
		luo_crypt.iCryptoProvider = "Microsoft Strong Cryptographic Provider"
		dw_1.setitem(ll_row,'dekrypt_password_txt',luo_crypt.of_decrypt(ls_password, ls_kd_karyawan))
	next
end if
end event

event dw_1::ue_preconstructor;call super::ue_preconstructor;If  f_security_access(gs_kd_user,dw_1.tag,'Menu') <> "Fullaccess" Then 
	This.DataObject = "d_m_login_password_user"
End If
end event

event dw_1::ue_preedit;call super::ue_preedit;String ls_nm_karyawan
String ls_lname_emp,ls_confirm
Long ll_nbr, ll_foundrow

If gs_kd_user <> gs_user_admin Then
	If wordcap(dw_1.GetitemString(dw_1.Getrow(),"nm_login")) = "Admin"Or wordcap(dw_1.GetitemString(dw_1.Getrow(),"nm_login")) = "Administrator" Then
			MessageBox("Informasi","Administrator tidak bisa di edit!")
			Return Failure
	End If
	
	Open(w_confirm_pass)
	
	ls_confirm = Message.Stringparm
	
	If ls_confirm <> 'Success' Then Return Failure

End If
end event

event dw_1::ue_predelete;call super::ue_predelete;String ls_nm_karyawan
String ls_lname_emp,ls_confirm
Long ll_nbr, ll_foundrow

If gs_kd_user <> gs_user_admin Then
	If wordcap(dw_1.GetitemString(dw_1.Getrow(),"nm_login")) = "Admin"Or wordcap(dw_1.GetitemString(dw_1.Getrow(),"nm_login")) = "Administrator" Then
			MessageBox("Informasi","Administrator tidak bisa di delete!")
			Return Failure
	End If
End If
end event

type uo_1 from u_cst_tabpage_1dw`uo_1 within u_cst_m_login_password
integer y = 116
end type

type dw_1_search from u_cst_tabpage_1dw`dw_1_search within u_cst_m_login_password
end type

type st_1 from statictext within u_cst_m_login_password
integer x = 23
integer y = 36
integer width = 466
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Open Sans Semibold"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 24207700
string text = "Change Password"
boolean focusrectangle = false
end type

event clicked;String ls_lname_emp,ls_confirm

Long ll_nbr, ll_foundrow

ll_nbr = dw_1.RowCount()
 
ll_foundrow = dw_1.Find( "kd_karyawan = '" + gs_kd_user + "'", 1, ll_nbr)

dw_1.event ue_edit(ll_foundrow)
end event

