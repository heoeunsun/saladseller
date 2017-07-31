create table member(
m_id varchar(20) primary key,
m_pw varchar(30) not null,
m_name varchar(20),
m_email varchar(30),
m_reg_date datetime default CURRENT_TIMESTAMP
);

