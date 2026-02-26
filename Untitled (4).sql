CREATE TABLE `Participantes` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `nascimento_data` date NOT NULL,
  `cpf` varchar(255) UNIQUE NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `id_rfid` uuid
);

CREATE TABLE `Credencial` (
  `rfid` uuid PRIMARY KEY,
  `data_emissao` date NOT NULL,
  `status_ativacao` bool DEFAULT true
);

CREATE TABLE `Trilha` (
  `id` uuid PRIMARY KEY,
  `nome` varchar(255) UNIQUE NOT NULL,
  `descricao` varchar(255),
  `coordenador` varchar(255) NOT NULL
);

CREATE TABLE `Sessao` (
  `id` uuid PRIMARY KEY,
  `id_trilha` uuid,
  `titulo` varchar(255) NOT NULL,
  `horario_inicio` timestamp NOT NULL,
  `horario_termino` timestamp NOT NULL,
  `sala` varchar(255) NOT NULL
);

CREATE TABLE `Agendamentos` (
  `id` uuid PRIMARY KEY,
  `id_participante` uuid,
  `id_sessao` uuid
);

ALTER TABLE `Participantes` ADD FOREIGN KEY (`id_rfid`) REFERENCES `Credencial` (`rfid`);

ALTER TABLE `Sessao` ADD FOREIGN KEY (`id_trilha`) REFERENCES `Trilha` (`id`);

ALTER TABLE `Agendamentos` ADD FOREIGN KEY (`id_participante`) REFERENCES `Participantes` (`id`);

ALTER TABLE `Agendamentos` ADD FOREIGN KEY (`id_sessao`) REFERENCES `Sessao` (`id`);
