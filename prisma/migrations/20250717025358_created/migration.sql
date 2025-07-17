/*
  Warnings:

  - The primary key for the `module` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `mod_code` on the `module` table. The data in that column could be lost. The data in that column will be cast from `Integer` to `VarChar(10)`.
  - The primary key for the `pre_requisite` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `module code` on the `pre_requisite` table. The data in that column could be lost. The data in that column will be cast from `Integer` to `VarChar(10)`.

*/
-- AlterTable
ALTER TABLE "module" DROP CONSTRAINT "module_pkey",
ALTER COLUMN "mod_code" SET DATA TYPE VARCHAR(10),
ADD CONSTRAINT "module_pkey" PRIMARY KEY ("mod_code");

-- AlterTable
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_pkey",
ALTER COLUMN "module code" SET DATA TYPE VARCHAR(10),
ADD CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("module code", "requisite");

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "modCodeFk" FOREIGN KEY ("module code") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "RequisiteFk" FOREIGN KEY ("requisite") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
