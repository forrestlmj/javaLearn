-- 查询备份记录表last_backup_offset中上次备份的位置，从这里开始备份

select * from TBL_QUERY_TASK_MGR where TASK_ID > (select LASR_BACKUP_OFFSET from BACKUP_OFFSET where STATUS = 'ready')
-- 运行完上述结果更新backup_offset中的备份位置
update  BACKUP_OFFSET set LASR_BACKUP_OFFSET = 5 where STATUS = 'ready' ;


insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task',1,2);
insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task2',1,2);
insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task3',1,2);
insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task4',1,2);
select * from TBL_QUERY_TASK_MGR where TASK_EXEC_STATUS = 1;
select * from BACKUP_OFFSET;
update  BACKUP_OFFSET set LASR_BACKUP_OFFSET = 5 where STATUS = 'ready' ;
select * from TBL_QUERY_TASK_MGR where TASK_ID > (select LASR_BACKUP_OFFSET from BACKUP_OFFSET where STATUS = 'ready');


insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task1',1,2);
insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task2',1,2);
insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task3',1,2);
insert into TBL_QUERY_TASK_MGR (TASK_NAME,TASK_TYPE,USER_ID) values('new task4',1,2);