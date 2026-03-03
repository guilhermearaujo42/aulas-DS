CREATE TABLE `Animal` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `raca` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `cor` varchar(255) NOT NULL,
  `porte` varchar(255) NOT NULL,
  `dono_animal` varchar(255) NOT NULL,
);

CREATE TABLE `Tutor` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cpf` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `Medicos_veterinarios` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `crmv` varchar(255) UNIQUE NOT NULL,
  `especialidade` varchar(255) UNIQUE NOT NULL,
  `telefone` varchar(255) UNIQUE NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `Consultas` (
  `id` uuid PRIMARY KEY,
  `medico_consulta` varchar(255),
  `animal_consultado` varchar(255),
  `data` date NOT NULL,
  `hora` datetime NOT NULL,
  `sintomas_observados` varchar(255) NOT NULL,
  `diagnostico` varchar NOT NULL,
  `observacoes` varchar
);

CREATE TABLE `Tratamentos` (
  `id` uuid PRIMARY KEY,
  `medicos_relacionados` varchar(255),
  `orientacoes` varchar(255) NOT NULL,
  `duracao` date NOT NULL,
  `instrucoes` varchar(255) NOT NULL
);

CREATE TABLE `vacinas` (
  `id` uuid PRIMARY KEY,
  `nome_vacina` varchar(255) NOT NULL,
  `fabricante` varchar(255) NOT NULL,
  `lote` varchar(255) NOT NULL,
  `validade` varchar(255) NOT NULL,
  `animal_aplicado` varchar(255),
  `medico_aplicador` varchar(255)
);

ALTER TABLE `Animal` ADD FOREIGN KEY (`dono_animal`) REFERENCES `Tutor` (`id`);

ALTER TABLE `Consultas` ADD FOREIGN KEY (`medico_consulta`) REFERENCES `Medicos_veterinarios` (`id`);

ALTER TABLE `Consultas` ADD FOREIGN KEY (`animal_consultado`) REFERENCES `Animal` (`id`);

ALTER TABLE `Tratamentos` ADD FOREIGN KEY (`medicos_relacionados`) REFERENCES `Medicos_veterinarios` (`id`);

ALTER TABLE `vacinas` ADD FOREIGN KEY (`animal_aplicado`) REFERENCES `Animal` (`id`);

ALTER TABLE `vacinas` ADD FOREIGN KEY (`medico_aplicador`) REFERENCES `Medicos_veterinarios` (`id`);
