$PBExportHeader$u_cst_m_bank.sru
forward
global type u_cst_m_bank from u_cst_tabpage_1dw
end type
end forward

global type u_cst_m_bank from u_cst_tabpage_1dw
end type
global u_cst_m_bank u_cst_m_bank

on u_cst_m_bank.create
int iCurrent
call super::create
end on

on u_cst_m_bank.destroy
call super::destroy
end on

type uo_1_alt from u_cst_tabpage_1dw`uo_1_alt within u_cst_m_bank
end type

type dw_1 from u_cst_tabpage_1dw`dw_1 within u_cst_m_bank
string dataobject = "d_m_bank"
string windowedit = "w_m_bank_edit"
string tableedit = "m_bank"
end type

event dw_1::ue_retrieve;call super::ue_retrieve;of_retrieve()
end event

type uo_1 from u_cst_tabpage_1dw`uo_1 within u_cst_m_bank
end type

type dw_1_search from u_cst_tabpage_1dw`dw_1_search within u_cst_m_bank
end type

