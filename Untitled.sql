CREATE TABLE "Medicos" (
  "id" uuid PRIMARY KEY,
  "CRM" varchar UNIQUE NOT NULL,
  "Nome" varchar NOT NULL,
  "Endereco" integer,
  "Telefone" integer,
  "Especialidade" varchar
);

CREATE TABLE "Pacientes" (
  "CPF" integer PRIMARY KEY,
  "Nome" varchar NOT NULL,
  "Endereco" integer,
  "Telefone" integer
);

CREATE TABLE "Consultas" (
  "id" uuid PRIMARY KEY,
  "cpf_pacientes" varchar,
  "cre_Medicos" varchar,
  "data_consultas" date
);

CREATE TABLE "Exames" (
  "id" uuid PRIMARY KEY,
  "cpf_pacientes" vachar,
  "crm_medicos" vachar,
  "nome_exames" varchar
);

ALTER TABLE "Consultas" ADD FOREIGN KEY ("cpf_pacientes") REFERENCES "Pacientes" ("CPF");

ALTER TABLE "Consultas" ADD FOREIGN KEY ("cre_Medicos") REFERENCES "Medicos" ("CRM");

ALTER TABLE "Exames" ADD FOREIGN KEY ("cpf_pacientes") REFERENCES "Pacientes" ("CPF");

ALTER TABLE "Exames" ADD FOREIGN KEY ("crm_medicos") REFERENCES "Medicos" ("CRM");
