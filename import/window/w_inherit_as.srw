$PBExportHeader$w_inherit_as.srw
forward
global type w_inherit_as from window
end type
type cb_1 from commandbutton within w_inherit_as
end type
type dw_2 from u_cst_dddw within w_inherit_as
end type
type st_2 from statictext within w_inherit_as
end type
type dw_1 from datawindow within w_inherit_as
end type
end forward

global type w_inherit_as from window
integer width = 1531
integer height = 344
boolean titlebar = true
string title = "Set Inherit To"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 24207700
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_2 dw_2
st_2 st_2
dw_1 dw_1
end type
global w_inherit_as w_inherit_as

type variables
String is_kd_security_access_1_sys
String is_kd_karyawan_txt
String is_kd_karyawan_temp
str_generic istr_generic
DataStore ids_datastore_karyawan
DataStore ids_datastore_sec_access_2
DataStore ids_datastore_sec_access_3
end variables

forward prototypes
public subroutine of_proses ()
public function integer of_initialize ()
public function integer of_preproses ()
end prototypes

public subroutine of_proses ();Long ll_storevalue
Long ll_i
Long ll_increment
String ls_sql
String ls_format
String ls_kd_modul
String ls_kd_menu
String ls_hak_akses
String ls_kd_security_access_1_sys
String ls_no_security_access_1_sys
String ls_kd_security_access_2_sys
String ls_kd_security_access_3_sys
String ls_no_security_access_2_sys
String ls_no_security_access_3_sys
String ls_kd_security_access_2_sys_temp
String ls_kd_karyawan_temp
String ls_nm_karyawan
String kd_modul_txt

If of_preproses() = Failure Then Return

dw_2.accepttext()
														
If IsNull(is_kd_security_access_1_sys) Or Sqlca.Sqlcode <> 0 Then is_kd_security_access_1_sys = ""	

ls_kd_karyawan_temp = dw_2.GetitemString(1,"kd_karyawan")

If IsNull(ls_kd_karyawan_temp) Or Sqlca.Sqlcode <> 0 Then ls_kd_karyawan_temp =''

f_get_pk("m_security_access_1_sys",ls_kd_security_access_1_sys)

ls_no_security_access_1_sys = f_get_no_doc("m_security_access_1_sys")

ll_increment = Long(Right(ls_kd_security_access_1_sys, 12)) + 1

ls_format = Left(ls_kd_security_access_1_sys, Len(ls_kd_security_access_1_sys) - 12)

Execute Immediate"Begin Transaction";

//m_security_acccess_1
ls_sql = " Insert Into  m_security_access_1_sys (kd_security_access_1_sys, no_security_access, kd_karyawan, kode_level, keterangan,  kd_user_input, tgl_input, kd_user_update, tgl_update) " + &
			"  Values ('"+ ls_kd_security_access_1_sys +"' , '"+ ls_no_security_access_1_sys +"', '"+ ls_kd_karyawan_temp +"', '1', '-' , '" + gs_kd_user + "', '" + String(f_get_server_date()) +"' "+ &
				" , '" + gs_kd_user + "', '" + String(f_get_server_date()) +"' ) "
	
Execute Immediate:ls_sql;

If f_cek_sqlcode(ls_sql, sqlca) = Failure Then Return 

ll_increment = 0
	
ls_sql = "  SELECT m_security_access_2_sys.kd_security_access_2_sys,   " + &
					" m_security_access_2_sys.ID,  " + & 
					" m_security_access_2_sys.kd_security_access_1_sys,   " + &
					" m_security_access_2_sys.kd_modul,  " + & 
					" m_security_access_2_sys.hak_akses,   " + &
					" m_security_access_2_sys.kd_user_input,   " + &
					" m_security_access_2_sys.tgl_input,   " + &
					" m_security_access_2_sys.kd_user_update,   " + &
					" m_security_access_2_sys.tgl_update," + &
				" (Select nm_login" + &
				" From m_login" + &
				" Where m_login.kd_karyawan = (select kd_karyawan" + &
																" From m_security_access_1_sys" + &
																" Where m_security_access_1_sys.kd_security_access_1_sys = m_security_access_2_sys.kd_security_access_1_sys)) as kd_karyawan_txt" + &
				 " FROM m_security_access_2_sys   " + &
			" Where  m_security_access_2_sys.kd_security_access_1_sys= '"+ is_kd_security_access_1_sys + "'"
	
ll_storevalue  = f_datastore(ls_sql,ids_datastore_sec_access_2)

ids_datastore_sec_access_2.Retrieve()
ids_datastore_sec_access_2.accepttext()

