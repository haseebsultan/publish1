#FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build

ARG VERSION=3.1-alpine
#FROM mcr.microsoft.com/dotnet/core/aspnet:$VERSION AS base
#FROM mcr.microsoft.com/dotnet/core/runtime-deps:3.1-alpine3.12 AS base

#FROM microsoft/aspnetcore:latest AS base
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1  AS base
 #FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base


#FROM mcr.microsoft.com/dotnet/core/runtime:3.1-buster-slim

#FROM mcr.microsoft.com/dotnet/core/runtime:3.1 AS base
#FROM mcr.microsoft.com/dotnet/core/sdk:3.1

#FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
#FROM mcr.microsoft.com/windows/servercore:ltsc2016

#WORKDIR C:/build
WORKDIR /build
COPY . .

#RUN dir C:\build

RUN ls -lha /build

FROM base AS final
RUN set -e
RUN sudo apt-get update
#RUN apk update
#RUN apt-get install -y libxml2-dev
#RUN apk add --update --no-cache g++ gcc libxml2-dev

ENV LD_LIBRARY_PATH="/build/clidriver/lib/"
Env PATH=$PATH:"/build/clidriver/bin:/build/clidriver/lib"
#WORKDIR C:/build
WORKDIR /build
EXPOSE 80
ENTRYPOINT ["dotnet", "HelloWorldAPI.dll"]
