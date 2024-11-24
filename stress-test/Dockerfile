FROM eclipse-temurin:17-jdk-alpine AS build
RUN <<EOF
apk add --no-cache git maven
git config --global user.email "dev@null.com"
git config --global user.name "foo"
git clone https://github.com/PureGero/minecraft-stress-test /minecraft-stress-test
#cd /minecraft-stress-test
#git checkout d341edeb331df88c9370e41b76000891dcbf55bb
EOF
WORKDIR /minecraft-stress-test
RUN mvn

FROM eclipse-temurin:17-jre-alpine AS jar-base
WORKDIR /stress-test
COPY --from=build /minecraft-stress-test/target/minecraft-stress-test-1.0.0-SNAPSHOT-jar-with-dependencies.jar /stress-test
COPY stress-test-entrypoint.sh .
ENTRYPOINT [ "./stress-test-entrypoint.sh" ]
