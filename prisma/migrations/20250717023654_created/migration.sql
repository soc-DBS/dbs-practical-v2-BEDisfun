/*
  Warnings:

  - The primary key for the `pre_requisite` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Changed the type of `module code` on the `pre_requisite` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_pkey",
DROP COLUMN "module code",
ADD COLUMN     "module code" INTEGER NOT NULL,
ADD CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("module code", "requisite");
