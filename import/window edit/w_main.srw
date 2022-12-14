$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type dw_4 from datawindow within w_main
end type
type dw_6 from datawindow within w_main
end type
type dw_3 from datawindow within w_main
end type
type uo_2 from u_cst_shortcutbar within w_main
end type
type uo_1 from u_cst_powerdock within w_main
end type
type dw_2 from datawindow within w_main
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 4393
integer height = 2408
boolean titlebar = true
string title = "Broker Ins System"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "logo-broker-system.ico"
boolean center = true
dw_4 dw_4
dw_6 dw_6
dw_3 dw_3
uo_2 uo_2
uo_1 uo_1
dw_2 dw_2
dw_1 dw_1
end type
global w_main w_main

type variables
Integer ii_prevpositionx
Integer ii_prevpositiony
Integer UNITIALIZED

//-- Define the "Extreme points" constants. --
constant integer LEFTMOST=1
constant integer RIGHTMOST=2
constant integer TOPMOST=3
constant integer BOTTOMMOST=4

Boolean ib_performredraw
Integer	ii_barwidth = -1		// Default to negative value. 

u_cst_tabpage i_last

end variables

forward prototypes
public subroutine of_setmenudw1 ()
public subroutine of_setmenudw2 ()
public subroutine of_changemenu (string as_menuname)
public subroutine of_setmenudw3 ()
public subroutine of_setmenudw4 ()
public subroutine of_setmenudw5 ()
public subroutine of_setmenudw6 ()
public subroutine of_setmenudw7 ()
public subroutine of_setmenudw8 ()
public subroutine of_setmenuadmin ()
public subroutine of_setmenudw9 ()
public subroutine of_change_title ()
public subroutine of_resetmenu ()
end prototypes

public subroutine of_setmenudw1 ();//Menu Marine Insurance
Integer li_row
integer li_jml
integer li_rowcount

string ls_data1
string ls_data2
string ls_nm_login
string ls_datastore
string ls_Kd_menu
datastore lds_data

////Master Umum 

select nm_login
into :ls_nm_login
from m_login
where m_login.kd_karyawan = :gs_kd_user;

if isnull(ls_nm_login) or sqlca.sqlcode <> 0 then ls_nm_login = ''

if Upper(ls_nm_login) = 'ADMIN' then
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Asuransi')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Bank')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Cabang')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Customer')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Divisi')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Jabatan')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Karyawan')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'Master Umum')
	dw_1.SetItem(li_row, 'data2', 'Kendaraan')
	
	li_row = dw_2.insertrow(0)
	dw_2.setitem(li_row, 'data1', 'Transaksi')
	dw_2.setitem(li_row, 'data2', 'TeleMarketing MV')
	
	li_row = dw_2.insertrow(0)
	dw_2.setitem(li_row, 'data1', 'Transaksi')
	dw_2.setitem(li_row, 'data2', 'Customer Service')
	
	li_row = dw_3.insertrow(0)
	dw_3.setitem(li_row, 'data1', 'Utility')
	dw_3.setitem(li_row, 'data2', 'Import MV')
	
	li_row = dw_3.insertrow(0)
	dw_3.setitem(li_row, 'data1', 'Utility')
	dw_3.setitem(li_row, 'data2', 'Setup Customer Service')
	
	li_row = dw_4.insertrow(0)
	dw_4.setitem(li_row, 'data1', 'Report')
	dw_4.setitem(li_row, 'data2', 'Report Follow UP')
	
	//System Setting
	li_row = dw_6.insertrow(0)
	dw_6.setitem(li_row, 'data1', 'System Setting')
	dw_6.setitem(li_row, 'data2', 'Info')
	
	li_row = dw_6.insertrow(0)
	dw_6.setitem(li_row, 'data1', 'System Setting')
	dw_6.setitem(li_row, 'data2', 'Info Broker')
	
	li_row = dw_6.insertrow(0)
	dw_6.setitem(li_row, 'data1', 'System Setting')
	dw_6.setitem(li_row, 'data2', 'Login')
	
	li_row = dw_6.insertrow(0)
	dw_6.setitem(li_row, 'data1', 'System Setting')
	dw_6.setitem(li_row, 'data2', 'Menu')
	
	li_row = dw_6.insertrow(0)
	dw_6.setitem(li_row, 'data1', 'System Setting')
	dw_6.setitem(li_row, 'data2', 'Menu User Akses')
	
	li_row = dw_6.insertrow(0)
	dw_6.setitem(li_row, 'data1', 'System Setting')
	dw_6.setitem(li_row, 'data2', 'Security Access')
else
	ls_datastore = " Select * from m_menu_user where m_menu_user.kd_user = '"+gs_kd_user+"' "
	f_datastore(ls_datastore,lds_Data)
	lds_data.retrieve()
	li_rowcount = lds_data.rowcount()
	
	for li_jml = 1 to li_rowcount
		ls_Kd_menu = lds_data.getitemstring(li_jml,'kd_menu')
		
		select nm_menu,nm_menulv2
		into :ls_data1,:ls_data2
		from m_menu
		where m_menu.kd_menu = :ls_Kd_menu;
		
		if isnull(ls_data1) or sqlca.sqlcode <> 0 then ls_data1 = ''
		if isnull(ls_data2) or sqlca.sqlcode <> 0 then ls_data2 = ''
		
		if Upper(ls_data1) = 'TRANSAKSI' then
			li_row = dw_2.insertrow(0)
			dw_2.setitem(li_row, 'data1', 'Transaksi')
			dw_2.setitem(li_row, 'data2', ls_data2)
		end if
		
		if Upper(ls_data1) = 'MASTER UMUM' then
			li_row = dw_1.InsertRow(0)
			dw_1.SetItem(li_row, 'data1', 'Master Umum')
			dw_1.SetItem(li_row, 'data2', ls_data2)
		end if
		
		if Upper(ls_data1) = 'UTILITY' then
			li_row = dw_3.insertrow(0)
			dw_3.setitem(li_row, 'data1', 'Utility')
			dw_3.setitem(li_row, 'data2', ls_data2)
		end if
		
		if Upper(ls_data1) = 'SYSTEM SETTING' then
			li_row = dw_6.insertrow(0)
			dw_6.setitem(li_row, 'data1', 'System Setting')
			dw_6.setitem(li_row, 'data2', ls_data2)
		end if
		
		if Upper(ls_data1) = 'REPORT' then
			li_row = dw_6.insertrow(0)
			dw_6.setitem(li_row, 'data1', 'Report')
			dw_6.setitem(li_row, 'data2', ls_data2)
		end if
		
	next
end if

dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()
dw_4.GroupCalc()
//dw_5.GroupCalc()
dw_6.GroupCalc()
end subroutine

public subroutine of_setmenudw2 ();//Menu Travel Insurance

Integer li_row

//Master Umum 
/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Bisnis')*/

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Databank')

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Divisi')*/

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Dokumen')*/

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Jabatan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan Group')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Peserta')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'User Akses')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Pajak') */

 li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Negara') 

 li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kota') 

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs Standard')*/

