# FancyBoardApp
This is bulletin board app which will be added with bootstrap UI, reply function

<h3>Tutorial</h3>
Add root-context.xml on ../webapp/WEB-INF/spring
```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mybatis-spring="http://mybatis.org/schema/mybatis-spring"
	xsi:schemaLocation="http://mybatis.org/schema/mybatis-spring 
						http://mybatis.org/schema/mybatis-spring-1.2.xsd
						http://www.springframework.org/schema/beans 
						http://www.springframework.org/schema/beans/spring-beans.xsd
						http://www.springframework.org/schema/context 
						http://www.springframework.org/schema/context/spring-context-3.1.xsd">

	<!-- Root Context: defines shared resources visible to all other web components -->
	<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"></property>
		<property name="url" value="jdbc:log4jdbc:mysql://localhost:3306/board2"></property>
		<property name="username" value="{userName}"></property>
		<property name="password" value="{password}"></property>
	</bean> 
	
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="dataSource"></property>
		<property name="configLocation" value="classpath:/mybatis-config.xml"></property>
		<property name="mapperLocations" value="classpath:/mappers/**/*Mapper.xml"></property>
	</bean>
	
	<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate" destroy-method="clearCache">
		<constructor-arg name="sqlSessionFactory" ref="sqlSessionFactory"></constructor-arg>
	</bean>
	
	<context:component-scan base-package="com.donkunny"></context:component-scan>
</beans>
```
