To compile the .exe:

```
urweb stackExample -dbms sqlite -db stackExample.db
```

then you need to build the db from the generated SQL schema:

```
sqlite3 stackExample.db < stackExample.sql
```

now you can launch the server

```
./stackExample.eex
```

and connect to it in a browser by going to the url:

```
http://127.0.0.1:8080/StackExample/main
```
