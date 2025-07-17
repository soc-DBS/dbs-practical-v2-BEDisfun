/*
  Warnings:

  - The primary key for the `country` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `country name` on the `country` table. All the data in the column will be lost.
  - The primary key for the `staff_dependent` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `dependent name` on the `staff_dependent` table. All the data in the column will be lost.
  - You are about to drop the column `staff no` on the `staff_dependent` table. All the data in the column will be lost.
  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admin number` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `course code` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `home phone number` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `mobile phone number` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `student name` on the `student` table. All the data in the column will be lost.
  - Added the required column `country_name` to the `country` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dependent_name` to the `staff_dependent` table without a default value. This is not possible if the table is not empty.
  - Added the required column `staff_no` to the `staff_dependent` table without a default value. This is not possible if the table is not empty.
  - Added the required column `admin_number` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `course_code` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `home_phone_number` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mobile_phone_number` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `student_name` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "country" DROP CONSTRAINT "country_pkey",
DROP COLUMN "country name",
ADD COLUMN     "country_name" VARCHAR(30) NOT NULL,
ADD CONSTRAINT "country_pkey" PRIMARY KEY ("country_name");

-- AlterTable
ALTER TABLE "staff_dependent" DROP CONSTRAINT "staff_dependent_pkey",
DROP COLUMN "dependent name",
DROP COLUMN "staff no",
ADD COLUMN     "dependent_name" VARCHAR(30) NOT NULL,
ADD COLUMN     "staff_no" CHAR(4) NOT NULL,
ADD CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no", "dependent_name");

-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
DROP COLUMN "admin number",
DROP COLUMN "course code",
DROP COLUMN "home phone number",
DROP COLUMN "mobile phone number",
DROP COLUMN "student name",
ADD COLUMN     "admin_number" VARCHAR(4) NOT NULL,
ADD COLUMN     "course_code" VARCHAR(5) NOT NULL,
ADD COLUMN     "home_phone_number" CHAR(8) NOT NULL,
ADD COLUMN     "mobile_phone_number" CHAR(8) NOT NULL,
ADD COLUMN     "student_name" VARCHAR(30) NOT NULL,
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("admin_number");

-- CreateTable
CREATE TABLE "stud_mod_performance" (
    "admin_number" CHAR(4) NOT NULL,
    "module_registered" VARCHAR(10) NOT NULL,
    "mark" INTEGER NOT NULL,
    "grade" CHAR(2) NOT NULL,

    CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("admin_number","module_registered")
);