//Master Khusus 
li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Plan')

dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Benefit')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Plan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Plan Code')

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Jaminan')*/

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Produk')

//Transaksi
/*li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Input Rate')*/

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Setup Produk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk Produk')

//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Transaksi')
//dw_2.SetItem(li_row, 'data2', 'Polis Induk Customer')
 
li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Borderaux')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Invoice')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Rekap Invoice') 

//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Report')
//dw_2.SetItem(li_row, 'data2', 'Daftar Peserta')

////Endorsment
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Endorsment')
//dw_2.SetItem(li_row, 'data2', 'Input Endorsment')
 
//Klaim
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Klaim')
//dw_2.SetItem(li_row, 'data2', 'Klaim Cash Plan')
 
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Klaim')
//dw_2.SetItem(li_row, 'data2', 'Register Klaim')
 
//Utility
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Utility')
//dw_2.SetItem(li_row, 'data2', 'Import / View Rate')


/*li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Utility')
dw_2.SetItem(li_row, 'data2', 'Transfer Data Peserta')*/

dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()
end subroutine

public subroutine of_changemenu (string as_menuname);This.SetRedraw(False)

Choose Case as_MenuName		
//	Case "p_marine"
	Case ""
		dw_1.Reset()
		dw_2.Reset()
		dw_3.Reset()
		If f_security_access(gs_kd_user,f_get_modul('Mv'),'Modul') = 'Deny' Then 
			of_resetmenu()
		Else
			of_SetMenuDW1()
			uo_2.of_Reset()
			uo_2.of_SetTheme("BLUE")
			uo_2.of_AddItem(dw_1, "Master", 'folder-gear-icon.PNG')
			uo_2.of_AddItem(dw_2, "Transaksi", 'folder-gear-icon.PNG')
			uo_2.of_AddItem(dw_3, "Utility", 'folder-gear-icon.PNG')
			uo_2.of_AddItem(dw_4, "Report", 'folder-gear-icon.PNG')
//			uo_2.of_AddItem(dw_5, "Endorsment", 'folder-gear-icon.PNG')
			uo_2.of_AddItem(dw_6, "System Setting", 'folder-gear-icon.PNG')
			uo_2.of_SelectItem(1)
//			gs_modul = 'MARINE CARGO'
		End If
//	Case "p_airplane"
//		dw_1.Reset()
//		dw_2.Reset()
//		dw_3.Reset()
//		If f_security_access(gs_kd_user,f_get_modul('Travel'),'Modul') = 'Deny' Then 
//			of_resetmenu()
//		Else
//			of_SetMenuDW2()
//			uo_2.of_Reset()
//			uo_2.of_SetTheme("BLUE")
//			uo_2.of_AddItem(dw_1, "Master Travel Ins.", 'Module.PNG')
//			uo_2.of_AddItem(dw_2, "Bisnis Proses Travel Ins.", 'Module.PNG')
//			uo_2.of_SelectItem(1)
//			gs_modul = 'TRAVEL'
//		End If
//	Case "p_auto"
//		dw_1.Reset()
//		dw_2.Reset()
//		dw_3.Reset()
//		If f_security_access(gs_kd_user,f_get_modul('Motor Vehicle'),'Modul') = 'Deny' Then
//			of_resetmenu()
//		Else
//			of_SetMenuDW3()
//			uo_2.of_Reset()
//			uo_2.of_SetTheme("BLUE")
//			uo_2.of_AddItem(dw_1, "Master Motor Vehicle Ins.", 'Module.PNG')
//			uo_2.of_AddItem(dw_2, "Bisnis Proses Motor Vehicle Ins.", 'Module.PNG')
//			uo_2.of_SelectItem(1)
//			gs_modul = 'MOTOR VEHICLE'
//		End If
//	Case "p_credit"
//		dw_1.Reset()
//		dw_2.Reset()
//		dw_3.Reset()
//		If f_security_access(gs_kd_user,f_get_modul('Credit Life'),'Modul') = 'Deny' Then
//			of_resetmenu()
//		Else
//			of_SetMenuDW4()
//			uo_2.of_Reset()
//			uo_2.of_SetTheme("BLUE")
//			uo_2.of_AddItem(dw_1, "Master Credit Life Ins", 'Module.PNG')
//			uo_2.of_AddItem(dw_2, "Bisnis Proses Credit Life Ins", 'Module.PNG')
//			uo_2.of_SelectItem(1)
//			gs_modul = 'CREDIT LIFE'
//		End If
//	Case"p_property"
//		dw_1.Reset()
//		dw_2.Reset()
//		dw_3.Reset()
//		If f_security_access(gs_kd_user,f_get_modul('Property'),'Modul') = 'Deny' Then  
//			of_resetmenu()
//		Else
//			of_SetMenuDW5()
//			uo_2.of_Reset()
//			uo_2.of_SetTheme("BLUE")
//			uo_2.of_AddItem(dw_1, "Master  Property Ins.", 'Module.PNG')
//			uo_2.of_AddItem(dw_2, "Bisnis Proses  Property Ins.", 'Module.PNG')
//			uo_2.of_SelectItem(1)
//			gs_modul = 'PROPERTY'
//		End If
//	Case"p_industry"
//		dw_1.Reset()
//		dw_2.Reset()
//		dw_3.Reset()
//		If f_security_access(gs_kd_user,f_get_modul('Industry'),'Modul') = 'Deny' Then  
//			of_resetmenu()
//		Else
//			of_SetMenuDW6()
//			uo_2.of_Reset()
//			uo_2.of_SetTheme("BLUE")
//			uo_2.of_AddItem(dw_1, "Master Industry Ins.", 'Module.PNG')
//			uo_2.of_AddItem(dw_2, "Bisnis Proses  Industry Ins.", 'Module.PNG')
//			uo_2.of_SelectItem(1)
//			gs_modul = 'INDUSTRY'
//		End If
//	Case"p_money"
//		dw_1.Reset()
//		dw_2.Reset()
//		dw_3.Reset()
//		If f_security_access(gs_kd_user,f_get_modul('Finance'),'Modul') = 'Deny' Then  
//			of_resetmenu()
//		Else
//			of_SetMenuDW7()
//			uo_2.of_Reset()
//			uo_2.of_SetTheme("BLUE")
//			uo_2.of_AddItem(dw_1, "Finance's.", 'Module.PNG')
//			uo_2.of_AddItem(dw_2, "***", 'Module.PNG')
//			uo_2.of_SelectItem(1)
//			gs_modul = 'FINANCE'
//		End If
//	Case "p_health"
//		dw_1.Reset()
//		dw_2.Reset()
//		dw_3.Reset()
//		If f_security_access(gs_kd_user,f_get_modul('Health'),'Modul') = 'Deny' Then  
//			of_resetmenu()
//		Else
//			of_SetMenuDW8()
//			uo_2.of_Reset()
//			uo_2.of_SetTheme("BLUE")
//			uo_2.of_AddItem(dw_1, "Master Health/PA Ins", 'Module.PNG')
//			uo_2.of_AddItem(dw_2, "Bisnis Proses Health/PA Ins", 'Module.PNG')
//			uo_2.of_SelectItem(1)
//			gs_modul = 'HEALTH'
//		End If
	Case "p_report"
		dw_1.Reset()
		dw_2.Reset()
		dw_3.Reset()
		If f_security_access(gs_kd_user,f_get_modul('Report'),'Modul') = 'Deny' Then 
			of_resetmenu()
		Else
			of_SetMenuDW9()
			uo_2.of_Reset()
			uo_2.of_SetTheme("BLUE")
			uo_2.of_AddItem(dw_1, "Broker System Report", 'Module.PNG')
			uo_2.of_AddItem(dw_2, " ", 'Module.PNG')
			uo_2.of_SelectItem(1)
			gs_modul = 'REPORT'
		End If
	Case "p_setting"
		dw_1.Reset()
		dw_2.Reset()
		dw_3.Reset()
		If f_security_access(gs_kd_user,f_get_modul('Setting'),'Modul') = 'Deny' Then  
			of_resetmenu()
			
		Else
			of_SetMenuadmin()
			uo_2.of_Reset()
			uo_2.of_SetTheme("BLUE")
			uo_2.of_AddItem(dw_1, "System Setting", 'Module.PNG')
			uo_2.of_AddItem(dw_2, "", "")
			uo_2.of_SelectItem(1)
			gs_modul = 'SETTING'
		End If
