spool log.log
drop user &1. cascade;
create user &1. identified by &2.;
grant connect,resource,dba to &1.;
connect &1./&2.@oracle;


create table t_mc_type(
	nid number not null primary key,
	sname varchar2(30),
	npid number,
	norder number
);

create sequence seq_t_mc_type 
increment by 1 start with 1 nomaxvalue minvalue 1;

comment on table t_mc_type is '商品类别表';

comment on column t_mc_type.nid is '类别编号';
comment on column t_mc_type.sname is '类别名称';
comment on column t_mc_type.npid is '父类编号';
comment on column t_mc_type.norder is '类别排序';


create table t_mc(
	nid number not null primary key,
	sname varchar2(30),
	sdescription varchar2(300),
	nprice number(10,2),
	simg varchar2(300),
	smctag char(1),
	dcdate date,
	nmaxid number,
	nminid number
);

create sequence seq_t_mc
increment by 1 start with 1 nomaxvalue minvalue 1;

comment on table t_mc_type is '商品信息表';

comment on column t_mc.nid is '类别编号';
comment on column t_mc.sname is '类别名称';
comment on column t_mc.sdescription is '商品描述';
comment on column t_mc.nprice is '商品价格';
comment on column t_mc.simg is '商品图片';
comment on column t_mc.smctag is '是否缺货';
comment on column t_mc.dcdate is '添加时间';
comment on column t_mc.nmaxid is '所属大类';
comment on column t_mc.nminid is '所属小类';


create table t_user(
	suser varchar2(30) not null primary key,
	spwd varchar2(30),
	sname varchar2(30),
	ssex varchar2(3),
	dbirth date,
	semail varchar2(300),
	sphone varchar2(30),
	saddress varchar2(300),
	scode char(6),
	nlevel number(1),
	dregdate date,
	slock char(1),
	dlastdate date,
	nlogin number
);

comment on table t_user is '用户表';

comment on column t_user.suser is '用户名';
comment on column t_user.spwd is '密码';
comment on column t_user.sname is '真实姓名';
comment on column t_user.ssex is '性别';
comment on column t_user.dbirth is '出生日期';
comment on column t_user.semail is '电子邮箱';
comment on column t_user.sphone is '电话号码';
comment on column t_user.saddress is '地址';
comment on column t_user.scode is '邮编';
comment on column t_user.nlevel is '权限级别';
comment on column t_user.dregdate is '注册时间';
comment on column t_user.slock is '冻结';
comment on column t_user.dlastdate is '最后登录时间';
comment on column t_user.nlogin is '登录次数';


create table t_order(
	nid number not null primary key,
	scuser varchar2(30),
	dgdate date,
	spaytype varchar2(30),
	ssendtype varchar2(30),
	nmctypesize number,
	nmcsize number,
	ntotalprice number(10,2),
	sstatus char(1),
	smsg varchar2(2000),
	sauser varchar2(30),
	dadate date,
	ssname varchar2(30),
	ssaddress varchar2(300),
	sscode char(6),
	ssphone varchar2(30),
	ssemail varchar2(300)
);

create sequence seq_t_order
increment by 1 start with 1 nomaxvalue minvalue 1;

comment on table t_order is '订单表';

comment on column t_order.nid is '订单编号';
comment on column t_order.scuser is '订单用户名';
comment on column t_order.dgdate is '下单时间';
comment on column t_order.spaytype is '付款方式';
comment on column t_order.ssendtype is '发货方式';
comment on column t_order.nmctypesize is '商品种类数';
comment on column t_order.nmcsize is '商品总个数';
comment on column t_order.ntotalprice is '订单总金额';
comment on column t_order.sstatus is '审核状态';
comment on column t_order.smsg is '订单反馈';
comment on column t_order.sauser is '审核人';
comment on column t_order.dadate is '审核时间';
comment on column t_order.ssname is '收货人';
comment on column t_order.ssaddress is '收货人地址';
comment on column t_order.sscode is '收货人邮编';
comment on column t_order.ssphone is '收货人联系电话';
comment on column t_order.ssemail is '收货人email';



create table t_order_item(
	nid number not null primary key,
	norderid number,
	nmcid number,
	smcname varchar2(30),
	sdescription varchar2(300),
	simg varchar2(300),
	ncount number,
	nprice number(10,2),
	ntotalprice number(10,2)
);

create sequence seq_t_order_item
increment by 1 start with 1 nomaxvalue minvalue 1;


