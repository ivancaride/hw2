# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"

# Generate models and tables, according to the domain model.
# TODO!

#in terminal i put: 
# rails generate model Movie
# rails generate model Studio
# rails generate model Actor
# rails generate model Role
#I added the columns to each table via db and then y run the migration. 

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

new_studio = Studio.new
new_studio ["studio_name"] = "Warner Bros."

Warner Bros = Studio.find_by({ "studio_name" => "Warner Bros." })

new_movie1 = Movie.new
new_movie1 ["title"] = "Batman Begins"
new_movie1 ["year released"] = "2005"
new_movie1 ["mpaa rating"] = "PG-13"
new_movie1 ["studio_id"] = Warner Bros ["id"]

new_movie2 = Movie.new
new_movie2 ["title"] = "The Dark Knight"
new_movie2 ["year released"] = "2008"
new_movie2 ["mpaa rating"] = "PG-13"
new_movie2 ["studio_id"] = Warner Bros ["id"]

new_movie3 = Movie.new
new_movie3 ["title"] = "The Dark Knight Rises"
new_movie3 ["year released"] = "2012"
new_movie3 ["mpaa rating"] = "PG-13"
new_movie3 ["studio_id"] = Warner Bros ["id"]

new_actor1 = Actor.new
new_actor1 ["actor_name"] = "Christian Bale"

new_actor2 = Actor.new
new_actor2 ["actor_name"] = "Michael Caine"

new_actor3 = Actor.new
new_actor3 ["actor_name"] = "Liam Neeson"

new_actor4 = Actor.new
new_actor4 ["actor_name"] = "Katie Holmes"

new_actor5 = Actor.new
new_actor5 ["actor_name"] = "Gary Oldman"

new_actor6 = Actor.new
new_actor6 ["actor_name"] = "Heath Ledger"

new_actor7 = Actor.new
new_actor7 ["actor_name"] = "Aaron Eckhart"

new_actor8 = Actor.new
new_actor8 ["actor_name"] = "Maggie Gyllenhaal"

new_actor9 = Actor.new
new_actor9 ["actor_name"] = "Tom Hardy"

new_actor10 = Actor.new
new_actor10 ["actor_name"] = "Joseph Gordon-Levitt"

new_actor11 = Actor.new
new_actor11 ["actor_name"] = "Anne Hathaway"

Batman Begins = Movie.find_by({ "title" => "Batman Begins" })
The Dark Knight = Movie.find_by({ "title" => "The Dark Knight" })
The Dark Knight Rises = Movie.find_by({ "title" => "The Dark Knight Rises" })

Christian Bale = Actor.find_by({ "actor_name" => "Christian Bale" })
Michael Caine = Actor.find_by({ "actor_name" => "Michael Caine" })
Liam Neeson = Actor.find_by({ "actor_name" => "Liam Neeson" })
Katie Holmes = Actor.find_by({ "actor_name" => "Katie Holmes" })
Gary Oldman = Actor.find_by({ "actor_name" => "Gary Oldman" })
Heath Ledger = Actor.find_by({ "actor_name" => "Heath Ledger" })
Aaron Eckhart = Actor.find_by({ "actor_name" => "Aaron Eckhart" })
Maggie Gyllenhaal = Actor.find_by({ "actor_name" => "Maggie Gyllenhaal" })
Tom Hardy = Actor.find_by({ "actor_name" => "Tom Hardy" })
Joseph Gordon-Levitt = Actor.find_by({ "actor_name" => "Joseph Gordon-Levitt" })
Anne Hathaway = Actor.find_by({ "actor_name" => "Anne Hathaway" })


new_role1 = Role.new
new_role1 ["role_name"] = "Bruce Wayne"
new_role1 ["movie_id"] = Batman Begins ["id"]
new_role1 ["actor_id"] = Christian Bale ["id"]

new_role2 = Role.new
new_role2 ["role_name"] = "Alfred"
new_role2 ["movie_id"] = Batman Begins ["id"]
new_role2 ["actor_id"] = Michael Caine ["id"]

new_role3 = Role.new
new_role3 ["role_name"] = "Ra's Al Ghul"
new_role3 ["movie_id"] = Batman Begins ["id"]
new_role3 ["actor_id"] = Liam Neeson ["id"]

new_role4 = Role.new
new_role4 ["role_name"] = "Rachel Dawes"
new_role4 ["movie_id"] = Batman Begins ["id"]
new_role4 ["actor_id"] = Katie Holmes ["id"]

new_role5 = Role.new
new_role5 ["role_name"] = "Commissioner Gordon"
new_role5 ["movie_id"] = Batman Begins ["id"]
new_role5 ["actor_id"] = Gary Oldman ["id"]

new_role6 = Role.new
new_role6 ["role_name"] = "Bruce Wayne"
new_role6 ["movie_id"] = The Dark Knight ["id"]
new_role6 ["actor_id"] = Christian Bale ["id"]

new_role7 = Role.new
new_role7 ["role_name"] = "Joker"
new_role7 ["movie_id"] = The Dark Knight ["id"]
new_role7 ["actor_id"] = Heath Ledger ["id"]

new_role8 = Role.new
new_role8 ["role_name"] = "Harvey Dent"
new_role8 ["movie_id"] = The Dark Knight ["id"]
new_role8 ["actor_id"] = Aaron Eckhart ["id"]

new_role9 = Role.new
new_role9 ["role_name"] = "Alfred"
new_role9 ["movie_id"] = The Dark Knight ["id"]
new_role9 ["actor_id"] = Michael Caine ["id"]

new_role10 = Role.new
new_role10 ["role_name"] = "Rachel Dawes"
new_role10 ["movie_id"] = The Dark Knight ["id"]
new_role10 ["actor_id"] = Maggie Gyllenhaal ["id"]

new_role11 = Role.new
new_role11 ["role_name"] = "Bruce Wayne"
new_role11 ["movie_id"] = The Dark Knight Rises ["id"]
new_role11 ["actor_id"] = Christian Bale ["id"]

new_role12 = Role.new
new_role12 ["role_name"] = "Commissioner Gordon"
new_role12 ["movie_id"] = The Dark Knight Rises ["id"]
new_role12 ["actor_id"] = Gary Oldman ["id"]

new_role13 = Role.new
new_role13 ["role_name"] = "Bane"
new_role13 ["movie_id"] = The Dark Knight Rises ["id"]
new_role13 ["actor_id"] = Tom Hardy ["id"]

new_role14 = Role.new
new_role14 ["role_name"] = "John Blake"
new_role14 ["movie_id"] = The Dark Knight Rises ["id"]
new_role14 ["actor_id"] = Joseph Gordon-Levitt ["id"]

new_role15 = Role.new
new_role15 ["role_name"] = "Selina Kyle"
new_role15 ["movie_id"] = The Dark Knight Rises ["id"]
new_role15 ["actor_id"] = Anne Hathaway ["id"]


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

for movies in movie
    title = movie ["title"]
    year = movie ["year released"]
    rating = movie ["mpaa rating"]
    studio = 

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
