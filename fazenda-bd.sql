-- ************************************************* --
--                    COMANDOS DDL                   --
-- ************************************************* --

-- Deleta o banco se existir
-- DROP DATABASE IF EXISTS `fazenda-bd`;

-- Cria o banco de dados "fazenda-bd".
CREATE DATABASE `fazenda-bd`;

-- seleciona o banco de Dados fazenda-bd para inserção das tabelas
USE `fazenda-bd`;

-- Cria a tabela Funcionarios.
CREATE TABLE `Funcionarios`
(
	`CPF` VARCHAR(255) NOT NULL,
	`NomeCompleto` VARCHAR(255) NOT NULL,
	`DataDeNascimento` DATE,
	`DataDeAdmissao` DATE,
	`Cargo` VARCHAR(255),
	`Salario` FLOAT,
	`HorasExtras` INT,
	PRIMARY KEY (`CPF`)
); 

-- Cria a tabela VacasLeiteiras.
CREATE TABLE `VacasLeiteiras`
(
	`VacaID` INT NOT NULL,
	`Raca` VARCHAR(255),
	`DataDeNascimento` DATE,
	`DataDaUltimaPrenhez` DATE,
	`NumDeInseminacoes` CHAR(255),
	`TotalDeLeiteProduzido` INT, -- em litros
	`VacinasRealizadas` VARCHAR(255),
	`EstaPrenha` BOOL,
	`DataPrevistaDoParto` DATE,
	`DataDaUltimaOrdenha` DATE,
	`QtdLeiteUltimaOrdenha` INT,
	PRIMARY KEY (`VacaID`)
); 

-- Cria a tabela Produtos.
CREATE TABLE `Produtos`
(
	`ProdutoID` INT NOT NULL,
	`Nome` VARCHAR(255),
	`DataDeProducao` DATE,
	`DataDeValidade` DATE,
	`Comprador` INT,
	`Pago` BOOL,
	`DataDeEntrega` DATE,
	`QuantidadeComprada` INT,
	`QuantidadeEmEstoque` INT,
	PRIMARY KEY (`ProdutoID`)
); 


-- Cria a tabela Varejistas.
CREATE TABLE `Varejistas`
(
	`VarejistaID` INT NOT NULL,
	`Nome` VARCHAR(255) NOT NULL,
	`CNPJ` VARCHAR(255) NOT NULL UNIQUE, 
	`DataDoUltimoPedido` DATE,
	`ProdutosComprados` INT,
	PRIMARY KEY (`VarejistaID`),
	CONSTRAINT `FK_ProdutosVarejistas` FOREIGN KEY (`ProdutosComprados`)
    REFERENCES `Produtos`(`ProdutoID`)
);


-- Cria a tabela Equipamentos.
CREATE TABLE `Equipamentos`
(
	`EquipamentoID` INT NOT NULL,
	`Nome` CHAR(255),
	`Modelo` CHAR(255),
	`Marca` CHAR(255), 
	`Tipo` CHAR(255),  
	`NumDeSerie` INT,
	`AnoDeFabricacao` INT,
	`DataDaUltimaManutencao` DATE,
	PRIMARY KEY (`EquipamentoID`)
);

-- Cria a tabela Soja.
CREATE TABLE `Soja`
(
	`LoteSojaID` INT NOT NULL, 
	`DataDoInicioDaPlantacao` DATE, 
	`DataDoTerminoDaPlantacao` DATE, 
	`QuantidadeTotal` INT, -- em quilos
	`Perdas` INT, -- em quilos
	`HerbicidasUsados` VARCHAR(255), 
	`PesticidasUsados` VARCHAR(255),
	`Comprador` INT,
	`DataDeEntrega` DATE,
	PRIMARY KEY (`LoteSojaID`),
	CONSTRAINT `FK_VarejistasSoja` FOREIGN KEY (`Comprador`)
    REFERENCES `Varejistas`(`VarejistaID`)
); 

