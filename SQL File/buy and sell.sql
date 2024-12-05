use project;
CREATE TABLE user_signup (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_email VARCHAR(100) UNIQUE,
    user_username VARCHAR(100) UNIQUE,
    user_password VARCHAR(100)
);

CREATE TABLE sell_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    item_desc TEXT NOT NULL,
    item_price INT NOT NULL,
    username VARCHAR(100),
    selling_id VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    mobile BIGINT NOT NULL,
    address TEXT NOT NULL,
    FOREIGN KEY (username) REFERENCES user_signup(user_username),
    FOREIGN KEY (email) REFERENCES user_signup(user_email)
);

update sell_item set category="Electronics" where item_name="Headphones";


CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    item_id INT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    item_desc TEXT,
    item_price DECIMAL(10, 2),
    seller_username VARCHAR(50),
    seller_email VARCHAR(100),
    seller_mobile VARCHAR(15),
    seller_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

