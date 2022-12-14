$PBExportHeader$u_cst_m_karyawan.sru
forward
global type u_cst_m_karyawan from u_cst_tabpage_1dw
end type
end forward

global type u_cst_m_karyawan from u_cst_tabpage_1dw
integer width = 645
integer height = 464
string tabname = "MASTER KARYAWAN"
end type
global u_cst_m_karyawan u_cst_m_karyawan

on u_cst_m_karyawan.create
int iCurrent
call super::create
end on

on u_cst_m_karyawan.destroy
call super::destroy
end on

type uo_1_alt from u_cst_tabpage_1dw`uo_1_alt within u_cst_m_karyawan
end type

type dw_1 from u_cst_tabpage_1dw`dw_1 within u_cst_m_karyawan
string tag = "Karyawan"
integer width = 2926
integer height = 372
string title = "MASTER KARYAWAN"
string dataobject = "d_m_karyawan"
string windowedit = "w_m_karyawan_edit"
string tableedit = "m_karyawan"
end type

event dw_1::ue_retrieve;call super::ue_retrieve; of_retrieve()
end event

event dw_1::ue_deletebefore;call super::ue_deletebefore;String ActionInterLocal ="D|"
DataWindow adw_data[]
n_interlocal ln_interlocal

This.Accepttext()

adw_data ={dw_1}

ActionInterLocal +=String(This.Getrow())

ln_interlocal = Create n_interlocal

ln_interlocal.of_dispatchinterlocal(ActionInterLocal,adw_data)

Destroy ln_interlocal

If f_cek_valueinterlocal() = Failure Then Return Failure

Return AncestorReturnValue

 
end event

event dw_1::ue_predelete;call super::ue_predelete;long ll_Count

string ls_Kd_karyawan

ls_Kd_karyawan = this.getitemstring(al_row,'kd_karyawan')

select count(1)
into :ll_count
from m_login 
where m_login.kd_karyawan = :ls_Kd_karyawan ;

if isnull(ll_count) or sqlca.sqlcode <> 0 then ll_count = 0

if ll_count > 0 then
	Messagebox('Informasi','Karyawan ini tidak bisa di hapus karena mempunyai akses Login !')
	return -1
end if

return 1
end event

type uo_1 from u_cst_tabpage_1dw`uo_1 within u_cst_m_karyawan
end type

type dw_1_search from u_cst_tabpage_1dw`dw_1_search within u_cst_m_karyawan
end type

