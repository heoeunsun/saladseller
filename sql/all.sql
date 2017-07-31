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

insert into category values(0,"fresh food","Known as Korea's premiere gourmet food destination, we offers thousands of imported specialty foods, olive oils, spices, sauces and cheese with selections you simply can't find anywhere else in the area. Charming, casual and a culinary delight from your local marchants.");
insert into category values(0,"processed food","We offers a wide and appealing array of absolutely fresh produce, seasonal as well as year-round. With our catering team, we brings our unconventional flare anywhere you want to be, from simple but delicious work lunches and elegant family dinner.");
insert into category values(0,"dessert","Our partners and their staffs produce from fresh ingredients mixed on the spot ? browse the aisles for everything from a mouthwatering selection of ice creams to waffles to our best chocolate collections. The desserts you order from our shop contain only pure cane sugar, cage free eggs and sustainably grown chocolates.");

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

insert into product values(0,1,'무농약 청경채',"images/img_1.jpg",
"중국 배추의 일종으로 중국 요리에 약방의 감초처럼 빠지지 않고 사용되는 청경채",
"청경채는 생으로 먹는 겉절이도 맛있지만, 굴소스와 함께 볶아 먹는 요리도 일품이지요. 영양이 풍부한 청경채를 소개합니다.
떫은 맛이 거의 없으며 냄비에 소량의 끓는 물을 넣고 소금과 기름을 넣은 후 청경채를 넣고 뚜껑을 덮어 데쳐 먹으면 좋고 겉절이, 국거리, 생식 등으로 다양하게 활용할 수 있습니다. 
자체에 즙이 많고 열량이 낮아 다이어트에 효과적이며 칼슘, 나트륨 등 각종 미네랄과 비타민 C나 카로틴이 풍부하여 피부미용에도 좋습니다.",3000,100);

<select id="searchBoard" parameterType="HashMap" resultType="board">
		select p.* , count(r.num) as replyCount
		from product p left join reply r
		on p.p_num = r.num
		where 1=0
		<if test="p_name !=null">
			or name like '%${name}%'
		</if>
		<if test="descript !=null">
			or descript like '%${descript}%'
		</if>
		<if test="specification !=null">
			or specification like '%${specification}%'
		</if>
		<if test="type == 0">
			or 1=1
		</if>
		group by p.p_num
		order by p_num desc
	</select>
	
select p.*, count(r.num) as replyCount

create table attach(
	fullName VARCHAR(150) PRIMARY KEY,
	num INT NOT NULL,
	regdate timestamp default now(),
	foreign key (num) references product(p_num)
);

CREATE TABLE orderList (
o_id INT PRIMARY KEY AUTO_INCREMENT,
p_id INT REFERENCES product(p_id) NOT NULL,
m_id INT REFERENCES member(m_id) NOT NULL,
o_num INT NOT NULL,
o_date DATETIME NOT NULL
);



-- 장바구니 테이블 생성
CREATE TABLE cart(
cart_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
m_id VARCHAR(50) NOT NULL,
p_num INT NOT NULL,
amount INT DEFAULT 0,
FOREIGN KEY(m_id) REFERENCES member(m_id),
FOREIGN KEY(p_num) REFERENCES product(p_num)
);

INSERT INTO cart(cart_id, m_id, p_num, amount) VALUES (1, 'owner', 26, 100);

-- 장바구니 테이블 시퀀스 생성
CREATE SEQUENCE seq_cart START WITH 10 INCREMENT BY 1;
COMMIT;

-- 장바구니 테이블 제약조건(외래키) 생성
ALTER TABLE cart ADD CONSTRAINT cart_userid_fk FOREIGN KEY(m_id) REFERENCES member(m_id);
ALTER TABLE cart ADD CONSTRAINT cart_product_fk FOREIGN KEY(p_num) REFERENCES product(p_num);
COMMIT;