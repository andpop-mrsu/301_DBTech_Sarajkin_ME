-- 1. Добавление новых пользователей
INSERT INTO users (name, email, gender, register_date, occupation_id)
VALUES 
('Максим Сарайкин', 'maxim.saraikin@example.com', 'male', date('now'), 
    (SELECT id FROM occupations WHERE name = 'student')),
('Самылкин Максим', 'samylkin.maxim@example.com', 'male', date('now'), 
    (SELECT id FROM occupations WHERE name = 'engineer')),
('Родионов Михаил', 'rodionov.mikhail@example.com', 'male', date('now'), 
    (SELECT id FROM occupations WHERE name = 'programmer')),
('Сеничев Александр', 'senichev.alexandr@example.com', 'male', date('now'), 
    (SELECT id FROM occupations WHERE name = 'student')),
('Фомин Сергей', 'fomin.sergey@example.com', 'male', date('now'), 
    (SELECT id FROM occupations WHERE name = 'student'));


INSERT INTO movies (title, year)
VALUES 
('Форрест Гамп', 1994),
('Крестный отец', 1972),
('Побег из Шоушенка', 1994);

INSERT INTO movies_genres (movie_id, genre_id)
VALUES 
-- Форрест Гамп: Drama, Romance, Comedy
((SELECT id FROM movies WHERE title = 'Форрест Гамп'), 
 (SELECT id FROM genres WHERE name = 'Drama')),
((SELECT id FROM movies WHERE title = 'Форрест Гамп'), 
 (SELECT id FROM genres WHERE name = 'Romance')),
((SELECT id FROM movies WHERE title = 'Форрест Гамп'), 
 (SELECT id FROM genres WHERE name = 'Comedy')),

-- Крестный отец: Crime, Drama
((SELECT id FROM movies WHERE title = 'Крестный отец'), 
 (SELECT id FROM genres WHERE name = 'Crime')),
((SELECT id FROM movies WHERE title = 'Крестный отец'), 
 (SELECT id FROM genres WHERE name = 'Drama')),

-- Побег из Шоушенка: Drama
((SELECT id FROM movies WHERE title = 'Побег из Шоушенка'), 
 (SELECT id FROM genres WHERE name = 'Drama'));

-- 4. Добавление отзывов
INSERT INTO ratings (user_id, movie_id, rating, timestamp)
VALUES 
((SELECT id FROM users WHERE email = 'maxim.saraikin@example.com'), 
 (SELECT id FROM movies WHERE title = 'Форрест Гамп'), 5.0, strftime('%s', 'now')),
((SELECT id FROM users WHERE email = 'maxim.saraikin@example.com'), 
 (SELECT id FROM movies WHERE title = 'Крестный отец'), 4.9, strftime('%s', 'now')),
((SELECT id FROM users WHERE email = 'maxim.saraikin@example.com'), 
 (SELECT id FROM movies WHERE title = 'Побег из Шоушенка'), 4.8, strftime('%s', 'now'));

-- 5. Добавление тегов
INSERT INTO tags (user_id, movie_id, tag, timestamp)
VALUES 
((SELECT id FROM users WHERE email = 'maxim.saraikin@example.com'), 
 (SELECT id FROM movies WHERE title = 'Форрест Гамп'), 'трогательный история жизни', strftime('%s', 'now')),
((SELECT id FROM users WHERE email = 'maxim.saraikin@example.com'), 
 (SELECT id FROM movies WHERE title = 'Крестный отец'), 'мафия классика', strftime('%s', 'now')),
((SELECT id FROM users WHERE email = 'maxim.saraikin@example.com'), 
 (SELECT id FROM movies WHERE title = 'Побег из Шоушенка'), 'фильм о надежде и свободе', strftime('%s', 'now'));