comment on table t_order_item is '订单条目表';

comment on column t_order_item.nid is '编号';
comment on column t_order_item.norderid is '所属订单';
comment on column t_order_item.nmcid is '订购商品ID';
comment on column t_order_item.smcname is '商品名';
comment on column t_order_item.sdescription is '商品简述';
comment on column t_order_item.simg is '商品图片';
comment on column t_order_item.ncount is '商品数';
comment on column t_order_item.nprice is '商品单价';
comment on column t_order_item.ntotalprice is '商品总价';

insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'电器',0);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'电脑',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'手机',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'mp3',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'移动硬盘',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'冰箱',1);
insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'服装',0);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'男装',7);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'女装',7);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'童装',7);




insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'三星s700台式电脑','性价比不错的品牌电脑',6000.10,'1.jpg','n',sysdate,1,2);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'联想3560笔记本电脑','能力不错，抗震，防摔，防水',12000.10,'2.jpg','n',sysdate,1,2);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'nokia 6120c','性价比超高',1400.00,'3.jpg','n',sysdate,1,3);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'nokia 3110','主席现在正在用的手机，性价比却不怎么样',1400,'4.jpg','y',sysdate,1,3);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'三星移动硬盘','5400转，320g，质量相当不错，包用三年',300,'10.jpg','n',sysdate,1,5);


insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'可爱木耳边衬衫','可爱风格',39.00,'5.jpg','n',sysdate,7,9);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'夏装淑女短袖雪纺连衣裙','人气超高的商品，大家不要错过',60.00,'6.jpg','n',sysdate,7,9);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'夏装欧美波西米亚V领连衣裙','人气超高的商品，大家不要错过',120.00,'7.jpg','n',sysdate,7,9);

insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'新款印花长袖T恤','ATOPI男装 新品特价包邮秒杀秋冬款全纯棉百搭长袖T恤',69.00,'8.jpg','n',sysdate,7,8);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'V领长袖T恤','秋冬新款男时尚 韩版 修身V领长袖T恤 男士T恤 POLO特价此款包邮',48.00,'9.jpg','n',sysdate,7,8);


insert into t_user(suser,spwd,sname,ssex,dbirth,semail,sphone,saddress,scode,nlevel,dregdate,slock,dlastdate,nlogin
)values('jessewizard','123456','hww','m','09-11月-89','wizardwsk@vip.qq.com','15980736321','福州大学学生公寓','350108',9,sysdate,0,sysdate,0);

insert into t_user(suser,spwd,sname,ssex,dbirth,semail,sphone,saddress,scode,nlevel,dregdate,slock,dlastdate,nlogin
)values('lxj','123456','刘少奇','m','09-12月-89','lxj@vip.qq.com','15980736321','福州大学学生公寓','350108',9,sysdate,0,sysdate,0);

insert into t_user(suser,spwd,sname,ssex,dbirth,semail,sphone,saddress,scode,nlevel,dregdate,slock,dlastdate,nlogin
)values('admin','123456','admin','m','09-12月-89','lxj@vip.qq.com','15980736321','福州大学学生公寓','350108',9,sysdate,0,sysdate,0);


insert into t_order(nid,scuser,dgdate,spaytype,ssendtype,nmctypesize,nmcsize,ntotalprice,sstatus,smsg,sauser,dadate,ssname,ssaddress,sscode,ssphone,ssemail)
values(seq_t_order.nextval,'lxj',sysdate,'网银','快递',3,3,19400.20,2,'这是订单反馈','admin',sysdate,'hww','福州大学','350108','15980736321','wizardwsk@vip.qq.com');




insert into t_order_item(nid,norderid,nmcid,smcname,sdescription,simg,ncount,nprice,ntotalprice)
values(seq_t_order_item.nextval,1,1,'三星s700台式电脑','性价比不错的品牌电脑','1.jpg',1,6000.10,6000.10);
insert into t_order_item(nid,norderid,nmcid,smcname,sdescription,simg,ncount,nprice,ntotalprice)
values(seq_t_order_item.nextval,1,2,'联想3560笔记本电脑','能力不错，抗震，防摔，防水','2.jpg',1,12000.10,12000.10);
insert into t_order_item(nid,norderid,nmcid,smcname,sdescription,simg,ncount,nprice,ntotalprice)
values(seq_t_order_item.nextval,1,3,'nokia 6120c','性价比超高','3.jpg',1,1400.00,1400.00);
commit;
spool off;