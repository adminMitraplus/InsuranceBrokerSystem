$PBExportHeader$w_m_bank_edit.srw
forward
global type w_m_bank_edit from w_input
end type
end forward

global type w_m_bank_edit from w_input
integer width = 1362
integer height = 568
end type
global w_m_bank_edit w_m_bank_edit

on w_m_bank_edit.create
int iCurrent
call super::create
end on

on w_m_bank_edit.destroy
call super::destroy
end on

event ue_presave;call super::ue_presave;long ll_count

string ls_singkatan_bank
string ls_nm_bank
string ls_kd_bank

dw_1.accepttext()

ls_kd_bank = dw_1.getitemstring(1,'kd_bank')

ls_singkatan_bank = Trim(dw_1.getitemstring(1,'singkatan_bank'))
ls_nm_bank = Trim(dw_1.getitemstring(1,'nm_bank'))

select count(*)
into :ll_count
from m_bank
where (m_bank.singkatan_bank = :ls_singkatan_bank
	or m_bank.nm_bank = :ls_nm_bank )
	and m_bank.kd_bank <> :ls_Kd_bank;
	
if isnull(ll_count) or sqlca.sqlcode <> 0 then ll_count = 0

if ll_count > 0 then
	Messagebox('Informasi','Singkatan atau nama bank sudah ada !')
	return -1
end if

return 1
end event

type dw_1 from w_input`dw_1 within w_m_bank_edit
integer width = 1349
integer height = 384
string dataobject = "d_m_bank_edit"
boolean setnodocument = true
string nodocument = "no_bank"
end type

type uo_1 from w_input`uo_1 within w_m_bank_edit
end type

