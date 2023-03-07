-- dto
select
logic_database,logic_table,
max(case when init_type = 'trion' then init_name end),
max(case when init_type = 'hive' then init_name end) ,
max(case when init_type = 'kudu' then init_name end)
from fds_logic_view_init group by logic_database,logic_table;

INSERT INTO fetch_data_system.fds_logic_view_init (id, init_name, init_type, logic_database, logic_table) VALUES (1, 'view_db_tb', 'trion', 'db', 'tb');
INSERT INTO fetch_data_system.fds_logic_view_init (id, init_name, init_type, logic_database, logic_table) VALUES (2, 'db_tb', 'hive', 'db', 'tb');
INSERT INTO fetch_data_system.fds_logic_view_init (id, init_name, init_type, logic_database, logic_table) VALUES (3, 'db_tb', 'kudu', 'db', 'tb');
INSERT INTO fetch_data_system.fds_logic_view_init (id, init_name, init_type, logic_database, logic_table) VALUES (4, 'view_db_tb2', 'trion', 'db', 'tb2');
INSERT INTO fetch_data_system.fds_logic_view_init (id, init_name, init_type, logic_database, logic_table) VALUES (5, 'db_tb', 'hive', 'db', 'tb2');
INSERT INTO fetch_data_system.fds_logic_view_init (id, init_name, init_type, logic_database, logic_table) VALUES (6, 'db_tb', 'kudu', 'db', 'tb2');
INSERT INTO fetch_data_system.fds_logic_view_init (id, init_name, init_type, logic_database, logic_table) VALUES (7, 'view_db_tb3', 'trion', 'db', 'tb3');

