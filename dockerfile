FROM openjdk

WORKDIR /app

COPY target/MavenNDepartmentStoreWebsite-0.0.1-SNAPSHOT.war  /app

ENTRYPOINT ["java","-jar","/app/MavenNDepartmentStoreWebsite-0.0.1-SNAPSHOT.war","-web ","-webAllowOthers ","-tcp" ,"-tcpAllowOthers", "-browser"]