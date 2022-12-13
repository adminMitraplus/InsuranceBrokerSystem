$PBExportHeader$w_m_security_access_2_edit.srw
forward
global type w_m_security_access_2_edit from w_input
end type
end forward

global type w_m_security_access_2_edit from w_input
integer width = 2121
integer height = 620
end type
global w_m_security_access_2_edit w_m_security_access_2_edit

on w_m_security_access_2_edit.create
int iCurrent
call super::create
end on

on w_m_security_access_2_edit.destroy
call super::destroy
end on

event ue_presave;call super::ue_presave;String ls_access
String ls_aplikasi
String ls_kd_header
Long ll_count

dw_1.Accepttext()

ls_kd_header = dw_1.Getitemstring(1,"kd_security_access_1_sys")
ls_access = dw_1.Getitemstring(1,"kd_security_access_2_sys")
ls_aplikasi = dw_1.Getitemstring(1,"kd_modul")

Select Count(1)
Into:ll_count
From m_security_access_2_sys
Where m_security_access_2_sys.kd_modul =:ls_aplikasi And
		 m_security_access_2_sys.kd_security_access_1_sys =:ls_kd_header And m_security_access_2_sys.kd_security_access_2_sys <>:ls_access ;
													  
If ll_count <> 0  Then 
	MessageBox("Informasi","Security access sudah di setting!",Information!)
	Return Failure
End IF

Return AncestorReturnValue
end event

type dw_1 from w_input`dw_1 within w_m_security_access_2_edit
integer width = 2112
integer height = 440
string dataobject = "d_security_access_2_edit"
end type

event dw_1::ue_postadd;call super::ue_postadd;This.setitem(This.getrow(),'kd_security_access_1_sys',istr_generic.ss_string1)
This.setitem(This.getrow(),'kd_security_access_1_sys_txt',istr_generic.ss_string2)
This.setitem(This.getrow(),'hak_akses','Deny')
end event

type uo_1 from w_input`uo_1 within w_m_security_access_2_edit
end type

