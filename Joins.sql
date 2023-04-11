CREATE TABLE Students(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(120) default 'xxxxxx',
	Age int check(Age >= 18),
	Point int check(Point between 0 and 100)
)

CREATE TABLE Groups(
	Id int primary key identity,
	Name nvarchar(50)
)

CREATE TABLE Points(
	Id int primary key identity,
	Mark char(1),
	Min int,
	Max int
)

CREATE TABLE Duties(
	Id int primary key identity,
	Positon nvarchar(250),
	Dependon int foreign key references Duties(Id)
)

CREATE TABLE Products(
	Id int primary key identity,
	Name nvarchar(100),
	Price decimal(18,2)
)

CREATE TABLE Sizes(
	Id int primary key identity,
	Name nvarchar(50)
)

ALTER TABLE Students
ADD GroupId int foreign key references Groups(Id)

INSERT INTO Students
VALUES ('Shahin', 'Sherifzade', 18, 85),
		('Huseyin', 'Ehedzade', 21, 65),
		('Ayxan', 'Mustafayev', 21, 75),
		('Mehemmed', 'Ismayilov', 35, 75)

-- inner join
select stu.Id, stu.Name, stu.Surname, stu.Point, gr.Name 
from Students stu
join Groups gr
ON stu.GroupId = gr.Id

-- left join
select stu.Id, stu.Name, stu.Surname, stu.Point, gr.Name 
from Students stu
left join Groups gr
ON stu.GroupId = gr.Id

--select stu.Id, stu.Name, stu.Surname, stu.Point, gr.Name 
--from Groups gr
--left join Students stu
--ON stu.GroupId = gr.Id

--right join
select stu.Id, stu.Name, stu.Surname, stu.Point, gr.Name 
from Students stu
right join Groups gr
ON stu.GroupId = gr.Id

--full outer join
select stu.Id, stu.Name, stu.Surname, stu.Point, gr.Name 
from Students stu
full join Groups gr
ON stu.GroupId = gr.Id

select stu.Id, stu.Name, stu.Point, p.Mark from Students stu
join Points p
ON stu.Point >= p.Min AND stu.Point <= p.Max

select dtu1.Positon, dtu2.Positon 'Dependon' from Duties dtu1
left join Duties dtu2
ON dtu1.Dependon = dtu2.Id

select p.Name 'Product name', s.Name 'Size' from Products p
cross join Sizes s

--select * from Groups