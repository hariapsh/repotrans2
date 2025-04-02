
--
-- BUY
--
  CREATE TABLE "user_test"."BUY" 
   (	"BUY_ID" NUMBER(*,0) NOT NULL ENABLE,
	"COMPANY_NAME" VARCHAR2(25) NOT NULL ENABLE,
	"DISTRIBUTOR_NAME" VARCHAR2(25) NOT NULL ENABLE,
	PRIMARY KEY ("BUY_ID") ENABLE
   );
--
-- COMPANY
--
  CREATE TABLE "user_test"."COMPANY" 
   (	"COMPANY_NAME" VARCHAR2(25) NOT NULL ENABLE,
	"HQ_ADDRESS" VARCHAR2(35),
	"INCOME_OUTCOME" NUMBER(*,0),
	"NUMBER_OF_SALESMEN" NUMBER(*,0),
	"NUMBER_OF_FACTORIES" NUMBER(*,0),
	"NEW_DRUG_RATE" NUMBER(*,0),
	PRIMARY KEY ("COMPANY_NAME") ENABLE
   );
--
-- DISTRIBUTE
--
  CREATE TABLE "user_test"."DISTRIBUTE" 
   (	"DISTRIBUTOR_NAME" VARCHAR2(25) NOT NULL ENABLE,
	"COMPANY_NAME" VARCHAR2(25) NOT NULL ENABLE,
	"DRUG_ID" NUMBER(*,0) NOT NULL ENABLE,
	"DAYS_UNTIL_DELIVERY" NUMBER(*,0),
	PRIMARY KEY ("DISTRIBUTOR_NAME","COMPANY_NAME","DRUG_ID") ENABLE
   );
--
-- DISTRIBUTOR
--
  CREATE TABLE "user_test"."DISTRIBUTOR" 
   (	"DISTRIBUTOR_NAME" VARCHAR2(200) NOT NULL ENABLE,
	"DISTR_POINTS" NUMBER(*,0),
	"DISTR_CAPACITY" NUMBER(*,0),
	"MEAN_DISTR_TIME" NUMBER(*,0),
	"DISTR_RANGE" NUMBER(*,0),
	PRIMARY KEY ("DISTRIBUTOR_NAME") ENABLE
   );
--
-- DOCTOR
--
  CREATE TABLE "user_test"."DOCTOR" 
   (	"DOCTOR_SSN" NUMBER(*,0) NOT NULL ENABLE,
	"DOCTOR_NAME" VARCHAR2(35),
	"AGE" NUMBER(*,0),
	"EXPERIENCE_YEARS" NUMBER(*,0),
	"SPECIALTY" VARCHAR2(25),
	PRIMARY KEY ("DOCTOR_SSN") ENABLE
   );
--
-- DRUG
--
  CREATE TABLE "user_test"."DRUG" 
   (	"DRUG_ID" NUMBER(*,0) NOT NULL ENABLE,
	"SERIAL_CODE" NUMBER(*,0) NOT NULL ENABLE,
	"COMPANY_NAME" VARCHAR2(25) NOT NULL ENABLE,
	"DRUG_NAME" VARCHAR2(60),
	"DRUG_TYPE" VARCHAR2(25),
	"APPROVAL" NUMBER(1,0),
	"PRICE" NUMBER(8,2),
	PRIMARY KEY ("DRUG_ID") ENABLE
   );
--
-- GOESTO
--
  CREATE TABLE "user_test"."GOESTO" 
   (	"DOCTOR_SSN" NUMBER(*,0),
	"PATIENT_SSN" NUMBER(*,0),
	PRIMARY KEY ("PATIENT_SSN","DOCTOR_SSN") ENABLE
   );
--
-- HISTORY
--
  CREATE TABLE "user_test"."HISTORY" 
   (	"PATIENT_SSN" NUMBER(*,0) NOT NULL ENABLE,
	"DRUG_ID" NUMBER(*,0) NOT NULL ENABLE,
	"MONTHS_PER_DOSE" NUMBER(*,0),
	PRIMARY KEY ("PATIENT_SSN","DRUG_ID") ENABLE
   );
--
-- PATIENT
--
  CREATE TABLE "user_test"."PATIENT" 
   (	"PATIENT_SSN" NUMBER(*,0) NOT NULL ENABLE,
	"PATIENT_NAME" VARCHAR2(35),
	"AGE" NUMBER(*,0),
	"GENDER" NUMBER(1,0),
	"PHONE_NUMBER" NUMBER(*,0),
	PRIMARY KEY ("PATIENT_SSN") ENABLE
   );
--
-- PRESCRIBE
--
  CREATE TABLE "user_test"."PRESCRIBE" 
   (	"DRUG_ID" NUMBER(*,0) NOT NULL ENABLE,
	"DOCTOR_SSN" NUMBER(*,0) NOT NULL ENABLE,
	"PATIENT_SSN" NUMBER(*,0) NOT NULL ENABLE,
	"DOCTOR_NAME" VARCHAR2(35),
	"DATE_OF_PRESCRIPTION" DATE,
	PRIMARY KEY ("DRUG_ID","DOCTOR_SSN") ENABLE
   );
