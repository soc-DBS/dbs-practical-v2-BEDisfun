/*
  Warnings:

  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
ALTER COLUMN "module_registered" SET DATA TYPE VARCHAR(11),
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("admin_number", "module_registered");
