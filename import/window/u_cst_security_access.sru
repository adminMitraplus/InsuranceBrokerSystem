$PBExportHeader$u_cst_security_access.sru
forward
global type u_cst_security_access from u_cst_tabpage_3dw
end type
end forward

global type u_cst_security_access from u_cst_tabpage_3dw
integer width = 645
integer height = 2852
end type
global u_cst_security_access u_cst_security_access

on u_cst_security_access.create
int iCurrent
call super::create
end on

on u_cst_security_access.destroy
call super::destroy
end on

type uo_3_alt from u_cst_tabpage_3dw`uo_3_alt within u_cst_security_access
end type

type uo_1_alt from u_cst_tabpage_3dw`uo_1_alt within u_cst_security_access
end type

type uo_2_alt from u_cst_tabpage_3dw`uo_2_alt within u_cst_security_access
end type

type dw_3_search from u_cst_tabpage_3dw`dw_3_search within u_cst_security_access
integer y = 1392
end type

type uo_3 from u_cst_tabpage_3dw`uo_3 within u_cst_security_access
integer y = 1292
end type

event uo_3::constructor;call super::constructor; uo_3.of_SetEnabled("Add", False)
end event

type uo_2 from u_cst_tabpage_3dw`uo_2 within u_cst_security_access
integer y = 648
end type

type dw_2 from u_cst_tabpage_3dw`dw_2 within u_cst_security_access
integer y = 748
integer width = 3986
integer height = 544
string dataobject = "d_security_access_2"
string windowedit = "w_m_security_access_2_edit"
string tableedit = "m_security_access_2_sys"
end type

event dw_2::ue_preadd;call super::ue_preadd;If dw_1.Rowcount() = 0 Then
	MessageBox("Informasi","Harap isi header terlebih dahulu!",Information!)
	Return Failure
End If

istr_generic.ss_string1 = dw_1.GetItemString(dw_1.Getrow(), "kd_security_access_1")
istr_generic.ss_string2 = dw_1.GetItemString(dw_1.Getrow(), "no_security_access")

Return AncestorReturnValue
end event

event dw_2::ue_preconstructor;call super::ue_preconstructor;of_SetMaster(dw_1, "kd_security_access_1_sys")
end event

type dw_2_search from u_cst_tabpage_3dw`dw_2_search within u_cst_security_access
integer y = 748
end type

type dw_1 from u_cst_tabpage_3dw`dw_1 within u_cst_security_access
string tag = "Security Access"
integer width = 3986
integer height = 544
string title = "SECURITY ACCESS"
string dataobject = "d_security_access_1"
string windowedit = "w_m_security_access_1_edit"
string tableedit = "m_security_access_1_sys"
end type

event dw_1::ue_retrieve;call super::ue_retrieve;of_retrieve()
end event

event dw_1::clicked;call super::clicked;String ls_dwo

This.accepttext()

ls_dwo = dwo.name

If This.Rowcount() = 0 Then Return

istr_generic.ss_string1= This.Getitemstring(this.getrow(),"kd_security_access_1_sys")
istr_generic.ss_string2= This.Getitemstring(this.getrow(),"m_karyawan_txt")

If ls_dwo = "hl_inherit" Then 
	Openwithparm(w_inherit_as,istr_generic)
	of_retrieve()
End IF
end event

event dw_1::ue_retrieveend;call super::ue_retrieveend;uo_2.of_setenabled("Add",False) 
uo_3.of_setenabled("Add",False) 
dw_2.Modify("cb_delete.enabled = False ")
dw_3.Modify("cb_delete.enabled = False ")
end event

type uo_1 from u_cst_tabpage_3dw`uo_1 within u_cst_security_access
end type

type dw_1_search from u_cst_tabpage_3dw`dw_1_search within u_cst_security_access
end type

type dw_3 from u_cst_tabpage_3dw`dw_3 within u_cst_security_access
integer y = 1392
integer width = 3986
integer height = 1496
string dataobject = "d_security_access_3"
string windowedit = "w_m_security_access_3_edit"
string tableedit = "m_security_access_3_sys"
end type

event dw_3::ue_preconstructor;call super::ue_preconstructor;of_SetMaster(dw_2, "kd_security_access_2_sys")
end event

event dw_3::ue_preadd;call super::ue_preadd;If dw_2.Rowcount() = 0 Then
	MessageBox("Informasi","Harap isi header terlebih dahulu!",Information!)
	Return Failure
End If

istr_generic.ss_string1 = dw_2.GetItemString(dw_1.Getrow(), "kd_security_access_2")

Return AncestorReturnvalue
end event

