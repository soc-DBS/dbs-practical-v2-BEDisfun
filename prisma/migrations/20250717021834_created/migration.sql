-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "offeredByDeptCode" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
