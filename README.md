# DevOps-Project-SpringBootApplication-rediscache-MySQLDB
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/6cd2b21f-af0a-42d2-9681-fdef0a40b9cb)
<br><br/>
1. Clone source code present in repo https://github.com/singhritesh85/spring-redis-cache-mysql.git as shown in screenshot below
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/4230b494-083b-4c2a-bcb4-7f0ace7cb552)
2. Now connect to the MySQL database and create database and table as required for the project.
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/a6c97420-5cc2-4ea0-8b19-00b27393a099)
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/2d0a7db1-b640-4e3a-83bd-02436d49811f)
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/872c7247-eb68-45bd-b52f-27924b102b8b)
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/08b842c0-69e1-40b5-90c7-bac6ea7794fb)
3. Do the entry in the file spring-redis-cache-mysql/src/main/resources/application.properties for spring.datasource.url, spring.datasource.username and spring.datasource.password as shown in the screenshot below.
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/fac4965f-0c21-4e3f-9b51-3f33490e0f8a)
4. Do the entry in the file spring-redis-cache-mysql/src/main/java/com/springredis/cache/SpringRedisCacheApplication.java for Redis hostname, Redis Port and Redis primary key.
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/a8bce6aa-8927-444d-bc26-0561a361044e)
5. Build the Code using Maven as shown in the screenshot below
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/5d14398a-41b4-4438-9728-aded6fee4810)
6. Start the Spring Boot Application as shown in screenshot below
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/e4062fb2-f742-49e0-bd60-36e3e7e38000)
7. Now use POST method for entry into the table items from POSTMAN as shown in screenshot below.
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/db60004a-6a25-4b14-b08b-c08322a29e93)
8. Checked from database and found entry is present in the database table as shown in the screenshot below
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/a07c4233-51f4-45d9-8b22-48dd204fbef5)
9. Now Access the entry using GET method from POSTMAN and record the time as shown in the screenshot below
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/3fc850bb-4124-4b7f-8e79-7ce70d8d66cd)
This is the first time we are accessing the data So Application will connect to database and provide the result and you can see from screenshot below the time taken 669ms.
10. Finally Access the entry second time using GET method from POSTMAN and record the time as shown in the screenshot below
![image](https://github.com/singhritesh85/DevOps-Project-SpringBootApplication-rediscache-MySQLDB/assets/56765895/a9c0406e-f19b-49a3-b4c7-38cfe7c76949)
This time when we access the data then SpringBoot Application will connect with Redis cache and provide the data and hence the time taken is less.
<br><br/>
The motive of this project is to show the advantage of implementing Redis Cache with MySQL database in an Application. Whenever we query any data then Application will connect with the Redis Cache and if it doesn't find the data in cache then it will connect with database and get the data. After geting the data from database it will make an entry in the Redis Cache for the same. So that next time if same data will be queried then Application will conect with Redis Cache and get the data rather than connecting with the database and getting the data and hence the latency for the request has been reduced.

<br><br/>
<br><br/>
<br><br/>
<br><br/>
<br><br/>
<br><br/>
<br><br/>
```
Source Code:- https://github.com/singhritesh85/spring-redis-cache-mysql.git
```
<br><br/>
<br><br/>
<br><br/>
<br><br/>
<br><br/>
<br><br/>
<br><br/>
```
Reference:-  https://github.com/souravkantha/spring-redis-cache.git
```
