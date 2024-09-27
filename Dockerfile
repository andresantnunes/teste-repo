FROM openjdk:17-jdk-slim-buster
# imagem de base da nossa imagem
# sistema operacional linux + jdk 17

LABEL authors="andre"
#metadados da imagem

WORKDIR /app
# dentro do sistema linux adicionado anteriormente
# vamos criar uma pasta chamada "/app"

COPY target/*.jar app.jar
# copaindo qualquer arquivo .jar que esteja na pasta target
# o jar é o código compilaod desse programa

ENV SERVER-PORT=8082
# define a variavel de ambiente SERVER-PORT que é lida pelo spring
# é equivalente ao "server.port=" do application.properties

EXPOSE 8082
# porta exposta para o Docker
# pode ser exposta para a máquina com o port-foward
# temos que definir qual porta na nossa maquina equivale a 8082 do container

ENTRYPOINT ["java", "-jar", "app.jar"]
# Comando de exercução da aplicação
# lembrando que é em uma linhade comando Linux