$PBExportHeader$w_m_agama_edit.srw
forward
global type w_m_agama_edit from w_input
end type
end forward

global type w_m_agama_edit from w_input
integer width = 1614
integer height = 580
string title = "Input Agama"
end type
global w_m_agama_edit w_m_agama_edit

on w_m_agama_edit.create
int iCurrent
call super::create
end on

on w_m_agama_edit.destroy
call super::destroy
end on

event ue_update;call super::ue_update;//Datawindow adw_data[]
//n_interlocal ln_interlocal
//
//ln_interlocal = Create n_interlocal
//
//adw_data = {dw_1}
//
//ln_interlocal.of_DispatchInterlocal(ActionInterLocal,adw_data)
//
//Destroy ln_interlocal
//
//If f_cek_valueinterlocal() = Failure Then Return Failure

Return AncestorReturnValue

end event

type dw_1 from w_input`dw_1 within w_m_agama_edit
integer width = 1605
string dataobject = "d_m_agama_edit"
boolean setupdatesyntax = false
end type

type uo_1 from w_input`uo_1 within w_m_agama_edit
end type

