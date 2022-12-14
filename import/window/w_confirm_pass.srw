$PBExportHeader$w_confirm_pass.srw
forward
global type w_confirm_pass from window
end type
type cb_1 from commandbutton within w_confirm_pass
end type
type st_1 from statictext within w_confirm_pass
end type
type sle_pass from singlelineedit within w_confirm_pass
end type
end forward

global type w_confirm_pass from window
integer width = 1609
integer height = 300
boolean titlebar = true
string title = "Secure confirm"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 32294799
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_1 st_1
sle_pass sle_pass
end type
global w_confirm_pass w_confirm_pass

on w_confirm_pass.create
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_pass=create sle_pass
this.Control[]={this.cb_1,&
this.st_1,&
this.sle_pass}
end on

on w_confirm_pass.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_pass)
end on

type cb_1 from commandbutton within w_confirm_pass
integer x = 1248
integer y = 96
integer width = 329
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Confirm"
end type

event clicked;Datetime ldt_tgl_update
Integer li_count
String ls_input_password
String ls_kd_karyawan
String ls_kd_user
String ls_nm_divisi
String ls_real_password
String ls_real_password_decrypted
n_cryptoapi luo_crypt

ls_input_password = sle_pass.text

Select password,tgl_update
Into :ls_real_password,:ldt_tgl_update
From m_login
Where m_login.kd_karyawan =:gs_kd_user;

luo_crypt.iCryptoProvider = "Microsoft Strong Cryptographic Provider"
ls_real_password_decrypted = luo_crypt.of_decrypt(ls_real_password, String(ldt_tgl_update, "yyyymmddhhmmss"))

If IsNull(ls_real_password) Or Sqlca.Sqlcode <> 0 Then ls_real_password= ""
 
If ls_real_password_decrypted <> ls_input_password Then 
	MessageBox("Informasi","Password invalid!")
	Return
End If

ClosewithReturn(w_confirm_pass,"Success")

		
	
end event

type st_1 from statictext within w_confirm_pass
integer x = 23
integer y = 16
integer width = 1527
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 32294799
boolean enabled = false
string text = "Pleace, confirm your password before you can complete the process!"
boolean focusrectangle = false
end type

type sle_pass from singlelineedit within w_confirm_pass
integer x = 46
integer y = 96
integer width = 1193
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Open Sans"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

