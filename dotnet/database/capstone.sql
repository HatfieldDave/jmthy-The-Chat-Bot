USE master
GO

-- Drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

-- Create Tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL,
	nickname nvarchar(150) NOT NULL,
	pronouns nvarchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

CREATE TABLE pathway (
	topic_id int IDENTITY(1,1) NOT NULL,
	topic_q varchar(200) NOT NULL,
	topic_info varchar(2000) NOT NULL,
	link(500) NOT NULL
	CONSTRAINT PK_pathway PRIMARY KEY (topic_id)
)

CREATE TABLE curriculum (
	topic_id int IDENTITY(1,1) NOT NULL,
	topic_q varchar(200) NOT NULL,
	topic_info varchar(2000) NOT NULL,
	link(500) NOT NULL
	CONSTRAINT PK_curriculum PRIMARY KEY (topic_id)
)

CREATE TABLE quotes (
	quote_id int IDENTITY(1,1) NOT NULL,
	quote varchar(2000) NOT NULL,
	CONSTRAINT PK_quote PRIMARY KEY (quote_id)
)

--CREATE TABLE security_questions(
	--username varchar(50) NOT NULL, 
	--question_id int IDENTITY(1,1) NOT NULL,
	--question_one nvarchar(500) NOT NULL,
	--answer_one nvarchar(500) NOT NULL,
	--question_two nvarchar(500) NOT NULL, 
	--answer_two nvarchar(500) NOT NULL,
	--question_three nvarchar(500) NOT NULL,
	--answer_three nvarchar(500) NULL
	--CONSTRAINT PK_security_questions PRIMARY KEY(username)
--)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role, nickname, pronouns) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'Nitro', 'He/Him');
INSERT INTO users (username, password_hash, salt, user_role, nickname, pronouns) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 'Zada', 'She/Her');
GO

INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Managing Stress and Imposter Syndrome',
'Make (and keep to) a schedule While you're at it, schedule breaks into your day
Remind yourself you are here to learn Don't compare yourself to others
Move your body Drink water Celebrate your wins!','LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Time management','The Pomodoro Technique
Step 1 Get a to-do list and a timer.
Step 2 Set your timer for 25 minutes and focus on a single task from your to-do list until the timer rings.
Step 3 When your session ends, mark off one pomodoro (one pomodoro = one 25-minute session) and record what you completed.
Step 4 Then enjoy a five-minute break.
Step 5 After four Pomodoros, take a longer, more restorative 15-30 minute break.
Cirillo Also Cites 3 Rules For The Pomodoro Technique:
Rule 1 Break down complex projects. If a task requires more than four Pomodoros, it needs to be divided into smaller, actionable steps. Sticking to this rule will help ensure you make clear progress on your projects.
Rule 2 Small tasks go together. Any tasks that will take less than one Pomodoro should be combined with other simple tasks. For example, "write rent check," "set vet appointment," and "read Pomodoro article" could go together in one session.
Rule 3 Once a pomodoro is set, it must ring. The pomodoro is an indivisible unit of time and cannot be broken, especially not to check incoming emails, team chats, or text messages. Any ideas, tasks, or requests that come up should be taken note of to come back to later.
','LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Elevator pitch','Your elevator pitch should be between 30-40 seconds. Add your own unique twist to your pitch or insert a joke related to your sense of humor (as long as it"s appropriate, of course!). Your personality is what makes you YOU - when you"re showcasing your personality, you"re portraying confidence. And confidence is key! If you sound bored or lack enthusiasm when giving your pitch, you"ll lose the attention of your audience quickly. Your elevator pitch isn"t just about what you"re saying, but how you"re saying it, so don"t forget about all of your non-verbal cues. These include eye contact, hand gestures, body language, and facial expressions. Always remember, you’ve got this!
','LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Resume','Your resume should include all of these items, Professional Summary, Name/Contact Information, Technical Skills, Technical Experience, Education and Professional Experience.
Listing your Capstone Projects, as well as any side projects you"ve worked on, will be an important part of building out your resume.
','LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('LinkedIn','LinkedIn serves as your online resume and presence when applying to jobs. While your resume is your "highlight reel", your LinkedIn profile is where you elaborate more on your story. Having a solid LinkedIn Summary will truly help you stick out among other candidates when you"re active on the job search so if recruiters can get a sense of who you are, Why you"re great, What you"re bringing to the table, AND your dazzling personality!',
'LINKEMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Side Projects','You don"t need some huge project to have something you can talk about. Just having even a simple project can let employers get a look inside your mind. At the end of the day, they’re interested in hearing about how you"re designing the program, what roadblocks you"ve run into, different approaches you might take if you did it again, and where you want to take the project in the future.',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Networking','Networking is going to be a vital part of your new career in technology. We want you all to feel comfortable and confident when it comes to networking with folks in the tech industry. Because of this, it"s important for you to begin networking sooner than later, so you can build up a quality network of connections in the industry. Remember - it"s not all about who you know... but knowing people will 100% help you in the technology industry!',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Interview Preparation','Interviewing begins the moment you receive a call or email from the recruiter informing you that they"re interested in scheduling an interview. From that moment until the day of your interview, you need to ensure that you"re as prepared as possible. If you go into any interview without a high level of preparation, it will not go well. Preparation is key when interviewing for roles in the tech industry. Remember to research the company you"re meeting with, Bring several copies of your resume to pass out to all interviewers, Check your Appearance, Dress to impress, Look Good!',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Behavioral Interviews','Behavioral Interviews will be a big part of your job search as you begin applying for a job in technology. Companies aren"t just looking for someone who "checks the boxes" in regard to technical skills, they want someone who is a culture fit for their team and their company as well, which is why they"ll use the behavioral interview and/or phone screen to assess if you"re a culture fit or not.',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Technical Interviews','While most of you likely have experience in general or behavioral interviews, we"re guessing you have yet to encounter a technical interview. The technical interview is very specific to the industry you’re entering and is usually a blend of technical questions, whiteboarding, and/or coding problems.',
'LINKME');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('After Interviews','The interview doesn"t end once you leave or log off the Zoom call! Make sure you"re taking the time to follow-up accordingly with the company and that you don"t take your foot off the gas with other applications! Always send a thank you email (after each and every interview),
Make it personal. Keep applying until you have a signed offer letter in your hand. Even if you feel really good about an interview, don"t stop applying.',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Job Search','Job Boards, Search Terms, A Boolean Search is a structured search that uses specific search terms with a mixture of phrases such as AND, OR, or NOT to utilize a search engine to its fullest potential. Job alerts will automatically unearth new jobs that match your preferences (based on your keywords and filters) and notify you daily via email and push notifications so you discover great opportunities as soon as possible.The Two-Pronged Approach allows you to take your job application a step further by getting in front of the right person at a company, Step one: Identify a Contact. Step 2: Send Them a Message or Email.',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Benefits','Once you receive a job offer, you"ll want to review the benefits package as well. The benefits package will include paid time off (PTO), medical benefits, bonuses, and more. Make sure to review this lesson so you"re familiar with what to expect in a benefits package.',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('Huntr','Huntr is an incredible job search organizational platform that Tech Elevator provides students access too. Once you begin applying to jobs, it"s easy to lose track of which opportunities you"ve applied to, Huntr makes staying organized in your job search easy! In addition to helping you keep track of your applications and interviews, Huntr allows you track your job goals, and find and apply to jobs using their Job Portal!',
'LINKMEPLEASE');
INSERT INTO pathway (topic_q, topic_info, link) VALUES ('','','');



INSERT INTO curriculum (topic_q, topic_info, link) VALUES ('','','');
INSERT INTO curriculum (topic_q, topic_info, link) VALUES ('','','');
INSERT INTO curriculum (topic_q, topic_info, link) VALUES ('','','');
INSERT INTO curriculum (topic_q, topic_info, link) VALUES ('','','');
INSERT INTO curriculum (topic_q, topic_info, link) VALUES ('','','');



INSERT INTO quotes (quote) VALUES ('');
INSERT INTO quotes (quote) VALUES ('');
INSERT INTO quotes (quote) VALUES ('');
INSERT INTO quotes (quote) VALUES ('');
INSERT INTO quotes (quote) VALUES ('');
GO




Select * From users
