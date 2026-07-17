# Build stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY DemoApi.Api/DemoApi.Api.csproj DemoApi.Api/
RUN dotnet restore DemoApi.Api/DemoApi.Api.csproj

COPY . .
RUN dotnet publish DemoApi.Api/DemoApi.Api.csproj -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 8080
ENTRYPOINT ["dotnet", "DemoApi.Api.dll"]