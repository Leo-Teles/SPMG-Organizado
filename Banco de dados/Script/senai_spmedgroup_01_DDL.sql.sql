CREATE DATABASE SPMG;
GO

USE SPMG;
GO

CREATE TABLE TIPOUSUARIO(
idTipoUsuario TINYINT PRIMARY KEY IDENTITY,
qualUsuario VARCHAR (13) NOT NULL
);
GO
 
CREATE TABLE ESPECIALIDADE(
idEspecialidade TINYINT PRIMARY KEY IDENTITY,
especiaMedica VARCHAR (30) NOT NULL
);
GO

CREATE TABLE CLINICA(
idClinica TINYINT PRIMARY KEY IDENTITY,
enderecoClinica VARCHAR (100) NOT NULL,
telefoneClinica VARCHAR (7) NOT NULL UNIQUE,
horarioFuncionamento VARCHAR (30) NOT NULL,
nomeClinica VARCHAR (100) NOT NULL,
cnpj CHAR(6) NOT NULL UNIQUE
);
GO

CREATE TABLE SITUACAO(
idSituacao INT PRIMARY KEY IDENTITY,
descricaoSituacao VARCHAR (1000) NOT NULL
);
GO

CREATE TABLE USUARIO(
idUsuario INT PRIMARY KEY IDENTITY,
idTipoUsuario TINYINT FOREIGN KEY REFERENCES TIPOUSUARIO(idTipoUsuario),
email VARCHAR (50) NOT NULL UNIQUE,
nome VARCHAR (15) NOT NULL,
senha VARCHAR (10) NOT NULL
);
GO

CREATE TABLE PACIENTE(
idPaciente TINYINT PRIMARY KEY IDENTITY,
idUsuario INT FOREIGN KEY REFERENCES USUARIO(idUsuario),
telefone CHAR (7) NOT NULL,
dataNascimento VARCHAR (10) NOT NULL,
cpf CHAR (11) NOT NULL UNIQUE,
endereco VARCHAR (100) NOT NULL
);
GO

CREATE TABLE MEDICO(
idMedico TINYINT PRIMARY KEY IDENTITY,
idEspecialidade TINYINT FOREIGN KEY REFERENCES ESPECIALIDADE(idEspecialidade),
idClinica TINYINT FOREIGN KEY REFERENCES CLINICA(idClinica),
idUsuario INT FOREIGN KEY REFERENCES USUARIO(idUsuario),
crm CHAR (9)NOT NULL UNIQUE
);
GO

CREATE TABLE CONSULTA(
idConsulta SMALLINT PRIMARY KEY IDENTITY,
idClinica TINYINT FOREIGN KEY REFERENCES CLINICA(idClinica),
idMedido  TINYINT FOREIGN KEY REFERENCES MEDICO(idMedico),
idSituacao	INT FOREIGN KEY REFERENCES SITUACAO(idSituacao),
idPaciente TINYINT FOREIGN KEY REFERENCES PACIENTE(idPaciente),
dataConsulta VARCHAR (15) NOT NULL
);
GO