# Database documentation

KOM is using MySQL.

-----

## **Schemas**

Schemas are made with [dbdiagram.io](https://dbdiagram.io/home).

### **Versions**

Every version of the database schema is stored in the "schemas" folder.

Each version is stored in a folder named "vX" which X is an incremental number.

This folder contains :
- The dbdiagram script in a file named "dbdiagram_script.txt
- The export in sql in a file named "export.sql"
- The image of the schema in a file named "schema.png"

-----

## **Card table**

This table refeer to the Magic playing card.

Card table is fed every week thanks to the API of [MTGJSON](https://mtgjson.com/) at [this url](https://mtgjson.com/api/v5/AllPrintings.json).

### **Fetch data protocol**

Every week this protocol is launched by a call to the API made by the server.

Step 1: 
- List of cards are retrived in JSON format from [https://mtgjson.com/api/v5/AllPrintings.json](https://mtgjson.com/api/v5/AllPrintings.json) 

Step 2:
- We browse the list of maps obtained previously

Step 3:
- The database is checked to see if the card is already stored. To know if a card is already in the database we make the request to the database with the "uuid" field of the card as parameter


Step 4:
- If the previous step indicates that the card is not already in the database, it is inserted into the database


---

1. create datebase KOM;
2. source AllPrintings.sql (for cards ...)
3. source export.sql (for users ...)