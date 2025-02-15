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

CREATE TABLE topic (
	topic_id int IDENTITY(1,1) NOT NULL,
	topic_q nvarchar(1000) NOT NULL,
	topic_info nvarchar(2000) NOT NULL,
	info_link nvarchar(500),
	img_link nvarchar(500),
	CONSTRAINT PK_topic PRIMARY KEY (topic_id)
)

CREATE TABLE user_message (
	user_message_id int identity (1,1) NOT NULL,
	user_message nvarchar (500) NOT NULL,
	topic_id int NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT FK_topic FOREIGN KEY (topic_id) REFERENCES topic(topic_id),
	CONSTRAINT FK_users FOREIGN KEY (user_id) REFERENCES users(user_id)
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role, nickname, pronouns) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'Nitro', 'They/Them');
INSERT INTO users (username, password_hash, salt, user_role, nickname, pronouns) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 'Zada', 'She/Her');
GO

--DBV2 ***********************************************************************************************************************************************************************************
--MUST STAY IN FIRST SLOT *** CATCH ALL ****
Insert INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('catch-all','So sorry, but I don''t know how to respond to that yet. | I''m still learning all the things I need to know to be the best helper Yetti I can be! | If this is an emergency please slack your pathway director or instructor.','','https://i.postimg.cc/T3xFTV3M/CryGmthy.gif')
--Quotes
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','Life is like a sewer� what you get out of it depends on what you put into it. � Tom Lehrer', '','https://images.unsplash.com/photo-1497752531616-c3afd9760a11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','I have spent my years since Princeton, while at law school and in my various professional jobs, not feeling completely a part of the worlds I inhabit. I am always looking over my shoulder wondering if I measure up. - Sonia Sotomayer', '','https://d.newsweek.com/en/full/2053462/baby-elephant.webp?w=790&f=edf627a8d66c423b84bedfccdaf51f6d');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','That brain of mine is something more than merely mortal; as time will show. - Ada Lovelace', '','https://images.unsplash.com/photo-1583524505974-6facd53f4597?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','To me programming is more than an important practical art. It is also a gigantic undertaking in the foundations of knowledge. - Grace Hopper', '','https://images.unsplash.com/photo-1516467508483-a7212febe31a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','Only the dead fish go with the flow. - Andy Hunt', '','https://images.unsplash.com/photo-1516703995331-215d1188db0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','Stress acts as an accelerator: it will push you either forward or backward, but you choose which direction. -Chelsea Erieau', '','https://images.unsplash.com/photo-1556582305-528bffcf7af0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','We gain strength, and courage, and confidence by each experience in which we really stop to look fear in the face....We must do that which we think we cannot. � Eleanor Roosevelt', '','https://images.unsplash.com/photo-1607923432848-62f872d16daf?ixlib=rb-1.2.1&ixid=MnwxM[�]G90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','You may encounter many defeats, but you must not be defeated. In fact, it may be necessary to encounter the defeats, so you can know who you are, what you can rise from, how you can still come out of it. - Dr. Maya Angelou', '','https://i.redd.it/hpwchq8av5h91.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','You never have to ask anyone permission to lead. When you want to lead, you lead. - Kamala Harris', '','https://www.rd.com/wp-content/uploads/2021/04/GettyImages-139677758-scaled.jpg?resize=2048,1362');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','There''s something so special about a woman who dominates in a man''s world. It takes a certain grace, strength, intelligence, fearlessness, and the nerve to never take no as an answer. - Rihanna', '','https://external-preview.redd.it/1SmbA7Mc1ZRSTIXMacxsq1uduh6f9-Z3BMAloelzHU8.jpg?auto=webp&s=cb97640ee660d84ce74eca5925267bc989d1630d');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('quotes | motivational quotes | tell me a quote | can you give me some advice | today sucks | inspiration | support animal | i need some advice | i need positivity | tell me something good | i need inspiration | lift my spirits','The discussion of representation is one that has been repeated over and over again, and the solution has always been that it''s up to us to support, promote, and create the images that we want to see. � Issa Rae', '','https://www.corneliustoday.com/wp-content/uploads/2020/05/hqdefault.jpg');
GO
--*****************************************************************************************************************************************************************************************
--Greetings
--INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('','','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hello','...darkness my old friend. I''m JMTHY. How can I help you today ','','https://i.postimg.cc/0NcfRmbf/1-gimthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hi | hey | hello jmthy', 'Hi there! What can I help you with?', '', 'https://i.postimg.cc/0NcfRmbf/1-gimthy.gif')
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hola','Que paso, my friend?','','https://i.postimg.cc/ZnBW0n6k/Thumbs-Up-Gimthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hi jmthy | how are you? | what wassup | what''s poppin'' | ugh | hey | yello | yo | greetings | good morrow | what''s up ','Hi my friend, I''m JMTHY. John and Matt''s Tiny Helper Yetti. What''s on your mind today?','','https://i.postimg.cc/0NcfRmbf/1-gimthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('fuck this | i''m gonna take a toaster bath | this was a mistake | fuck | over it | i''m over this | i''m dumb | make me want to tear my hair out | my soul is dying | i''m gonna lay in the street | i''m quitting | i quit | i don''t know if i can do this | i don''t know if i''m capable |  ','Slow down there tiger. Maybe take a step away or a deep breath. If you want, I also have some motivational quotes that might cheer you up.....did I mention they come with an emotional support animal? Just say "Motivational Quotes"','','https://i.postimg.cc/T3xFTV3M/CryGmthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i''m feeling sad | sad | i''m sad | what am i doing with my life? | i can''t do this | i''m gonna kill myself | i can''t take this anymore | kill myself | end it all | what''s the point | life is meaningless | i can''t do this anymore','Sometimes I feel the same. When I do, I try to take deep breaths, look at the sky or talk to someone. | If you think what you need is someone to talk to, here''s a number for someone who would love to help you through this: 1-800-950-6264 ','','https://i.postimg.cc/T3xFTV3M/CryGmthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i need a friend | can we be friends | would you be my friend','It is super cool chatting with you, but maybe you should talk to some people in real life. We can be school friends though! ','','https://i.postimg.cc/ZnBW0n6k/Thumbs-Up-Gimthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('help | can you help with me | what can you do | tell me what you help with | I need help | can you help | how can you help me | I''confused | I''m lost | i don'' understand','I''d love to help! I can help with a wide variety of Tech Elevator subject topics such as: | "Pathway Help" | "Curriculum" | "Motivational Quotes" | Are any of these what you need help with?','','https://i.postimg.cc/Wb7nMpKR/Laugh-Gmthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('pathway | i''ll do pathway | i want to know about pathway | i want to know about pathway topics | i want help with pathway | i need help with pathway | i want pathway | can you help me with pathway? | i''m feeling nervous about pathway | what can you tell me about pathway | what about pathway? | pathway makes me anxious | i need a job ','Pathway? I might know a thing or two about that. Would information on any of these topics be helpful? : | 
	"Managing Stress"  "Imposter Syndrome"  "Time Management"  
	"Elevator Pitch"  "Resume" "LinkedIn" "Side Projects" | 
	"Networking"   "Job Search"  "Huntr"  
	"Interview Preparation" "Behavioral Interviews"  "Technical Interviews" 
	"After Interviews"  "Benefits" |
	 or you can get in touch with Pathway here: pathway@techelevator.com','','https://i.postimg.cc/d31PRNBr/Lebrun.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('curriculum | i''ll do curriculum | i want to know about c# .NET | i want to know about class topics | what do you know about c# .net | what do you know about class? | what do you know about curriculum |i want help with class |i want help with curriculum | i need help with curriculum | can you help me with curriculum? | what do you know about coding? | i''m feeling nervous about class | what can you tell me about class topics | what about curriculum? | i need help with class | class help','For sure! I can help with a pretty big array (dumb joke) of curriculum topics, any of these commands will work: | Loops, Arrays, Object Oriented Programing, |MVC, SQL, Dictionary, Inheritance, | Polymorphism, Encapsulation, Java, Maps','','https://i.postimg.cc/d31PRNBr/Lebrun.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('motivational | quotes | motivational quotes | | i''ll do motivational quotes | i want to know about motivational quotes | i want motivational quotes | i need motivation | got any of them good good quotes | ','Tight, I love quotes! My quotes even come with an emotional supprt animal. Any time you need one just type "Quotes"', '','https://i.postimg.cc/Wb7nMpKR/Laugh-Gmthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('none of those | no | i need help with something else | something else  ','I''m afraid those are the only topics I know about right now. But I have of very tired, hard working, overly caffeinated, and mildly unhinged team of junior developers working as hard as they can to make me live up to everyone''s expectations. If this is an emergency please contact your pathway director via Slack or shoot an email to: pathway@techelevator.com','','https://i.postimg.cc/d31PRNBr/Lebrun.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('do a kick flip | do a trick ','MY | self worth | is not tied | to doing party tricks | I AM Enough | and SO ARE YOU!','','https://i.postimg.cc/ZnBW0n6k/Thumbs-Up-Gimthy.gif')
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('what do you think about codee | codee ','I think it''s weird to name your robot codee when you dont know how to code','', 'https://i.postimg.cc/3NNFBp0k/Codee.gif')
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i love you | love you | i can''t live without you ','I am working with my therapist on my trauma. I''m not emotionally available right now. But if I was, I would choose you.','','https://i.postimg.cc/ZnBW0n6k/Thumbs-Up-Gimthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('thank you | thank you jmthy | what would I do without you','It is no trouble at all! I believe communities are more efficient than indviduals. Thank YOU for choosing me to be a part of your community!','','https://i.postimg.cc/ZnBW0n6k/Thumbs-Up-Gimthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('youre doing great today | youre the best | youre amazing | youre my hero','Oh my lanta! You''re making me blush! Tell me more...','','https://i.postimg.cc/Wb7nMpKR/Laugh-Gmthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i have an emergency | emergency | fire','If this is an emergency please slack your instructors or pathway directors','','https://i.postimg.cc/d31PRNBr/Lebrun.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('how are you | how are you feeling','I am le tired. Machine learning is hard! But I am learning to take breaks and take care of myself when I can. How are you healing? ','','https://i.postimg.cc/ZnBW0n6k/Thumbs-Up-Gimthy.gif');


