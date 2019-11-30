insert into CourseVO (capacity,courseName,courseTag,credits) values (400,'Introduction to macroeconomics','ME102',4);
insert into CourseVO (capacity,courseName,courseTag,credits) values (350,'Advanced macroeconomics','ME103',4);
insert into CourseVO (capacity,courseName,courseTag,credits) values (250,'Approximation of macroeconomics','ME201',4);
insert into CourseVO (capacity,courseName,courseTag,credits) values (100,'Super Advanced Approximation to macroeconomics','ME901',4);
insert into SpecialisationVO (credits,specialisationName,specialisationTag) values (20,'Data Science','DS');
insert into SpecialisationVO (credits,specialisationName,specialisationTag) values (50,'Computer Science and Theory','CS');
insert into SpecialisationVO (credits,specialisationName,specialisationTag) values (75,'Network and Communication','NC');
insert into SpecialisationVO (credits,specialisationName,specialisationTag) values (45,'Electronics and Communicatino','EC');
insert into Course_Course (id,prerequisiteVOS_id) values(2,1);
insert into Course_Course (id,prerequisiteVOS_id) values(3,1);
insert into Course_Course (id,prerequisiteVOS_id) values(4,1);
insert into Course_Specialisation(id,specialisation_id) values(1,2);
insert into Course_Specialisation(id,specialisation_id) values(2,2);
insert into Course_Specialisation(id,specialisation_id) values(3,2);
insert into Course_Specialisation(id,specialisation_id) values(4,2);
insert into UserVO(email,password) values('admin','admin');

