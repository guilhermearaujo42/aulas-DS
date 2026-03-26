CREATE TABLE Departamento
(
  codigo INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL, UNIQUE
);

CREATE TABLE Colaborador 
(
  codigo INT,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(150),
  cod_departamento INT,
  CONSTRAINT pk_colaborador PRIMARY KEY (codigo),
  FOREIGN KEY (cod_departamento) REFERENCES Departamento(codigo)
);

INSERT INTO Departamento (codigo,nome)
VALUES
(1,'RH'),
(2,'MARKETING'),
(3,'FINANCEIRO');

INSERT INTO Colaborador (codigo,nome,endereco,cod_departamento)
VALUES
(1,'joao','ruaA',1),
(2,'maria','ruaB',2),
(3,'pedro','ruaB',3);
