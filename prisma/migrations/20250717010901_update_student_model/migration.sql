/*
  Warnings:

  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `admin number` on the `student` table. The data in that column could be lost. The data in that column will be cast from `VarChar(30)` to `VarChar(4)`.

*/
-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
ALTER COLUMN "admin number" SET DATA TYPE VARCHAR(4),
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("admin number");
