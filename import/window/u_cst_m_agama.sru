$PBExportHeader$u_cst_m_agama.sru
forward
global type u_cst_m_agama from u_cst_tabpage_1dw
end type
end forward

global type u_cst_m_agama from u_cst_tabpage_1dw
integer width = 649
integer height = 340
end type
global u_cst_m_agama u_cst_m_agama

on u_cst_m_agama.create
int iCurrent
call super::create
end on

on u_cst_m_agama.destroy
call super::destroy
end on

type uo_1_alt from u_cst_tabpage_1dw`uo_1_alt within u_cst_m_agama
end type

type dw_1 from u_cst_tabpage_1dw`dw_1 within u_cst_m_agama
string tag = "Agama"
integer width = 654
integer height = 236
string title = "MASTER AGAMA"
string dataobject = "d_m_agama"
string windowedit = "w_m_agama_edit"
string tableedit = "m_agama"
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

type uo_1 from u_cst_tabpage_1dw`uo_1 within u_cst_m_agama
end type

type dw_1_search from u_cst_tabpage_1dw`dw_1_search within u_cst_m_agama
end type

