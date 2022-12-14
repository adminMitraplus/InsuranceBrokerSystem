$PBExportHeader$w_m_menu_user_edit.srw
forward
global type w_m_menu_user_edit from w_input_2dw
end type
type uo_2 from u_cst_toolbar within w_m_menu_user_edit
end type
end forward

global type w_m_menu_user_edit from w_input_2dw
integer width = 1829
uo_2 uo_2
end type
global w_m_menu_user_edit w_m_menu_user_edit

type variables
string is_kode[]
end variables
on w_m_menu_user_edit.create
int iCurrent
call super::create
this.uo_2=create uo_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_2
end on

on w_m_menu_user_edit.destroy
call super::destroy
destroy(this.uo_2)
end on

event ue_update;call super::ue_update;long ll_jml
long ll_rowcount

string ls_kd_karyawan
string ls_kd_menu
string ls_kd_menu_user
string ls_sql
string ls_kode

dw_1.accepttext()
dw_2.accepttext()

ls_kd_karyawan = dw_1.getitemstring(1,'kd_karyawan')

ll_rowcount = dw_2.rowcount()

if Upperbound(is_kode[]) <> 0 then
	for ll_jml = 1 to Upperbound(is_kode[])
		ls_Sql = " Delete m_menu_user where kd_menu_user = '"+is_kode[ll_jml]+"'"
		Execute Immediate :ls_sql;
		
		if f_cek_sqlcode(ls_sql,sqlca) = -1 then return -1
		
	next
	
end if

for ll_jml = 1 to ll_Rowcount
	ls_kode = dw_2.getitemstring(ll_jml,'kd_menu_user')
	ls_kd_menu = dw_2.getitemstring(ll_jml,'kd_menu')
	
	if isnull(ls_kode) then
		f_get_pk('m_menu_user',ls_kd_menu_user)
		
		ls_sql = " Insert into m_menu_user ( kd_menu_user, kd_user, kd_menu) "+&
					" Values ('"+ls_kd_menu_user+"','"+ls_kd_karyawan+"','"+ls_kd_menu+"' ) "
		Execute Immediate :ls_sql;
		
		if f_cek_sqlcode(ls_Sql,sqlca) = -1 then return -1
	else
		ls_sql = " Update m_menu_user set kd_menu = '"+ls_Kd_menu+"' where kd_menu_user = '"+ls_kode+"' "
		Execute Immediate :ls_sql;
		
		if f_cek_sqlcode(ls_sql,sqlca) = -1 then return -1
		
	end if
	
next

return 1
end event

event ue_updatedw;//
return 1
end event

event ue_presave;call super::ue_presave;long ll_jml
long ll_rowcount

string ls_kd_menu

dw_2.accepttext()

ll_rowcount = dw_2.rowcount()

for ll_jml = 1 to ll_rowcount
	ls_kd_menu = dw_2.getitemstring(ll_jml,'kd_menu')
	
	if isnull(ls_kd_menu) or ls_kd_menu = '' then
		Messagebox('Informasi','Ada Menu yang belum di pilih !')
		return -1
	end if
	
next

return 1
end event

