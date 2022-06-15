CREATE DATABASE `interviewcrackerdb`;

USE `interviewcrackerdb`;

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profilepic` MEDIUMBLOB,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_id_UNIQUE` (`staff_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `courses` (
  `courses_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(64) NOT NULL,
  `student_enroll_count` int(11) NOT NULL,
  PRIMARY KEY (`courses_id`),
  UNIQUE KEY `courses_id_UNIQUE` (`courses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `code_complexity` (
  `code_complexity_id` int(11) NOT NULL AUTO_INCREMENT,
  `complexity_desc` varchar(64) NOT NULL,
  PRIMARY KEY (`code_complexity_id`),
  UNIQUE KEY `code_complexity_id_UNIQUE` (`code_complexity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `coding_question` (
  `coding_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `code_complexity_id` int(11) NOT NULL,
  `summary` varchar(100) NOT NULL,
  `question` varchar(1000) NOT NULL,
  PRIMARY KEY (`coding_question_id`),
  UNIQUE KEY `coding_question_id_UNIQUE` (`coding_question_id`),
  FOREIGN KEY (`code_complexity_id`) REFERENCES `code_complexity` (`code_complexity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `coding_test_case` (
  `coding_test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `coding_question_id` int(11) NOT NULL,
  `summary` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  PRIMARY KEY (`coding_test_case_id`),
  UNIQUE KEY `coding_test_case_id_UNIQUE` (`coding_test_case_id`),
  FOREIGN KEY (`coding_question_id`) REFERENCES `coding_question` (`coding_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `students` (
  `students_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profilepic` MEDIUMBLOB,
  PRIMARY KEY (`students_id`),
  UNIQUE KEY `students_id_UNIQUE` (`students_id`),
  UNIQUE KEY `student_email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `student_course` (
  `student_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  `completion_percent` int(11),
  `hit_count` int(11),
  PRIMARY KEY (`student_course_id`),
  UNIQUE KEY `student_course_id_UNIQUE` (`student_course_id`),
  FOREIGN KEY (`students_id`) REFERENCES `students` (`students_id`),
  FOREIGN KEY (`courses_id`) REFERENCES `courses` (`courses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `student_coding` (
  `student_coding_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_id` int(11) NOT NULL,
  `coding_question_id` int(11) NOT NULL,
  `completion_percent` int(11),
  `hit_count` int(11),
  PRIMARY KEY (`student_coding_id`),
  UNIQUE KEY `student_coding_id_UNIQUE` (`student_coding_id`),
  FOREIGN KEY (`students_id`) REFERENCES `students` (`students_id`),
  FOREIGN KEY (`coding_question_id`) REFERENCES `coding_question` (`coding_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `student_coding_test` (
  `student_coding_test_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_id` int(11) NOT NULL,
  `coding_question_id` int(11) NOT NULL,
  `coding_test_case_id` int(11) NOT NULL,
  `hit_count` int(11),
  `status` char(1),
  PRIMARY KEY (`student_coding_test_id`),
  UNIQUE KEY `student_coding_test_id_UNIQUE` (`student_coding_test_id`),
  FOREIGN KEY (`students_id`) REFERENCES `students` (`students_id`),
  FOREIGN KEY (`coding_question_id`) REFERENCES `coding_question` (`coding_question_id`),
  FOREIGN KEY (`coding_test_case_id`) REFERENCES `coding_test_case` (`coding_test_case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

commit;

select * from students;
drop table students;

show tables;


ALTER TABLE students
ADD COLUMN profilepic VARCHAR(15) AFTER password;

ALTER TABLE students MODIFY profilepic MEDIUMBLOB;
