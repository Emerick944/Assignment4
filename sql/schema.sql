CREATE DATABASE ChoresCountdb;

\c playerdb;

CREATE TYPE conference as ENUM  ('EAST', 'WEST');
CREATE TYPE position_role as ENUM  ('PG', 'SG', 'SF', 'PF', 'C');

-- create a table
CREATE TABLE users (
    Id_User Serial PRIMARY KEY(Id_Users),
    username VARCHAR(50),
    Firstname VARCHAR(50) NOT NULL,
    Lastname VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
);

CREATE TABLE FlatSharing(
   Id_FlatSharing INT,
   FlatSharing_Name VARCHAR(100) NOT NULL,
   Address VARCHAR(500),
   City VARCHAR(50),
   State VARCHAR(50),
   Zipcode VARCHAR(50),
   PRIMARY KEY(Id_FlatSharing)
);

CREATE TABLE Chore_Category(
   Id_Chore_Category INT,
   Name_Category VARCHAR(50),
   Priority VARCHAR(50),
   Difficulty VARCHAR(50),
   PRIMARY KEY(Id_Chore_Category)
);

CREATE TABLE Chore(
   Id_Chore INT,
   Chore_Name VARCHAR(100) NOT NULL,
   Chore_Description VARCHAR(500),
   Chore_Deadline DATE,
   Id_Chore_Category INT NOT NULL,
   PRIMARY KEY(Id_Chore),
   FOREIGN KEY(Id_Chore_Category) REFERENCES Chore_Category(Id_Chore_Category)
);

CREATE TABLE Members(
   username VARCHAR(50),
   Id_FlatSharing INT,
   PRIMARY KEY(username, Id_FlatSharing),
   FOREIGN KEY(username) REFERENCES Users(username),
   FOREIGN KEY(Id_FlatSharing) REFERENCES FlatSharing(Id_FlatSharing)
);

CREATE TABLE Must_Do(
   username VARCHAR(50),
   Id_Chore INT,
   PRIMARY KEY(username, Id_Chore),
   FOREIGN KEY(username) REFERENCES Users(username),
   FOREIGN KEY(Id_Chore) REFERENCES Chore(Id_Chore)
);
