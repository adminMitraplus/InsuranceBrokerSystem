$PBExportHeader$w_m_jabatan_edit.srw
forward
global type w_m_jabatan_edit from w_input
end type
end forward

global type w_m_jabatan_edit from w_input
integer width = 1806
integer height = 460
string title = "Input Master Produk"
end type
global w_m_jabatan_edit w_m_jabatan_edit

on w_m_jabatan_edit.create
int iCurrent
call super::create
end on

on w_m_jabatan_edit.destroy
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
//If ValueInterLocal = Failure  Then 
//	ValueInterLocal = Success
//     Return Failure
//End If
//
Return AncestorReturnValue


end event

event ue_presave;call super::ue_presave;String ls_no_npwp
String ls_primary
String ls_nm_jabatan
Long ll_count

Dw_1.Accepttext()

ls_primary = trim(dw_1.getitemstring(dw_1.getrow(),"kd_jabatan"))
ls_nm_jabatan = trim(dw_1.getitemstring(dw_1.getrow(),"nm_jabatan"))

Select Count(1)
Into:ll_count
From m_jabatan
Where m_jabatan.nm_jabatan =:ls_nm_jabatan And
		  m_jabatan.kd_jabatan <>:ls_primary;
		  
If ll_count<> 0 Then 
	MessageBox("Informasi","Data "+ls_nm_jabatan+" sudah ada pada database!",Information!)
	Return Failure
End If		  
		  
Return AncestorReturnValue		  
end event

type dw_1 from w_input`dw_1 within w_m_jabatan_edit
integer width = 1797
integer height = 284
string title = "INPUT MASTER PRODUK"
string dataobject = "d_m_jabatan_edit"
end type

event dw_1::ue_preconstructor;call super::ue_preconstructor;istr_dddw[1].ss_buttonname = "cb_kd_bisnis"
istr_dddw[1].ss_columnfrom = "kd_bisnis|nm_bisnis"
istr_dddw[1].ss_columnto = "kd_bisnis|kd_bisnis_txt"
istr_dddw[1].ss_dddwname = "dddw_m_bisnis"
istr_dddw[1].ss_tag = "w_m_bisnis_edit|m_bisnis"
istr_dddw[1].ss_where = ""
end event

type uo_1 from w_input`uo_1 within w_m_jabatan_edit
end type

