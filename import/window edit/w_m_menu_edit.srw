$PBExportHeader$w_m_menu_edit.srw
forward
global type w_m_menu_edit from w_input
end type
end forward

global type w_m_menu_edit from w_input
integer height = 552
end type
global w_m_menu_edit w_m_menu_edit

on w_m_menu_edit.create
int iCurrent
call super::create
end on

on w_m_menu_edit.destroy
call super::destroy
end on

event ue_presave;call super::ue_presave;String ls_no_npwp
String ls_primary
String ls_nm_menu
string ls_nm_menu2
String ls_kd_modul
Long ll_count

Dw_1.Accepttext()

ls_primary = trim(dw_1.getitemstring(dw_1.getrow(),"kd_menu"))
ls_nm_menu = wordcap(trim(dw_1.getitemstring(dw_1.getrow(),"nm_menu")))
ls_nm_menu2 = Wordcap(Trim(dw_1.getitemstring(1,'nm_menulv2')))
ls_kd_modul = trim(dw_1.getitemstring(dw_1.getrow(),"kd_modul"))

Select Count(1)
Into:ll_count
From m_menu
Where m_menu.nm_menu =:ls_nm_menu 
	and m_menu.nm_menulv2 = :ls_nm_menu2
	And m_menu.kd_menu <>:ls_primary And m_menu.kd_modul =:ls_kd_modul;
		  
If ll_count<> 0 Then 
	MessageBox("Informasi","Data "+ls_nm_menu+" sudah ada pada database!",Information!)
	Return Failure
End If		

If ls_nm_menu  = "Menu" Or ls_nm_menu  = "Security Access" Then 
	MessageBox("Informasi",+ls_nm_menu+" tidak bisa di entry!",Information!)
	Return Failure
End If		
		  
Return AncestorReturnValue		  
end event

event ue_update;call super::ue_update;Long ll_i 
Long ll_increment
String ls_sql
String ls_format
String ls_kd_menu
String ls_kd_security_access_1_sys
String ls_kd_security_access_2_sys
String ls_kd_security_access_3_sys
String ls_no_security_access_3_sys
dwItemStatus ldw_status
Datastore lds_datastore_sec_acces_2

dw_1.Accepttext()

ls_kd_menu = dw_1.GetitemString(1,"kd_menu")

ldw_status = dw_1.GetItemStatus(1, 0, Primary!)

If ldw_status = New! Or ldw_status = NewModified! Then
	
	f_get_pk("m_security_access_3_sys",ls_kd_security_access_3_sys)
	
	ll_increment = Long(Right(ls_kd_security_access_3_sys, 12)) + 1
	
	ls_format = Left(ls_kd_security_access_3_sys, Len(ls_kd_security_access_3_sys) - 12)
	
		ls_sql =   "   SELECT m_security_access_2_sys.kd_security_access_2_sys,   "+ &
							"   m_security_access_2_sys.ID,    "+ &
							"   m_security_access_2_sys.kd_security_access_1_sys,  "+ &
							"   m_security_access_2_sys.kd_modul,    "+ &
							"   m_security_access_2_sys.hak_akses,    "+ &
							"   m_security_access_2_sys.kd_user_input,    "+ &
							"   m_security_access_2_sys.tgl_input,    "+ &
							"   m_security_access_2_sys.kd_user_update,    "+ &
							"   m_security_access_2_sys.tgl_update   "+ &
					 "   FROM m_security_access_2_sys    "+ &
				"   Where m_security_access_2_sys.kd_modul ='" + istr_generic.ss_string1 + "' "

	f_datastore(ls_sql,lds_datastore_sec_acces_2)
	
	lds_datastore_sec_acces_2.Retrieve()
	lds_datastore_sec_acces_2.accepttext()	
	
	If lds_datastore_sec_acces_2.Rowcount() > 0 Then 
		For ll_i = 1 To lds_datastore_sec_acces_2.Rowcount()
			
			ls_kd_security_access_3_sys = ls_format + String(ll_increment, "000000000000")
			
			ls_kd_security_access_1_sys = lds_datastore_sec_acces_2.GetitemString(ll_i,"kd_security_access_1_sys")
			
			ls_kd_security_access_2_sys = lds_datastore_sec_acces_2.GetitemString(ll_i,"kd_security_access_2_sys")
			
			ls_sql = " Insert Into m_security_access_3_sys  (kd_security_access_3_sys, kd_security_access_2_sys,kd_security_access_1_sys, kd_menu, hak_akses, kd_user_input, tgl_input, kd_user_update, tgl_update) " + &
						"  Values ('"+ls_kd_security_access_3_sys+"', '"+ ls_kd_security_access_2_sys +"','"+ls_kd_security_access_1_sys+"', '"+ ls_kd_menu +"', 'Dataview', '" +gs_kd_user+"', '"+String(f_get_server_date())+"', '" +gs_kd_user+"', '"+String(f_get_server_date())+"')  "
						
			Execute Immediate:ls_sql;
			
			If f_cek_sqlcode(ls_sql, sqlca) = Failure Then Return Failure
			
			ll_increment++	
		Next 
	End If
End If
Return Ancestorreturnvalue

Destroy lds_datastore_sec_acces_2
end event

type dw_1 from w_input`dw_1 within w_m_menu_edit
integer width = 1943
integer height = 376
string title = "INPUT MASTER INFO"
string dataobject = "d_m_menu_edit"
end type

event dw_1::ue_preupdate;call super::ue_preupdate;String ls_menu

dw_1.Accepttext()

ls_menu = trim(wordcap(dw_1.Getitemstring(1,"nm_menu")))
dw_1.setitem(1,"nm_menu",ls_menu)

Return Ancestorreturnvalue
end event

event dw_1::ue_postadd;call super::ue_postadd;This.Setitem(1,"kd_modul",istr_generic.ss_string1)
This.Setitem(1,"kd_modul_txt",istr_generic.ss_string2)
end event

type uo_1 from w_input`uo_1 within w_m_menu_edit
end type