--
-- PRESCRIPTION
--
  CREATE TABLE "user_test"."PRESCRIPTION" 
   (	"PRESCRIPTION_ID" NUMBER(*,0) NOT NULL ENABLE,
	"COMPANY_NAME" VARCHAR2(25) NOT NULL ENABLE,
	"DRUG_ID" NUMBER(*,0) NOT NULL ENABLE,
	"PATIENT_SSN" NUMBER(*,0) NOT NULL ENABLE,
	"DISEASE_CODE" VARCHAR2(3),
	"DATE_OF_PRESCRIPTION" DATE,
	PRIMARY KEY ("PRESCRIPTION_ID") ENABLE
   );
--
-- PRODUCE
--
  CREATE TABLE "user_test"."PRODUCE" 
   (	"PRODUCE_ID" NUMBER(*,0) NOT NULL ENABLE,
	"COMPANY_NAME" VARCHAR2(25) NOT NULL ENABLE,
	"DRUG_ID" NUMBER(*,0) NOT NULL ENABLE,
	PRIMARY KEY ("COMPANY_NAME","DRUG_ID") ENABLE
   );
--
-- PROVIDES
--
  CREATE TABLE "user_test"."PROVIDES" 
   (	"PROVIDES_ID" NUMBER(*,0) NOT NULL ENABLE,
	"SDOP_ID" NUMBER(*,0) NOT NULL ENABLE,
	"DRUG_ID" NUMBER(*,0),
	PRIMARY KEY ("PROVIDES_ID") ENABLE
   );
--
-- SALESMAN
--
  CREATE TABLE "user_test"."SALESMAN" 
   (	"SALESMAN_NAME" VARCHAR2(25),
	"SALESMAN_SSN" NUMBER(*,0) NOT NULL ENABLE,
	"COMPANY_NAME" VARCHAR2(25),
	"DRUG_ID" NUMBER(*,0) NOT NULL ENABLE,
	"EXPERIENCE" NUMBER(*,0),
	"SALARY" NUMBER(*,0),
	PRIMARY KEY ("SALESMAN_SSN") ENABLE
   );
--
-- SDOP
--
  CREATE TABLE "user_test"."SDOP" 
   (	"SDOP_ID" NUMBER(*,0) NOT NULL ENABLE,
	"CITY" VARCHAR2(25) NOT NULL ENABLE,
	"SDOP_RANGE" NUMBER(*,0),
	"SDOP_CAPACITY" NUMBER(*,0),
	"ADDRESS" VARCHAR2(40),
	"SDOP_DELIVERY_TIME" NUMBER(*,0),
	PRIMARY KEY ("SDOP_ID") ENABLE
   );
--
-- SELL
--
  CREATE TABLE "user_test"."SELL" 
   (	"SELL_ID" NUMBER(*,0) NOT NULL ENABLE,
	"SDOP_ID" NUMBER(*,0) NOT NULL ENABLE,
	"DISTRIBUTOR_NAME" VARCHAR2(40) NOT NULL ENABLE,
	PRIMARY KEY ("SELL_ID") ENABLE
   );
--
-- VISIT
--
  CREATE TABLE "user_test"."VISIT" 
   (	"SALESMAN_SSN" NUMBER(*,0),
	"DOCTOR_SSN" NUMBER(*,0),
	PRIMARY KEY ("SALESMAN_SSN","DOCTOR_SSN") ENABLE
   );
--
-- SYS_C008317
--
ALTER TABLE "user_test"."BUY" ADD  FOREIGN KEY ("COMPANY_NAME") REFERENCES "user_test"."COMPANY"("COMPANY_NAME") ENABLE;

--
-- SYS_C008318
--
ALTER TABLE "user_test"."BUY" ADD  FOREIGN KEY ("DISTRIBUTOR_NAME") REFERENCES "user_test"."DISTRIBUTOR"("DISTRIBUTOR_NAME") ENABLE;

--
-- SYS_C008293
--
ALTER TABLE "user_test"."DISTRIBUTE" ADD  FOREIGN KEY ("DISTRIBUTOR_NAME") REFERENCES "user_test"."DISTRIBUTOR"("DISTRIBUTOR_NAME") ENABLE;

--
-- SYS_C008294
--
ALTER TABLE "user_test"."DISTRIBUTE" ADD  FOREIGN KEY ("COMPANY_NAME") REFERENCES "user_test"."COMPANY"("COMPANY_NAME") ENABLE;

--
-- SYS_C008295
--
ALTER TABLE "user_test"."DISTRIBUTE" ADD  FOREIGN KEY ("DRUG_ID") REFERENCES "user_test"."DRUG"("DRUG_ID") ENABLE;

