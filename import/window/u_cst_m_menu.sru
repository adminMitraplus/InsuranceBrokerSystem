$PBExportHeader$u_cst_m_menu.sru
forward
global type u_cst_m_menu from u_cst_tabpage_2dw
end type
end forward

global type u_cst_m_menu from u_cst_tabpage_2dw
integer width = 1358
integer height = 1656
end type
global u_cst_m_menu u_cst_m_menu

type variables

end variables

on u_cst_m_menu.create
int iCurrent
call super::create
end on

on u_cst_m_menu.destroy
call super::destroy
end on

type uo_2 from u_cst_tabpage_2dw`uo_2 within u_cst_m_menu
integer x = 0
integer y = 420
end type

event uo_2::constructor;call super::constructor; uo_2.of_SetEnabled("Add", False)
 
 
end event

type dw_2 from u_cst_tabpage_2dw`dw_2 within u_cst_m_menu
integer y = 520
integer width = 1362
integer height = 1140
string dataobject = "d_m_menu"
string windowedit = "w_m_menu_edit"
string tableedit = "m_menu"
end type

event dw_2::ue_preconstructor;call super::ue_preconstructor;of_SetMaster(dw_1, "kd_modul")
end event

event dw_2::ue_preadd;call super::ue_preadd;If dw_1.Rowcount() = 0 Then
	MessageBox("Informasi","Harap isi header terlebih dahulu!",Information!)
	Return Failure
End If


istr_generic.ss_string1 =dw_1.GetItemString(dw_1.Getrow(), "kd_modul")
istr_generic.ss_string2 = dw_1.GetItemString(dw_1.Getrow(), "nm_modul")

Return AncestorReturnValue
end event

type dw_2_search from u_cst_tabpage_2dw`dw_2_search within u_cst_m_menu
end type

type dw_1_search from u_cst_tabpage_2dw`dw_1_search within u_cst_m_menu
end type

type uo_1 from u_cst_tabpage_2dw`uo_1 within u_cst_m_menu
integer x = 0
end type

type dw_1 from u_cst_tabpage_2dw`dw_1 within u_cst_m_menu
string tag = "Polis Induk Coas"
integer width = 1362
integer height = 320
string title = "MODUL"
string dataobject = "d_m_modul"
string windowedit = "w_m_modul_edit"
string tableedit = "m_modul"
end type

event dw_1::ue_retrieve;call super::ue_retrieve;of_retrieve()
end event