End Choose

//uo_1.of_setdock(3, True)

This.SetRedraw(True)
end subroutine

public subroutine of_setmenudw3 ();// Menu Motor Vehicle Insurance
Integer li_row

//Master Umum 
li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Bisnis')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Databank')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Divisi')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Dokumen')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Jabatan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan')
 
li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan Group')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Peserta')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'User Akses')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Negara')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Pajak')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Propinsi')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kota')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs Standard')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Regional')

//Master Khusus 
li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Jaminan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Kategori TSI')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Merk dan Type')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Produk')

//Transaksi 
li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Input Rate')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Setup Dokumen')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Setup Produk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk Produk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk Customer')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Borderaux')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Invoice')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Rekap Invoice') 


//Utility
li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Utility')
dw_2.SetItem(li_row, 'data2', 'Update Nomor Polis')

dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()
end subroutine

public subroutine of_setmenudw4 ();//Menu Asuransi Jiwa Kredit

Integer li_row

//Master Umum 
li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Bisnis')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Databank')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Divisi')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Dokumen')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Jabatan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan Group')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Peserta')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'User Akses')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Negara')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Pajak')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Propinsi')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kota')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs Standard')

//Master Khusus 
li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Account Bank')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Jenis Endorsement')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Jenis Klaim')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Jaminan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Produk')

//Transaksi
li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Input Rate')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Setup Dokumen')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Setup Produk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk Produk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk Customer')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Borderaux')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Invoice')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Rekap Invoice') 

//Endorsment
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Endorsment')
//dw_2.SetItem(li_row, 'data2', 'Input Endorsment')
//
////Klaim
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Klaim')
//dw_2.SetItem(li_row, 'data2', 'Header Klaim')
//
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Klaim')
//dw_2.SetItem(li_row, 'data2', 'Register Klaim')

//Utility
li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Utility')
dw_2.SetItem(li_row, 'data2', 'Import / View Rate') 

dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()
end subroutine

public subroutine of_setmenudw5 ();// Menu Property Insurance
end subroutine

public subroutine of_setmenudw6 ();// Menu Industry Insurance
end subroutine

public subroutine of_setmenudw7 ();// Menu Finance
Integer li_row 

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Finance')
dw_1.SetItem(li_row, 'data2', 'Outstanding')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Finance')
dw_1.SetItem(li_row, 'data2', 'Pelunasan(IN/OUT)')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Finance')
dw_1.SetItem(li_row, 'data2', 'Cash Bank')

dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()
end subroutine

public subroutine of_setmenudw8 ();//Menu Asuransi Health

Integer li_row

//Master Umum 
/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Bisnis')*/

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Databank')

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Divisi')*/

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Dokumen')*/

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Jabatan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Karyawan Group')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Peserta')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'User Akses')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Pajak') */

 li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Negara') 
//
// li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'Master Umum')
//dw_1.SetItem(li_row, 'data2', 'Propinsi')

 li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kota') 

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Umum')
dw_1.SetItem(li_row, 'data2', 'Kurs Standard')*/

//Master Khusus 
li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Plan')

dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Benefit')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Plan')

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Plan Code')

/*li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Jaminan')*/

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'Master Khusus')
dw_1.SetItem(li_row, 'data2', 'Produk')

//Transaksi
/*li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Input Rate')*/

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Setup Produk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Induk Produk')

//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Transaksi')
//dw_2.SetItem(li_row, 'data2', 'Polis Induk Customer')
 
li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Polis Borderaux')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Invoice')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Transaksi')
dw_2.SetItem(li_row, 'data2', 'Rekap Invoice')

li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Report')
dw_2.SetItem(li_row, 'data2', 'Daftar Peserta')

////Endorsment
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Endorsment')
//dw_2.SetItem(li_row, 'data2', 'Input Endorsment')
 
//Klaim
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Klaim')
//dw_2.SetItem(li_row, 'data2', 'Klaim Cash Plan')
 
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Klaim')
//dw_2.SetItem(li_row, 'data2', 'Register Klaim')
 
//Utility
//li_row = dw_2.InsertRow(0)
//dw_2.SetItem(li_row, 'data1', 'Utility')
//dw_2.SetItem(li_row, 'data2', 'Import / View Rate')


/*li_row = dw_2.InsertRow(0)
dw_2.SetItem(li_row, 'data1', 'Utility')
dw_2.SetItem(li_row, 'data2', 'Transfer Data Peserta')*/

dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()
end subroutine

public subroutine of_setmenuadmin ();//Menu Admininitrator
Integer li_row
 
If  gs_kd_user = gs_user_admin Then 
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'System Setting')
	dw_1.SetItem(li_row, 'data2', 'Info')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'System Setting')
	dw_1.SetItem(li_row, 'data2', 'Info Broker')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'System Setting')
	dw_1.SetItem(li_row, 'data2', 'Menu')
	
	li_row = dw_1.InsertRow(0)
	dw_1.SetItem(li_row, 'data1', 'System Setting')
	dw_1.SetItem(li_row, 'data2', 'Security Access')

End If 

li_row = dw_1.InsertRow(0)
dw_1.SetItem(li_row, 'data1', 'System Setting')
dw_1.SetItem(li_row, 'data2', 'Login')


dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()



end subroutine

public subroutine of_setmenudw9 ();// Menu report
Integer li_row