--
-- SYS_C008278
--
ALTER TABLE "user_test"."DRUG" ADD  FOREIGN KEY ("COMPANY_NAME") REFERENCES "user_test"."COMPANY"("COMPANY_NAME") ENABLE;

--
-- SYS_C008270
--
ALTER TABLE "user_test"."GOESTO" ADD  FOREIGN KEY ("PATIENT_SSN") REFERENCES "user_test"."PATIENT"("PATIENT_SSN") ENABLE;

--
-- SYS_C008271
--
ALTER TABLE "user_test"."GOESTO" ADD  FOREIGN KEY ("DOCTOR_SSN") REFERENCES "user_test"."DOCTOR"("DOCTOR_SSN") ENABLE;

--
-- SYS_C008322
--
ALTER TABLE "user_test"."HISTORY" ADD  FOREIGN KEY ("PATIENT_SSN") REFERENCES "user_test"."PATIENT"("PATIENT_SSN") ENABLE;

--
-- SYS_C008323
--
ALTER TABLE "user_test"."HISTORY" ADD  FOREIGN KEY ("DRUG_ID") REFERENCES "user_test"."DRUG"("DRUG_ID") ENABLE;

--
-- SYS_C008328
--
ALTER TABLE "user_test"."PRESCRIBE" ADD  FOREIGN KEY ("DOCTOR_SSN") REFERENCES "user_test"."DOCTOR"("DOCTOR_SSN") ENABLE;

--
-- SYS_C008329
--
ALTER TABLE "user_test"."PRESCRIBE" ADD  FOREIGN KEY ("DRUG_ID") REFERENCES "user_test"."DRUG"("DRUG_ID") ENABLE;

--
-- SYS_C008304
--
ALTER TABLE "user_test"."PRESCRIPTION" ADD  FOREIGN KEY ("DRUG_ID") REFERENCES "user_test"."DRUG"("DRUG_ID") ENABLE;

--
-- SYS_C008305
--
ALTER TABLE "user_test"."PRESCRIPTION" ADD  FOREIGN KEY ("COMPANY_NAME") REFERENCES "user_test"."COMPANY"("COMPANY_NAME") ENABLE;

--
-- SYS_C008306
--
ALTER TABLE "user_test"."PRESCRIPTION" ADD  FOREIGN KEY ("PATIENT_SSN") REFERENCES "user_test"."PATIENT"("PATIENT_SSN") ENABLE;

--
-- SYS_C008311
--
ALTER TABLE "user_test"."PRODUCE" ADD  FOREIGN KEY ("COMPANY_NAME") REFERENCES "user_test"."COMPANY"("COMPANY_NAME") ENABLE;

--
-- SYS_C008312
--
ALTER TABLE "user_test"."PRODUCE" ADD  FOREIGN KEY ("DRUG_ID") REFERENCES "user_test"."DRUG"("DRUG_ID") ENABLE;

--
-- SYS_C008336
--
ALTER TABLE "user_test"."PROVIDES" ADD  FOREIGN KEY ("SDOP_ID") REFERENCES "user_test"."SDOP"("SDOP_ID") ENABLE;

--
-- SYS_C008337
--
ALTER TABLE "user_test"."PROVIDES" ADD  FOREIGN KEY ("DRUG_ID") REFERENCES "user_test"."DRUG"("DRUG_ID") ENABLE;

--
-- SYS_C008282
--
ALTER TABLE "user_test"."SALESMAN" ADD  FOREIGN KEY ("COMPANY_NAME") REFERENCES "user_test"."COMPANY"("COMPANY_NAME") ENABLE;

--
-- SYS_C008283
--
ALTER TABLE "user_test"."SALESMAN" ADD  FOREIGN KEY ("DRUG_ID") REFERENCES "user_test"."DRUG"("DRUG_ID") ENABLE;

--
-- SYS_C008342
--
ALTER TABLE "user_test"."SELL" ADD  FOREIGN KEY ("SDOP_ID") REFERENCES "user_test"."SDOP"("SDOP_ID") ENABLE;

--
-- SYS_C008343
--
ALTER TABLE "user_test"."SELL" ADD  FOREIGN KEY ("DISTRIBUTOR_NAME") REFERENCES "user_test"."DISTRIBUTOR"("DISTRIBUTOR_NAME") ENABLE;

--
-- SYS_C008297
--
ALTER TABLE "user_test"."VISIT" ADD  FOREIGN KEY ("SALESMAN_SSN") REFERENCES "user_test"."SALESMAN"("SALESMAN_SSN") ENABLE;

--
-- SYS_C008298
--
ALTER TABLE "user_test"."VISIT" ADD  FOREIGN KEY ("DOCTOR_SSN") REFERENCES "user_test"."DOCTOR"("DOCTOR_SSN") ENABLE;

