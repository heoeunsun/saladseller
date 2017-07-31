create table if not exists board
(
	num int primary key auto_increment,
	pass varchar(30),
	name varchar(30),
	email varchar(30),
	title varchar(50),
	content varchar(1000),
	readCount int,
	writedate date
)


