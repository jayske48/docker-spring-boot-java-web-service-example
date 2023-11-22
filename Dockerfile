# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine
ENV AWS_PROFILE=${AWS_PROFILE} 
ENV AWS_PROFILE_CENTRAL=${AWS_PROFILE_CENTRAL} 
ENV AWS_PROFILE_DMA=${AWS_PROFILE_DMA} 
ENV AWS_REGION=${AWS_REGION} 
ENV AWS_CENTRAL_REGION=${AWS_CENTRAL_REGION} 
ENV INSTALL_ID=${INSTALL_ID 
ENV DMA_INSTALL_ID=${DMA_INSTALL_ID} 
ENV DMP_INSTALL_ID=${DMP_INSTALL_ID} 
ENV AUTOMATION_VERSION="${AUTOMATION_VERSION} 
ENV WINDSOR_FAMILY_ID=${WINDSOR_FAMILY_ID} 
ENV WINDSOR_WF_ACCESS_ID=${WINDSOR_WF_ACCESS_ID} 
ENV INDSOR_WF_ACCESS_ID_CENTRAL=${WINDSOR_WF_ACCESS_ID_CENTRAL} 

# set shell to bash
# source: https://stackoverflow.com/a/40944512/3128926
RUN apk update && apk add bash

# Set the working directory to /app
WORKDIR /app

# Copy the fat jar into the container at /app
COPY /target/docker-java-app-example.jar /app
COPY int.env ./

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run jar file when the container launches
CMD ["java", "-jar", "docker-java-app-example.jar"]
