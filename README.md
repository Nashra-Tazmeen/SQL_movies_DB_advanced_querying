# SQL_movies_DB_advanced_querying
In this project, I've used intermediate to advanced level SQL queries to explore the movies database .
I've also used various SQL techniques such as Joins, Sub-queries, CTEs, Text functions and so on to analyze the data.



**"Wrap-up and Reflections: Concluding Points"**

1.**Data Retrieval[Single tabe]**

 - SELECT,FROM and WHERE are the basic SQL functions
 - (*) means all columns,using * after the select query will select all the columns of a database
 - With the help of the USE function, you can indicate the query to use a particular data base, especially when there are multipe databases.
 - The COUNT function will provide the numerical count of rows
 - The DISTINCT function will help you see the unique values present in a given column
 - '%' is a wild card search
 - use LIKE function and '%' to filter the rows based on a text value
 - <,> are the basic numerical operators used in SQL 
 - you can also use  AND,OR BETWEEN,IN to perform numerical queries
 - you can sort the table by using 'ORDER BY' clause
 - By default ,it sorts the data in ascending order but you can specify the sort order
 - LIMIT clause can be used to fetch the top 'N' or bottom 'N' amount of records 'N' can be any nnumerical value
 - OFFSET clause will help you to skip a certain number of rows in your final result
 - Knowing summary analytics in SQL will enable you to perform  AD HOC analysis which is an important business use case
 - MAX,MIN and AVG are the common header name by using 'as' clause
 - GROUP BY clause will help you to create a summary of metrics such as average ,count etc. for selected coulmns(s)
 - the order of query execution in SQL is FROM ->WHERE->GROUP BY->HAVING->ORDER BY
 - GROUP BY and HAVING clause are often used together
 - The column you use in HAVING shoud be present in SELECT clause whereas WHERE can use columns that is not present in select clause as well.
 -   you can derive columns from the existing columns in a table
 - As a data analyst,Revenue and profit are the most common metrics that you will calculate in any industry
 - Currency conversions and unit conversions are important business use cases of SQL 
 - IF function is often used in SQL queries
 - when you have more than two conditions ,you need to use CASE and END function instead of IF function

2.Data Retrieval[Multiple tables:Inner Join,Left Join,Right Join,Full Join]:
 - companies use multiple tables to store data
	 
		 - To save space by avoiding repetition
		 - organize data better
		 - Make updates easily
	
 - In SQL you will be able to map multiple tables using JOIN clause
 - JOIN and ON clauses used together will enable you to merge twotables 
 - JOIN,ON and AND clause will enable you to merge two tables based on multiple coulmns
 - You can assign an abbreviated letter next  to table name to shorten the query  length
 - There are multiple kinds of JOIN in SQL:INNER,LEFT,RIGHT,FULL and CROSS JOIN
 - By default ,SQL performs an inner join 
 - UNION clause will enable you to perform FULL JOIN
 - Concatenation means combining two text strings together 
 - CONCAT clause in SQL will help you understanding of SQL 
 - CROSS JOIN is useful when you do not have any common column between the tables.

3 .Complex queries[Subqueries,co-related query ,CTE]

 - Subqueries are queries which generate output that will be used as input to the main query
 - Queries that provide a single record,list or even  a table as output can be used as a subquey
 -IN,ANY and ALL clause expect a list as input
 - ANY clause execute the condition for anyone of the values on the list that meets the condition which is the minimum value by default
 - ALL clause executes  the condition where all the values on the list meet the condition which is the maximum value of the list. 
 - A subquery is called a co-related query when its execution depends upon the statement written after the bracket
 - one needs to choose between writing a subquery or corelated query depends on its performance
 - Common Table Expression(CTE)creates a temporary table within a query
 - WITH and AS clause are used in combination to create CTE
 - one can create multiple CTEs inside a query
 - There are multiple benefits of writing CTEs such as query readability,reusability and creating views
 - Recursive subqueries in CTEs have several applications involving data series generation.

   

