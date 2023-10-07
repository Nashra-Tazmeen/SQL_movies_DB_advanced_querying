**Data Retrieval** [Single Table]:

 1.Retrieve data using text query (SELECT, WHERE, DISTINCT, LIKE)
		
		 select *
		from movies;

		select title, industry
		from movies;

		select title 
		from movies
		where industry="Bollywood";

		select title 
		from movies where title like "%Thor%";
		select*
		from movies where studio=""; 

 exercise 
 - Print all movie titles and release year for all Marvel Studios movies.
 
			select title,release_year,studio
			from movies
			where studio=Marvel Studios";
 - Print all movies that have Avenger in their name.

				select*
				from movies where title like "%Avenger%";
 - Print the year when the movie "The Godfather" was released.

				select title,release_year 
				from movies where title like "%The god father%";
 - print all distinct movie studios in the Bollywood industry

		select DISTINCT studio
		from movies where industry="Bollywood";

 

2 .  Retrieve Data Using Numeric Query (BETWEEN, IN, ORDER BY, LIMIT, OFFSET)


	select *
	from movies where imdb_rating>6 AND imdb_rating<9;

		select *
		from movies where imdb_rating>6 ANDimdb_rating<9;


		select*
		from movies where release_year IN (2022,2013);
		
		select *
		from movies where industry="Bollywood"
		order by imdb_rating DESC LIMIT 5 OFFSET 1 ;
Exercise:
		
1 . Print all movies in the order of their release year (latest first)

		select *
		from movies 
		order by release_year DESC;

2 .  Select all movies that are by Marvel Studios and Hombale Films

	select *
	from movies where studio IN("Marvel Studios","Hombale Films");
select*
from movies where studio="Marvel studio";
3 . Select all THOR movies by their release year

	select*
	from movies 
	where title like "%THOR%"
	order by release_year;
	
4 . Select all movies that are not from Marvel Studios

	select*
	from movies where the studio NOT IN ("Marvel Studios");
	
5 .  How many movies were released between 2015 and 2022
	
	select count(*)
	from movies
	where release_year IN (2015,2022);

3 . Inbuit functions  (MIN, MAX, AVG, GROUP BY)

	select count(*)
	from movies where industry="Bollywood";

	select  MIN(imdb_rating)
	from movies
	where industry="Bollywood";

	select MIN(imdb_rating) as min_rating,
	MAX(imdb_rating) as max_rating,
	ROUND(AVG(imdb_rating),2) as avg_rating
	from movies
	where studio="Marvel Studios";

	

 - Having clause
 

		select release_year,count(*) as movies_count
			from movies
			group by release_year
			having movies_count>2
			order by movies_count;
		-- order of execution from >where > groupby > having >orderby
		-- what ever the column we r using in having should be listed but not same with where clause


Exercise:

1 . Print the max and min movie release year

					select min(release_year),max(release_year)
					from movies ;
2 . Print a year and how many movies were released in that year starting with the latest year

		SELECT release_year, COUNT(*) as movie_count
		FROM movies
		GROUP BY release_year
		ORDER BY release_year DESC;
4 .Calculated columns(IF,CASE,YEAR,CURYEAR):
	
	
	select*,YEAR(curdate())-birth_year as age 
	from actors;

	select*,(revenue-budget) as profit
	from financials;
	
	select*,
	 CASE
		when unit="billions" then revenue*1000
	    when unit="thousand" then revenue/1000
	    ELSE revenue
	 END as revenue_mln
	from financials;

**II.Data Retrieval**[Multiple tables]:

	 
	--Inner Join
	 select m.movie_id,title,revenue,budget,currency,unit
	 from movies m
	 inner join financials f
	 on m.movie_id=f.movie_id;
	 
	 -- Left Join
	 select m.movie_id,title,revenue,budget,currency,unit
	 from movies m
	 left join financials f
	 on m.movie_id=f.movie_id;
	 
	 -- Right Join
	
	 select m.movie_id,title,revenue,budget,currency,unit
	 from movies m
	 right join financials f
	 on m.movie_id=f.movie_id;
	 
	 -- Full Join
	 select m.movie_id,title,revenue,budget,currency,unit
	 from movies m
	 left join financials f
	 on m.movie_id=f.movie_id
	 UNION
	 select m.movie_id,title,revenue,budget,currency,unit
	 from movies m
	 right join financials f
	 on m.movie_id=f.movie_id
 


	 --
 1 . Show all the movies with their language names
 
	 select m.language_id,title,name
	 from movies m
	 inner join languages l
	 on m.language_id=l.language_id
	 order by language_id asc;
	 
2 . Show all Telugu movie names (assuming you don't know the language

	 select m.language_id,title,name
	 from movies m
	 inner join languages l
	 on m.language_id=l.language_id
	 where name="Telugu"
	 order by language_id asc;
 
 3 .Show the language and number of movies released in that language
 
	 select l.name,l.language_id ,count(*) as movie_count
	 from movies m
	 inner join languages l
	 on m.language_id=l.language_id
	 group by l.language_id
	 order by l.language_id asc;


III. **Complex queries**[Subqueries, Co-related query,CTE]
**Subqueries:**

1. where subquery returns value

		 select*
		 from movies where imdb_rating=(select MAX(imdb_rating) from movies);
		 
		  select *
		  from movies where imdb_rating=(select MIN(imdb_rating) from movies);
		  
  
 2. where subquery returns list
 
		  select*
		  from movies where imdb_rating IN
		  ((select  MAX(imdb_rating) from movies), (select MIN(imdb_rating) from movies));
		  
 
 3. where subquery returns table(get all the actors whose age is between 70 and 85)
 

		select actor_name,age
		from 
			(select  name as actor_name ,
				year(curdate()) -birth_year as age
		        from actors)
	        
		   as actors_age
		   where age>70 AND age<85;


-- above thing can also be solved using co-related subquery

	select actor_id,name,
		(select count(*) from movie_actor
	     where actor_id=actors.actor_id) as movie_count
	from actors
	order by movie_count desc;


-- using CTE

		with actors_age as(
			select name as actor_name ,
					year(curdate())-birth_year as age
		            from actors
		         )   
		select actor_name,age
		from actors_age
		where age>70 AND age<85;    


Exercise:
 1. Select all the movies with minimum and maximum release_year. Note that there be more than one movie in min and a max year hence output rows can be more than 
 
		select* 
		from movies
		where release_year IN((select MIN(release_year) from movies),(select MAX(release_year) from movies));

 2. Select all the rows from the movies table whose imdb_rating is higher than the average rating

				select*
				from movies 
				where imdb_rating BETWEEN (select AVG(imdb_rating)from movies)AND(select MAX(imdb_rating)from movies);

