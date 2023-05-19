FROM openjdk

WORKDIR /app

COPY target/MavenNDepartmentStoreWebsite-0.0.1-SNAPSHOT.war  /app

CMD ["java","-jar","/app/MavenNDepartmentStoreWebsite-0.0.1-SNAPSHOT.war"]