//General Report 
//li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'General Report')
//dw_1.SetItem(li_row, 'data2', 'Outstanding')
//
//li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'Credit Life Ins Report')
//dw_1.SetItem(li_row, 'data2', 'Produksi')
//
//li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'Health Ins Report')
//dw_1.SetItem(li_row, 'data2', 'Produksi')
//
//li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'Motor Vehicle Ins Report')
//dw_1.SetItem(li_row, 'data2', 'Produksi')
//
//li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'Marine Cargo Ins Report')
//dw_1.SetItem(li_row, 'data2', 'Produksi')
//
//li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'Property Ins Report')
//dw_1.SetItem(li_row, 'data2', 'Produksi')
//
//li_row = dw_1.InsertRow(0)
//dw_1.SetItem(li_row, 'data1', 'Finance Report')
//dw_1.SetItem(li_row, 'data2', 'Produksi')

////Utility
////li_row = dw_2.InsertRow(0)
////dw_2.SetItem(li_row, 'data1', 'Utility')
////dw_2.SetItem(li_row, 'data2', 'Import / View Rate')
////
////li_row = dw_2.InsertRow(0)
////dw_2.SetItem(li_row, 'data1', 'Utility')
////dw_2.SetItem(li_row, 'data2', 'Transfer Data Peserta')

dw_1.GroupCalc()
dw_2.GroupCalc()
dw_3.GroupCalc()
end subroutine

public subroutine of_change_title ();Long ll_counter
String ls_database
String ls_nm_user
String ls_ServerName
String ls_app_exe
String ls_version_lokal
String ls_direct_local
String ls_exe_name
String ls_syncweb
String ls_passKey
String ls_IDKey
String ls_ini_local
n_cryptoapi luo_crypt

Select nm_karyawan
Into :ls_nm_user
From m_karyawan
Where kd_karyawan = :gs_kd_user;

If IsNull(ls_nm_user) or SQLCA.SQLCODE <> 0 Then ls_nm_user = ""

ls_ServerName = ProfileString("broker.ini", "Database", "ServerName", "")
ls_Database = ProfileString("broker.ini", "Database", "Database", "")
ls_direct_local = ProfileString("broker.ini", "Database", "direct_local", "")
ls_exe_name = ProfileString("broker.ini", "Database", "exe_name", "")
 
ls_version_lokal = ProfileString("version.conf", "version Broker sys", "Current version", "") 

luo_crypt.iCryptoProvider = "Microsoft Strong Cryptographic Provider" 
 
ls_passKey = String(ll_counter, "000000000000")
ls_IDKey = String(ll_counter, "000000000000")

ll_counter ++

ls_version_lokal = luo_crypt.of_Decrypt(ls_version_lokal, ls_passKey + "Pass")      
 
ls_syncweb = f_get_info('Connection','Interlocal') 

This.Title = "Telle Marketing System "+ls_version_lokal+ " Syncweb - "+ls_syncweb+" | Server - " + ls_serverName + " | Database - " + ls_database + " | User - " + ls_nm_user + " |" 
end subroutine

public subroutine of_resetmenu ();//uo_1.of_setdock(3, False)
uo_2.of_Reset()
uo_2.of_SetTheme("BLUE")
uo_2.of_AddItem(dw_1, "Access Denied", 'Module.PNG')
uo_2.of_AddItem(dw_2, " ", 'Module.PNG')
uo_2.of_SelectItem(1)

end subroutine

on w_main.create
this.dw_4=create dw_4
this.dw_6=create dw_6
this.dw_3=create dw_3
this.uo_2=create uo_2
this.uo_1=create uo_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_4,&
this.dw_6,&
this.dw_3,&
this.uo_2,&
this.uo_1,&
this.dw_2,&
this.dw_1}
end on

on w_main.destroy
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.dw_3)
destroy(this.uo_2)
destroy(this.uo_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;u_cst_homepage luo_home

uo_1.of_setdock(3, True)
uo_1.of_SetTheme("BLUE")
uo_1.of_AddDockItem(3, uo_2, "MENU EXPLORER", 'TreeView!')

uo_2.of_SetTheme("BLUE")

//uo_2.of_AddItem(dw_1, "", 'folder-gear-icon.PNG')
//uo_2.of_AddItem(dw_2, "", 'folder-gear-icon.PNG')
uo_1.of_OpenDocument("Home", luo_home, 0, True)
uo_2.of_SelectItem(1)

dw_3.Visible = False

//update for pelunasan
Select kd_cabang
Into :gs_kd_cabang
From m_cabang
Where Rtrim(Ltrim(Upper(nm_cabang))) = "JAKARTA";

If IsNull(gs_kd_cabang) or SQLCA.SQLCODE <> 0 Then gs_kd_cabang = ""

gs_kd_cara_setoran_hll = f_get_info("kd_cara_setoran", "HLL")
gs_kd_cara_setoran_pll = f_get_info("kd_cara_setoran", "PLL")
gs_kd_cara_setoran_memo = f_get_info("kd_cara_setoran", "MEMO")
gs_kd_cara_setoran_cash = f_get_info("kd_cara_setoran", "CASH")
//gs_kd_cara_setoran_none = f_get_info("kd_cara_setoran", "<NONE>")
gs_kd_cara_setoran_transfer = f_get_info("kd_cara_setoran", "TRANSFER")

Select kd_profit_center
Into :gs_kd_profit_center_none
From m_profit_center
Where nm_profit_center = "<NONE>";

If IsNull(gs_kd_profit_center_none) or SQLCA.SQLCODE <> 0 Then gs_kd_profit_center_none = ""

Select kd_profit_center
Into :gs_kd_profit_center_jkt
From m_profit_center
Where nm_profit_center = "JAKARTA";

If IsNull(gs_kd_profit_center_jkt) or SQLCA.SQLCODE <> 0 Then gs_kd_profit_center_jkt = ""

Select kd_account
Into :gs_kd_account_none
From m_account
Where nm_account = "<NONE>";

If IsNull(gs_kd_account_none) or SQLCA.SQLCODE <> 0 Then gs_kd_account_none = ""

Select kd_kurs
Into :gs_kd_kurs_rupiah
From m_kurs
Where nm_kurs = "Rupiah";

If IsNull(gs_kd_kurs_rupiah) or SQLCA.SQLCODE <> 0 Then gs_kd_kurs_rupiah = ""

Select kd_cost_center
Into :gs_kd_cost_center_none
From m_cost_center
Where nm_cost_center = "<NONE>";

If IsNull(gs_kd_cost_center_none) or SQLCA.SQLCODE <> 0 Then gs_kd_cost_center_none = ""

of_change_title()

of_changemenu("")

end event

event resize;uo_1.Resize(THIS.WorkSpaceWidth() - 4,THIS.WorkSpaceHeight() - 10)
end event

type dw_4 from datawindow within w_main
integer x = 370
integer y = 556
integer width = 686
integer height = 136
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_menu"
boolean border = false
boolean livescroll = true
end type

event clicked;String ls_data1
String ls_data2
String ls_DWOName
String ls_DWOType
String ls_DWBand

str_dw_band lstr_band

//System Setting
//u_cst_m_menu luo_menu
//u_cst_m_login_password luo_login_password

u_cst_laporan_follow_up luo_follow

If row > 0 Then
	ls_data1 = this.GetItemString(row, 'data1')
	ls_data2 = this.GetItemString(row, 'data2')
	
	If ls_data1 = 'Report' And ls_data2 = 'Report Follow UP' Then uo_1.of_OpenDocument('Report Follow UP', luo_follow, 0, False)

End If

If This.RowCount() = 0 Then Return

ls_DWOName = dwo.name
ls_DWOType = dwo.Type
ls_DWBand = This.GetBandAtPointer()
lstr_band = f_parse_bandinfo(ls_DWBand)

If Left(ls_DWOName, 3) = 'cb_' Or Left(ls_DWOName, 2) = 't_' Or ls_DWOName = "datawindow" Then 
	Return
End If

If lstr_band.row = 0 Then Return

Choose Case lstr_band.band
	Case 'tree.level.1'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,1) Then
			This.Collapse(lstr_band.row,1)
		Else
			This.Expand(lstr_band.row,1)
		End If
	
	Case 'tree.level.2'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,2) Then
			This.Collapse(lstr_band.row,2)
		Else
			This.expand(lstr_band.row,2)
		End If
	
	Case 'tree.level.3'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,3) Then
			This.Collapse(lstr_band.row,3)
		Else
			This.expand(lstr_band.row,3)
		End If
	
	Case 'tree.level.4'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,4) Then
			This.Collapse(lstr_band.row,4)
		Else
			This.expand(lstr_band.row,4)
		End If
	
	Case 'tree.level.5'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,5) Then
			This.Collapse(lstr_band.row,5)
		Else
			This.expand(lstr_band.row,5)
		End If
