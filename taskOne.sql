

USE OnlineStore;


CREATE TABLE Orders (
orderId INT PRIMARY KEY NOT NULL,
UserId INT NOT NULL,
FOREIGN KEY (UserId)REFERENCES Users(Id));

ALTER TABLE Orders
ADD dateOfOrder DATETIME NOT NULL ;

ALTER TABLE Orders 
ADD CONSTRAINT DF_Orders_dateOfOrder 
DEFAULT GETDATE() FOR dateOfOrder;



CREATE TABLE OrderProducts (
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,

    PRIMARY KEY (OrderId, ProductId),

    FOREIGN KEY (OrderId) REFERENCES orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products(id)
);

CREATE TABLE categories (
    id INT PRIMARY KEY,
    name NVARCHAR(50) NOT NULL
);


ALTER TABLE products
ADD category_id INT;

ALTER TABLE products
ADD CONSTRAINT FK_products_categories
FOREIGN KEY (category_id) REFERENCES categories(id);


CREATE TABLE employees (
    id INT PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    manager_id INT,

    FOREIGN KEY (manager_id) REFERENCES employees(id)
);

ALTER TABLE users
ADD phone NVARCHAR(20);


ALTER TABLE users
DROP COLUMN phone;

ALTER TABLE users
ALTER COLUMN name NVARCHAR(100);

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    phone NVARCHAR(20)
);



CREATE TABLE payments (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (order_id) REFERENCES Orders(OrderId)
);

CREATE TABLE students (
    id INT PRIMARY KEY,
    name NVARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    title NVARCHAR(100) NOT NULL
);


CREATE TABLE StudentCourses (
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,

    PRIMARY KEY (StudentId, CourseId),

    FOREIGN KEY (StudentId) REFERENCES students(id),
    FOREIGN KEY (CourseId) REFERENCES courses(id)
);


CREATE TABLE logs (
    id INT PRIMARY KEY,
    message NVARCHAR(255) NOT NULL,
    log_time DATETIME DEFAULT GETDATE()
);

TRUNCATE TABLE logs;

ALTER TABLE products
DROP COLUMN price;

DROP TABLE logs;

CREATE TABLE people (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL
);

CREATE TABLE posts (
    id NVARCHAR(50) NOT NULL,
    likes NVARCHAR(50) NULL
);

CREATE TABLE books (
    id INT PRIMARY KEY,
    title NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE authors (
    id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    book_id INT  NOT NULL,

    FOREIGN KEY (book_id) REFERENCES books(id)

);

CREATE TABLE id_table (
    id INT PRIMARY KEY
);


CREATE TABLE example (
    number INT NOT NULL,
    text NVARCHAR(100) NOT NULL,
    date DATETIME NOT NULL
);

CREATE TABLE emp (
    id INT,
    email NVARCHAR(50)
);

ALTER TABLE emp
ADD CONSTRAINT UQ_emp_email UNIQUE (email);