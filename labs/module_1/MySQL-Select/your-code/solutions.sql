Select authors.au_id as `Author ID`, authors.au_fname as `First Name`, authors.au_lname as `Last Name`, titles.title as Title, publishers.pub_name as Publisher
from titleauthor
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id;

Select authors.au_id as `Author ID`, authors.au_fname as `First Name`, authors.au_lname as `Last Name`, COUNT(titles.title) as `Title count`, publishers.pub_name as Publisher
from titleauthor
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name;

Select authors.au_id as `Author ID`, authors.au_fname as `First Name`, authors.au_lname as `Last Name`, SUM(sales.qty) as Total
from titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 3;

Select authors.au_id as `Author ID`, authors.au_fname as `First Name`, authors.au_lname as `Last Name`, SUM(sales.qty) as Total
from titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY Total DESC;
