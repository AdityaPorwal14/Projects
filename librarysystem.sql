create database library;
use library;

create table students(
Student_id int,
Name varchar(100) not null,
Email varchar(100) not null,
course varchar(50),
year date,
phone int(10)); 

alter table students add primary key(student_id);
alter table students change course branch varchar(50);
alter table students modify year int;
alter table students modify phone char(10);

create table Books(
Book_id int primary key,
title varchar(100) not null,
authorid int not null,
PublisherName varchar(100) not null,
copies_available int not null,
Book_category_id int not null);

alter table books add constraint fk_authorid
foreign key (authorid) references author(author_id);

alter table books add constraint fk_categoryid
foreign key (book_category_id) references category(category_id);

create table author(
author_id int primary key,
author_name varchar(100) not null);

create table category(
category_id int not null,
Category_name varchar(100) not null);

select * from category;

alter table category add primary key(category_id);

create table issued_books(
issue_id int primary key,
issued_student_id int,
book_id int not null,
issue_date date not null,
book_date date not null);

alter table issued_books add constraint fkissue_student_id
foreign key(issued_student_id) references students(student_id);

alter table issued_books add constraint fkbookid
foreign key(book_id) references books(book_id);

ALTER TABLE issued_books DROP COLUMN book_date;

create table returns(
return_id int primary key,
return_issue_id int,
return_date date,
fine_amount decimal(6,2));

alter table returns add constraint fkissue_id
foreign key(return_issue_id) references issued_books(issue_id); 

create table admin(
admin_id int primary key,
Name varchar(100) not null,
email varchar(100) not null,
password varchar(100) not null);

create table reservation(
reservation_id int primary key,
student_id int,
reservation_date date,
book_id int not null,
status varchar(50) default 'pending',
foreign key (student_id) references students(student_id),
foreign key (book_id) references books(book_id));

show tables;

desc admin;
desc author;
desc books;
desc students;

insert into students(student_id,name,email,branch,year,phone)
values
(101,'Aditya Porwal','aadityporwal96@gmail.com','Computer Science',2024,6377828779);

select * from students;

insert into students(student_id,name,email,branch,year,phone)
values
(105,'Kuldeep Singh Rathore','KuldeepSinghRathore@gmail.com','Computer Science',2024,8949926724);

INSERT INTO Author (author_id, author_name)
VALUES
(101, 'Elaine N. Marieb'),
(102, 'Meenakshi Raman'),
(103, 'Ved Vyasa'),
(104, 'Valmiki'),
(105, 'Robert Feldman'),
(106, 'James Clear'),
(107, 'Ankur Warikoo'),
(108, 'Carol S. Dweck'),
(109, 'Cal Newport'),
(110, 'Simon Sinek'),
(111, 'Eckhart Tolle'),
(112, 'Mark Manson'),
(113, 'Robert T. Kiyosaki'),
(114, 'Napoleon Hill'),
(115, 'Morgan Housel'),
(116, 'Francesc Miralles'),
(117, 'David Goggins'),
(118, 'Jordan B. Peterson'),
(119, 'Tim Ferriss'),
(120, 'Ryan Holiday'),
(121, 'Paulo Coelho'),
(122, 'Shiv Khera'),
(123, 'Dr. A.P.J. Abdul Kalam'),
(124, 'Gaur Gopal Das'),
(125, 'Jay Shetty'),
(126, 'Peter Thiel'),
(127, 'Eric Ries'),
(128, 'Austin Kleon'),
(129, 'Jason Fried'),
(130, 'Malcolm Gladwell'),
(131, 'Angela Duckworth'),
(132, 'Daniel H. Pink'),
(133, 'Mihaly Csikszentmihalyi'),
(134, 'Susan Cain'),
(135, 'Kerry Patterson'),
(136, 'Robin Sharma'),
(137, 'Dale Carnegie'),
(138, 'Daniel Goleman'),
(139, 'Viktor E. Frankl'),
(140, 'Sun Tzu'),
(141, 'Robert Greene'),
(142, 'Kevin Horsley'),
(143, 'David J. Schwartz'),
(144, 'Og Mandino');

INSERT INTO Category (category_id, Category_name)
VALUES
(1, 'Academic'),
(2, 'Mythology'),
(3, 'Self-Help'),
(4, 'Personal Finance'),
(5, 'Motivation/Productivity');

