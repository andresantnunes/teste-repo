# Compilador do código

FROM openjdk:17-jdk-slim-buster AS build
# crio uma máquina para realizar o build do código

COPY . .
# Copiar todos os arquivos da raiz do projeto apra dentro da imagem docker

RUN chmod 700 mvnw
# comando linux para habilitar a execução do arquivo mvnw

RUN ./mvnw clean package
# gera um .jar do código dentro da imagem

### --------------

# Executor do código compilado

FROM openjdk:17-jdk-slim-buster

WORKDIR app

COPY --from=build target/*.jar app.jar
# copio do build anterior
# o build é tratado como uma máquina separada

ENTRYPOINT ["java", "-jar", "app.jar"]