f_get_pk("m_security_access_2_sys",ls_kd_security_access_2_sys)

ll_increment = Long(Right(ls_kd_security_access_2_sys, 12)) + 1

ls_format = Left(ls_kd_security_access_2_sys, Len(ls_kd_security_access_2_sys) - 12)
		
//m_security_acccess_2
For ll_i = 1 To ids_datastore_sec_access_2.Rowcount()
	
	ls_kd_security_access_2_sys = ls_format + String(ll_increment, "000000000000")
	
	ls_kd_modul = ids_datastore_sec_access_2.Getitemstring(ll_i,"kd_modul")
	ls_hak_akses = ids_datastore_sec_access_2.GetitemString(ll_i,"hak_akses")
	
	ls_sql = " Insert Into m_security_access_2_sys  ( kd_security_access_2_sys, kd_security_access_1_sys, kd_modul, hak_akses,  kd_user_input, tgl_input, kd_user_update, tgl_update) " + &
				" Values ( '" + ls_kd_security_access_2_sys + "','" + ls_kd_security_access_1_sys + "','" + ls_kd_modul + "','" + ls_hak_akses + "', '" + gs_kd_user + "', '" + String(f_get_server_date()) +"' "+ &
				" , '" + gs_kd_user + "', '" + String(f_get_server_date()) +"' ) "
				
	Execute Immediate:ls_sql;
	
	If f_cek_sqlcode(ls_sql, sqlca) = Failure Then Return 
	
	ll_increment++
Next

ll_storevalue=0
ll_increment=0
ls_format=""

ls_sql = " SELECT m_security_access_3_sys.kd_security_access_3_sys, " + &
					" m_security_access_3_sys.ID,   " + &
					" m_security_access_3_sys.kd_security_access_2_sys,   " + &
					" (select kd_modul	 " + &
						" from m_modul " + &
						" Where m_modul.kd_modul =(select kd_modul " + &
											  " From m_security_access_2_sys " + &
											  " Where m_security_access_2_sys.kd_security_access_2_sys = m_security_access_3_sys.kd_security_access_2_sys)) as kd_modul_txt, " + &
					" m_security_access_3_sys.kd_security_access_1_sys,   " + &
					" m_security_access_3_sys.kd_menu,   " + &
					" m_security_access_3_sys.hak_akses," + &
					" (select nm_menu" + &
					" From m_menu" + &
					" Where m_menu.kd_menu = m_security_access_3_sys.kd_menu) as kd_menu_txt," + &
						" m_security_access_3_sys.kd_user_input,   " + &
						" m_security_access_3_sys.tgl_input,   " + &
						" m_security_access_3_sys.kd_user_update,   " + &
						" m_security_access_3_sys.tgl_update," + &
					" (Select nm_login" + &
					" From m_login" + &
					" Where m_login.kd_karyawan = (select kd_karyawan" + &
																	" From m_security_access_1_sys" + &
																	" Where m_security_access_1_sys.kd_security_access_1_sys = m_security_access_3_sys.kd_security_access_1_sys)) as kd_karyawan_txt" + &
			 " FROM m_security_access_3_sys   " + &
		" Where m_security_access_3_sys.kd_security_access_1_sys='"+ is_kd_security_access_1_sys + "'"

ll_storevalue  = f_datastore(ls_sql,ids_datastore_sec_access_3)

ids_datastore_sec_access_3.Retrieve()
ids_datastore_sec_access_3.accepttext()

f_get_pk("m_security_access_3_sys",ls_kd_security_access_3_sys)

ll_increment = Long(Right(ls_kd_security_access_3_sys, 12)) + 1

ls_format = Left(ls_kd_security_access_3_sys, Len(ls_kd_security_access_3_sys) - 12)

