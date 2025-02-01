-- Table Creation
CREATE TABLE Users (
    userId VARCHAR2(10) PRIMARY KEY,
    name VARCHAR2(50),
    emailAddress VARCHAR2(100) UNIQUE
);

-- Insert Values
INSERT INTO Users (userId, name, emailAddress) VALUES ('alice01', 'Alice, A', 'alice@gmail.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('bob17', 'Bob, B', 'bob@hotmail.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('charlie5', 'Charlie, C', 'charlie@yahoo.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('dave19', 'Dave, D', 'dave@gmail.com');
INSERT INTO Users (userId, name, emailAddress) VALUES ('eve20', 'Eve, E', 'eve@hotmail.com');

-- Select Data
SELECT * FROM Users;


-- Table Creation
CREATE TABLE Genre (
    genreCode VARCHAR2(10) PRIMARY KEY,
    title VARCHAR2(50)
);

-- Insert Values
INSERT INTO Genre (genreCode, title) VALUES ('GN01', 'Fiction');
INSERT INTO Genre (genreCode, title) VALUES ('GN02', 'Non-Fiction');
INSERT INTO Genre (genreCode, title) VALUES ('GN03', 'Philosophy');

-- Select Data
SELECT * FROM Genre;


-- Table Creation
CREATE TABLE Book (
    bookId VARCHAR2(10) PRIMARY KEY,
    title VARCHAR2(100),
    genreCode VARCHAR2(10),
    price NUMBER(5,2),
    CONSTRAINT fk_genre FOREIGN KEY (genreCode) REFERENCES Genre(genreCode)
);

-- Insert Values
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B001', 'The Great Gatsby', 'GN01', 5.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B002', 'To Kill a Mockingbird', 'GN01', 6.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B003', 'A Brief History of Time', 'GN02', 7.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B004', 'The Art of War', 'GN03', 4.99);
INSERT INTO Book (bookId, title, genreCode, price) VALUES ('B005', 'The Catcher in the Rye', 'GN01', 5.49);

-- Select Data
SELECT * FROM Book;

-- Table Creation
CREATE TABLE Purchase (
    userId VARCHAR2(10),
    bookId VARCHAR2(10),
    purchaseDate DATE,
    PRIMARY KEY (userId, bookId, purchaseDate),
    CONSTRAINT fk_user FOREIGN KEY (userId) REFERENCES Users(userId),
    CONSTRAINT fk_book FOREIGN KEY (bookId) REFERENCES Book(bookId)
);

-- Insert Values
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('alice01', 'B002', TO_DATE('2022-05-05', 'YYYY-MM-DD'));
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('dave19', 'B005', TO_DATE('2023-05-10', 'YYYY-MM-DD'));
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('bob17', 'B004', TO_DATE('2022-05-12', 'YYYY-MM-DD'));
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('eve20', 'B001', TO_DATE('2023-05-15', 'YYYY-MM-DD'));
INSERT INTO Purchase (userId, bookId, purchaseDate) VALUES ('frank30', 'B003', TO_DATE('2023-08-20', 'YYYY-MM-DD'));

-- Select Data
SELECT * FROM Purchase;