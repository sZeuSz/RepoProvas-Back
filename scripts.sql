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




ALTER TABLE "disciplines" ADD CONSTRAINT "disciplines_fk0" FOREIGN KEY ("period_id") REFERENCES "periods"("id");

ALTER TABLE "tests" ADD CONSTRAINT "tests_fk0" FOREIGN KEY ("category_id") REFERENCES "category"("id");
ALTER TABLE "tests" ADD CONSTRAINT "tests_fk1" FOREIGN KEY ("professor_id") REFERENCES "professors"("id");
ALTER TABLE "tests" ADD CONSTRAINT "tests_fk2" FOREIGN KEY ("discipline_id") REFERENCES "disciplines"("id");

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

INSERT INTO disciplines (name, period_id) VALUES ('LFA', 3);

INSERT INTO professors (name) VALUEs('Eulanda');

INSERT INTO professors (name) VALUEs('Marco');


INSERT INTO professors_disciplines (professor_id, discipline_id) VALUES('1','1');

INSERT INTO professors_disciplines (professor_id, discipline_id) VALUES('2','1');

-- Marco
INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.1', 'www.google.pdf', 1, 2, 1);
-- Eulanda
INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.2', 'www.google.pdf', 1, 1, 1);


INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.1', 'www.google.pdf', '1', '1', '1');

INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.2', 'www.google2.pdf', '2', '1', '1');

INSERT INTO tests (name, link, category_id, professor_id, discipline_id) VALUES('2020.6', 'www.google2.pdf', '3', '1', '1');