# yvs_jobs_search_assistant
an old piece that is helpful during job search. I'm hoping to do some more work on it in the coming millenia :-)

Some notes:

Don't forget to set up your own .gitignore

Installing database:
All database files are in DB_Design folder
Start by importing tables.sql which will create a database and tables
Import procedures.sql and view.sql in any order you like

-----------------------------------------------------------------------

DB Q&A

Why use views and procedures?
Because I can?... ;-)

Overall the understanding of working with Database Manegement Systems like MySQL is good for those who are looking 
to produce secure high performance data driven web applications.

Modern frameworks and systems like Doctrine are good for low level prototyping but end up requiring developers to 
add extra systems for cashing and searching through data, overtime creating a support nightmare.

As I work on this projectI will try to introduce more of the basic data design practices that couild be used to 
improve overall data performance in your systems.


Aren't DBs hard to upgarde?

In most cases, when I had to upgade the copies of the DB on different machine, I just created an upgrade sql file 
and executed it in MySQL workbench or its equivalent on every machine.

MySQL also allows one to define the folders in which files for the DB design and data are stored, so I guess there 
is an opportunity to simply add those files to the git repository, but I am not that good and advise you to contact 
MySQL admin experts for now. Over time I'm hoping to be able to do more tests on the subject.


Doesn't your approach to the DB contradict the OOP approach for PHP programmers?

Anybody who claims to be a PHP Programmer is either a genious or an idiot... I don't think there are That many geniouses 
in web development

Anybody who claims that "objects" in PHP are defind by the word "class" - definitely do not qualify to be a genious...

Personally, I am a Web Systems Developer specialising in Back End and I try to use the tools at my disposal to their full 
potential, while keeping the number of tools to a required minimum

-----------------------------------------------------------------------

PHP Q&A

Where are the classes?

All the classes that I use, I randomly ended up keeping in the folder "functions" as an omage to the time when I just 
started learnign PHP and learnt encapsulation and separation of code in functions and then in classes


You don't have many classes...

Perks of a well designed architecture? ;-)


Why the features like autoload and the types of controllers, we are used to from frameworks, are missing?

Because, like any good system that actually works and is used, Job Search Assistant had never left its "quick" prototype 
stage. All the changes that were done to it over the years were more along the lines of adding small functionalities 
here and there

-----------------------------------------------------------------------

Genral Q&A

Aren't you woried that potential employers might not like your opinion?

I am hoping that my potential employers are going to be looking for a person to produce secure and fast applications 
and not the guy who can shower them with buzz words.


What if we disagree with you?

My opinions have been reached independently, but they correspond with the opinions of the PHP creator. 

As someone who is still involved in PHP development, Rasmus Lerdorf had to concede to the stupidity of the crowd, 
feel free to find his opinions on frameworks and the history of creating PHP on YouTube

But you don't need to agree with me to use the JSA, so - enjoy :-)


Will you answer if we ask more questions?

Surprise me! :-D

But I will do my best to answer genuine questions first
