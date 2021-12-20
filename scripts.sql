CREATE TABLE "professors" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "professors_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "disciplines" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"period_id" integer NOT NULL,
	CONSTRAINT "disciplines_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "tests" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"link" TEXT NOT NULL,
	"category_id" integer NOT NULL,
	"professor_id" integer NOT NULL,
	"discipline_id" integer NOT NULL,
	CONSTRAINT "tests_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "professors_disciplines" (
	"id" serial NOT NULL,
	"professor_id" integer NOT NULL,
	"discipline_id" integer NOT NULL,
	CONSTRAINT "professors_disciplines_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "periods" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "periods_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "disciplines" ADD CONSTRAINT "disciplines_fk0" FOREIGN KEY ("period_id") REFERENCES "periods"("id") ON DELETE CASCADE;

ALTER TABLE "tests" ADD CONSTRAINT "tests_fk0" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE CASCADE;
ALTER TABLE "tests" ADD CONSTRAINT "tests_fk1" FOREIGN KEY ("professor_id") REFERENCES "professors"("id") ON DELETE CASCADE;
ALTER TABLE "tests" ADD CONSTRAINT "tests_fk2" FOREIGN KEY ("discipline_id") REFERENCES "disciplines"("id" ON DELETE CASCADE);

ALTER TABLE "professors_disciplines" ADD CONSTRAINT "professors_disciplines_fk0" FOREIGN KEY ("professor_id") REFERENCES "professors"("id");
ALTER TABLE "professors_disciplines" ADD CONSTRAINT "professors_disciplines_fk1" FOREIGN KEY ("discipline_id") REFERENCES "disciplines"("id");


















INSERT INTO category (name) VALUES ('P1');
INSERT INTO category (name) VALUES ('P2');
INSERT INTO category (name) VALUES ('P3');
INSERT INTO category (name) VALUES ('2ch');
INSERT INTO category (name) VALUES ('Outras');

INSERT INTO periods (name) VALUES ('1°');
INSERT INTO periods (name) VALUES ('2°');
INSERT INTO periods (name) VALUES ('3°');
INSERT INTO periods (name) VALUES ('4°');
INSERT INTO periods (name) VALUES ('5°');
INSERT INTO periods (name) VALUES ('6°');
INSERT INTO periods (name) VALUES ('7°');
INSERT INTO periods (name) VALUES ('8°');

INSERT INTO disciplines (name, period_id) 
	VALUES ('INTRODUÇÃO À COMPUTAÇÃO', 1),
		   ('TEXTOS TÉCNICOS EM CIÊNCIA DA COMPUTAÇÃO', 1),
		   ('SEMINÁRIOS EM COMPUTAÇÃO', 1),
		   ('MATEMÁTICA DISCRETA', 1),
		   ('ÁLGEBRA LINEAR I', 1),
		   ('CÁLCULO DIFERENCIAL E INTEGRAL I', 1);

INSERT INTO disciplines (name, period_id) 
	VALUES ('ALGORITMOS E ESTRUTURA DE DADOS I', 2),
		   ('LINGUAGENS FORMAIS E AUTÔMATOS', 2),
		   ('SISTEMAS LÓGICOS', 2),
		   ('ÁLGEBRA LINEAR II', 2),
		   ('CÁLCULO DIFERENCIAL E INTEGRAL II', 2),
		   ('INGLÊS INSTRUMENTAL I', 2);

INSERT INTO disciplines (name, period_id) 
	VALUES ('ALGORITMOS E ESTRUTURAS DE DADOS II', 3),
		   ('ORGANIZAÇÃO DE COMPUTADORES', 3),
		   ('METODOLOGIA CIENTÍFICA EM CIÊNCIA DA COMPUTAÇÃO', 3),
		   ('COMPUTAÇÃO NUMÉRICA', 3),
		   ('FÍSICA I E', 3);
		   ('LABORATÓRIO DE FISICA I E', 3);

INSERT INTO disciplines (name, period_id) 
	VALUES ('TÉCNICAS AVANÇADAS DE PROGRAMAÇÃO', 4),
		   ('PARADIGMA DE LINGUAGENS DE PROGRAMAÇÃO', 4),
		   ('ARQUITETURA DE COMPUTADORES', 4),
		   ('REDES DE COMPUTADORES', 4),
		   ('PROBABILIDADE E ESTATISTICA', 4);


INSERT INTO disciplines (name, period_id) 
	VALUES ('PROJETO E ANÁLISE DE ALGORITMOS', 5),
		   ('LABORATÓRIO DE PROGRAMAÇÃO AVANÇADA', 5),
		   ('COMPILADORES', 5),
		   ('SISTEMAS OPERACIONAIS I', 5),
		   ('INTRODUÇÃO À ENGENHARIA DE SOFTWARE', 5);
		
INSERT INTO disciplines (name, period_id) 
	VALUES ('INTRODUÇÃO À TEORIA DOS GRAFOS', 6),
		   ('BANCOS DE DADOS I', 6),
		   ('INTELIGÊNCIA ARTIFICIAL', 6),
		   ('ANÁLISE E PROJETO DE SISTEMAS', 6),
		   ('INTRODUÇÃO À COMPUTAÇÃO GRÁFICA', 6);


INSERT INTO disciplines (name, period_id) 
	VALUES ('INTRODUÇÃO À ADMINISTRAÇÃO', 7),
		   ('PROGRAMAÇÃO PARA WEB', 7),
		   ('AVALIAÇÃO DE DESEMPENHO', 7),
		   ('SISTEMAS DISTRIBUÍDOS I', 7),
		   ('INTERAÇÃO HUMANO-COMPUTADOR', 7);

INSERT INTO disciplines (name, period_id) 
	VALUES ('INFORMÁTICA, ÉTICA E SOCIEDADE', 8),
		   ('EMPREENDEDORISMO EM TECNOLOGIA DA', 8),
		   ('TRABALHO DE CONCLUSÃO DE CURSO', 8),
		   ('ENADE - INGRESSANTE', 8),
		   ('ENADE - CONCLUINTE', 8);


INSERT INTO professors (name) 
	VALUES ('Eulanda'),
		   ('Marco'),
		   ('Marcio'),
		   ('César'),
		   ('Renato'),
		   ('Bruna'),
		   ('Ozana'),
		   ('Isabelly');


INSERT INTO professors_disciplines (professor_id, discipline_id) 
	VALUES ('1','1'),
		   ('2','1'),
		   ('3','2'),
		   ('4','2'),
		   ('5','3'),
		   ('6','3'),
		   ('7','4'),
		   ('8','4');






-- EuLanda
INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.1', 'http://www.marcusramos.com.br/univasf/lfa-2011-1/prova-1.pdf', 3, 1, 8);
-- Eulanda
INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.2', 'http://www.marcusramos.com.br/univasf/lfa-2017-1/prova-final-sol.pdf', 3, 1, 8);
-- Eulanda
INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.3', 'http://professor.pucgoias.edu.br/SiteDocente/admin/arquivosUpload/17389/material/CMP4145_01.pdf', 2, 1, 8);
-- Marcio
INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.1', 'http://professor.pucgoias.edu.br/SiteDocente/admin/arquivosUpload/17389/material/CMP4145_01.pdf', 1, 2, 8);