End Choose
end event

event constructor;This.Modify("DataWindow.Color='" +  String(RGB(230, 230, 230)) + "'")
This.Modify("t_2.BackGround.Color='" + String(RGB(174, 213, 130)) + "'")
end event

type dw_6 from datawindow within w_main
integer x = 370
integer y = 696
integer width = 686
integer height = 136
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_menu"
boolean border = false
boolean livescroll = true
end type

event clicked;String ls_data1
String ls_data2
String ls_DWOName
String ls_DWOType
String ls_DWBand

str_dw_band lstr_band

//System Setting
//u_cst_m_menu luo_menu
//u_cst_m_login_password luo_login_password

u_cst_m_menu luo_menu
u_cst_m_login_password luo_login_password
u_cst_security_access luo_security_access
u_cst_m_info luo_info
u_cst_m_menu_user luo_menu_user
If row > 0 Then
	ls_data1 = this.GetItemString(row, 'data1')
	ls_data2 = this.GetItemString(row, 'data2')
	
//	If ls_data1 = 'System Setting' And ls_data2 = 'Info' Then uo_1.of_OpenDocument('Master Login', luo_info, 0, False)
	If ls_data1 = 'System Setting' And ls_data2 = 'Info' Then uo_1.of_OpenDocument('Master Info', luo_info, 0, False)
//	If ls_data1 = 'System Setting' And ls_data2 = 'Info Broker' Then uo_1.of_OpenDocument('Master Info Broker', luo_info_broker, 0, False)
	If ls_data1 = 'System Setting' And ls_data2 = 'Menu' Then uo_1.of_OpenDocument('Master Menu', luo_menu, 0, False)
	If ls_data1 = 'System Setting' And ls_data2 = 'Menu User Akses' Then uo_1.of_OpenDocument('Menu User Akses', luo_menu_user, 0, False)
	If ls_data1 = 'System Setting' And ls_data2 = 'Security Access' Then uo_1.of_OpenDocument('Security Access', luo_security_access, 0, False)
	If ls_data1 = 'System Setting' And ls_data2 = 'Login' Then uo_1.of_OpenDocument('Master Login', luo_login_password, 0, False)
	
End If

If This.RowCount() = 0 Then Return

ls_DWOName = dwo.name
ls_DWOType = dwo.Type
ls_DWBand = This.GetBandAtPointer()
lstr_band = f_parse_bandinfo(ls_DWBand)

If Left(ls_DWOName, 3) = 'cb_' Or Left(ls_DWOName, 2) = 't_' Or ls_DWOName = "datawindow" Then 
	Return
End If

If lstr_band.row = 0 Then Return

Choose Case lstr_band.band
	Case 'tree.level.1'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,1) Then
			This.Collapse(lstr_band.row,1)
		Else
			This.Expand(lstr_band.row,1)
		End If
	
	Case 'tree.level.2'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,2) Then
			This.Collapse(lstr_band.row,2)
		Else
			This.expand(lstr_band.row,2)
		End If
	
	Case 'tree.level.3'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,3) Then
			This.Collapse(lstr_band.row,3)
		Else
			This.expand(lstr_band.row,3)
		End If
	
	Case 'tree.level.4'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,4) Then
			This.Collapse(lstr_band.row,4)
		Else
			This.expand(lstr_band.row,4)
		End If
	
	Case 'tree.level.5'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,5) Then
			This.Collapse(lstr_band.row,5)
		Else
			This.expand(lstr_band.row,5)
		End If
End Choose
end event

event constructor;This.Modify("DataWindow.Color='" +  String(RGB(230, 230, 230)) + "'")
This.Modify("t_2.BackGround.Color='" + String(RGB(174, 213, 130)) + "'")
end event

type dw_3 from datawindow within w_main
integer x = 370
integer y = 420
integer width = 686
integer height = 136
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_menu"
boolean border = false
boolean livescroll = true
end type

event clicked;String ls_data1
String ls_data2
String ls_DWOName
String ls_DWOType
String ls_DWBand

str_generic lstr_generic

str_dw_band lstr_band 
//Fiannce 
u_cst_t_fin_pelunasan luo_pelunasan 
u_cst_t_fin_cashbank luo_cashbank
u_cst_t_fin_outstanding luo_outstanding
u_cst_t_fin_pp luo_pp
u_cst_t_fin_setoran luo_setoran
u_cst_t_setup_cs luo_setup_cs

If row > 0 Then
	ls_data1 = this.GetItemString(row, 'data1')
	ls_data2 = this.GetItemString(row, 'data2') 
	
 	If ls_data1 = 'Utility' And ls_data2 = 'Import MV' Then 
		lstr_generic.ss_String10 = 'CUSTOMER'
		openwithparm(w_import_data_customer,lstr_generic)
	end if
	
	If ls_data1 = 'Utility' And ls_data2 = 'Import Kendaraan' Then 
		lstr_generic.ss_String10 = 'OBJECT'
		openwithparm(w_import_data_customer,lstr_generic)
	end if
	
	If ls_data1 = 'Utility' And ls_data2 = 'Setup Customer Service' Then uo_1.of_OpenDocument('Setup Customer Service', luo_setup_cs, 0, False) 
	
	If ls_data1 = 'Finance' And ls_data2 = 'Pelunasan(IN/OUT)' Then uo_1.of_OpenDocument('Pelunasan', luo_pelunasan, 0, False) 
	If ls_data1 = 'Finance' And ls_data2 = 'Cash Bank' Then uo_1.of_OpenDocument('Cash Bank', luo_cashbank, 0, False)
	If ls_data1 = 'Finance' And ls_data2 = 'Outstanding' Then uo_1.of_OpenDocument('Outstanding', luo_outstanding, 0, False)
	If ls_data1 = 'Finance' And ls_data2 = 'Pengajuan Pembayaran' Then uo_1.of_OpenDocument('Bukti Bayar', luo_pp, 0, False)
	If ls_data1 = 'Finance' And ls_data2 = 'Setoran' Then uo_1.of_OpenDocument('Bukti Bayar', luo_setoran, 0, False)
	
	
