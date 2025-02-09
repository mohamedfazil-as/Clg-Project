-- Insert data for course table
insert into student_management.course (coursecode,coursename,imple_date,isActive) values ("BCA","Bachelor Of Computer Application ",'1990-01-01',"Y");
insert into student_management.course (coursecode,coursename,imple_date,isActive) values ("BSC-IT","Bachelor Of Science Information Technology ",'1990-01-01',"Y");
insert into student_management.course (coursecode,coursename,imple_date,isActive) values ("BSC-CS","Bachelor Of Science Computer Science",'1990-01-01',"Y");
insert into student_management.course (coursecode,coursename,imple_date,isActive) values ("BSC-MATHS","Bachelor Of Science Mathmatics ",'1990-01-01',"Y");
insert into student_management.course (coursecode,coursename,imple_date,isActive) values ("BSC-CHEMISTRY","Bachelor Of Science Chemistry ",'1990-01-01',"Y");

commit;
-- Insert data for subject table
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BXF101","FOUNDATION TAMIL-I","I",25,75);
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BMF101","FOUNDATION ENGLISH-I","II",25,75);
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BHM101","PROGRAMMING IN  C AND DLF","III",25,75);
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BTA103","FOUNDATION MATHEMATICS-I","III",25,75);
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BHMP101","PROGRAMMING IN  C AND DLF PRACTICALS-I","III",25,75);
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BOO101","ORGANIZATIONAL DYNAMICS","IV",25,75);
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BSO102","EMPLOYABLITY SKILLS - I ","IV",25,75);
	insert into subjects (subjectcode,subjectname,partno,cia_markmax,se_markmax) values ("20BVO103","VALUE EDUCATION ","IV",25,75);

	commit;

CREATE INDEX idx_subjects_subjectcode_partno ON subjects(subjectcode, partno);

ALTER TABLE `student_management`.`subjects` 
CHANGE COLUMN `subjectname` `subjectname` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL ,
CHANGE COLUMN `partno` `partno` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `cia_markmax` `cia_markmax` INT NOT NULL ,
CHANGE COLUMN `se_markmax` `se_markmax` INT NOT NULL ,
ADD UNIQUE INDEX `subjectcode_UNIQUE` (`subjectcode` ASC) VISIBLE,
ADD UNIQUE INDEX `subjectname_UNIQUE` (`subjectname` ASC) VISIBLE;
;


ALTER TABLE `student_management`.`students` 
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
ADD UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
ADD UNIQUE INDEX `mobile_UNIQUE` (`mobile` ASC) VISIBLE,
ADD INDEX `idx_student_id_name` (`id` ASC, `name` ASC) VISIBLE;
;






