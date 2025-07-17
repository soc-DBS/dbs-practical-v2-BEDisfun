-- CreateTable
CREATE TABLE "pre_requisite" (
    "module code" VARCHAR(10) NOT NULL,
    "requisite" VARCHAR(10) NOT NULL,

    CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("module code","requisite")
);
