FROM public.ecr.aws/docker/library/amazoncorretto:17
COPY target/data-exploration-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
