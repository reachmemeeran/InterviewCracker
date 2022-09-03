# Interview Cracker - Web Application
University of Bath | MSc Computer Science | Dissertation | InterviewCracker

Gamification is the process of incorporating gaming elements and principles into non-gaming environments in order to increase user engagement. This project uses a gamification methodology to make learning Java programming language fun and engaging activity. Students today are accustomed to social and gamified real-life experiences, and worldwide, online course completion rates have averaged less than 13%. So that the courses would be interactive, we created an e-learning web application with features like leader boards, progress bars, and certificates.


This project seeks to validate gamification hypothesis through a web application, 'Interview Cracker'. Through this application, University of Bath's Principles of Programming (POP) module work sheets have been transformed into online code editor test sheets with pre-loaded test cases. This application can help students to evaluate their codes and run tests instantly. This process of simplifying students’ learning to a task-driven approach will help us gamify the process further. An app-based course that given rise to a new coding interview questions has been introduced to assist students prepare for and succeed in job interviews. Additionally, based on different levels, such as beginner, intermediate, and expert, students can tailor their experience.

## Tech Stack

* Java - Version: 8
* JSP, Servlet, JSTL, HTML, JS, jQuery and CSS
  * JSP-API - Version: 2.0
  * javax.servlet-API -  Version: 3.0.1
  * JSTL - Version: 1.2
  * JAXB-API - Version: 2.3.0
  * HyperText Markup Language- HTML - Version: 4
  * JavaScript - JS
  * jQuery
  * Cascading Style Sheet - CSS
* Hibernate - Version: 5.2.12.Final
* Codex-API
* gson - Version: 2.8.5
* Apache Tomact - Version: 9.0
* MySQL Database- Version: 5.1.46
* Postman client for API Validation
* Maven Build tool
  * maven-compiler-plugin - Version: 3.8.1
  * maven-war-plugin - Version: 3.2.3
* Github
* JUnit Test suite - Version: 5


## Modules

* Student Portal
  * Student's Authorisation
  * Principles of Programming module
  * Coding Challenge module
  * Certifiation, Leaderboard and Progress bars
  
* Instructor (ADMIN) Portal
  * Instructor's Authorisation
  * Staff Management module
  * Student Management module
  * Principles of Programming Management module
  * Code Complexity management module
  * Coding Question Management module

## Java Package Organisation
The top level package name is com.interviewcracker, and it is preceded by the controller package, which consists of java servlet source files. Since this project includes both a student and an administrator portal, there are two sub-branches under the controller package: admin for the instructor portal and frontend for the student portal. Under each part of the package there are many sub packages corresponding to each module such as code, code complexity, pop, student and staff.

The model layer package is com.interviewcracker.dao and it consists of all the DAO classes. The package for the model is com.interviewcracker.entity, and it contains all model or entity classes. com.interviewcracker.service is the package for the business/service layer. 

This structure makes the code well-organised and is easy to maintain.

<img width="745" alt="Screenshot 2022-09-03 at 9 52 51 PM" src="https://user-images.githubusercontent.com/85428685/188287351-7a2a84e1-98e3-4df8-b79e-3b44b3c15a15.png">

## UI Directory Organisation
The student portal module's jsp files are all located in the frontend directory, the instructor module's jsp files are all located in the admin directory, all CSS styles are located in the css directory, error pages are located in the error directory, JS files are located in the js directory, and images are  located in the images directory. For ease of comprehension by visitors, all directories' names have been kept simple and straight forward.

<img width="193" alt="Screenshot 2022-09-03 at 9 54 57 PM" src="https://user-images.githubusercontent.com/85428685/188287516-3bbd896d-3dbb-4e6f-9b79-0639bd8aae5a.png">

## Few Image from the applicaiton

**Student Portal Home Page**
<img width="1438" alt="StudentHomeHigh" src="https://user-images.githubusercontent.com/85428685/188287565-3e5bcc93-fea7-4606-9812-9e81330ce879.png">

**Student Portal POP Module**
<img width="1437" alt="StudentPOPHigh" src="https://user-images.githubusercontent.com/85428685/188287585-18c78cc4-138a-4c1f-9947-d16fe0087d1a.png">

<img width="1439" alt="psssed" src="https://user-images.githubusercontent.com/85428685/188287757-5fa4175e-867c-427d-b516-8dadc24e07af.png">

**Student Portal Coding Challenge Module**
<img width="1439" alt="c1" src="https://user-images.githubusercontent.com/85428685/188287636-a89b5bd9-2d28-4bc1-b138-4823b9dd4a9a.png">
<img width="1440" alt="c2" src="https://user-images.githubusercontent.com/85428685/188287642-932e1fd6-753b-4aec-9d90-574b51e9ca05.png">
<img width="1440" alt="c7" src="https://user-images.githubusercontent.com/85428685/188287653-3c5c58fe-a67b-4be4-b5ba-17153890764e.png">
<img width="1440" alt="c8" src="https://user-images.githubusercontent.com/85428685/188287658-4af4622d-b7df-43f5-ad24-161abbee4b4d.png">
<img width="1437" alt="c4" src="https://user-images.githubusercontent.com/85428685/188287678-b124bf8d-51b0-45ce-8764-c43da79369ca.png">

**Certificate**
<img width="1440" alt="c10" src="https://user-images.githubusercontent.com/85428685/188287900-7e9ff879-81d8-4808-ac80-c7365736090a.png">


## Testimonials
* Participant -1- I'm motivated and captivated by leaderboards and pie charts for progress. 
* Participant -2- Better Visibility compared to Moodle.
* Participant -3- Fun to solve and easy to track. 
* Participant -4- I feel accomplished with certificates of 100% solved status.
* Participant -5- It is easier to use, offers better navigation to exercises, and enables instructors to keep track of student progress.

The primary objective of the research is to bridge the gap between learning the principles of programming module in semester 1 and implementing those  programming skills to succeed in coding job interviews. It can be referred from the user evaluation that this application based research has helped the  students eliminate their huddles and the gamification aspect has accelerated their learning. The gamification components employed has increased the user  motivation leading to significant increase in user engagement. This approach to learning helps students improve their coding skills, in turn boosting  their confidence and success in Job interviews. Finally, the research can conclude that the description and research findings of implementing the web  application Interview cracker has been comprehensive and hence should be sufficient for researchers to further extend and asses an equivalent system.
