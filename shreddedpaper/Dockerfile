FROM eclipse-temurin:21-jdk-alpine AS build
RUN <<EOF
apk add --no-cache git
git config --global user.email "dev@null.com"
git config --global user.name "foo"
git clone https://github.com/MultiPaper/ShreddedPaper /ShreddedPaper

cd /ShreddedPaper
./gradlew --parallel applyPatches
./gradlew --parallel shadowjar createReobfPaperclipJar

cd build/libs
mv shreddedpaper-paperclip-*.jar shreddedpaper.jar
EOF
FROM eclipse-temurin:21-jre-alpine
WORKDIR /ShreddedPaper
COPY --from=build /ShreddedPaper/build/libs/shreddedpaper.jar /ShreddedPaper
RUN echo eula=TRUE > eula.txt
CMD ["java", "-jar", "shreddedpaper.jar"]
