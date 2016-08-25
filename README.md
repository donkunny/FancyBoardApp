# FancyBoardApp
This is bulletin board app which has functions, which are
* searching(검색 기능)
* replies(댓글 달기)
* pagination(페이지 매기기)
* counting of views & replies(조회수, 댓글 수)

<hr />
* More Information you want, visit my blog, www.donkunny.com
* Demo test app is uploaded here, <a href="http://www.donkunny.com:8080/FancyBoardApp/sboard/list">FancyBoardApp</a>
* Any commands are fine. Thank you

<h3>Instruction</h3>
<h4>1. Make database and tables</h4>
```
mysql> create database fancyBoard;
mysql> use board2;
mysql> create table tbl_board (
    -> bno INT NOT NULL AUTO_INCREMENT,
    -> title VARCHAR(200) NOT NULL,
    -> content TEXT NULL,
    -> writer VARCHAR(50) NOT NULL,
    -> regdate TIMESTAMP NOT NULL DEFAULT now(),
    -> viewcnt INT DEFAULT 0,
    -> replycnt INT DEFAULT 0,
    -> PRIMARY KEY (bno));

mysql> create table tbl_reply (
    -> rno int NOT NULL AUTO_INCREMENT,
    -> bno int NOT NULL DEFAULT 0,
    -> replytext varchar (1000) not null,
    -> replyer varchar(50) not null,
    -> regdate TIMESTAMP NOT NULL DEFAULT now(),
    -> updatedate TIMESTAMP NOT NULL DEFAULT now(),
    -> primary key(rno)
    -> );

// add foreign key in tbl_reply
mysql> alter table tbl_reply add constraint fk_board foreign key (bno) references tbl_board (bno);
```
<h4>2. Initial repository Import </h4>
```
$ mkdir {directory-name}
$ cd {directory-name}
$ git clone git@github.com:donkunny/FancyBoardApp.git
$ git checkout development
```
<h4>3. Setting up environment (in STS) </h4>
<h5>1) Create root-context.xml in ../webapp/WEB-INF/spring directory</h5>
* Include Namespaces, which are beans, context, mybatis,tx
* Add beans which are dataSource, transactionManager, sqlSessionFactory, sqlSession
* Add component-scan for DAO, Service class
```
	<!-- Root Context: defines shared resources visible to all other web components -->
	<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"></property>
		<property name="url" value="jdbc:log4jdbc:mysql://localhost:3306/fancyBoard"></property>
		<property name="username" value="{userName}"></property>
		<property name="password" value="{password}"></property>
	</bean> 
	
	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager" >
    		<property name="dataSource" ref="dataSource" ></property>
    	</bean>
    
    	<tx:annotation-driven/>
	
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="dataSource"></property>
		<property name="configLocation" value="classpath:/mybatis-config.xml"></property>
		<property name="mapperLocations" value="classpath:/mappers/**/*Mapper.xml"></property>
	</bean>
	
	<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate" destroy-method="clearCache">
		<constructor-arg name="sqlSessionFactory" ref="sqlSessionFactory"></constructor-arg>
	</bean>
	
	<context:component-scan base-package="com.donkunny.persistence"></context:component-scan>
	<context:component-scan base-package="com.donkunny.service"></context:component-scan>
```

<h4>Reference </h4>
* 코드로 배우는 스프링 웹 프로젝트(구멍가게 코딩단 지음, 남가람북스)
