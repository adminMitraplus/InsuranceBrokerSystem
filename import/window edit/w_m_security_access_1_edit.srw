$PBExportHeader$w_m_security_access_1_edit.srw
forward
global type w_m_security_access_1_edit from w_input
end type
end forward

global type w_m_security_access_1_edit from w_input
integer width = 1998
integer height = 756
end type
global w_m_security_access_1_edit w_m_security_access_1_edit

on w_m_security_access_1_edit.create
int iCurrent
call super::create
end on

on w_m_security_access_1_edit.destroy
call super::destroy
end on

event ue_presave;call super::ue_presave;String ls_access
String ls_karyawan
Long ll_count

dw_1.Accepttext()

ls_access = dw_1.Getitemstring(1,"kd_security_access_1_sys")
ls_karyawan = dw_1.Getitemstring(1,"kd_karyawan")

Select Count(1)
Into:ll_count
From m_login
Where m_login.kd_karyawan=:ls_karyawan;

If IsNull(ll_count) Or Sqlca.Sqlcode <> 0 Then ll_count = 0

If ll_count = 0 Then 
	MessageBox("Informasi","karyawan belum ada access login!",Information!)
	Return Failure
End If

Select Count(1)
Into:ll_count
From m_security_access_1_sys
Where m_security_access_1_sys.kd_karyawan =:ls_karyawan And
		m_security_access_1_sys.kd_security_access_1_sys <>:ls_access ;
															  
If ll_count <> 0  Then 
	MessageBox("Informasi","Security access sudah di setting!",Information!)
	Return Failure
End IF

Return AncestorReturnValue
end event

event ue_update;call super::ue_update;Long ll_increment
Long ll_i
String ls_sql
String ls_format
String ls_kd_modul
String ls_kd_menu
String ls_kd_security_access_1_sys
String ls_kd_security_access_2_sys
String ls_no_security_access_2_sys
String ls_kd_security_access_3_sys
String ls_no_security_access_3_sys
String ls_kd_security_access_2_sys_temp

Datastore lds_datastore_modul
Datastore lds_datastore_menu
dwItemStatus ldw_status

dw_1.accepttext()

ldw_status = dw_1.GetItemStatus(1, 0, Primary!)

If ldw_status = New! Or ldw_status = NewModified! Then

	ls_kd_security_access_1_sys = dw_1.Getitemstring(1,"kd_security_access_1_sys")
	
	f_get_pk("m_security_access_2_sys",ls_kd_security_access_2_sys)
	
	ll_increment = Long(Right(ls_kd_security_access_2_sys, 12)) + 1
	
	ls_format = Left(ls_kd_security_access_2_sys, Len(ls_kd_security_access_2_sys) - 12)
	
	ls_sql = " SELECT m_modul.kd_modul,  "+&
						"   m_modul.ID,    "+&
						"   m_modul.nm_modul  "+&
				 "  FROM m_modul    "
	
	f_datastore(ls_sql,lds_datastore_modul)
	
	lds_datastore_modul.Retrieve()
	lds_datastore_modul.accepttext()	
	
	If lds_datastore_modul.Rowcount() > 0 Then 
		For ll_i = 1 To lds_datastore_modul.Rowcount()
			
			ls_kd_security_access_2_sys = ls_format + String(ll_increment, "000000000000")
			
			ls_kd_modul = lds_datastore_modul.GetitemString(ll_i,"kd_modul")
			
			ls_sql = " Insert Into m_security_access_2_sys  (kd_security_access_2_sys, kd_security_access_1_sys, kd_modul, hak_akses, kd_user_input, tgl_input, kd_user_update, tgl_update) " + &
						"  Values ('"+ls_kd_security_access_2_sys+"', '"+ls_kd_security_access_1_sys+"', '"+ ls_kd_modul +"', 'Deny', '" +gs_kd_user+"', '"+String(f_get_server_date())+"', '" +gs_kd_user+"', '"+String(f_get_server_date())+"')  "
						
			Execute Immediate:ls_sql;
			
			If f_cek_sqlcode(ls_sql, sqlca) = Failure Then Return Failure
			
			ll_increment++
		Next	
			ll_increment = 0
			f_get_pk("m_security_access_3_sys",ls_kd_security_access_3_sys)
			
			ll_increment = Long(Right(ls_kd_security_access_3_sys, 12)) + 1
			
			ls_format = Left(ls_kd_security_access_3_sys, Len(ls_kd_security_access_3_sys) - 12)
			
			ls_sql = "  SELECT m_menu.kd_menu,   "+&
								" m_menu.ID,   "+&
								" kd_modul, "+&
								" m_menu.nm_menu  	"+&
							" FROM m_menu   "
							
			f_datastore(ls_sql,lds_datastore_menu)
			
			lds_datastore_menu.Retrieve()
			lds_datastore_menu.accepttext()	
		
			If lds_datastore_menu.Rowcount() > 0 Then 
				For ll_i = 1 To lds_datastore_menu.Rowcount()
					
					ls_kd_security_access_3_sys= ls_format + String(ll_increment, "000000000000")
					
					ls_kd_modul = lds_datastore_menu.GetitemString(ll_i,"kd_modul")
					
					ls_kd_menu = lds_datastore_menu.GetitemString(ll_i,"kd_menu")
					
					Select kd_security_access_2_sys
					Into:ls_kd_security_access_2_sys_temp
					From m_security_access_2_sys
					Where m_security_access_2_sys.kd_security_access_1_sys =:ls_kd_security_access_1_sys And m_security_access_2_sys.kd_modul =:ls_kd_modul;
					
					If Sqlca.Sqlcode <> 0 Then ls_kd_security_access_2_sys_temp =""
					
					ls_sql = " Insert Into m_security_access_3_sys  (kd_security_access_3_sys,kd_security_access_2_sys,  kd_security_access_1_sys, kd_menu, hak_akses, kd_user_input, tgl_input, kd_user_update, tgl_update) " + &
								"  Values ('"+ls_kd_security_access_3_sys+"', '"+ls_kd_security_access_2_sys_temp+"', '"+ls_kd_security_access_1_sys+"', '"+ ls_kd_menu +"', 'Dataview', '" +gs_kd_user+"', '"+String(f_get_server_date())+"', '" +gs_kd_user+"', '"+String(f_get_server_date())+"')  "
								
					Execute Immediate:ls_sql;
					
					If f_cek_sqlcode(ls_sql, sqlca) = Failure Then Return Failure
					
					ll_increment++
				Next	
			End If
		End If
End If

Destroy lds_datastore_modul
Destroy lds_datastore_menu

Return AncestorreturnValue
end event

type dw_1 from w_input`dw_1 within w_m_security_access_1_edit
integer width = 1989
integer height = 576
string dataobject = "d_security_access_1_edit"
boolean setnodocument = true
string nodocument = "no_security_access"
end type

event dw_1::ue_preconstructor;call super::ue_preconstructor;istr_dddw[1].ss_buttonname 	= "cb_kd_karyawan"
istr_dddw[1].ss_columnfrom 	= "kd_karyawan|nm_login_txt"
istr_dddw[1].ss_columnto 		= "kd_karyawan|kd_karyawan_txt"
istr_dddw[1].ss_dddwname 	= "dddw_login"
istr_dddw[1].ss_tag 				= "|"
istr_dddw[1].ss_where 			= ""
end event

type uo_1 from w_input`uo_1 within w_m_security_access_1_edit
end type

