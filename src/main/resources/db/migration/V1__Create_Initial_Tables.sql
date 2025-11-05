-- V1__Create_Initial_Tables.sql

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, --bcrypt hash
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_profiles (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE,
    title VARCHAR(100),
    bio TEXT,
    
    CONSTRAINT fk_user
        FOREIGN KEY(user_id) 
        REFERENCES users(id)
        ON DELETE CASCADE -- delete if corresponding user is deleted
);

CREATE TABLE links (
    id BIGSERIAL PRIMARY KEY,
    profile_id BIGINT NOT NULL,
    title VARCHAR(100) NOT NULL,
    url VARCHAR(500) NOT NULL,
    -- 'sort_order' est utile pour permettre à l'utilisateur de réorganiser ses liens
    sort_order INT DEFAULT 0,
    
    CONSTRAINT fk_profile
        FOREIGN KEY(profile_id) 
        REFERENCES user_profiles(id)
        ON DELETE CASCADE -- delete if corresponding profile is deleted
);

CREATE INDEX idx_links_profile_id ON links(profile_id);