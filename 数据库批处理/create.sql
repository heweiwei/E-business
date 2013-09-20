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

comment on table t_mc_type is '��Ʒ����';

comment on column t_mc_type.nid is '�����';
comment on column t_mc_type.sname is '�������';
comment on column t_mc_type.npid is '������';
comment on column t_mc_type.norder is '�������';


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

comment on table t_mc_type is '��Ʒ��Ϣ��';

comment on column t_mc.nid is '�����';
comment on column t_mc.sname is '�������';
comment on column t_mc.sdescription is '��Ʒ����';
comment on column t_mc.nprice is '��Ʒ�۸�';
comment on column t_mc.simg is '��ƷͼƬ';
comment on column t_mc.smctag is '�Ƿ�ȱ��';
comment on column t_mc.dcdate is '���ʱ��';
comment on column t_mc.nmaxid is '��������';
comment on column t_mc.nminid is '����С��';


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

comment on table t_user is '�û���';

comment on column t_user.suser is '�û���';
comment on column t_user.spwd is '����';
comment on column t_user.sname is '��ʵ����';
comment on column t_user.ssex is '�Ա�';
comment on column t_user.dbirth is '��������';
comment on column t_user.semail is '��������';
comment on column t_user.sphone is '�绰����';
comment on column t_user.saddress is '��ַ';
comment on column t_user.scode is '�ʱ�';
comment on column t_user.nlevel is 'Ȩ�޼���';
comment on column t_user.dregdate is 'ע��ʱ��';
comment on column t_user.slock is '����';
comment on column t_user.dlastdate is '����¼ʱ��';
comment on column t_user.nlogin is '��¼����';


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

comment on table t_order is '������';

comment on column t_order.nid is '�������';
comment on column t_order.scuser is '�����û���';
comment on column t_order.dgdate is '�µ�ʱ��';
comment on column t_order.spaytype is '���ʽ';
comment on column t_order.ssendtype is '������ʽ';
comment on column t_order.nmctypesize is '��Ʒ������';
comment on column t_order.nmcsize is '��Ʒ�ܸ���';
comment on column t_order.ntotalprice is '�����ܽ��';
comment on column t_order.sstatus is '���״̬';
comment on column t_order.smsg is '��������';
comment on column t_order.sauser is '�����';
comment on column t_order.dadate is '���ʱ��';
comment on column t_order.ssname is '�ջ���';
comment on column t_order.ssaddress is '�ջ��˵�ַ';
comment on column t_order.sscode is '�ջ����ʱ�';
comment on column t_order.ssphone is '�ջ�����ϵ�绰';
comment on column t_order.ssemail is '�ջ���email';



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


comment on table t_order_item is '������Ŀ��';

comment on column t_order_item.nid is '���';
comment on column t_order_item.norderid is '��������';
comment on column t_order_item.nmcid is '������ƷID';
comment on column t_order_item.smcname is '��Ʒ��';
comment on column t_order_item.sdescription is '��Ʒ����';
comment on column t_order_item.simg is '��ƷͼƬ';
comment on column t_order_item.ncount is '��Ʒ��';
comment on column t_order_item.nprice is '��Ʒ����';
comment on column t_order_item.ntotalprice is '��Ʒ�ܼ�';

insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'����',0);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'����',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'�ֻ�',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'mp3',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'�ƶ�Ӳ��',1);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'����',1);
insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'��װ',0);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'��װ',7);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'Ůװ',7);
	insert into t_mc_type(nid,sname,npid) values(seq_t_mc_type.nextval,'ͯװ',7);




insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'����s700̨ʽ����','�Լ۱Ȳ����Ʒ�Ƶ���',6000.10,'1.jpg','n',sysdate,1,2);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'����3560�ʼǱ�����','�����������𣬷�ˤ����ˮ',12000.10,'2.jpg','n',sysdate,1,2);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'nokia 6120c','�Լ۱ȳ���',1400.00,'3.jpg','n',sysdate,1,3);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'nokia 3110','��ϯ���������õ��ֻ����Լ۱�ȴ����ô��',1400,'4.jpg','y',sysdate,1,3);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'�����ƶ�Ӳ��','5400ת��320g�������൱������������',300,'10.jpg','n',sysdate,1,5);


insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'�ɰ�ľ���߳���','�ɰ����',39.00,'5.jpg','n',sysdate,7,9);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'��װ��Ů����ѩ������ȹ','�������ߵ���Ʒ����Ҳ�Ҫ���',60.00,'6.jpg','n',sysdate,7,9);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'��װŷ����������V������ȹ','�������ߵ���Ʒ����Ҳ�Ҫ���',120.00,'7.jpg','n',sysdate,7,9);

insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'�¿�ӡ������T��','ATOPI��װ ��Ʒ�ؼ۰�����ɱ�ﶬ��ȫ���ްٴ��T��',69.00,'8.jpg','n',sysdate,7,8);
insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) 
	values(seq_t_mc.nextval,'V�쳤��T��','�ﶬ�¿���ʱ�� ���� ����V�쳤��T�� ��ʿT�� POLO�ؼ۴˿����',48.00,'9.jpg','n',sysdate,7,8);


insert into t_user(suser,spwd,sname,ssex,dbirth,semail,sphone,saddress,scode,nlevel,dregdate,slock,dlastdate,nlogin
)values('jessewizard','123456','hww','m','09-11��-89','wizardwsk@vip.qq.com','15980736321','���ݴ�ѧѧ����Ԣ','350108',9,sysdate,0,sysdate,0);

insert into t_user(suser,spwd,sname,ssex,dbirth,semail,sphone,saddress,scode,nlevel,dregdate,slock,dlastdate,nlogin
)values('lxj','123456','������','m','09-12��-89','lxj@vip.qq.com','15980736321','���ݴ�ѧѧ����Ԣ','350108',9,sysdate,0,sysdate,0);

insert into t_user(suser,spwd,sname,ssex,dbirth,semail,sphone,saddress,scode,nlevel,dregdate,slock,dlastdate,nlogin
)values('admin','123456','admin','m','09-12��-89','lxj@vip.qq.com','15980736321','���ݴ�ѧѧ����Ԣ','350108',9,sysdate,0,sysdate,0);


insert into t_order(nid,scuser,dgdate,spaytype,ssendtype,nmctypesize,nmcsize,ntotalprice,sstatus,smsg,sauser,dadate,ssname,ssaddress,sscode,ssphone,ssemail)
values(seq_t_order.nextval,'lxj',sysdate,'����','���',3,3,19400.20,2,'���Ƕ�������','admin',sysdate,'hww','���ݴ�ѧ','350108','15980736321','wizardwsk@vip.qq.com');




insert into t_order_item(nid,norderid,nmcid,smcname,sdescription,simg,ncount,nprice,ntotalprice)
values(seq_t_order_item.nextval,1,1,'����s700̨ʽ����','�Լ۱Ȳ����Ʒ�Ƶ���','1.jpg',1,6000.10,6000.10);
insert into t_order_item(nid,norderid,nmcid,smcname,sdescription,simg,ncount,nprice,ntotalprice)
values(seq_t_order_item.nextval,1,2,'����3560�ʼǱ�����','�����������𣬷�ˤ����ˮ','2.jpg',1,12000.10,12000.10);
insert into t_order_item(nid,norderid,nmcid,smcname,sdescription,simg,ncount,nprice,ntotalprice)
values(seq_t_order_item.nextval,1,3,'nokia 6120c','�Լ۱ȳ���','3.jpg',1,1400.00,1400.00);
commit;
spool off;