
# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY BirgunjSalon.Api/BirgunjSalon.Api.csproj BirgunjSalon.Api/
RUN dotnet restore BirgunjSalon.Api/BirgunjSalon.Api.csproj

COPY . .
RUN dotnet publish BirgunjSalon.Api/BirgunjSalon.Api.csproj \
    --configuration Release \
    --output /app/publish \
    /p:UseAppHost=false

# Stage 2: Run the published application
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000

ENTRYPOINT ["dotnet", "BirgunjSalon.Api.dll"]
