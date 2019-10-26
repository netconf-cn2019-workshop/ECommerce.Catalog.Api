FROM dotnetclub-docker.pkg.coding.net/dotnetconf/mcr/aspnet:2.2 AS base
ARG PROJ_NAME
ENV APP_NAME=${PROJ_NAME}
WORKDIR /app
EXPOSE 80

FROM dotnetclub-docker.pkg.coding.net/dotnetconf/mcr/dotnet-core-sdk:2.2 AS build
COPY . /src/
WORKDIR /src/

RUN dotnet restore *.csproj
RUN dotnet build *.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish *.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "${APP_NAME}.dll"]


# docker build . -t dotnetclub-docker.pkg.coding.net/dotnetconf/dev/$(basename $(pwd) | cut -d '.' -f 2,3 | awk '{print tolower($0)}' | sed 's/\./\-/g'):$(date +"%Y%m%d-%H%M%S") --build-arg PROJ_NAME=$(basename $(pwd))
