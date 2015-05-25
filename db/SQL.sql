drop schema if exists biggym;

create schema biggym;

use biggym;

ALTER DATABASE biggym DEFAULT CHARACTER SET utf8;

create table instructor (
	instructor_id int not null auto_increment,
    full_name varchar(100) not null,
    bio text not null,
    qualifications text not null,
    awards text,
    ins_of_month varchar(4) not null, #"yes" or "no"
    primary key (instructor_id)
);

create table room (
	room_id int not null auto_increment,
    room_name varchar(100) not null,
    coord_x float,
    coord_y float,
    primary key (room_id)
);

create table course_category (
	category_id int not null auto_increment,
    category_name varchar(100) not null,
    about text,
    origins text,
    good_for text,
    practices text,
    primary key (category_id)
);

create table course (
	course_id int not null auto_increment,
    course_name varchar(100) not null,
    description text not null,
    schedule text not null,
    speacial_features text,
    belongs_to int not null,
    held_here int not null,
    level varchar(45) not null,
    primary key (course_id),
    foreign key (belongs_to) references course_category (category_id),
    foreign key (held_here) references room (room_id)
);

create table offer (
	course_id int not null,
	catagory_id int not null,
	foreign key (catagory_id) references course_category (category_id),
    foreign key (course_id) references course (course_id)
);

create table teaches_1 (
	course_id int not null,
	instructor_id int not null,
	foreign key (instructor_id) references instructor (instructor_id),
    foreign key (course_id) references course (course_id)
);

create table teaches_2 (
	catagory_id int not null,
	instructor_id int not null,
	foreign key (instructor_id) references instructor (instructor_id),
    foreign key (catagory_id) references course_category (category_id)
);

create table img (
	img_id varchar(32) not null,
    url text not null
);

create table video (
	video_id varchar(32) not null,
    url text not null
);


create view staff_1 as
	select c.course_idroom as course_id, c.course_name as course_name, i.*
    from course c
    inner join teaches_1 t
		on c.course_id = t.course_id
	inner join instructor i
		on t.instructor_id = i.instructor_id;

create view staff_2 as
	select c.category_id as category_id, c.category_name as category_name, i.*
    from course_category c
    inner join teaches_2 t
		on c.category_id = t.catagory_id
	inner join instructor i
		on t.instructor_id = i.instructor_id;


DELIMITER $$
create trigger populate
	after insert on teaches_1
    for each row
    begin
		DECLARE temp INT;
        set temp := (select belongs_to from course where course_id=new.course_id);
		insert into teaches_2
			values(temp,new.instructor_id);
    end