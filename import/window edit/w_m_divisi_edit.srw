$PBExportHeader$w_m_divisi_edit.srw
forward
global type w_m_divisi_edit from w_input
end type
end forward

global type w_m_divisi_edit from w_input
integer width = 1394
integer height = 460
string title = "Input Kurs"
end type
global w_m_divisi_edit w_m_divisi_edit

on w_m_divisi_edit.create
int iCurrent
call super::create
end on

on w_m_divisi_edit.destroy
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
//
Return AncestorReturnValue

end event

event ue_presave;call super::ue_presave;String ls_primary
String ls_divisi
Long ll_count

ls_primary = trim(dw_1.getitemstring(dw_1.getrow(),"kd_divisi"))
ls_divisi = trim(dw_1.getitemstring(dw_1.getrow(),"nm_divisi"))

Select Count(1)
Into:ll_count
From m_divisi
Where m_divisi.nm_divisi =:ls_divisi And
		  m_divisi.kd_divisi <>:ls_primary;
		  
If ll_count<> 0 Then 
	MessageBox("Informasi","Data "+ls_divisi+" sudah ada pada database!",Information!)
	Return Failure
End If

Return AncestoRreturnvalue
end event

type dw_1 from w_input`dw_1 within w_m_divisi_edit
integer width = 1385
integer height = 288
string dataobject = "d_m_divisi_edit"
boolean setupdatesyntax = false
end type

event dw_1::ue_postadd;call super::ue_postadd;this.setitem(1,'status','T')
end event

type uo_1 from w_input`uo_1 within w_m_divisi_edit
end type

