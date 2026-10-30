# Read Me First
The following was discovered as part of building this project:

* The original package name 'com.example..realestate' is invalid and this project uses 'com.example.realestate' instead.

# Getting Started

### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/3.5.4/maven-plugin)
* [Create an OCI image](https://docs.spring.io/spring-boot/3.5.4/maven-plugin/build-image.html)
* [Spring Web](https://docs.spring.io/spring-boot/3.5.4/reference/web/servlet.html)
* [Spring Data JPA](https://docs.spring.io/spring-boot/3.5.4/reference/data/sql.html#data.sql.jpa-and-spring-data)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/3.5.4/reference/using/devtools.html)

### Guides
The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)
* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)
* [Accessing data with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)

## Deploying publicly on Railway

The application uses JSP views, so the Docker build packages it as an executable WAR and runs it with Java 11. Railway deployment configuration is in `Dockerfile` and `railway.json`.

1. Push the project to a GitHub repository and create a Railway project from that repository.
2. Add a Railway MySQL service. In the application service, add these reference variables, replacing `MySQL` with the exact name of the database service if it differs:

   ```text
   SPRING_PROFILES_ACTIVE=railway
   MYSQLHOST=${{MySQL.MYSQLHOST}}
   MYSQLPORT=${{MySQL.MYSQLPORT}}
   MYSQLDATABASE=${{MySQL.MYSQLDATABASE}}
   MYSQLUSER=${{MySQL.MYSQLUSER}}
   MYSQLPASSWORD=${{MySQL.MYSQLPASSWORD}}
   ```

3. Add a Railway volume mounted at `/app/uploads`, then set `UPLOAD_DIR=/app/uploads` on the application service. Without this volume, uploaded property photos can be lost when Railway replaces the container.
4. Before the first deployment, optionally configure `ADMIN_BOOTSTRAP_USERNAME`, `ADMIN_BOOTSTRAP_EMAIL`, and `ADMIN_BOOTSTRAP_PASSWORD` to create the first admin account. Use a unique password with at least 8 characters, uppercase and lowercase letters, a number, and a special character; do not include spaces. The bootstrap only creates an account when no admin account exists.
5. Deploy the application service and generate a Railway public domain. The configured `/login` health check verifies the web application is responding.

Keep database passwords and admin credentials in Railway variables only; never commit them to Git. The developer's local `src/main/resources/application.properties` is ignored by Git and Docker so local credentials remain on the developer's machine. The Docker image automatically activates the `railway` profile, which keeps production settings separate from local `application.properties`, enables secure session cookies, and disables SQL statement logging. Railway's generated `PORT` is used automatically.

For local Docker smoke testing, build with `docker build -t estatefinders .` and run with the database environment variables above plus `SPRING_PROFILES_ACTIVE=railway`, `PORT=8080`, and `UPLOAD_DIR=/app/uploads`. Mount a local directory at `/app/uploads` if testing image uploads. Open `http://localhost:8080/login`.

### Maven Parent overrides

Due to Maven's design, elements are inherited from the parent POM to the project POM.
While most of the inheritance is fine, it also inherits unwanted elements like `<license>` and `<developers>` from the parent.
To prevent this, the project POM contains empty overrides for these elements.
If you manually switch to a different parent and actually want the inheritance, you need to remove those overrides.
