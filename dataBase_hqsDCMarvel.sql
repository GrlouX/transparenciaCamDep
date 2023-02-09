# Construção e uso da base de dados para os personagens da DC e da Marvel

CREATE DATABASE IF NOT EXISTS bd_dmhqs;
USE bd_dmhqs;

# Criação de tabelas

CREATE TABLE IF NOT EXISTS dc_data(
    pageid VARCHAR(6) PRIMARY KEY,
    nameid text,
    urlslug text,
    identity text,
    align text,
    eye text,
    hair text,
    sex text,
    gsm text,
    alive text,
    appearances text,
    firsttime text,
    firstyear text
);

CREATE TABLE IF NOT EXISTS marvel_data(
    pageid VARCHAR(6) PRIMARY KEY,
    nameid text,
    urlslug text,
    identity text,
    align text,
    eye text,
    hair text,
    sex text,
    gsm text,
    alive text,
    appearances text,
    firsttime text,
    firstyear text
);

# Carga de dados para as tabelas - No prompt de comando: mysql -u [user name] -p [password]; / SET GLOBAL local_infile=true; / exit;/ mysql --local-infile=1 -u [user name] -p [password];

LOAD DATA LOCAL INFILE '/Users/username/.../dados/dc-wikia-data.csv' 
INTO TABLE `bd_dmhqs`.`dc_data` CHARACTER SET UTF8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/username/.../dados/marvel-wikia-data.csv' 
INTO TABLE `bd_dmhqs`.`marvel_data` CHARACTER SET UTF8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

# Ajustes nos dados carregados

SELECT * FROM dc_data; # 6896 registros importados

SELECT pageid, identity, align, eye, hair, sex
FROM dc_data
WHERE identity='' OR align='' OR eye='' OR hair='' OR sex=''; # 4717 registros com alguma característica ausente

SET SQL_SAFE_UPDATES = 0;

UPDATE dc_data
SET gsm='No'
WHERE gsm='';

SELECT pageid, appearances, firsttime, firstyear
FROM dc_data
WHERE appearances='' OR firsttime='' OR firstyear=''; # 415 registros sem alguma informação sobre a origem do personagem

UPDATE dc_data
SET appearances='1'
WHERE appearances=''; # Premissa de que houve pelo menos 1 aparição de cada personagem

ALTER TABLE dc_data
MODIFY COLUMN appearances int;

ALTER TABLE dc_data
ADD COLUMN firstappearance text
AFTER firstyear;

SELECT pageid, firsttime
FROM dc_data
WHERE firsttime='1988, Holiday'; # Dados com padrão diferente dos demais

UPDATE dc_data
SET firstappearance=SUBSTR(STR_TO_DATE(firsttime, '%Y, %M'),1,7)
WHERE firsttime != '' AND firsttime != '1988, Holiday';

UPDATE dc_data
SET firstappearance=CONCAT(SUBSTR(firsttime,1,4),'-12')
WHERE firsttime = '1988, Holiday'; # Premissa de que 'Holiday' corresponde ao mês 12

ALTER TABLE dc_data
ADD COLUMN company text
AFTER firstappearance;

UPDATE dc_data
SET company="DC";

SELECT * FROM dc_data; # Tabela atualizada com todos os dados da DC

SET SQL_SAFE_UPDATES = 1;


SELECT * FROM marvel_data; # 16376 registros importados

SELECT pageid, identity, align, eye, hair, sex, alive
FROM marvel_data
WHERE identity='' OR align='' OR eye='' OR hair='' OR sex='' OR alive=''; # 11453 registros com alguma característica ausente

SET SQL_SAFE_UPDATES = 0;

UPDATE marvel_data
SET gsm='No'
WHERE gsm='';

SELECT pageid, appearances, firsttime, firstyear
FROM marvel_data
WHERE appearances='' OR firsttime='' OR firstyear=''; # 1711 registros sem alguma informação sobre a origem do personagem

UPDATE marvel_data
SET appearances='1'
WHERE appearances=''; # Premissa de que houve pelo menos 1 aparição de cada personagem

ALTER TABLE marvel_data
MODIFY COLUMN appearances int;

ALTER TABLE marvel_data
ADD COLUMN firstappearance text
AFTER firstyear;

UPDATE marvel_data
SET firstappearance=SUBSTR(STR_TO_DATE(firsttime, '%b-%y'),1,7)
WHERE firsttime != '';

ALTER TABLE marvel_data
ADD COLUMN company text
AFTER firstappearance;

UPDATE marvel_data
SET company="Marvel";

SELECT * FROM marvel_data; # Tabela atualizada com todos os dados da Marvel 

SET SQL_SAFE_UPDATES = 1;


# Exportação do relatório completo

SELECT 'pageid','nameid','identity','align','eye','hair','sex','gsm','alive','appearances','firstappearance','company'
UNION
SELECT pageid, nameid, identity, align, eye, hair, sex, gsm, alive, appearances, firstappearance, company
FROM dc_data 
UNION
SELECT pageid, nameid, identity, align, eye, hair, sex, gsm, alive, appearances, firstappearance, company
FROM marvel_data
INTO OUTFILE 'secure_file_priv-directory/comic_data.csv'
FIELDS ENCLOSED BY '"' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n'; # 23272 registros da DC e da Marvel


