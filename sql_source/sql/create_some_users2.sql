@c:/users/russ/Documents/Computers/SQL Scripts/My_own_SQL_scripts/sql_source/sql/create_some_users



@c:/users/russ/Documents/Computers/create_some_users



@c:\users\russ\Documents\Computers\create_some_users

CREATE DIRECTORY USER_DIR AS '/gers/e1cart1/adhoc/syscr';

CREATE DIRECTORY USER_DIR AS 'c:\users\russ\Documents\Computers';
GRANT read ON DIRECTORY user_dir TO hr;
GRANT write ON DIRECTORY user_dir TO hr;


exec create_some_users;



exec create_some_users(1,1000);

@c:\users\russ\Documents\Computers\make_some_users


@c:\users\russ\Documents\Computers\drop_some_users


@syscr/create_some_users
