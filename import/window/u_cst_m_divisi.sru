$PBExportHeader$u_cst_m_divisi.sru
forward
global type u_cst_m_divisi from u_cst_tabpage_1dw
end type
end forward

global type u_cst_m_divisi from u_cst_tabpage_1dw
integer width = 626
integer height = 364
end type
global u_cst_m_divisi u_cst_m_divisi

on u_cst_m_divisi.create
int iCurrent
call super::create
end on

on u_cst_m_divisi.destroy
call super::destroy
end on

type uo_1_alt from u_cst_tabpage_1dw`uo_1_alt within u_cst_m_divisi
end type

type dw_1 from u_cst_tabpage_1dw`dw_1 within u_cst_m_divisi
string tag = "Divisi"
integer width = 631
integer height = 268
string title = "MASTER BISNIS"
string dataobject = "d_m_divisi"
string windowedit = "w_m_divisi_edit"
string tableedit = "m_divisi"
end type

event dw_1::ue_retrieve;call super::ue_retrieve; of_retrieve()
end event

event dw_1::ue_deletebefore;call super::ue_deletebefore;String ActionInterLocal ="D|"
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

type uo_1 from u_cst_tabpage_1dw`uo_1 within u_cst_m_divisi
integer width = 622
end type

type dw_1_search from u_cst_tabpage_1dw`dw_1_search within u_cst_m_divisi
end type

