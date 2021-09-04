*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Suite Setup    Connect To Database    psycopg2    ${db_name}    ${db_user}    ${db_password}    ${db_host}    ${db_port}
Suite Teardown    Disconnect From Database


*** Variables ***
${db_name}    learning
${db_user}    postgres
${db_password}    postgres
${db_host}    localhost
${db_port}    5432


*** Test Cases ***
#Create Person Table
#    ${out} =    execute sql string    create table person(id serial primary key, first_name varchar(100), last_name varchar(100));
#    log to console    ${out}
#    should be equal as strings    ${out}    None

#Insert data in person table
#    execute sql string    insert into person (first_name, last_name) values('John', 'Doe')

#Insert Multiple Records using sql file
#    execute sql script    ./TestData/insert_data.sql

Check data in table
    check if exists in database    select first_name from person where first_name='Jane';

Check table exists
    table must exist    person

Validate row count from table
    row count is 0    select * from person where first_name='Dane'
    row count is equal to x    select * from person where first_name='Jane'    1

#Update record in table
#    execute sql string    update person set last_name='James' where first_name='Jim'

Delete records
    execute sql string    delete from person where first_name='John'

Retrieve records from table
    @{results} =    query    select * from person;
    FOR    ${result}    IN    @{results}
        log to console    ${result[1]}
    END