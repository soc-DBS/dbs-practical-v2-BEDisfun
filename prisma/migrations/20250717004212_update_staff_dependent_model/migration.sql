-- CreateTable
CREATE TABLE "staff_dependent" (
    "staff no" CHAR(4) NOT NULL,
    "dependent name" VARCHAR(30) NOT NULL,
    "relationship" VARCHAR(20) NOT NULL,

    CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff no","dependent name")
);
