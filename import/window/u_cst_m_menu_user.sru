$PBExportHeader$u_cst_m_menu_user.sru
forward
global type u_cst_m_menu_user from u_cst_tabpage_2dw
end type
type st_1 from statictext within u_cst_m_menu_user
end type
end forward

global type u_cst_m_menu_user from u_cst_tabpage_2dw
integer height = 632
st_1 st_1
end type
global u_cst_m_menu_user u_cst_m_menu_user

on u_cst_m_menu_user.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_m_menu_user.destroy
call super::destroy
destroy(this.st_1)
end on

type uo_2_alt from u_cst_tabpage_2dw`uo_2_alt within u_cst_m_menu_user
integer y = 368
end type

type uo_1_alt from u_cst_tabpage_2dw`uo_1_alt within u_cst_m_menu_user
end type

type uo_2 from u_cst_tabpage_2dw`uo_2 within u_cst_m_menu_user
integer y = 368
end type

type dw_2 from u_cst_tabpage_2dw`dw_2 within u_cst_m_menu_user
integer y = 468
string dataobject = "d_m_menu_user"
string windowedit = "w_m_menu_user_edit"
string tableedit = "m_menu_user"
end type

event dw_2::ue_preconstructor;call super::ue_preconstructor;of_setmaster(dw_1,'kd_karyawan')
end event

event dw_2::ue_preadd;call super::ue_preadd;string ls_kd_karyawan

if dw_1.getrow() = 0 then
	Messagebox('Informasi','Belum ada user yang dapat diberikan akses !')
	return -1
end if

ls_kd_karyawan = dw_1.getitemstring(dw_1.getrow(),'kd_karyawan')

istr_generic.ss_String1 = ls_Kd_karyawan

return 1
end event

event dw_2::ue_preedit;call super::ue_preedit;string ls_kd_karyawan
string ls_kd_menu_user

ls_kd_karyawan = dw_1.getitemstring(dw_1.getrow(),'kd_karyawan')
ls_kd_menu_user = this.getitemstring(al_row,'kd_menu_user')

istr_generic.ss_String1 = ls_kd_karyawan
istr_generic.ss_string2 = ls_kd_menu_user

return 1
end event

type dw_2_search from u_cst_tabpage_2dw`dw_2_search within u_cst_m_menu_user
integer y = 468
end type

type dw_1_search from u_cst_tabpage_2dw`dw_1_search within u_cst_m_menu_user
integer y = 204
end type

type uo_1 from u_cst_tabpage_2dw`uo_1 within u_cst_m_menu_user
integer y = 100
end type

type dw_1 from u_cst_tabpage_2dw`dw_1 within u_cst_m_menu_user
integer y = 204
string dataobject = "d_m_login_password"
string windowedit = "w_m_login_password_edit"
string tableedit = "m_login"
end type

event dw_1::ue_retrieve;call super::ue_retrieve;string ls_sqlselect


if Upper(gs_nm_user) = 'ADMIN' then
	of_retrieve()
else
	ls_sqlselect = dw_1.getsqlselect()
	dw_1.setsqlselect(ls_sqlselect + " And kd_karyawan = '"+gs_kd_user+"" )
end if

end event

event dw_1::ue_predelete;call super::ue_predelete;integer li_message

Long ll_nbr, ll_foundrow
long ll_count

String ls_nm_karyawan
String ls_lname_emp,ls_confirm
string ls_Kd_karyawan

//If gs_kd_user <> gs_user_admin Then
//	If wordcap(dw_1.GetitemString(al_row,"nm_login")) = "Admin"Or wordcap(dw_1.GetitemString(al_row,"nm_login")) = "Administrator" Then
//			MessageBox("Informasi","Administrator tidak bisa di delete!")
//			Return Failure
//	End If
//End If

ls_kd_karyawan = dw_1.getitemstring(al_row,'kd_karyawan')
If wordcap(dw_1.GetitemString(al_row,"nm_login")) = "Admin"Or wordcap(dw_1.GetitemString(al_row,"nm_login")) = "Administrator" Then
		MessageBox("Informasi","Administrator tidak bisa di delete!")
		Return Failure
End If

if gs_kd_user = gs_user_admin then
	li_message = Messagebox('Informasi','Apakah User ini akan di hapus ?')
	
	if li_message = 2 then return -1
end if

return 1
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

event dw_1::ue_deletebefore;call super::ue_deletebefore;long ll_count

string ls_kd_Karyawan
string ls_sql

ls_Kd_karyawan = dw_1.getitemstring(al_row,'kd_karyawan')

select count(*)
into :ll_count
from m_menu_user
where m_menu_user.kd_user = :ls_kd_karyawan;

if isnull(ll_count) or sqlca.sqlcode <> 0 then ll_count = 0

if ll_count > 0 then
	ls_Sql = " Delete from m_menu_user where kd_user = '"+ls_kd_karyawan+"'"
	Execute Immediate :ls_sql;
	
	if f_cek_sqlcode(ls_sql,sqlca) = -1 then return -1
	
end if

return 1
end event

type st_1 from statictext within u_cst_m_menu_user
integer x = 32
integer y = 16
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

