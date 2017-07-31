create table attach(
	fullName varchar(150) primary key,
	num int not null,
	regdate timestamp default now(),
	
	foreign key (num) references board(num)
);



select *
		from board where num=184
		
		
		

게시글 번호가 184 인 게시글의 모든 정보와 184번 게시글의 첨부파일 이름

select b.*, a.fullname from board b left join attach a 
 on b.num = a.num
 where b.num = 184;





		
		