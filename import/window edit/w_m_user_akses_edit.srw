$PBExportHeader$w_m_user_akses_edit.srw
forward
global type w_m_user_akses_edit from w_input
end type
end forward

global type w_m_user_akses_edit from w_input
integer width = 1742
integer height = 516
string title = "Input Agama"
end type
global w_m_user_akses_edit w_m_user_akses_edit

on w_m_user_akses_edit.create
int iCurrent
call super::create
end on

on w_m_user_akses_edit.destroy
call super::destroy
end on

event ue_update;call super::ue_update;Datawindow adw_data[]
n_interlocal ln_interlocal

ln_interlocal = Create n_interlocal

adw_data = {dw_1}

ln_interlocal.of_DispatchInterlocal(ActionInterLocal,adw_data)

Destroy ln_interlocal

If f_cek_valueinterlocal() = Failure Then Return Failure

Return AncestorReturnValue

end event

type dw_1 from w_input`dw_1 within w_m_user_akses_edit
integer width = 1728
integer height = 340
string dataobject = "d_m_user_akses_edit"
boolean setkduserinput = false
boolean setkduserupdate = false
boolean setupdatesyntax = false
end type

event dw_1::ue_preconstructor;call super::ue_preconstructor;istr_dddw[1].ss_buttonname = "cb_kd_group_karyawan"
istr_dddw[1].ss_columnfrom = "kd_group_karyawan|nm_databank"
istr_dddw[1].ss_columnto = "kd_group_karyawan|nm_databank"
istr_dddw[1].ss_dddwname = "dddw_m_group_karyawan"
istr_dddw[1].ss_tag = ""
istr_dddw[1].ss_where = ""

istr_dddw[2].ss_buttonname = "cb_kd_modul"
istr_dddw[2].ss_columnfrom = "kd_modul|nm_modul"
istr_dddw[2].ss_columnto = "kd_modul|nm_modul"
istr_dddw[2].ss_dddwname = "dddw_m_modul_web"
istr_dddw[2].ss_tag = ""
istr_dddw[2].ss_where = ""
end event

type uo_1 from w_input`uo_1 within w_m_user_akses_edit
end type