End If

If This.RowCount() = 0 Then Return

ls_DWOName = dwo.name
ls_DWOType = dwo.Type
ls_DWBand = This.GetBandAtPointer()
lstr_band = f_parse_bandinfo(ls_DWBand)

If Left(ls_DWOName, 3) = 'cb_' Or Left(ls_DWOName, 2) = 't_' Or ls_DWOName = "datawindow" Then 
	Return
End If

If lstr_band.row = 0 Then Return

Choose Case lstr_band.band
	Case 'tree.level.1'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,1) Then
			This.Collapse(lstr_band.row,1)
		Else
			This.Expand(lstr_band.row,1)
		End If
	
	Case 'tree.level.2'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,2) Then
			This.Collapse(lstr_band.row,2)
		Else
			This.expand(lstr_band.row,2)
		End If
	
	Case 'tree.level.3'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,3) Then
			This.Collapse(lstr_band.row,3)
		Else
			This.expand(lstr_band.row,3)
		End If
	
	Case 'tree.level.4'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,4) Then
			This.Collapse(lstr_band.row,4)
		Else
			This.expand(lstr_band.row,4)
		End If
	
	Case 'tree.level.5'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,5) Then
			This.Collapse(lstr_band.row,5)
		Else
			This.expand(lstr_band.row,5)
		End If
End Choose
end event

event constructor;This.Modify("DataWindow.Color='" +  String(RGB(230, 230, 230)) + "'")
This.Modify("t_2.BackGround.Color='" + String(RGB(174, 213, 130)) + "'")
end event

type uo_2 from u_cst_shortcutbar within w_main
integer x = 1193
integer y = 684
integer taborder = 20
end type

on uo_2.destroy
call u_cst_shortcutbar::destroy
end on

type uo_1 from u_cst_powerdock within w_main
integer width = 4375
integer height = 2324
integer taborder = 30
end type

on uo_1.destroy
call u_cst_powerdock::destroy
end on

event ue_preconstructor;call super::ue_preconstructor;of_SetDesiredHeight(gl_HeightSpace)
end event

type dw_2 from datawindow within w_main
integer x = 370
integer y = 284
integer width = 686
integer height = 136
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_menu"
boolean border = false
boolean livescroll = true
end type

event clicked;String ls_data1
String ls_data2
String ls_DWOName
String ls_DWOType
String ls_DWBand

str_dw_band lstr_band

////deklarasi Transakasi Asuransi Jiwa Kredit 
//u_cst_t_polis_borderaux luo_borderaux
//u_cst_t_polis_induk luo_polis_induk
//u_cst_t_polis_induk_produk luo_polis_induk_produk
//u_cst_t_rate luo_rate
//u_cst_t_setup_produk_ajk luo_t_setup_produk_ajk
//u_cst_t_polis_induk_customer_ajk luo_polis_induk_customer_ajk
//u_cst_t_setup_dokumen luo_setup_dokumen
//u_cst_t_transfer_rate luo_transfer_rate
//u_cst_t_transfer_hupi luo_transfer_hupi
//u_cst_t_end luo_endorsment
//u_cst_t_nota luo_invoice
//u_cst_t_bc_nota luo_nota
//u_cst_t_fin_pelunasan luo_pelunasan
//u_cst_t_klaim luo_klaim
//u_cst_health luo_health

////deklarasi transaksi MV
//u_cst_t_setup_produk_mv  luo_t_setup_produk_mv
//u_cst_t_polis_induk_customer_mv luo_t_customer_mv
//u_cst_t_update_no_polis luo_update_no_polis
//
////deklarasi transaksi Marine Cargo
//u_cst_t_setup_produk_cargo luo_t_setup_produk_cargo
//
////deklarasi transaksi Health
//u_cst_t_setup_produk_cp luo_t_setup_produk_cp
//u_cst_t_polis_induk_customer_cp luo_t_customer_cp
//
////deklarasi klaim Health
//u_cst_t_klaim_cp  luo_t_klaim_cp  

//deklarasi transaksi Finance's 
u_cst_t_fin_cashbank luo_cashbank

//transaksi umum
u_cst_m_login_password luo_login_password

u_cst_t_polis luo_polis
u_cst_t_nota luo_nota
u_cst_t_nota_rekap luo_rekap_nota

u_cst_t_customer_service2 luo_cs

If row > 0 Then
	ls_data1 = this.GetItemString(row, 'data1')
	ls_data2 = this.GetItemString(row, 'data2')
	
	If ls_data1 = 'Transaksi' And ls_data2 = 'TeleMarketing MV' Then uo_1.of_OpenDocument('Transaksi Telemarketing', luo_cs, 0, False)
	
	If ls_data1 = 'Transaksi' And ls_data2 = 'Input Polis' Then uo_1.of_OpenDocument('Transaksi Input Polis', luo_polis, 0, False)
	If ls_data1 = 'Transaksi' And ls_data2 = 'Input Nota' Then 
		gs_menu = ''
		uo_1.of_OpenDocument('Transaksi Input Nota', luo_nota, 0, False)
	end if
	If ls_data1 = 'Transaksi' And ls_data2 = 'Rekap Nota' Then 
		gs_menu = ''
		uo_1.of_OpenDocument('Transaksi Rekap Nota', luo_rekap_nota, 0, False)
	end if
	