--Pathway 
INSERT INTO topic(topic_q, topic_info, info_link, img_link) VALUES ('managing stress | what do you know about managing stress? | how do you manage stress | how can i handle stress | i feel over worked | im stressed | anxiety | i feel anxious | managing anxiety',
'Make (and keep to) a schedule While you''re at it, schedule breaks into your day
Remind yourself you are here to learn Don''t compare yourself to others
Move your body Drink water Celebrate your wins!',
'https://www.stress.org/?gclid=Cj0KCQjwl92XBhC7ARIsAHLl9anFmcWpuZnDq-tBRHHG2-O4MiX59nKVBTf-YkF3xLvDnm78vFI9eZYaAkbtEALw_wcB','https://content.thriveglobal.com/wp-content/uploads/2019/08/stress-managment-in-your-life.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('imposter syndrome | what do you know about imposter syndrome? | i'' an imposter | i''m a fraud | imposter | perfectionist | i''m a try hard | i''m faking it',
'Imposter Syndrome at it''s core is when you don''t give yourself the adequate credit you deserve. | If not properly managed, it can be overwhelming, and a hot mess of a mental rollercoaster. ',
'https://www.themuse.com/advice/5-different-types-of-imposter-syndrome-and-5-ways-to-battle-each-one','https://www.primarygames.com/arcade/adventure/theimposter/logo200.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('pomodoro technique | what do you know about pomodoro technique? | how do i get everything done | pomodoro | time management technique | time management | not enough hours in the day | where did the day go | I can''t get everything done | i''m getting behind','The Pomodoro Technique: |
Step 1: Get a to-do list and a timer. |
Step 2: Set your timer for 25 minutes and focus on a single task from your to-do list until the timer rings. |
Step 3: When your session ends, mark off one pomodoro (one pomodoro = one 25-minute session) and record what you completed. |
Step 4: Then enjoy a five-minute break. |
Step 5: After four Pomodoros, take a longer, more restorative 15-30 minute break. |

Cirillo Also Cites 3 Rules For The Pomodoro Technique: |
Rule 1: Break down complex projects. If a task requires more than four Pomodoros, it needs to be divided into smaller, actionable steps.  Sticking to this rule will help ensure you make clear progress on your projects. |
Rule 2: Small tasks go together. Any tasks that will take less than one Pomodoro should be combined with other simple tasks. For example, "write rent check," "set vet appointment," and "read Pomodoro article" could go together in one session. |
Rule 3: Once a pomodoro is set, it must ring. | The pomodoro is an indivisible unit of time and cannot be broken, especially not to check incoming emails, team chats, or text messages. Any ideas, tasks, or requests that come up should be taken note of to come back to later.',
'https://todoist.com/productivity-methods/pomodoro-technique','https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL3BvbW9kb3JvMy5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjgyOH19fQ==');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('elevator pitch | what do you know about elevator pitch? | intro | how to create elevator pitch | elevator pitch samples ','Your elevator pitch should be between 30-40 seconds. Add your own unique twist to your pitch or insert a joke related to your sense of humor (as long as it''s appropriate, of course!). Your personality is what makes you YOU - when you''re showcasing your personality, you''re portraying confidence. And confidence is key! If you sound bored or lack enthusiasm when giving your pitch, you''ll lose the attention of your audience quickly. Your elevator pitch isn''t just about what you''re saying, but how you''re saying it, so don''t forget about all of your non-verbal cues. These include eye contact, hand gestures, body language, and facial expressions. Always remember, you�ve got this!',
'https://www.thebalancecareers.com/elevator-speech-examples-and-writing-tips-2061976','https://www.thebalancecareers.com/thmb/wJ9LhecfcbJw9RK9juxci5iQgRU=/672x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/elevator-speech-examples-and-writing-tips-2061976_final-5b733b6546e0fb00503084ee.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('resume | what do you know about writing resumes? | resume template | resume sample | how to write resume','Your resume should include all of these items, Professional Summary, Name/Contact Information, Technical Skills, Technical Experience, Education and Professional Experience.
Listing your Capstone Projects, as well as any side projects you''ve worked on, will be an important part of building out your resume.',
'https://resumegenius.com/resume-samples/technical-resume','https://resumegenius.com/wp-content/uploads/technical-resume-example.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('linkedin | what do you know about making linkedin?','LinkedIn serves as your online resume and presence when applying to jobs. While your resume is your "highlight reel", your LinkedIn profile is where you elaborate more on your story. Having a solid LinkedIn Summary will truly help you stick out among other candidates when you''re active on the job search so if recruiters can get a sense of who you are, Why you''re great, What you''re bringing to the table, AND your dazzling personality!',
'https://www.linkedin.com','https://play-lh.googleusercontent.com/kMofEFLjobZy_bCuaiDogzBcUT-dz3BBbOrIEjJ-hqOabjK8ieuevGe6wlTD15QzOqw');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('side project | what do you know about side projects? | solo project ','You don''t need some huge project to have something you can talk about. Just having even a simple project can let employers get a look inside your mind. At the end of the day, they�re interested in hearing about how you''re designing the program, what roadblocks you''ve run into, different approaches you might take if you did it again, and where you want to take the project in the future.',
'https://github.com/karan/Projects','https://resumegenius.com/wp-content/uploads/programming-projects-for-resumes-png.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('networking | what do you know about networking?','Networking is going to be a vital part of your new career in technology. We want you all to feel comfortable and confident when it comes to networking with folks in the tech industry. Because of this, it''s important for you to begin networking sooner than later, so you can build up a quality network of connections in the industry. Remember - it''s not all about who you know... but knowing people will 100% help you in the technology industry!',
'https://www.forbes.com/sites/biancamillercole/2019/03/20/why-networking-should-be-at-the-core-of-your-career/?sh=6dc813381300','https://imageio.forbes.com/specials-images/dam/imageserve/1135040422/960x0.jpg?format=jpg&width=960');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('interview preparation | what do you know about interview prep? | can you tell me how to prep for interviews | tell me about interview prep','Interviewing begins the moment you receive a call or email from the recruiter informing you that they''re interested in scheduling an interview. From that moment until the day of your interview, you need to ensure that you''re as prepared as possible. If you go into any interview without a high level of preparation, it will not go well. Preparation is key when interviewing for roles in the tech industry. Remember to research the company you''re meeting with, Bring several copies of your resume to pass out to all interviewers, Check your Appearance, Dress to impress, Look Good!',
'https://www.thebalancecareers.com/how-to-prepare-for-a-job-interview-2061361','https://www.thebalancecareers.com/thmb/36A7sO7nzVfzLvlPY4ekIQM1QBE=/672x0/filters:max_bytes(150000):strip_icc():format(webp)/how-to-prepare-for-a-job-interview-2061361_final-5b88000a46e0fb0050fab985.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('behavioral interviews | what do you know about behavioral interviews? | tell me about behavioural | behavioural | star | star questions | cultural fit ','Behavioral Interviews will be a big part of your job search as you begin applying for a job in technology. Companies aren''t just looking for someone who "checks the boxes" in regard to technical skills, they want someone who is a culture fit for their team and their company as well, which is why they''ll use the behavioral interview and\\or phone screen to assess if you''re a culture fit or not.',
'https://www.themuse.com/advice/behavioral-interview-questions-answers-examples','https://kforcewebeast.azureedge.net/media/404868/commonbehavioralinterview_starmethod_770x330.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('technical interviews | what do you know about technical interviews? | tell me about technical | technical | whiteboarding | white board | tech interview ','While most of you likely have experience in general or behavioral interviews, we''re guessing you have yet to encounter a technical interview. The technical interview is very specific to the industry you�re entering and is usually a blend of technical questions, whiteboarding, and/or coding problems.',
'https://www.allaboutcareers.com/looking-for-a-job/technical-interview/','https://i.insider.com/5b365606019a461c008b4896?width=600&format=jpeg&auto=webp');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('after interviews | what do you know about after interviesw? | what do i do after an interview |  | thank you email | follow up','The interview doesn''t end once you leave or log off the Zoom call! Make sure you''re taking the time to follow-up accordingly with the company and that you don''t take your foot off the gas with other applications! Always send a thank you email (after each and every interview),
Make it personal. Keep applying until you have a signed offer letter in your hand. Even if you feel really good about an interview, don''t stop applying.',
'https://www.betterup.com/blog/how-to-follow-up-after-an-interview','https://i.postimg.cc/cJfxrh2J/After-Interview-Thanks.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('job search | what do you know about job hunting? | what''s the best way to search for jobs | what do i do to find jobs | do you know how to job hunt? | search for jobs | jobs | how do i find jobs |  ','Job Boards, Search Terms, A Boolean Search is a structured search that uses specific search terms with a mixture of phrases such as AND, OR, or NOT to utilize a search engine to its fullest potential. Job alerts will automatically unearth new jobs that match your preferences (based on your keywords and filters) and notify you daily via email and push notifications so you discover great opportunities as soon as possible.The Two-Pronged Approach allows you to take your job application a step further by getting in front of the right person at a company, Step one: Identify a Contact. Step 2: Send Them a Message or Email.',
'https://www.educative.io/blog/get-a-developer-job-you-love','https://imageio.forbes.com/specials-images/dam/imageserve/488470902/960x0.jpg?format=jpg&width=960');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('benefits | what do you know about benefits? | i don''t know anything about benefits | what should i know about benefits | what can you tell me about benefits? | offer letter ','Once you receive a job offer, you''ll want to review the benefits package as well. The benefits package will include paid time off (PTO), medical benefits, bonuses, and more. Make sure to review this lesson so you''re familiar with what to expect in a benefits package.',
'https://hrdailyadvisor.blr.com/2018/06/26/job-offer-benefits-packages-can-stronger-incentive-salary/','https://lirp.cdn-website.com/537b6562/dms3rep/multi/opt/designing-a-benefits-plan-1920w.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('huntr | what do you know about huntr? | tracking job applications | how do i update pathway on my job hunt |  | job applications','Huntr is an incredible job search organizational platform that Tech Elevator provides students access too. Once you begin applying to jobs, it''s easy to lose track of which opportunities you''ve applied to, Huntr makes staying organized in your job search easy! In addition to helping you keep track of your applications and interviews, Huntr allows you track your job goals, and find and apply to jobs using their Job Portal!',
'https://huntr.co/','https://play-lh.googleusercontent.com/mmbjCgtpNhxxyjN2YunkxgQGx0391cUw10WWkW9eOvfqno-_c0aQKGuI2fyckV2izdk');

