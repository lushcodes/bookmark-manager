## USER STORIES

```
As a user
So that I can see what bookmarks I have
I want to see a list of bookmarks
```
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

![alt text](public/domain_model.png "User story domain model")



### Setting Up Database (PostgreSQL)

1. Connect to psql
2. Create the database using the psql command 
```
CREATE DATABASE BookmarkManager;
```
3. Connect to the database using the psql command
```
\c BookmarkManager
```

4. Run the query saved in the migrations folder under file 01