//	//Clicked Menu Asuransi Jiwa Kredit (Life)
//	//Transaksi
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Polis Borderaux' Then uo_1.of_OpenDocument('Polis Borderaux', luo_borderaux, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Polis Induk' Then uo_1.of_OpenDocument('Polis Induk', luo_polis_induk, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Polis Induk Produk' Then uo_1.of_OpenDocument('Polis Induk Produk', luo_polis_induk_produk, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Polis Induk Customer' And gs_modul = 'CREDIT LIFE'Then  uo_1.of_OpenDocument('Polis Induk Customer', luo_polis_induk_customer_ajk, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Input Rate' Then uo_1.of_OpenDocument('Rate', luo_rate, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Setup Produk' And gs_modul = 'CREDIT LIFE'Then uo_1.of_OpenDocument('Setup Produk', luo_t_setup_produk_ajk, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Setup Dokumen' Then uo_1.of_OpenDocument('Setup Dokumen', luo_setup_dokumen, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Invoice' Then uo_1.of_OpenDocument('Invoice', luo_invoice, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Rekap Invoice' Then uo_1.of_OpenDocument('Rekap Invoice', luo_nota, 0, False)
//	
//	//Endorsement
//	If ls_data1 = 'Endorsment' And ls_data2 = 'Input Endorsment' Then uo_1.of_OpenDocument('Endorsement', luo_endorsment, 0, False)
//	
	//klaim
//	If ls_data1 = 'Klaim' And ls_data2 = 'Header Klaim' Then uo_1.of_OpenDocument('Klaim', luo_klaim, 0, False)
	
	//utility
//	If ls_data1 = 'Utility' And ls_data2 = 'Import / View Rate' Then uo_1.of_OpenDocument('Transfer Rate', luo_transfer_rate, 0, False)
//	If ls_data1 = 'Utility' And ls_data2 = 'Transfer Data Peserta' Then uo_1.of_OpenDocument('Transfer Data Peserta', luo_transfer_hupi, 0, False)
	
//	//Clicked Menu Motor Vechicle	
//	//Transaksi
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Setup Produk' And gs_modul = 'MOTOR VEHICLE' Then uo_1.of_OpenDocument('Setup Produk', luo_t_setup_produk_mv, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Polis Induk Customer' And gs_modul = 'MOTOR VEHICLE' Then uo_1.of_OpenDocument('Polis Induk Customer', luo_t_customer_mv, 0, False)
	
//	//utility
//	If ls_data1 = 'Utility' And ls_data2 = 'Update Nomor Polis'  Then uo_1.of_OpenDocument('Update No Polis', luo_update_no_polis, 0, False)
	
//	//Clicked Menu Health
//	//Transaksi
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Setup Produk' And gs_modul = 'HEALTH' Then uo_1.of_OpenDocument('Setup Produk', luo_t_setup_produk_cp, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Polis Induk Customer' And gs_modul = 'HEALTH' Then uo_1.of_OpenDocument('Polis Induk Customer', luo_t_customer_cp, 0, False)
	
//	//Klaim
//	If ls_data1 = 'Klaim' And ls_data2 = 'Klaim Cash Plan' Then uo_1.of_OpenDocument('Kliam Cash Plan', luo_t_klaim_cp, 0, False)
	
//	//Clicked Menu Travel
//	//Transaksi
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Setup Produk' And gs_modul = 'TRAVEL' Then uo_1.of_OpenDocument('Setup Produk', luo_t_setup_produk_cp, 0, False)
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Polis Induk Customer' And gs_modul = 'TRAVEL' Then uo_1.of_OpenDocument('Polis Induk Customer', luo_t_customer_cp, 0, False)
	
//	//Clicked Menu Marine Cargo	
//	//Transaksi
//	If ls_data1 = 'Transaksi' And ls_data2 = 'Setup Produk' And gs_modul = 'MARINE'Then uo_1.of_OpenDocument('Setup Produk', luo_t_setup_produk_cargo, 0, False)
	
//	//Report
//	If ls_data1 = 'Report' And ls_data2 = 'Daftar Peserta' Then uo_1.of_OpenDocument('Daftar Peserta (Health/PA)', luo_health, 0, False)
	
End If

If This.RowCount() = 0 Then Return

ls_DWOName = dwo.name
ls_DWOType = dwo.Type
ls_DWBand = This.GetBandAtPointer()
lstr_band = f_parse_bandinfo(ls_DWBand)

If Left(ls_DWOName, 3) = 'cb_' Or Left(ls_DWOName, 2) = 't_' Or ls_DWOName = "datawindow" Then 
	Return
End If

If lstr_band.row = 0 Then Return

Choose Case lstr_band.band
	Case 'tree.level.1'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,1) Then
			This.Collapse(lstr_band.row,1)
		Else
			This.Expand(lstr_band.row,1)
		End If
	
	Case 'tree.level.2'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,2) Then
			This.Collapse(lstr_band.row,2)
		Else
			This.expand(lstr_band.row,2)
		End If
	
	Case 'tree.level.3'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,3) Then
			This.Collapse(lstr_band.row,3)
		Else
			This.expand(lstr_band.row,3)
		End If
	
	Case 'tree.level.4'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,4) Then
			This.Collapse(lstr_band.row,4)
		Else
			This.expand(lstr_band.row,4)
		End If
	
	Case 'tree.level.5'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,5) Then
			This.Collapse(lstr_band.row,5)
		Else
			This.expand(lstr_band.row,5)
		End If
End Choose
end event

event constructor;This.Modify("DataWindow.Color='" +  String(RGB(230, 230, 230)) + "'")
This.Modify("t_2.BackGround.Color='" + String(RGB(174, 213, 130)) + "'")
end event

type dw_1 from datawindow within w_main
integer x = 370
integer y = 148
integer width = 686
integer height = 136
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_menu"
boolean border = false
boolean livescroll = true
end type

event constructor;This.Modify("DataWindow.Color='" +  String(RGB(230, 230, 230)) + "'")
This.Modify("t_2.BackGround.Color='" + String(RGB(174, 213, 130)) + "'")
end event

event clicked;String ls_data1
String ls_data2
String ls_DWOName
String ls_DWOType
String ls_DWBand

str_dw_band lstr_band

//deklarasi object master umum 
u_cst_m_asuransi luo_asuransi
u_cst_m_agen luo_agen
u_cst_m_bank luo_bank
u_cst_m_broker luo_broker
u_cst_m_cabang luo_cabang
u_cst_m_customer luo_customer
u_cst_m_menu luo_menu
u_cst_m_agama luo_agama
u_cst_m_bisnis luo_bisnis
u_cst_m_fin_cara_setoran luo_cara_setoran
u_cst_m_databank luo_databank
u_cst_m_divisi luo_divisi
u_cst_m_jabatan luo_jabatan
u_cst_m_karyawan luo_karyawan
u_cst_m_karyawan_group luo_karyawan_group
u_cst_m_peserta	luo_peserta
u_cst_m_user_akses luo_user_akses
u_cst_m_kota luo_kota
u_cst_m_kurs luo_kurs
u_cst_m_negara luo_negara
u_cst_m_propinsi luo_propinsi
u_cst_m_pajak luo_pajak
u_cst_m_dokumen luo_dokumen
u_cst_m_kurs_standard luo_kurs_standard
u_cst_m_regional luo_m_regional

u_cst_m_kendaraan luo_kendaraan

////deklarasi object master khusus
//u_cst_m_jaminan luo_jaminan
//u_cst_m_produk luo_produk
//u_cst_m_account_bank luo_account_bank
//u_cst_m_kategori_tsi_mv luo_kategori_tsi_mv
//u_cst_m_info_broker luo_info_broker
//u_cst_m_jns_endorsment luo_endorsment
//u_cst_m_jns_klaim luo_klaim
//u_cst_m_type_merk_mv luo_type_merk_mv
//u_cst_m_plan luo_plan
//u_cst_m_plan_code luo_plan_code
//u_cst_m_benefit luo_benefit

//Fiannce
u_cst_t_fin_pelunasan luo_pelunasan 
u_cst_t_fin_cashbank luo_cashbank
u_cst_t_fin_outstanding luo_outstanding

//deklarasi object system setting
u_cst_m_login_password luo_login_password
u_cst_security_access luo_security_access
u_cst_m_info luo_info

