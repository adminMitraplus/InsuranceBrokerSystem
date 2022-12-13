$PBExportHeader$w_m_cabang_edit.srw
forward
global type w_m_cabang_edit from w_input
end type
end forward

global type w_m_cabang_edit from w_input
integer width = 1833
integer height = 964
end type
global w_m_cabang_edit w_m_cabang_edit

on w_m_cabang_edit.create
int iCurrent
call super::create
end on

on w_m_cabang_edit.destroy
call super::destroy
end on

event ue_presave;call super::ue_presave;long ll_count

string ls_kd_cabang
string ls_nm_cabang

dw_1.accepttext()

ls_kd_cabang = dw_1.getitemstring(1,'kd_cabang')
ls_nm_cabang = Trim(dw_1.getitemstring(1,'nm_cabang'))

select count(1)
into :ll_count
from m_cabang
where m_cabang.nm_cabang = :ls_nm_cabang
	and m_cabang.kd_cabang <> :ls_kd_cabang;
	
if isnull(ll_count) or sqlca.sqlcode <> 0 then ll_Count = 0

if ll_count > 0 then
	Messagebox('Informasi','Cabang ini sudah ada!')
	return -1
end if

return 1
end event

type dw_1 from w_input`dw_1 within w_m_cabang_edit
integer width = 1819
integer height = 788
string dataobject = "d_m_cabang_edit"
end type

type uo_1 from w_input`uo_1 within w_m_cabang_edit
end type