-- Cria a tabela Leite.
CREATE TABLE `Leite`
(
	`LoteLeiteID` INT NOT NULL,
	`Tipo` CHAR(1),
	`DataDeProducao` DATE,
	`DataDeValidade` DATE,
	`TotalProduzido` INT, -- em litros
	`Perda` INT,-- em litros
	`Comprador` INT,
	`DataDeEntrega` DATE,	
	PRIMARY KEY (`LoteLeiteID`),
	CONSTRAINT `FK_VarejistasLeite` FOREIGN KEY (`Comprador`)
    REFERENCES `Varejistas`(`VarejistaID`)
); 

-- Cria a tabela Eventos.
CREATE TABLE `Eventos`
(
	`Nome` VARCHAR(255),
	`DataDoEvento` DATE
); 



-- ************************************************* --
--                    COMANDOS DML                   --
-- ************************************************* --


-- Insere uma linha (ou seja, um funcionário) na tabela Funcionarios.
INSERT INTO `Funcionarios` (`CPF`, `NomeCompleto`, `DataDeNascimento`, `DataDeAdmissao`, `Cargo`, `Salario`, `HorasExtras`)
VALUES ('00011122233', 'João da Silva', '1978-08-31', '2018-03-13', 'Operador de Colheitadeira', 6300.45, 0);

INSERT INTO `Funcionarios` (`CPF`, `NomeCompleto`, `DataDeNascimento`, `DataDeAdmissao`, `Cargo`, `Salario`, `HorasExtras`)
VALUES ('48604860482', 'Maria da Silva', '1983-04-20', '2019-03-30', 'Ordenhadora', 4200.38, 0);

INSERT INTO `Funcionarios` (`CPF`, `NomeCompleto`, `DataDeNascimento`, `DataDeAdmissao`, `Cargo`, `Salario`, `HorasExtras`)
VALUES ('96037693759', 'Sérgio Vacarejo', '1975-09-12', '2014-06-17', 'Veterinário', 7535.3, 0);

-- Insere uma linha (ou seja, uma vaca leiteira) na tabela VacasLeiteiras.
INSERT INTO `VacasLeiteiras` (`VacaID`, `Raca`, `DataDeNascimento`, `DataDaUltimaPrenhez`, `NumDeInseminacoes`, `TotalDeLeiteProduzido`, `VacinasRealizadas`, `EstaPrenha`, `DataPrevistaDoParto`, `DataDaUltimaOrdenha`, `QtdLeiteUltimaOrdenha`)
VALUES (1, 'Girolando', '2015-07-22', '2019-02-21', 2, 110, 'Febre Aftosa', false, null, '2020-09-01', 12);

INSERT INTO `VacasLeiteiras` (`VacaID`, `Raca`, `DataDeNascimento`, `DataDaUltimaPrenhez`, `NumDeInseminacoes`, `TotalDeLeiteProduzido`, `VacinasRealizadas`, `EstaPrenha`, `DataPrevistaDoParto`, `DataDaUltimaOrdenha`, `QtdLeiteUltimaOrdenha`)
VALUES (2, 'Girolando', '2015-07-22', '2020-04-02', 1, 98, 'Febre Aftosa', true, '2020-12-25', '2019-12-23', 8);

INSERT INTO `VacasLeiteiras` (`VacaID`, `Raca`, `DataDeNascimento`, `DataDaUltimaPrenhez`, `NumDeInseminacoes`, `TotalDeLeiteProduzido`, `VacinasRealizadas`, `EstaPrenha`, `DataPrevistaDoParto`, `DataDaUltimaOrdenha`, `QtdLeiteUltimaOrdenha`)
VALUES (3, 'Nelore', '2015-03-12', '2019-11-23', 3, 213, 'Febre Aftosa', false, null, '2020-09-01', 12);

