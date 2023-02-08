#Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role

select * from actors;###act_id,act_fname,act_lname;
select * from movie_cast;  #####act_id,mov_id,role
select * from movie;######mov_id,mov_title


select actors.act_fname,actors.act_lname,movie_cast.role,movie.mov_title
from actors 
inner join movie_cast on actors.act_id=movie_cast.act_id
inner join movie on movie.mov_id=movie_cast.mov_id
where movie.mov_title='annie hall';




# 2 From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'
#Return director first name, last name and movie title

select * from director;  #dir_id,dir_fname,dir_lname
select * from movie_direction; #dir_id,mov_id
select * from movie;  #mov_id,mov_title



select director.dir_fname,director.dir_lname,movie.mov_title 
from director 
inner join movie_direction on movie_direction.dir_id=director.dir_id
inner join movie on movie.mov_id=movie_direction.mov_id
where movie.mov_title= 'Eyes Wide Shut';



## 2nd 
select director.dir_fname,director.dir_lname,movie.mov_title,movie_cast.role
from director
inner join movie_direction on director.dir_id=movie_direction.dir_id
inner join movie_cast on movie_direction.mov_id=movie_cast.mov_id
inner join movie on movie_cast.mov_id=movie.mov_id
where movie.mov_title='eyes wide shut'


##3  Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’.
 Return director first name, last name and movie title.



select * from director; # dir_id,dir_fname,dir_lname
select * from movie_direction; # dir_id,mov_id
select * from movie; # mov_id,mov_title
select * from movie_cast; # act_id,mov_id,role


select director.dir_fname,director.dir_lname,movie.mov_title,movie_cast.role
from director 
inner join movie_direction on  director.dir_id=movie_direction.dir_id
inner join movie on movie_direction.mov_id=movie.mov_id
inner join movie_cast on movie.mov_id=movie_cast.mov_id
where movie_cast.role= 'Sean Maguire';


##4 Write a SQL query to find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included 
#Return actor first name, last name, movie title and release year. 
 
 
 select * from movie; #mov_id,mov_title,year(mov_dt_rel)
 select * from movie_cast; #act_id,mov_id,role
 select * from actors; # act_id,act_fname,act_lname
 
 
 ### this is from released year
 select actors.act_fName, actors.act_lName, movie.mov_title, year(movie.mov_dt_rel) from movie
 INNER JOIN movie_cast on movie_cast.mov_id = movie.mov_id
 INNER JOIN actors on actors.act_id = movie_cast.act_id
 where year(movie.mov_dt_rel) not between '1990' and '2000';
 
 ######### for acted year
 select actors.act_fName, actors.act_lName, movie.mov_title,movie.mov_year
 from movie
 INNER JOIN movie_cast on movie_cast.mov_id = movie.mov_id
 INNER JOIN actors on actors.act_id = movie_cast.act_id
   where movie.mov_year not between '1990' and '2000'
 
 ## 5  Write a SQL query to find the directors with the number of genres of movies. Group the result set on director first name
 last name and generic title. Sort the result-set in ascending order by director first name and last name. 
 Return director first name, last name and number of genres of movies
 
 
select * from director;## dir_id,dir_lname,dir_fname
select * from movie_direction;## mov_id,dir_id
 select * from movie_genres; ## mov_id, gen_id
 select * from genres; ## gen_id,gen_title


 select director.dir_fname,director.dir_lname,genres.gen_title, count(*)
 from director 
 inner join movie_direction on director.dir_id=movie_direction.dir_id
 inner join movie_genres on movie_direction.mov_id=movie_genres.mov_id
 inner join genres on movie_genres.gen_id=genres.gen_id
 Group by director.dir_fname,director.dir_lname,genres.gen_title
 order by director.dir_fname,director.dir_lname asc;
 
 
 
 ##### 
 
 
select director.dir_fname,director.dir_lname,genres.gen_title as move_genres, count(*)
 from director 
 inner join movie_direction on director.dir_id=movie_direction.dir_id
 inner join movie_genres on movie_direction.mov_id=movie_genres.mov_id
 inner join genres on movie_genres.gen_id=genres.gen_id
 Group by director.dir_fname,director.dir_lname,genres.gen_title
 order by director.dir_fname,director.dir_lname asc
