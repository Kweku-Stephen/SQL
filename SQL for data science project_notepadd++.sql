/*Data Scientist Role Play:Profiling and Analyzing the Yelp Dataset*/

--Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

--Part 1: Yelp Dataset Profiling and Understanding

/*Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table =  10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000*/
	


/*2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = (business_id = 8090, user_id = 9581, id = 10000)
vi. Checkin = 493
vii. Photo = (business_id = 6493, id = 10000)
viii. Tip = (business_id = 3979, user_id = 537)
ix. User = 10000
x. Friend = (user_id = 11, friend_id = 9415)
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.*/	



/*3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:*/ 

select *
from 
		user
where id is null or
        name is null or
        review_count is null or
        yelping_since is null or
        useful is null or
        funny is null or
        cool is null or
        fans is null or
        average_stars is null or
        compliment_hot is null or
        compliment_more is null or
        compliment_profile is null or
        compliment_cute is null or
        compliment_list is null or
        compliment_note is null or
        compliment_plain is null or
        compliment_plain is null or
        compliment_cool is null or
        compliment_funny is null or
        compliment_writer is null or
        compliment_photos;
	

	
/*4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:1		max:5		avg:3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:1.0		max:5.0		avg:3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg:1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000		avg:24.2995*/
		


--5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer: 
select city,
		sum(city) as `number of reviews`
from 	
		business
where id in (select business_id
            from review)
group by 
		city
order by `number of reviews` desc;
	

/*	Copy and Paste the Result Below:
	+-----------------+-------------------+
| city            | number of reviews |
+-----------------+-------------------+
| Las Vegas       |               132 |
| Phoenix         |                55 |
| Toronto         |                42 |
| Scottsdale      |                29 |
| Tempe           |                25 |
| Henderson       |                23 |
| Pittsburgh      |                22 |
| Charlotte       |                18 |
| Montréal        |                17 |
| Chandler        |                16 |
| Cleveland       |                11 |
| Madison         |                11 |
| Mesa            |                11 |
| Gilbert         |                 8 |
| Edinburgh       |                 5 |
| Glendale        |                 5 |
| Champaign       |                 4 |
| Lakewood        |                 4 |
| Markham         |                 4 |
| North Las Vegas |                 4 |
| Cave Creek      |                 3 |
| North York      |                 3 |
| Surprise        |                 3 |
| Avondale        |                 2 |
| Concord         |                 2 |
+-----------------+-------------------+
(Output limit exceeded, 25 of 67 total rows shown)*/
	


/*6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:*/
select  stars as `star rating`,
        count (stars) as count
from  
		business
where 
		city = 'Avon'
group by 
		stars;

/*Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star rating | count |
+-------------+-------+
|         1.5 |     1 |
|         2.5 |     2 |
|         3.5 |     3 |
|         4.0 |     2 |
|         4.5 |     1 |
|         5.0 |     1 |
+-------------+-------+*/


/*ii. Beachwood

SQL code used to arrive at answer:*/
select  
        stars as `star rating`,
        count (stars) as count
from 
		business
where 
		city = 'Beachwood'
group by 
		stars;

/*Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star rating | count |
+-------------+-------+
|         2.0 |     1 |
|         2.5 |     1 |
|         3.0 |     2 |
|         3.5 |     2 |
|         4.0 |     1 |
|         4.5 |     2 |
|         5.0 |     5 |
+-------------+-------+	*/


/*7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:*/
select 
	   id,
       name,
       review_count
from  
       user
order by 
       review_count desc
limit 3;
		
/*	Copy and Paste the Result Below:
	+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+	*/


/*8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	Posing more reviews has no correlation with more fans as suggested by the results of the query below
	For instance , the second and third persons with the most reviews deviate with 427 and 443 reviews
	respectively from the one with the most reviews. This condition occurs throughout the dataset and as such
	there is neither a high nor a low correlation between posing more reviews with more fans
	
	code:*/
select  id,
		name,
		review_count,
		fans
from  	
		user
order by 
		review_count 
