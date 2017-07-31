create table reply(
	rno int primary key auto_increment,
	num int not null,
	replytext varchar(1000) not null,
	replyer varchar(50) not null,
	regdate timestamp not null default now(),
	updatedate timestamp not null default now(),	
	foreign key(num) references product(p_num)
);