-- Insere uma linha (ou seja, um produto) na tabela Produtos.
INSERT INTO `Produtos` (`ProdutoId`, `Nome`, `DataDeProducao`, `DataDeValidade`, `Comprador`, `Pago`, `DataDeEntrega`, `QuantidadeComprada`, `QuantidadeEmEstoque`)
VALUES (1, 'Mel de eucalipto', '2020-07-27', '2020-08-18', 1, true, '2020-08-01', 20, 35);

INSERT INTO `Produtos` (`ProdutoId`, `Nome`, `DataDeProducao`, `DataDeValidade`, `Comprador`, `Pago`, `DataDeEntrega`, `QuantidadeComprada`, `QuantidadeEmEstoque`)
VALUES (2, 'Mel de eucalipto', '2020-07-27', '2020-08-18', 1, false, '2020-08-01', 15, 25);

INSERT INTO `Produtos` (`ProdutoId`, `Nome`, `DataDeProducao`, `DataDeValidade`, `Comprador`, `Pago`, `DataDeEntrega`, `QuantidadeComprada`, `QuantidadeEmEstoque`)
VALUES (3, 'Mel de eucalipto', '2020-08-27', '2020-07-08', 3, true, '2020-09-19', 25, 0);

-- Insere uma linha (ou seja, um varejista) na tabela Varejistas.
INSERT INTO `Varejistas` (`VarejistaID`, `Nome`, `CNPJ`, `DataDoUltimoPedido`, `ProdutosComprados`)
VALUES (1, 'Mercado Market', '11223344556677', '2020-07-30', 1);

INSERT INTO `Varejistas` (`VarejistaID`, `Nome`, `CNPJ`, `DataDoUltimoPedido`, `ProdutosComprados`)
VALUES (2, 'Atacado São Paulo', '769387653', '2020-10-15', 2);

INSERT INTO `Varejistas` (`VarejistaID`, `Nome`, `CNPJ`, `DataDoUltimoPedido`, `ProdutosComprados`)
VALUES (3, 'Mercado Market', '983756987', '2020-08-30', 3);

-- Insere uma linha (ou seja, um equipamento) na tabela Equipamentos.
INSERT INTO `Equipamentos` (`EquipamentoID`, `Nome`, `Marca`, `Modelo`, `Tipo`, `NumDeSerie`, `AnoDeFabricacao`, `DataDaUltimaManutencao`)
VALUES (1, 'Colheitadeira', 'New Holland', 'TC 57', 'agricultura', 1111, 1998, '2019-04-02');

INSERT INTO `Equipamentos` (`EquipamentoID`, `Nome`, `Marca`, `Modelo`, `Tipo`, `NumDeSerie`, `AnoDeFabricacao`, `DataDaUltimaManutencao`)
VALUES (2, 'Motossera', 'Vonder', 'T78', 'agricultura', 64564, 2014, '2020-05-05');

INSERT INTO `Equipamentos` (`EquipamentoID`, `Nome`, `Marca`, `Modelo`, `Tipo`, `NumDeSerie`, `AnoDeFabricacao`, `DataDaUltimaManutencao`)
VALUES (3, 'Trator', 'New Holland', 'TC 57', 'agricultura', 9866, 1998, '2018-03-28');

-- Insere uma linha (ou seja, um lote de soja) na tabela Soja.
INSERT INTO `Soja` (`LoteSojaID`, `DataDoInicioDaPlantacao`, `DataDoTerminoDaPlantacao`, `QuantidadeTotal`, `Perdas`, `HerbicidasUsados`, `PesticidasUsados`, `Comprador`, `DataDeEntrega`)
VALUES (1, '2018-07-10', '2018-08-25', 120, 1, 'Imazapir', 'TILT', 1, '2019-03-30');

