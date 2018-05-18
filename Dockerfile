FROM gcr.io/cloud-builders/mvn

ADD . .

RUN mvn install:install-file -Dfile=./ojdbc7.jar -DgroupId=com.oracle.jdbc -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar

RUN mvn -DskipTests clean package


RUN java -Ddatabase.url=jdbc:oracle:thin:@vertx-template_dbserver_1:1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar target/vertx-*-SNAPSHOT.jar create-database run


