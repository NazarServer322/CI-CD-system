#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Shop-15.csproj", "."]
RUN dotnet restore "Shop-15.csproj"
COPY . .
WORKDIR "/src"
RUN ls -l && pwd 
RUN dotnet build "Shop-15.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Shop-15.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Shop-15.dll"]