INSERT INTO Books (Book_id, title, authorid, PublisherName, copies_available, Book_category_id)
VALUES
(1, 'Human Physiology', 101, 'Pearson', 10, 1),
(2, 'Communication Skills', 102, 'McGraw Hill', 15, 1),
(3, 'Bhagavad Gita', 103, 'Gita Press', 12, 2),
(4, 'Ramayan', 104, 'Valmiki Publishers', 8, 2),
(5, 'Psychology Basics', 105, 'Oxford', 10, 1),
(6, 'Atomic Habits', 106, 'Penguin', 20, 3),
(7, 'Do Epic Shit', 107, 'Juggernaut', 25, 3),
(8, 'Make Epic Money', 107, 'Juggernaut', 18, 4),
(9, 'Get Epic Shit Done', 107, 'Juggernaut', 22, 3),
(10, 'Mindset', 108, 'Ballantine', 10, 3),
(11, 'Deep Work', 109, 'Grand Central', 12, 3),
(12, 'Start With Why', 110, 'Portfolio', 13, 3),
(13, 'The Power of Now', 111, 'New World', 7, 3),
(14, 'The Subtle Art of Not Giving a F*ck', 112, 'Harper', 14, 3),
(15, 'Rich Dad Poor Dad', 113, 'Plata', 30, 4),
(16, 'Think and Grow Rich', 114, 'The Ralston Society', 10, 4),
(17, 'The Psychology of Money', 115, 'Harriman House', 20, 4),
(18, 'Ikigai', 116, 'Penguin', 18, 3),
(19, 'Can’t Hurt Me', 117, 'Lioncrest', 12, 3),
(20, '12 Rules for Life', 118, 'Random House', 9, 3),
(21, 'Tools of Titans', 119, 'Houghton Mifflin', 10, 3),
(22, 'Ego is the Enemy', 120, 'Portfolio', 11, 3),
(23, 'Digital Minimalism', 109, 'Portfolio', 9, 3),
(24, 'The Alchemist', 121, 'HarperOne', 17, 3),
(25, 'You Can Win', 122, 'Macmillan', 16, 3),
(26, 'Wings of Fire', 123, 'Universities Press', 15, 3),
(27, 'India 2020', 123, 'Penguin', 13, 3),
(28, 'Life’s Amazing Secrets', 124, 'Penguin', 20, 3),
(29, 'Think Like a Monk', 125, 'Simon & Schuster', 22, 3),
(30, 'Zero to One', 126, 'Crown', 10, 4),
(31, 'The Lean Startup', 127, 'Crown Business', 9, 4),
(32, 'Steal Like an Artist', 128, 'Workman', 14, 3),
(33, 'Show Your Work', 128, 'Workman', 13, 3),
(34, 'Rework', 129, 'Crown', 11, 3),
(35, 'Outliers', 130, 'Little, Brown', 17, 3),
(36, 'Grit', 131, 'Scribner', 15, 3),
(37, 'Drive', 132, 'Riverhead', 12, 3),
(38, 'Flow', 133, 'Harper', 10, 3),
(39, 'Quiet', 134, 'Broadway', 10, 3),
(40, 'Crucial Conversations', 135, 'McGraw Hill', 14, 3),
(41, 'The 5 AM Club', 136, 'HarperCollins', 20, 3),
(42, 'The Monk Who Sold His Ferrari', 136, 'HarperCollins', 19, 3),
(43, 'How to Win Friends & Influence People', 137, 'Simon & Schuster', 16, 3),
(44, 'Emotional Intelligence', 138, 'Bantam', 12, 3),
(45, 'Man’s Search for Meaning', 139, 'Beacon Press', 11, 3),
(46, 'The Art of War', 140, 'Penguin Classics', 13, 2),
(47, 'The Laws of Human Nature', 141, 'Viking', 10, 3),
(48, 'Unlimited Memory', 142, 'TCK Publishing', 9, 3),
(49, 'The Magic of Thinking Big', 143, 'Fireside', 15, 3),
(50, 'The Greatest Salesman in the World', 144, 'Bantam', 10, 3);

INSERT INTO Admin (admin_id, Name, email, password)
VALUES
(1, 'Ravi Sharma', 'ravi.admin@library.com', 'Ravi@123'),
(2, 'Priya Mehta', 'priya.admin@library.com', 'Priya@123'),
(3, 'Aman Kapoor', 'aman.admin@library.com', 'Aman@123'),
(4, 'Sneha Roy', 'sneha.admin@library.com', 'Sneha@123'),
(5, 'Arjun Verma', 'arjun.admin@library.com', 'Arjun@123');