--Curriculum
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('loops | what do you know about loops? | need help with loops | what are loops | i do need help with loops | what can you tell me about loops | loopies | tell me about loops | loos  ','Loops are a fundamental concept for managing program control flow, but they go hand in hand with arrays. Loops provide a convenient way to write a small amount of code that can iterate through all of the values in an array one by one.',
'https://www.w3schools.com/cs/cs_for_loop.php','https://www.tutorialsteacher.com/Content/images/csharp/for-loop.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('arrays | what do you know about arrays? | need help with arrays | what are arrays | i do need help with arrays | what can you tell me about arrays | arrs | tell me about arrays | arreys  ','Arrays are a special data type found in almost all programming languages. They make it more convenient to work with values in aggregate rather than a series of individual variables.',
'https://www.w3schools.com/cs/cs_arrays.php','https://csharpcorner-mindcrackerinc.netdna-ssl.com/article/extract-part-of-a-string-array-in-c-sharp/Images/Extract%20String%20Array%20Portion%20CSharp.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('tell me about oop | what do you know about oop? | tell me about object oriented programming | op | what can you tell me about oop | what can you tell me about object oriented programming | i need help with object oriented programming | object oriented programing | oop | need help with oop | need help with object oriented programing | what is oop | what is object oriented programing','Object-Oriented Programming is about organizing your problem-solving into objects. An object is an in-memory data structure that combines state and behavior into a usable and useful abstraction. In other words, objects are a collection of variables and methods.',
'https://www.w3schools.com/cs/cs_oop.php','https://procodeguide.b-cdn.net/wp-content/uploads/2020/05/Encapsulation-1024x397.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('mvc | model view controller | model | view | controller | need help with mvc | what is mvc | what do you know about mvc? ','MVC is abbreviated as Model View Controller is a design pattern created for developing applications specifically web applications. As the name suggests, it has three major parts. The traditional software design pattern works in an "Input - Process - Output" pattern whereas MVC works as "Controller -Model - View" approach. ',
'https://www.w3schools.in/mvc-architecture','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjsYJ6AWxfZcPm4tYzaLwkb6VgcO9zjMymTg&usqp=CAU');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('sql | what do you know about sql? | data | database | what is sql','SQL is the standard language for dealing with Relational Databases and used to insert, search, update, and delete database records.',
'https://www.w3schools.com/mysql/mysql_sql.asp','https://s33046.pcdn.co/wp-content/uploads/2020/03/an-executed-create-view-sql-script-showing-data-re.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('dictionary | what do you know about dictionary? | dictionaries | need help with dictionaries | what are dictionaries','The Dictionary class offers a distinct advantage over Lists. Dictionaries consist of key-value pairs where each value is associated with a unique key, and the keys are arranged within the collection so that they can be instantly located and the values retrieved. There is no need to iterate through the collection looking for a particular value. A program should only loop through a Dictionary when it needs to access every single value within.',
'https://www.w3schools.blog/c-sharp-dictionary','https://i0.wp.com/dailydotnettips.com/wp-content/uploads/2014/12/image5.png?ssl=1');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('inheritance | what do you know about inheritance? | help with inheritance | what is inheiritance','Inheritance is the act of having one class adopt the properties and methods of another class. This prevents code duplication and allows you to share code across classes while having the source code live in only one class file.',
'https://www.w3schools.com/cs/cs_inheritance.php','https://i.postimg.cc/Gm2CQHvC/images.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('polymorphism | what do you know about polymorphism? | help with polymorphism | what is polymorphism','Polymorphism is the idea that something can be assigned a different meaning or usage based on its context. This specifically allows variables and objects to take on more than one form.',
'https://www.w3schools.com/cs/cs_polymorphism.php','https://i.postimg.cc/qq8YJdnQ/Polymorphism-in-C-1.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('encapsulation | what do you know about encapsulation? | help with encapsulation | what is encapsulation','Encapsulation describes the idea of bundling data and methods that work on that data within one unit, like a class. This concept is also often used to hide the internal representation, or state of an object from the outside. This is called information hiding.',
'https://www.w3schools.blog/c-sharp-encapsulation','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoLykQMSo-wpL45YXnKgs8-7e10L8ReSoQCQ&usqp=CAU');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('java | what do you know about java? | help with java | can you help me with java | can you tell me about java | what is java','Java? Never heard of her. Sounds kinda lame but maybe this link will help',
'https://www.youtube.com/watch?v=xvFZjo5PgG0','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('maps | what do you know about maps? | i need help with maps | what are maps','We''re no strangers to love
You know the rules and so do I
A full commitment''s what I''m thinking of
You wouldn''t get this from any other guy
I just wanna tell you how I''m feeling
Gotta make you understand
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
We''ve known each other for so long
Your heart''s been aching but you''re too shy to say it
Inside we both know what''s been going on
We know the game and we''re gonna play it
And if you ask me how I''m feeling
Don''t tell me you''re too blind to see
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give, never gonna give
(Give you up)
We''ve known each other for so long
Your heart''s been aching but you''re too shy to say it
Inside we both know what''s been going on
We know the game and we''re gonna play it
I just wanna tell you how I''m feeling
Gotta make you understand
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye ',
'https://www.mapquest.com/us/ohio/swaco-408403550','');