INSERT INTO `Soja` (`LoteSojaID`, `DataDoInicioDaPlantacao`, `DataDoTerminoDaPlantacao`, `QuantidadeTotal`, `Perdas`, `HerbicidasUsados`, `PesticidasUsados`, `Comprador`, `DataDeEntrega`)
VALUES (2, '2019-06-05', '2019-07-25', 100, 4, 'Imazapir', 'TILT', 1, '2019-03-30');

INSERT INTO `Soja` (`LoteSojaID`, `DataDoInicioDaPlantacao`, `DataDoTerminoDaPlantacao`, `QuantidadeTotal`, `Perdas`, `HerbicidasUsados`, `PesticidasUsados`, `Comprador`, `DataDeEntrega`)
VALUES (3, '2020-10-01', '2020-11-05', 140, 2, 'Imazapir', 'TILT', 2, '2020-12-30');

-- Insere uma linha (ou seja, um lote de leite) na tabela Leite.
INSERT INTO `Leite` (`LoteLeiteID`, `Tipo`, `DataDeProducao`, `DataDeValidade`, `TotalProduzido`, `Perda`, `Comprador`, `DataDeEntrega`)
VALUES (1, 'C', '2020-07-01', '2020-07-10', 50, 2, 1, '2020-07-05');

INSERT INTO `Leite` (`LoteLeiteID`, `Tipo`, `DataDeProducao`, `DataDeValidade`, `TotalProduzido`, `Perda`, `Comprador`, `DataDeEntrega`)
VALUES (2, 'A', '2020-07-01', '2020-07-10', 50, 2, 1, '2020-07-05');

INSERT INTO `Leite` (`LoteLeiteID`, `Tipo`, `DataDeProducao`, `DataDeValidade`, `TotalProduzido`, `Perda`, `Comprador`, `DataDeEntrega`)
VALUES (3, 'B', '2020-08-01', '2020-09-10', 73, 5, 2, '2020-08-05');

-- Insere uma linha (ou seja, um evento) na tabela Eventos.
INSERT INTO `Eventos` (`Nome`, `DataDoEvento`)
VALUES ('Feira do Agricultor de Serra Azul', '2020-10-10');

INSERT INTO `Eventos` (`Nome`, `DataDoEvento`)
VALUES ('Festival do Mel', '2020-03-05');

INSERT INTO `Eventos` (`Nome`, `DataDoEvento`)
VALUES ('Feira Agropecuária de Penha', '2020-11-10');



-- ************************************************* --
--                    COMANDOS DQL                   --
-- ************************************************* --


-- Retorna todas as vacas leiteiras que não estão prenhas no momento.
SELECT * FROM `VacasLeiteiras`
WHERE `EstaPrenha` = false;

-- Retorna a ID da vaca que produziu a menor quantidade de leite e informa a quantidade produzida.
SELECT `VacaID`, MIN(`TotalDeLeiteProduzido`) AS MenorQtdDeLeiteProduzido
FROM `VacasLeiteiras`
WHERE `TotalDeLeiteProduzido` = (SELECT MIN(`TotalDeLeiteProduzido`) FROM `VacasLeiteiras`);

-- Retorna a ID dos lotes de leite, o nome do varejista que comprou (vindo da tabela Varejistas) e ordena de forma decrescente por data da entrega.
SELECT `Leite`.`LoteLeiteID`, `Varejistas`.`Nome`, `Leite`.`DataDeEntrega`
FROM `Leite`
INNER JOIN `Varejistas` ON `Leite`.`Comprador` = `Varejistas`.`VarejistaID`
ORDER BY `Leite`.`DataDeEntrega` DESC;

-- Retorna o total de leite produzido na fazenda.
SELECT SUM(`TotalProduzido`)
FROM `Leite`;

-- Retorna a ID do lote de soja que teve a maior quantidade de perdas e informa a quantidade perdida.
SELECT `LoteSojaID`, MAX(`Perdas`) AS MaiorPerdaDeSoja
FROM `Soja`
WHERE `Perdas` = (SELECT MAX(`Perdas`) FROM `Soja`);



