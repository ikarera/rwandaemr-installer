delete from global_property where property like 'sync%';
delete from scheduler_task_config_property where task_config_id in (select task_config_id from scheduler_task_config where name like '%Sync%');
delete from scheduler_task_config where name like '%Sync%';
SET FOREIGN_KEY_CHECKS=0;
truncate sync_transmission_log_record;
truncate sync_server_record;
truncate sync_record;
truncate sync_server_class;
truncate sync_import;
truncate sync_class;
truncate sync_transmission_log;
truncate sync_server;
SET FOREIGN_KEY_CHECKS=1;
