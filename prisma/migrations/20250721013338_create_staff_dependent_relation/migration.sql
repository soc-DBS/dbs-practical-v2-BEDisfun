-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "crseCodeFK" FOREIGN KEY ("course_code") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