select * from admin;
select * from category;
select * from books;

INSERT INTO students(student_id, name, email, branch, year, phone)
VALUES
(106, 'Akshat Pandey', 'akshat.pandey@gmail.com', 'Mechanical', 2024, 6367226219),
(107, 'Ankit Kumar', 'ankit.kumar@gmail.com', 'Electrical', 2024, 8409626321),
(108, 'Harish Sharma', 'harish.sharma@gmail.com', 'Civil', 2024, 6378780329),
(109, 'Jitendra Singh', 'jitendra.singh@gmail.com', 'Electronics', 2024, 6367906506),
(110, 'Kavya', 'kavya123@gmail.com', 'Computer Science', 2024, 9729607165);

UPDATE students
SET branch = 'Computer Science'
WHERE student_id IN (106, 107, 108, 109, 110);

select * from students;
select * from returns;
select * from issued_books;

insert into issued_books values (01,101,3,'2025-04-20');
insert into issued_books values (02,104,11,'2025-04-20');
insert into issued_books values (03,102,34,'2025-04-20');

insert into returns values (01,01,'2025-05-01',0.0);

insert into returns(return_id,return_issue_id,return_date) values (02,1,'2025-07-10');

select * from issued_books;
select * from returns;

DELETE FROM returns
WHERE return_id = 2;

delimiter //
create trigger fine_amount_before_insert
before insert on returns for each row 

begin
declare issuedate date;
declare dayslate int;
declare fine decimal(6,2);

select issue_date into issuedate
from issued_books
where issue_id = new.return_issue_id;

set dayslate = datediff(new.return_date, issuedate)-20;

if dayslate > 0 then
set fine = dayslate*5;
else
set fine = 0;
end if;

set new.fine_amount = fine;
end //

delimiter ;

show tables;

select * from issued_books;

DROP TRIGGER IF EXISTS fine_amount_before_insert;

delimiter //
create trigger decrease_copy_after_issue
after insert on issued_books for each row

BEGIN
update books set copies_available = copies_available-1
where book_id = new.book_id;

end; // 
delimiter ;

select * from books;

drop trigger increase_copy_after_returns;

delimiter //
create trigger increase_copy_after_returns
after insert on returns for each row

begin
declare return_book_id int;
select book_id into return_book_id
from issued_books
where issue_id = new.return_issue_id;

update books set copies_available = copies_available+1
where book_id = return_book_id;

end; //

delimiter ;


delimiter //
create trigger fulfil_reservation_after_return
after insert on returns for each row 

begin
declare return_book_id int;
declare reservation_id_to_fulfil int;

select book_id into return_book_id
from issued_books where issue_id = new.return_issue_id;

select reservation_id into reservation_id_to_fulfil
from reservation
where book_id = return_book_id and status ='pending'
order by reservation_date asc limit 1;

if reservation_id_to_fulfil is not null then

update reservation set status = 'fulfilled'
where reservation_id = reservation_id_to_fulfil;

end if;

end; // 

delimiter ;


insert into issued_books values (03,102,34,'2025-04-20');

insert into returns(return_id,return_issue_id,return_date) values (03,03,'2025-07-10');

select * from returns;

create view available_books as 
select book_id, title, authorid from books where
copies_available>0;

CREATE VIEW unavailable_books AS
SELECT book_id, title, authorid, PublisherName, copies_available, Book_category_id FROM books WHERE 
copies_available = 0;


select * from available_books;
select * from unavailable_books;
select * from books where title like '%atomic habit%';


CREATE VIEW borrowing_students AS SELECT 
s.student_id, s.name AS student_name, s.email, s.branch, s.year, s.phone, ib.issue_id, ib.book_id, ib.issue_date
FROM students s, issued_books ib
WHERE s.student_id = ib.issued_student_id;

SELECT * FROM borrowing_students;

select * from issued_books;
desc issued_books;

select title and book_category_id from books;
select * from category;

insert into issued_books values(08,108,13,'2025-04-25');

insert into reservation values(302,106,'2025-04-26',13,'pending');

insert into returns(return_id,return_issue_id,return_date) values (208,08,'2025-05-20');

select * from returns;

select * from books;