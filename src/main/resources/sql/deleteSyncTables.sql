delete from global_property where property like 'sync%';
delete from scheduler_task_config_property where task_config_id in (select task_config_id from scheduler_task_config where name like '%Sync%');
delete from scheduler_task_config where name like '%Sync%';
delete from sync_server_record;
delete from sync_record;
delete from sync_server_class;
delete from sync_import;
delete from sync_class;
delete from sync_server;
