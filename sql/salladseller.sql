CREATE TABLE member(
	m_num INT PRIMARY KEY AUTO_INCREMENT,
	m_id VARCHAR(10) UNIQUE NOT NULL,
	m_pw VARCHAR(20) NOT NULL,
	m_email VARCHAR(30) NOT NULL,
	m_addr VARCHAR(50),
	m_phone VARCHAR(11) NOT NULL
);

CREATE TABLE category(
	cat_id INT PRIMARY KEY AUTO_INCREMENT,
	cat_name VARCHAR(20) UNIQUE NOT NULL,
	cat_desc VARCHAR(5000)
);

CREATE TABLE product(
	p_num INT PRIMARY KEY AUTO_INCREMENT,
	cat_id INT NOT NULL,
	p_name VARCHAR(50) NOT NULL,
	image VARCHAR(100),
	descript VARCHAR(1000),
	specification VARCHAR(1000),
	price INT NOT NULL,
	stock INT NOT NULL,
	foreign key(cat_id) REFERENCES category(cat_id)
);

CREATE TABLE cart(
	cart_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	m_id VARCHAR(50) NOT NULL,
	p_num INT NOT NULL,
	amount INT DEFAULT 0,
	FOREIGN KEY(m_id) REFERENCES member(m_id),
	FOREIGN KEY(p_num) REFERENCES product(p_num)
);

CREATE TABLE reply(
	rno int PRIMARY KEY AUTO_INCREMENT,
	num int NOT NULL,
	replytext varchar(1000) NOT NULL,
	replyer varchar(50) NOT NULL,
	regdate timestamp NOT NULL default now(),
	updatedate timestamp NOT NULL default now(),	
	foreign key(num) references product(p_num)
);