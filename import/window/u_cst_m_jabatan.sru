$PBExportHeader$u_cst_m_jabatan.sru
forward
global type u_cst_m_jabatan from u_cst_tabpage_1dw
end type
end forward

global type u_cst_m_jabatan from u_cst_tabpage_1dw
integer width = 645
integer height = 348
end type
global u_cst_m_jabatan u_cst_m_jabatan

on u_cst_m_jabatan.create
int iCurrent
call super::create
end on

on u_cst_m_jabatan.destroy
call super::destroy
end on

type dw_1 from u_cst_tabpage_1dw`dw_1 within u_cst_m_jabatan
string tag = "Jabatan"
integer width = 645
integer height = 248
string title = "MASTER AGAMA"
string dataobject = "d_m_jabatan"
string windowedit = "w_m_jabatan_edit"
string tableedit = "m_jabatan"
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

If ValueInterLocal = Failure Then 
	ValueInterLocal = Success
	Return Failure
End If

Return AncestorReturnValue

end event

type uo_1 from u_cst_tabpage_1dw`uo_1 within u_cst_m_jabatan
end type

type dw_1_search from u_cst_tabpage_1dw`dw_1_search within u_cst_m_jabatan
end type

