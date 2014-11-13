# About

A friend had this idea to build an app/service to send slow emails. I though it was a good idea and implemented a simple web demo based on it.

# Functionalities
The function is really simple: one web page to allow people to specified the recipient email address, the content of the email and the scheduled data to send and submit.

Then the data will stored in database and there is a quartz job running to send the emails when it is time.

# Technologies
- bootstrap
- Spring Boot 4.1
- Spring Core, Web, MVC, Data 4.1
- JPA, Hibernate 4.3.6
- MariaDB
- Quartz 2.2.1