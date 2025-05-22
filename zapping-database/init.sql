-- Create users table
CREATE TABLE IF NOT EXISTS users (
                                     id INTEGER PRIMARY KEY AUTOINCREMENT,
                                     nombre TEXT,
                                     email TEXT UNIQUE NOT NULL,
                                     password TEXT NOT NULL,
                                     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some test data
INSERT OR IGNORE INTO users (nombre, email, password) VALUES
    ('Test User 1', 'test1@example.com', 'password123'),
    ('Test User 2', 'test2@example.com', 'password456'),
    ('John Doe', 'john@example.com', 'mypassword');

-- Create an index for faster email lookups
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);