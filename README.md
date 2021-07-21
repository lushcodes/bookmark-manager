# Bookmark Manager Web App

This web app will allow a user to save, manage and visit a list of bookmarks to a Bookmark Manager. The process of creating this app involved TDD & BDD principles.

## USER STORIES
The user stories for the project were as follows:

```
As a user
So that I can access my regular links
I want to see a list of bookmarks
```

```
As a user
So I can store store a bookmark to visit later
I want to add a bookmark to the Bookmark Manager
```
## Setting Up Database (PostgreSQL)

1. Install PostgreSQL

2. Connect to psql through the terminal and create the production database using the following psql command:
```
CREATE DATABASE bookmark_manager;
```
3. Connect to the database using the psql command:
```
\c bookmark_manager
```

4. Run the query saved in the db/migrations folder under file 01

5. Create a test database
```
CREATE DATABASE bookmark_manager_test;
```
6. Connect to the new test database and run the query from step 4.

# PROCESS

### Class Diagram
_____________________________________________
                  |
      User        |       Bookmark
                  |   
      name        |       name, url { }
                  |
                  |
                  |
                  |       show_bookmarks
                  |
                  |
_____________________________________________

### Domain Model

Firstly, I mapped out the interactions relevant to the first user story across the model, view, controller and client prior to the involvement of the database. 

![alt text](public/domain_model.png "User Story Domain Model")