//deklarasi object laporan 
u_cst_t_fin_lap_arap luo_find_lap_arab

If row > 0 Then
	ls_data1 = this.GetItemString(row, 'data1')
	ls_data2 = this.GetItemString(row, 'data2')
	
	//master umum
	If ls_data1 = 'Master Umum' And ls_data2 = 'Kendaraan' Then uo_1.of_OpenDocument('Master Kendaraan', luo_kendaraan, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Agama' Then uo_1.of_OpenDocument('Master Agama', luo_agama, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Asuransi' Then uo_1.of_OpenDocument('Master Asuransi', luo_Asuransi, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Agen' Then uo_1.of_OpenDocument('Master Agen', luo_agen, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Bank' Then uo_1.of_OpenDocument('Master Bank', luo_bank, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Broker' Then uo_1.of_OpenDocument('Master Broker', luo_broker, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Cabang' Then uo_1.of_OpenDocument('Master Cabang', luo_cabang, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Customer' Then uo_1.of_OpenDocument('Master Customer', luo_customer, 0, False)
//	If ls_data1 = 'Master Umum' And ls_data2 = 'Databank' Then uo_1.of_OpenDocument('Master Databank', luo_databank, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Kurs' Then uo_1.of_OpenDocument('Master Kurs', luo_kurs, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Divisi' Then uo_1.of_OpenDocument('Master Divisi', luo_divisi, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Negara' Then uo_1.of_OpenDocument('Master Negara', luo_negara, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Propinsi' Then uo_1.of_OpenDocument('Master Propinsi', luo_propinsi, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Pajak' Then uo_1.of_OpenDocument('Master Pajak', luo_pajak, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Kota' Then uo_1.of_OpenDocument('Master Kota', luo_kota, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Karyawan' Then uo_1.of_OpenDocument('Master Karyawan', luo_karyawan, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Karyawan Group' Then uo_1.of_OpenDocument('Master Karyawan Group', luo_karyawan_group, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Peserta' Then uo_1.of_OpenDocument('Master Peserta', luo_peserta, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'User Akses' Then uo_1.of_OpenDocument('Master User Akses', luo_user_akses, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Jabatan' Then uo_1.of_OpenDocument('Master Jabatan', luo_jabatan, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Bisnis' Then uo_1.of_OpenDocument('Master Bisnis', luo_bisnis, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Dokumen' Then uo_1.of_OpenDocument('Master Dokumen', luo_dokumen, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Kurs Standard' Then uo_1.of_OpenDocument('Master Kurs Standard', luo_kurs_standard, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Cara Bayar' Then uo_1.of_OpenDocument('Master Cara Bayar', luo_cara_setoran, 0, False)
	If ls_data1 = 'Master Umum' And ls_data2 = 'Regional' Then uo_1.of_OpenDocument('Master Regional', luo_m_regional, 0, False)
	
//	//master khusus
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Account Bank' Then uo_1.of_OpenDocument('Master Account Bank', luo_account_bank, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Jenis Endorsement' Then uo_1.of_OpenDocument('Master Jenis Endorsment', luo_endorsment, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Jenis Klaim' Then uo_1.of_OpenDocument('Master Jenis Klaim', luo_klaim, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Produk' Then uo_1.of_OpenDocument('Master Produk', luo_produk, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Jaminan' Then uo_1.of_OpenDocument('Master Jaminan', luo_jaminan, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Kategori TSI' Then uo_1.of_OpenDocument('Master Kategori TSI', luo_kategori_tsi_mv, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Merk dan Type' Then uo_1.of_OpenDocument('Master Merk dan Type', luo_type_merk_mv, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Plan' Then uo_1.of_OpenDocument('Master Plan', luo_plan, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Plan Code' Then uo_1.of_OpenDocument('Master Plan Code', luo_plan_code, 0, False)
//	If ls_data1 = 'Master Khusus' And ls_data2 = 'Benefit' Then uo_1.of_OpenDocument('Master benefit', luo_benefit, 0, False)
	
//	//system setting
//	If ls_data1 = 'System Setting' And ls_data2 = 'Info' Then uo_1.of_OpenDocument('Master Info', luo_info, 0, False)
////	If ls_data1 = 'System Setting' And ls_data2 = 'Info Broker' Then uo_1.of_OpenDocument('Master Info Broker', luo_info_broker, 0, False)
//	If ls_data1 = 'System Setting' And ls_data2 = 'Menu' Then uo_1.of_OpenDocument('Master Menu', luo_menu, 0, False)
//	If ls_data1 = 'System Setting' And ls_data2 = 'Security Access' Then uo_1.of_OpenDocument('Security Access', luo_security_access, 0, False)
//	If ls_data1 = 'System Setting' And ls_data2 = 'Login' Then uo_1.of_OpenDocument('Master Login', luo_login_password, 0, False)
//	
//	//Finance 
//	If ls_data1 = 'Finance' And ls_data2 = 'Pelunasan(IN/OUT)' Then uo_1.of_OpenDocument('Pelunasan', luo_pelunasan, 0, False) 
//	If ls_data1 = 'Finance' And ls_data2 = 'Cash Bank' Then uo_1.of_OpenDocument('Cash Bank', luo_cashbank, 0, False)
//	If ls_data1 = 'Finance' And ls_data2 = 'Outstanding' Then uo_1.of_OpenDocument('Outstanding', luo_outstanding, 0, False)
	
//	//system setting
	If ls_data1 = 'General Report' And ls_data2 = 'Outstanding' Then uo_1.of_OpenDocument('Outstanding', luo_find_lap_arab, 0, False)
	
End If

If This.RowCount() = 0 Then Return

ls_DWOName = dwo.name
ls_DWOType = dwo.Type
ls_DWBand = This.GetBandAtPointer()
lstr_band = f_parse_bandinfo(ls_DWBand)

If Left(ls_DWOName, 3) = 'cb_' Or Left(ls_DWOName, 2) = 't_' Or ls_DWOName = "datawindow" Then 
	Return
End If

If lstr_band.row = 0 Then Return

Choose Case lstr_band.band
	Case 'tree.level.1'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,1) Then
			This.Collapse(lstr_band.row,1)
		Else
			This.Expand(lstr_band.row,1)
		End If
	
	Case 'tree.level.2'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,2) Then
			This.Collapse(lstr_band.row,2)
		Else
			This.expand(lstr_band.row,2)
		End If
	
	Case 'tree.level.3'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,3) Then
			This.Collapse(lstr_band.row,3)
		Else
			This.expand(lstr_band.row,3)
		End If
	
	Case 'tree.level.4'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,4) Then
			This.Collapse(lstr_band.row,4)
		Else
			This.expand(lstr_band.row,4)
		End If
	
	Case 'tree.level.5'
		This.ScrollToRow(lstr_band.row)
				
		If This.IsExpanded(lstr_band.row,5) Then
			This.Collapse(lstr_band.row,5)
		Else
			This.expand(lstr_band.row,5)
		End If
End Choose
end event