//m_security_acccess_3
For ll_i = 1 To ids_datastore_sec_access_3.Rowcount()
	
	ls_kd_security_access_3_sys = ls_format + String(ll_increment, "000000000000")
	
	kd_modul_txt  = ids_datastore_sec_access_3.GetitemString(ll_i,"kd_modul_txt")
	
	Select kd_security_access_2_sys
	Into:ls_kd_security_access_2_sys_temp
	From m_security_access_2_sys
	Where m_security_access_2_sys.kd_modul =:kd_modul_txt And m_security_access_2_sys.kd_security_access_1_sys =:ls_kd_security_access_1_sys;
	
	If IsNull(ls_kd_security_access_2_sys_temp) Or Sqlca.Sqlcode <> 0 then ls_kd_security_access_2_sys_temp =""
	
	ls_kd_menu = ids_datastore_sec_access_3.Getitemstring(ll_i,"kd_menu")
	ls_hak_akses = ids_datastore_sec_access_3.GetitemString(ll_i,"hak_akses")
	
	ls_sql = " Insert Into m_security_access_3_sys  ( kd_security_access_3_sys, kd_security_access_2_sys, kd_security_access_1_sys, kd_menu, hak_akses,  kd_user_input, tgl_input, kd_user_update, tgl_update) " + &
				" Values ( '" + ls_kd_security_access_3_sys + "', '"+ ls_kd_security_access_2_sys_temp +"', '" + ls_kd_security_access_1_sys + "','" + ls_kd_menu + "','" + ls_hak_akses + "', '" + gs_kd_user + "', '" + String(f_get_server_date()) +"' "+ &
				" , '" + gs_kd_user + "', '" + String(f_get_server_date()) +"' ) "
				
	Execute Immediate:ls_sql;
	
	If f_cek_sqlcode(ls_sql, sqlca) = Failure Then Return 
	
	ll_increment++
Next

Destroy ids_datastore_sec_access_2
Destroy ids_datastore_sec_access_3

Execute Immediate"Commit Transaction";

Commit Using SQLCA;

MessageBox("Informasi","Inherit berhasil di proses!",Information!)

Close(w_inherit_as)

end subroutine

public function integer of_initialize ();Long ll_storevalue
Long  ll_i
String ls_sql

istr_generic = Message.Powerobjectparm

is_kd_security_access_1_sys= istr_generic.ss_string1

Return Success
end function

public function integer of_preproses ();Long ll_count
String ls_kd_karyawan

dw_2.accepttext()

ls_kd_karyawan  = dw_2.GetItemString(1,"kd_karyawan")

If IsNull(ls_kd_karyawan) Or ls_kd_karyawan= "" Then ls_kd_karyawan = ""

If  ls_kd_karyawan= "" Then 
	MessageBox("Informasi","silahkan pilih karyawan untuk di inherit!",Information!)
	Return Failure
End If

Select Count(1)
Into:ll_count
From m_login
Where m_login.kd_karyawan=:ls_kd_karyawan;

If IsNull(ll_count) Or Sqlca.Sqlcode <> 0 Then ll_count = 0

If ll_count = 0 Then 
	MessageBox("Informasi","karyawan belum ada access login!",Information!)
	Return Failure
End If

Select Count(1)
Into:ll_count
From m_security_access_1_sys
Where m_security_access_1_sys.kd_karyawan =:ls_kd_karyawan;

If IsNull(ll_count) Or Sqlca.Sqlcode <> 0 Then ll_count = 0

If ll_count > 0 Then 
	MessageBox("Informasi","karyawan telah di setting pada security access modul atau menu, tidak dapat di proses inherit!",Information!)
	Return Failure
End If

If MessageBox("Question"," Peoses Inherit? ",Question!,OKCancel!,1) = 2 Then Return Failure

Return Success
end function

on w_inherit_as.create
this.cb_1=create cb_1
this.dw_2=create dw_2
this.st_2=create st_2
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_2,&
this.st_2,&
this.dw_1}
end on

on w_inherit_as.destroy
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.st_2)
destroy(this.dw_1)
end on

event open;of_initialize()
end event

type cb_1 from commandbutton within w_inherit_as
integer x = 1147
integer y = 160
integer width = 329
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Process"
end type

event clicked;of_proses()
end event

type dw_2 from u_cst_dddw within w_inherit_as
integer x = 9
integer y = 80
integer taborder = 30
end type

event ue_preconstructor;call super::ue_preconstructor;istr_dddw.ss_buttonname = "cb_kd_karyawan"
istr_dddw.ss_columnfrom = "kd_karyawan|nm_karyawan"
istr_dddw.ss_columnto =  "kd_karyawan|nm_karyawan"
istr_dddw.ss_columntype = "char(100)|char(255)|"
istr_dddw.ss_dddwname = "dddw_m_karyawan"
istr_dddw.ss_tag = "|"
istr_dddw.ss_where = " Where m_karyawan.tgl_keluar = NULL Or m_karyawan.kd_karyawan <>  '" + is_kd_karyawan_temp + "'  And m_karyawan.nm_karyawan not in ('Admin' , 'Administrator','(NONE)')  "

end event

type st_2 from statictext within w_inherit_as
integer x = 18
integer y = 12
integer width = 1568
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 24207700
string text = "Silahkan pilih karywan yang akan di inherit!"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_inherit_as
boolean visible = false
integer x = 32
integer y = 232
integer width = 265
integer height = 140
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "d_create_generate"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

