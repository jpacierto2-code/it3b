-- #1 Students Table
CREATE TABLE IF NOT EXISTS students (

    student_id INT PRIMARY KEY AUTO_INCREMENT,

    -- Student Name
    student_first_name VARCHAR(50) NOT NULL,
    student_last_name VARCHAR(50) NOT NULL,

    -- Student Course
    student_course VARCHAR(50) NOT NULL,

    -- Student Created Timestamp
    student_created_at TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- #2 Books Table
CREATE TABLE IF NOT EXISTS books (

    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(100) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_category VARCHAR(50) NOT NULL,
    book_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- #3 Borrow Table
CREATE TABLE IF NOT EXISTS borrow (

    -- Primary Key
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Foreign Keys
    book_id INT NOT NULL,
    student_id INT NOT NULL,

    -- Borrow Timestamp
    borrow_date TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

    -- Return Timestamp
    borrow_return_date TIMESTAMP NULL
    DEFAULT NULL,

    -- Foreign Key Constraints
    CONSTRAINT fk_borrow_student
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    CONSTRAINT fk_borrow_book
    FOREIGN KEY (book_id)
    REFERENCES books(book_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- Insert Students
INSERT INTO students (
    student_first_name,
    student_last_name,
    student_course
) VALUES
('JOHN PAUL', 'ACIERTO', 'BSIT'),
('GHENDIE', 'RUBIN', 'BSIT'),
('CARL XANDER', 'DAYRIT', 'BSIT'),
('REVIN RAVEN', 'ACIERTO', 'BSIT'),
('MICHAEL', 'WILLIAMS', 'BSPH'),
('GINA', 'ACIERTO', 'BSIT');

-- Insert Books
INSERT INTO books (
    book_title,
    book_author,
    book_category
) VALUES
('AVENGERS ENDGAME', 'MARVEL', 'ACTION'),
('PRINCE OF NARNIA', 'C.S. LEWIS', 'FICTION'),
('TO KILL A MOCKINGBIRD', 'HARPER LEE', 'FICTION'),
('1984', 'GEORGE ORWELL', 'DYSTOPIAN'),
('PRIDE AND PREJUDICE', 'JANE AUSTEN', 'ROMANCE'),
('THE HOBBIT', 'J.R.R. TOLKIEN', 'FANTASY');

-- Insert Borrow Records
INSERT INTO borrow (
    student_id,
    book_id
) VALUES
(1, 2),
(2, 1),
(3, 3);