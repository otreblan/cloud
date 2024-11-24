FROM eclipse-temurin:17-jdk-alpine AS build
RUN <<EOF
apk add --no-cache git
git config --global user.email "dev@null.com"
git config --global user.name "foo"
git clone https://github.com/crpmax/mc-bots /mc-bots -b v1.2.8
EOF
WORKDIR /mc-bots
RUN ./gradlew --parallel jar

FROM eclipse-temurin:17-jre-alpine AS jar-base
WORKDIR /mc-bots
COPY --from=build /mc-bots/build/libs/mc-bots-1.2.8.jar /mc-bots
COPY mc-bots-entrypoint.sh .
ENTRYPOINT [ "./mc-bots-entrypoint.sh" ]
