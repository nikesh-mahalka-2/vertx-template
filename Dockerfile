FROM gcr.io/cloud-builders/mvn

ADD . .

#ADD wait-for-it.sh wait-for-it.sh

RUN mvn install:install-file -Dfile=./ojdbc7.jar -DgroupId=com.oracle.jdbc -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar

RUN mvn -DskipTests clean package

RUN sudo apt-get update
RUN sudo apt-get install tree -y
#RUN 
#CMD java -Ddatabase.url=jdbc:oracle:thin:@vertx-template_dbserver_1:1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar target/vertx-*-SNAPSHOT.jar create-database run
# ENTRYPOINT ["java "]
#ENTRYPOINT ['java -Ddatabase.url=jdbc:oracle:thin:@vertx-template_dbserver_1:1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar target/vertx-*-SNAPSHOT.jar create-database run']
