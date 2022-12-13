$PBExportHeader$w_m_security_access_3_edit.srw
forward
global type w_m_security_access_3_edit from w_input
end type
end forward

global type w_m_security_access_3_edit from w_input
integer width = 2121
integer height = 524
end type
global w_m_security_access_3_edit w_m_security_access_3_edit

on w_m_security_access_3_edit.create
int iCurrent
call super::create
end on

on w_m_security_access_3_edit.destroy
call super::destroy
end on

event ue_presave;call super::ue_presave;String ls_access
String ls_primary_key
String ls_header
Long ll_count

ls_access = dw_1.Getitemstring(1,"kd_menu")
ls_header= dw_1.Getitemstring(1,"kd_security_access_2_sys")
ls_primary_key= dw_1.Getitemstring(1,"kd_security_access_3_sys")

Select Count(1)
Into:ll_count
From m_security_access_3_sys
Where m_security_access_3_sys.kd_menu =:ls_access And m_security_access_3_sys.kd_security_access_3_sys <>:ls_primary_key And m_security_access_3_sys.kd_security_access_2_sys =:ls_header;
																	  
If ll_count <> 0  Then 
	MessageBox("Informasi","Security access untuk menu ini sudah di setting!",Information!)
	Return Failure
End IF

Return AncestorReturnValue
end event

type dw_1 from w_input`dw_1 within w_m_security_access_3_edit
integer width = 2112
integer height = 348
string dataobject = "d_security_access_3_edit"
end type

event dw_1::ue_postadd;call super::ue_postadd;This.setitem(This.getrow(),'kd_security_access_2_sys',istr_generic.ss_string1)
This.setitem(This.getrow(),'hak_akses',"Dataview")
end event

type uo_1 from w_input`uo_1 within w_m_security_access_3_edit
end type

