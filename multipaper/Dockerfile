FROM eclipse-temurin:17-jdk-alpine AS build
RUN <<EOF
apk add --no-cache git
git config --global user.email "dev@null.com"
git config --global user.name "foo"
git clone https://github.com/MultiPaper/MultiPaper /MultiPaper
EOF
WORKDIR /MultiPaper
RUN <<EOF
./gradlew --parallel applyPatches
./gradlew --parallel shadowjar createReobfPaperclipJar
EOF
RUN mv MultiPaper-Master/build/libs/multipaper-master*.jar multipaper-master.jar
RUN mv build/libs/multipaper-paperclip*-reobf.jar multipaper-paperclip.jar
RUN ls -lha

FROM eclipse-temurin:17-jre-alpine AS jar-base
# https://spark.lucko.me/docs/misc/Using-async-profiler#install-libstdc
RUN apk add --no-cache libstdc++
WORKDIR /MultiPaper
RUN echo eula=TRUE > eula.txt

FROM jar-base AS master
COPY --from=build /MultiPaper/multipaper-master.jar /MultiPaper
CMD ["java", "-jar", "multipaper-master.jar"]

FROM jar-base AS paperclip
COPY --from=build /MultiPaper/multipaper-paperclip.jar /MultiPaper
COPY paperclip-entrypoint.sh .
ENTRYPOINT ["./paperclip-entrypoint.sh"]
