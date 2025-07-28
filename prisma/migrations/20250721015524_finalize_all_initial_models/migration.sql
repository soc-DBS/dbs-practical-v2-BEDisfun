/*
  Warnings:

  - The primary key for the `pre_requisite` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `module code` on the `pre_requisite` table. All the data in the column will be lost.
  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admin_number` on the `stud_mod_performance` table. All the data in the column will be lost.
  - You are about to drop the column `module_registered` on the `stud_mod_performance` table. All the data in the column will be lost.
  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admin_number` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `course_code` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `home_phone_number` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `mobile_phone_number` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `student_name` on the `student` table. All the data in the column will be lost.
  - Added the required column `mod_code` to the `pre_requisite` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mod_registered` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `crse_code` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stud_name` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pre_requisite" DROP CONSTRAINT "modCodeFk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "FKadminNo";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "FKmodcode";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "NationalityFK";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "crseCodeFK";

-- AlterTable
ALTER TABLE "module" ADD COLUMN     "mod_coord" CHAR(4);

-- AlterTable
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_pkey",
DROP COLUMN "module code",
ADD COLUMN     "mod_code" VARCHAR(10) NOT NULL,
ADD CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("mod_code", "requisite");

-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
DROP COLUMN "admin_number",
DROP COLUMN "module_registered",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ADD COLUMN     "mod_registered" VARCHAR(10) NOT NULL,
ALTER COLUMN "mark" DROP NOT NULL,
ALTER COLUMN "grade" DROP NOT NULL,
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("adm_no", "mod_registered");

-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
DROP COLUMN "admin_number",
DROP COLUMN "course_code",
DROP COLUMN "home_phone_number",
DROP COLUMN "mobile_phone_number",
DROP COLUMN "student_name",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ADD COLUMN     "crse_code" VARCHAR(5) NOT NULL,
ADD COLUMN     "home_phone" CHAR(8),
ADD COLUMN     "mobile_phone" CHAR(8),
ADD COLUMN     "stud_name" VARCHAR(30) NOT NULL,
ALTER COLUMN "address" SET DATA TYPE VARCHAR(100),
ALTER COLUMN "nationality" SET DATA TYPE VARCHAR(30),
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("adm_no");

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "offeredByDeptCode" TO "course_offered_by_fk";

-- RenameForeignKey
ALTER TABLE "pre_requisite" RENAME CONSTRAINT "RequisiteFk" TO "pre_requisite_requisite_fk";

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_mod_code_fk" FOREIGN KEY ("mod_code") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crse_code_fk" FOREIGN KEY ("crse_code") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fk" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;
