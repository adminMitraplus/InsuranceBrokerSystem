$PBExportHeader$u_cst_m_user_akses.sru
forward
global type u_cst_m_user_akses from u_cst_tabpage_1dw
end type
end forward

global type u_cst_m_user_akses from u_cst_tabpage_1dw
end type
global u_cst_m_user_akses u_cst_m_user_akses

type variables

end variables

on u_cst_m_user_akses.create
int iCurrent
call super::create
end on

on u_cst_m_user_akses.destroy
call super::destroy
end on

type dw_1 from u_cst_tabpage_1dw`dw_1 within u_cst_m_user_akses
string title = "MASTER USER AKSES"
string dataobject = "d_m_user_akses"
string windowedit = "w_m_user_akses_edit"
string tableedit = "m_user_akses"
end type

event dw_1::ue_retrieve;call super::ue_retrieve;of_retrieve()
end event

event dw_1::ue_delete;call super::ue_delete;String ActionInterLocal ="D|"
DataWindow adw_data[]
n_interlocal ln_interlocal

This.Accepttext()

adw_data ={dw_1}

ActionInterLocal +=String(This.Getrow())

ln_interlocal = Create n_interlocal

ln_interlocal.of_dispatchinterlocal(ActionInterLocal,adw_data)

Destroy ln_interlocal

If f_cek_valueinterlocal() = Failure Then Return Failure

Return AncestorReturnValue

end event

type uo_1 from u_cst_tabpage_1dw`uo_1 within u_cst_m_user_akses
end type

type dw_1_search from u_cst_tabpage_1dw`dw_1_search within u_cst_m_user_akses
end type