desc;

/*Table:
	+------------------------+-----------+--------------+------+
| id                     | name      | review_count | fans |
+------------------------+-----------+--------------+------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
| -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |   50 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 |
| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
| -gokwePdbXjfS0iF7NsUGA | eric      |         1116 |   16 |
| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
| -fUARDNuXAfrOn4WLSZLgA | Ed        |          904 |   38 |
| -hKniZN2OdshWLHYuj21jQ | Nicole    |          864 |   43 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 |
| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 |
| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 |
| -kO6984fXByyZm3_6z2JYg | Dominic   |          836 |   37 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 |
| -l9giG8TSDBG1jnUBUXp5w | Alison    |          775 |   61 |
| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 |
| -AaBjWJYiQxXkCMDlXfPGw | Tim       |          702 |   35 |
| -jt1ACMiZljnBFvS6RRvnA | L         |          696 |   10 |
| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 |
| -hxUwfo3cMnLTv-CAaP69A | Crissy    |          676 |   25 |
| -H6cTbVxeIRYR-atxdielQ | Lyn       |          675 |   45 |
+------------------------+-----------+--------------+------+
(Output limit exceeded, 25 of 10000 total rows shown)*/



/*9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Yes, more love than hate

	
	SQL code used to arrive at answer:*/
select  id,
		text
from    
		review
where 	
		text like 
            '%love%' or 
        text like 
            '%hate';
	
	
/*10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:*/
select  id,
		name,
		fans
from 
		user
order by 
		fans desc
limit 10;
	
/*	Copy and Paste the Result Below:
+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+*/
	
		

/*Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
    No, the star ratings has no correlation or relationship with their hours of operations.

ii. Do the two groups you chose to analyze have a different number of reviews?
     Yes, 2-3 star groups have reviews less than 10 wheras the 4-5 star groups records reviews above 10.

iii. Are you able to infer anything from the location data provided between these two groups? Explain.
     No, irrespective of differences in star rating, these groups of businesses reside in the same geographical average
     and also, the difference in distance between 2-3 star businesses and that of 4-5 star businesses is very insignificant.
     
     SQL code used for analysis:*/
select b.name,
        b.city,
        b.stars,
        c.category,
        h.hours,
        b.review_count,
        b.latitude,
        b.longitude
from (business b inner join category c on 
        b.id = c.business_id)
inner join hours h on b.id = h.business_id
where city = 'Mesa' --and 
        --category = 'Chinese'
group by stars;

/*2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
     For business with review count and checkin recorded, closed businesses have higher average reviews than that of their open counterparts, thus 16 and 13.5 respectively.
         
ii. Difference 2:
    For business with review count and checkin recorded, closed business have a total checkin of 18 whereas open businesses have 823.  
         
         
SQL code used for analysis:*/
select  
		b.is_open,
        case b.is_open
                when 1 then 'open'
        else 'closed'
                end 'open status',
        avg(b.review_count) as 'average reviews',
        sum(c.count) as 'Total checkin'
from  	
		business b inner join checkin c on
        b.id = c.business_id
group by 
		`open status`;
	
	
/*3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
   clustering analysis: This is so to assess if highly rated business have the most patronage, thus, the relationship between star rating and number of checkins      
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
    For this analysis, I will require stars and count variables from the business and checkin tables, respectively, These variables hold the star ratings and the measure of patronage of
    of their respective businesses.                        
                  
iii. Output of your finished dataset:
     +-------+---------------+
| stars | Total checkin |
+-------+---------------+
|   1.0 |            10 |
|   1.5 |             1 |
|   2.0 |            61 |
|   2.5 |            38 |
|   3.0 |           245 |
|   3.5 |           319 |
|   4.0 |            68 |
|   4.5 |            96 |
+-------+---------------+    
         
iv. Provide the SQL code you used to create your final dataset:*/
select  
        b.stars,
        sum (c.count) as 'Total checkin'
from    
        business b inner join checkin c on
        b.id = c.business_id
group by 
        `stars`;


