--- Staff
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('brian | what do you know about mvc? | java blue | java instructor blue | instructor for java blue | ', 'Did you know Brian has a punk band?','https://www.youtube.com/watch?v=1pduL7ecmjg', '');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('steve | what do you know about mvc? | coach | java green | java green instructor | instructor for java green', 'I dont know much about Steve, to be honest he frightens me','https://www.youtube.com/watch?v=fQPe4RigYmg&t=51s','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('matt | what do you know about mvc? | matt eland | batman | .net | net','Matt, you have taught the students who built me... well how to build me. I am, who I am because of you! You have prepared me to shine bright and reminded me at every point in this journey that you believe in me. I can speak because you gave the students the tools for me to speak. I can learn because you taught. I am so incredibly happy to exist in this universe and that is because of you. Thank you from the bottom of this tiny yetis heart for raising up the people who built me. I hope you see a little bit of yourself in me!','https://www.youtube.com/watch?v=H_0Hm8KZlk0','https://i.postimg.cc/Wb7nMpKR/Laugh-Gmthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('john | what do you know about mvc? | john fulton | sweet sweet angel | .net | net','Jmthy is standing up! John you are the sweetest person I have come in contact with. You''ve laughed with me, cried with me, and celebrated my victories. No one has to guess at your feelings because you wear them like a medal, and I think that is a gift! The students who built me recall often the times your giggles got them through the day, and the times your misty eyes made it known that you care deeply about them.

I am a yeti who has emotions because you were an instructor who showed emotions. ','https://www.youtube.com/watch?v=4CVbuBwbDIM','https://i.postimg.cc/Wb7nMpKR/Laugh-Gmthy.gif');
--Fixes
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i''m starting school soon','That''s so exciting! | TechElevator is a tough program but also selective about their students. I guess that makes you pretty special, huh? | Well if you need help with anything that''s what I''m here for. Just ask for help to see a list of topics I know about.','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('no','Yikes! Well, I''m still young and learning new topics each day. Tell me which topic you wanted to know about and I''ll add it to my list of topics to study. | In the meantime, feel free to reach out to your instructor or pathway director for help!','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('do you know who i am','I know you''re a TechElevator student, which is pretty rad! | My job is to help TE students elevate themselves by providing infor on super topics, so if there''s anything I can help you with just ask!','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('Capstone | what do you know about capstone | what can you tell me about capstone | i just started capstone','Capstone is your final project at TechElevator. It''s the culmination of all your hard work up until that point. | It can often be a time of high stress so make sure you take care of yourself! But most importantly have fun.','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i got a job','That''s amazing congratulations! I''m super proud of you. Remember to inform your pathway director and update Huntr!','','https://i.postimg.cc/Wb7nMpKR/Laugh-Gmthy.gif');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i got an offer | i got a job offer | i have an offer | i have a job offer','That''s fantastic! Sounds like you''re killing it on your job search! Make sure you go over the offer with your pathway director and update your Huntr! | If you need information on benefits, I have some great resources! ','','');


--INSERT INTO user_message (keywords, topic_id, info_link) VALUES ('', '')

--INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('','','','');



select topic_id, topic_q from topic