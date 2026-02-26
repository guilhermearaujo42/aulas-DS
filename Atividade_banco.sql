CREATE TABLE "Medicos" (
  "id" uuid PRIMARY KEY,
  "CRM" varchar UNIQUE NOT NULL,
  "Nome" varchar NOT NULL,
  "Endereco" integer NOT NULL,
  "Telefone" integer NOT NULL,
  "Especialidade" varchar NOT NULL
);

CREATE TABLE "Pacientes" (
  "id" uuid PRIMARY KEY,
  "CPF" varchar UNIQUE NOT NULL,
  "Nome" varchar NOT NULL,
  "Endereco" varchar NOT NULL,
  "Telefone" integer NOT NULL
);

CREATE TABLE "Dependente" (
  "id" uuid PRIMARY KEY,
  "id_pacientes" uuid,
  "nome" varchar NOT NULL
);

CREATE TABLE "Consultar" (
  "id" uuid PRIMARY KEY,
  "id_medicos" uuid,
  "id_pacientes" uuid,
  "data_consulta" date NOT NULL,
  "observacao" varchar
);

CREATE TABLE "Exames" (
  "id" uuid,
  "id_consultas" uuid,
  "nome" varchar NOT NULL,
  PRIMARY KEY ("id", "id_consultas")
);

ALTER TABLE "Dependente" ADD FOREIGN KEY ("id_pacientes") REFERENCES "Pacientes" ("id");

ALTER TABLE "Consultar" ADD FOREIGN KEY ("id_medicos") REFERENCES "Medicos" ("id");

ALTER TABLE "Consultar" ADD FOREIGN KEY ("id_pacientes") REFERENCES "Pacientes" ("id");

ALTER TABLE "Exames" ADD FOREIGN KEY ("id_consultas") REFERENCES "Consultar" ("id");
