-- CreateTable
CREATE TABLE "student" (
    "admin number" VARCHAR(30) NOT NULL,
    "student name" VARCHAR(30) NOT NULL,
    "gender" CHAR(1) NOT NULL,
    "address" CHAR(100) NOT NULL,
    "mobile phone number" CHAR(8) NOT NULL,
    "home phone number" CHAR(8) NOT NULL,
    "dob" DATE NOT NULL,
    "nationality" CHAR(30) NOT NULL,
    "course code" VARCHAR(5) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("admin number")
);
