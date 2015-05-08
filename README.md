## MVP ##
- Clean, Modern Design!
- Advanced search for books (author, title, genre, ISBN, etc)
- Track books as read, want, own, etc. (Customizable?)
- Review and rate books (Only published books!)
- Recommendation Engine!
- Import lists from other sites (goodreads, amazon, librarything)
- Mobile-enabled


## Terms ##
Ability to tag books in your "library". You can have books in your library that you don't own. You can mark books with multiple tags. Include some default categories that have special meanings:
- Read: I have read this book
- Own: I own this book
- Want: I want to read this book


## Models/API ##

### Sessions ###
```
POST /sessions/ # Generate New API Token
```



### Book ###
```
has_many owners (users)
has_many tags
```

```
POST    /books        # New Book
GET     /books/:id    # Get book
PUT     /books/:id    # Update book
DELETE  /books/:id    # Delete book

GET     /books/search # Search books
```

### Tag ###
```
has_many books
belongs_to user
```

```
POST    /tags      # New tag
GET     /tags/:id  # Get tag
PUT     /tags/:id  # Update tag
DELETE  /tags/:id  # Delete tag
```


### User ###
```
has_many books
has_many tags
```

```
POST    /users      # New user
GET     /users/:id  # Get user
PUT     /users/:id  # Update user
DELETE  /users/:id  # Delete user
```
