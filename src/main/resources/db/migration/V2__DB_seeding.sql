-- V2__Seed_Initial_Data.sql

INSERT INTO users (username, email, password)
VALUES (
    'YounesBenbouchta', 
    'younes.benbouchta@gmail.com', 
    '$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6' -- "password" hashed with bcrypt
);

INSERT INTO user_profiles (user_id, title, bio)
VALUES (
    1, 
    'Younes Benbouchta', 
    'Développeur Full Stack | Java, Spring Boot, React & DevOps'
);

INSERT INTO links (profile_id, title, url, sort_order)
VALUES 
    (1, 'Mon LinkedIn', 'https://www.linkedin.com/in/younes-benbouchta', 0),
    (1, 'Mon GitHub', 'https://github.com/yonotchobze', 1),
    (1, 'Mon Portfolio (Bientôt !)', '#', 2);