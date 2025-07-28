-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "NationalityFK" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;
