use db01test01

create table employee_mvc_328 (empid int primary key,name varchar(30),age int,sick_bal int,casual_bal int,supid int)

insert into employee_mvc_328 values(1120067,'Snehasis', 23, 8, 4, 564876)
insert into employee_mvc_328 values(342334 ,'Nayanita', 35 ,15, 3 ,123123)
insert into employee_mvc_328 values(489898 ,'Debyan', 31 ,12, 2 ,342334)
insert into employee_mvc_328 values(564876 ,'Antaroop', 30 ,9 ,3, 342334)

select * from  employee_mvc_328
select * from leave_mvc_328

create table leave_mvc_328(leave_start_date date,leave_end_date date,leave_type varchar(10),reason varchar(30),ndays int,eid int foreign key references employee_mvc_328(empid),lid int identity(1000,1) primary key,stat varchar(10) )


create proc sp_leave_mvc_register_328
@sleave_start_date date,@sleave_end_date date,
@sleave_type varchar(10),@sreason varchar(30),
@sndays int,@seid int ,@sstat varchar(10) ,@slid int out
as
begin
insert into leave_mvc_328 values(@sleave_start_date,@sleave_end_date,@sleave_type,@sreason ,@sndays,@seid,@sstat)
set @slid=@@IDENTITY
update employee_mvc_328 set sick_bal=(sick_bal-@sndays) where @sleave_type='sick'
update employee_mvc_328 set casual_bal=(casual_bal-@sndays) where @sleave_type='casual'
end

drop table leave_mvc_328

drop proc sp_leave_mvc_register_328
