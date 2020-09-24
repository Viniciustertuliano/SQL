# SQL SERVER

<p>Repositório para armazenar comandos e exercícios praticados na aula de Sql server e script com comandos de Linux e Docker para criação de um container com sql Server para utilizar como server.</p>

---
## Script para gerar container Docker com Sql Server
``` 
/*Status container*/

sudo systemctl status docker


/*Atualizando repositório*/

sudo docker pull mcr.microsoft.com/mssql/server:2019-latest


/*Inicia container e configura sql*/

sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Senha' --name '<Nome_container>' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest


/*Retorna dados do conteiner*/

sudo docker ps


/*Retorna id imagem e nome do container*/

sudo docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}"


/*Copiar arquivos do banco já criado para container*/

sudo docker cp pedidos_indices.ndf  sql1:/var/opt/mssql/data/pedidos_indices.ndf
sudo docker cp pedidos_log.ldf sql1:/var/opt/mssql/data/pedidos_log.ldf
sudo docker cp pedidos_tabelas.mdf sql1:/var/opt/mssql/data/pedidos_tabelas.mdf


/*Acessa o diretorio do container como root*/
sudo docker exec -it -u root <Nome_container> bash


/*Navega até a pasta correta*/

cd /var/opt/mssql/data/

/*Altera permisão de arquivo*/

chmod 777 pedidos_indices.ndf
chmod 777 pedidos_log.ldf
chmod 777 pedidos_tabelas.mdf



/*Altera proprietário do arquivo*/

chown mssql:root pedidos_indices.ndf
chown mssql:root pedidos_log.ldf
chown mssql:root pedidos_tabelas.mdf


/*Executa conainer*/

sudo docker exec -it <Nome_container> /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "<Senha>"


-------------------- Comandos para cria banco de dados -----------------------------------------------

create database pedidos
on primary
(name='pedtab', filename='/var/opt/mssql/data/pedidos_tabelas.mdf'),
filegroup pedind
(name='pedindices', filename ='/var/opt/mssql/data/pedidos_indices.ndf')
log on
(name = 'pedilog', filename='/var/opt/mssql/data/pedidos_log.ldf') FOR ATTACH;
GO;
-------------------- cria banco de dados -----------------------------------------------


/*Parar execução do container*/

sudo docker stop <nome_conainer>


/*eExclui container*/

sudo docker rm <nome_conainer>
```
