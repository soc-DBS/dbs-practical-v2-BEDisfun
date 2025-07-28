-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "FKmodcode" FOREIGN KEY ("module_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "FKadminNo" FOREIGN KEY ("admin_number") REFERENCES "student"("admin_number") ON DELETE NO ACTION ON UPDATE NO ACTION;
