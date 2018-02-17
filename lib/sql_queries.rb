# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"SELECT projects.title, SUM(pledges.amount)
FROM projects
JOIN pledges
ON projects.id = pledges.project_id
GROUP BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"SELECT users.name, users.age, SUM(pledges.amount)
FROM users
JOIN pledges
ON users.id = pledges.user_id
GROUP BY users.name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
# alias the difference between funding_goal & pledges.amount as amount_over to be referenced later in GROUP BY
# find projects that have a pledges.amount - funding_goal greater than or equal to zero
"SELECT projects.title, (SUM(pledges.amount) - projects.funding_goal) AS amount_over
FROM projects
JOIN pledges
ON projects.id = pledges.project_id
GROUP BY projects.title HAVING amount_over >= 0;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"Write your SQL query Here"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"Write your SQL query Here"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"Write your SQL query Here"
end

=begin

  BAD SQL:
    SELECT employee, SUM(bonus) FROM employee_bonus
    GROUP BY employee WHERE SUM(bonus) > 1000;

  Unfortunately the above will not work because the WHERE clause doesn’t work with aggregates – like SUM, AVG, MAX, etc. What we need to use is the HAVING clause. The HAVING clause was added to SQL so that we could compare aggregates to other values – just how the WHERE clause can be used with non-aggregates. Now, the correct SQL will look like this:

  GOOD SQL:
    SELECT employee, SUM(bonus) FROM employee_bonus
    GROUP BY employee HAVING SUM(bonus) > 1000;


  The difference between the HAVING and WHERE clause in SQL is that the WHERE clause can not be used with aggregates but the HAVING clause can. One way to think of it is that the HAVING clause is an additional filter to the WHERE clause.
=end