type dw_2 from w_input_2dw`dw_2 within w_m_menu_user_edit
integer y = 460
integer width = 1815
integer height = 868
string dataobject = "d_m_menu_user_edit1"
boolean vscrollbar = true
end type

event dw_2::buttonclicked;call super::buttonclicked;integer li_message

string ls_Kd_menu_user

if dwo.name = 'cb_delete' then
	ls_Kd_menu_user = this.getitemstring(row,'kd_menu_user')
	
	if isnull(ls_Kd_menu_user) or ls_Kd_menu_user = '' then
		this.deleterow(row)
	else
		li_message = Messagebox('Konfirmasi','Apakah data akan dihapus ?',Question!,yesno!,2)
		
		if li_message = 2 then return
		
		is_kode[Upperbound(is_kode) + 1] = ls_Kd_menu_user
		
		this.deleterow(row)
	end if
	
end if

end event

event dw_2::clicked;call super::clicked;this.scrolltorow(row)
end event

event dw_2::ue_passparm;call super::ue_passparm;long ll_jml
long ll_count
long ll_pos
long ll_pos2

string ls_kd_menu
string ls_menu
string ls_menu2
string ls_return

ll_count = UpperBound(astr_generic.ss_stringarr1[])

for ll_jml = 1 to ll_count
	ls_return = astr_generic.ss_Stringarr1[ll_jml]
	
	ll_pos = Pos(ls_return,'|')
	ll_pos2 = LastPos(ls_return,'|')
	ls_kd_menu = left(ls_return,ll_pos - 1)
	ls_menu = mid(ls_return,ll_pos + 1,ll_pos2 - ll_pos - 1 )
	ls_menu2 = mid(ls_return,ll_pos2 + 1,len(ls_return) - ll_pos2 )
	
	this.setitem(dw_2.getrow(),'kd_menu',ls_kd_menu)
	this.setitem(dw_2.getrow(),'nm_menu',ls_menu)
	this.setitem(dw_2.getrow(),'nm_menu2',ls_menu2)
	
	if ll_jml <> ll_count then
		this.insertrow(0)
		this.scrolltorow(this.rowcount())
	end if
	
next
end event

event dw_2::ue_prebuttonclicked;call super::ue_prebuttonclicked;long ll_count
long ll_jml
long ll_rowcount

string ls_filter
string ls_kd_menu

ll_rowcount = this.rowcount()

if buttonname = 'cb_edit_option2' then
	for ll_jml = 1 to ll_rowcount
		ls_kd_menu = this.getitemstring(ll_jml,'kd_menu')
		if isnull(ls_kd_menu) then ls_kd_menu = ''
		
		if row <> ll_jml then
			if ll_jml = ll_rowcount then
				ls_filter += "'"+ls_kd_menu+"'"
			else
				ls_filter += "'"+ls_kd_menu+"',"
			end if
		else
			ls_filter +="''"
		end if
		
		istr_dddw[1].ss_where = " where kd_menu not in ( select kd_menu from m_menu_user ) And kd_menu not in ( "+ls_filter+" ) "
	next
	
end if


return 1
end event

event dw_2::ue_preconstructor;call super::ue_preconstructor;istr_dddw[1].ss_buttonname = "cb_edit_option2"
istr_dddw[1].ss_columnfrom = "kd_menu|nm_menu|nm_menulv2"
istr_dddw[1].ss_columnto = "kd_menu|nm_menu|nm_menu2"
istr_dddw[1].ss_dddwname = "dddw_m_menu_user_option"
istr_dddw[1].ss_tag = ""

end event

type dw_1 from w_input_2dw`dw_1 within w_m_menu_user_edit
integer width = 1815
integer height = 260
string dataobject = "d_m_data_user_edit"
end type

event dw_1::ue_postadd;call super::ue_postadd;string ls_kd_karyawan

ls_kd_karyawan = istr_generic.ss_String1

this.retrieve(ls_kd_karyawan)
end event

event dw_1::constructor;call super::constructor;dw_2.event constructor()
end event

event dw_1::ue_postedit;call super::ue_postedit;long ll_find

string ls_kd_karyawan
string ls_kd_menu_user
string ls_nm_menu

ls_kd_karyawan = istr_generic.ss_String1
ls_kd_menu_user = istr_generic.ss_String2

this.retrieve(ls_kd_karyawan)
dw_2.retrieve(ls_kd_karyawan)

ll_find = dw_2.find("kd_menu_user = '"+ls_kd_menu_user+"'",1,dw_2.rowcount())
ls_nm_menu = dw_2.getitemstring(ll_find,'nm_menu')
dw_2.scrolltorow(ll_find)
//dw_2.setcolumn('kd_customer_txt')
dw_2.setfocus()
dw_2.selecttext(1,len(ls_nm_menu))

end event

type uo_1 from w_input_2dw`uo_1 within w_m_menu_user_edit
end type

event uo_1::ue_postconstructor;call super::ue_postconstructor;dw_2.width = dw_1.width
uo_2.width = this.width
uo_2.x = this.x

end event

type uo_2 from u_cst_toolbar within w_m_menu_user_edit
integer y = 360
integer taborder = 50
boolean bringtotop = true
end type

on uo_2.destroy
call u_cst_toolbar::destroy
end on

event ue_preconstructor;call super::ue_preconstructor;uo_2.of_SetRedraw(False)
uo_2.of_AddItem('Add', 'Add', uo_2.Button, 'Add.png')
uo_2.of_SetTheme(uo_2.Blue)
uo_2.of_SetRedraw(True)
end event

event ue_buttonclicked;call super::ue_buttonclicked;string ls_kd_menu

if Upper(as_button) = 'ADD' then
	if dw_2.rowcount() <> 0 then
		ls_kd_menu = dw_2.getitemstring(dw_2.rowcount(),'kd_menu')

		if isnull(ls_kd_menu) or ls_kd_menu = '' then
			Messagebox('Informasi','Silahkan pilih menu terlebih dahulu !')
			return 
		end if
	end if
	
	dw_2.insertrow(0)
	dw_2.scrolltorow(dw_2.rowcount())
end if
end event

