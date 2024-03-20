SET FOREIGN_KEY_CHECKS = 0;
SET GROUP_CONCAT_MAX_LEN=32768;
SET @tables = NULL;
SELECT GROUP_CONCAT('`', table_schema, '`.`', table_name, '`') INTO @tables
  FROM information_schema.tables
  WHERE table_schema = 'shop'; -- specify your database name here

SET @tables = CONCAT('DROP TABLE ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET FOREIGN_KEY_CHECKS = 1;

# -- Drop the existing database
# DROP DATABASE shop;
#
# -- Create a new database with the same name
# CREATE DATABASE shop;
#
# -- Use the new database
# USE shop;