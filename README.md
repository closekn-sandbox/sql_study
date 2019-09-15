# SQL study

## needs

- Docker for mac
- Homebrew

## download

`> brew install mysql`  
`> brew install postgresql`  

## Start-up

- both
`docker-compose up -d`  
- psql
`docker-compose up -d pgsql_study`  
- myql
`docker-compose up -d mysql_study`  

## Connection

- psql
`psql -h 127.0.0.1 -U dev`  
- mysql
`mysql -h 127.0.0.1 -u dev -p`  
