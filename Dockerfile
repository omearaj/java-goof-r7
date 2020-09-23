FROM maven:3-jdk-8-slim

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

ENV JAVA_TOOL_OPTIONS=-javaagent:/usr/src/goof/tcell/tcellagent.jar
ENV TCELL_AGENT_APP_ID=
ENV TCELL_AGENT_API_KEY=
ENV TCELL_API_URL=
ENV TCELL_INPUT_URL=

RUN mvn install

EXPOSE 8080
#ENTRYPOINT ["bash"]
ENTRYPOINT ["mvn", "tomcat7:run"]

