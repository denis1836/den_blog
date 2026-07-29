INSERT INTO Users (name, login, email, password_hash, role, state) 
VALUES ( 
    'Denis Pylypenko',
    'denis1836',
    'den.pylypen@protonmail.com',
    '',
    'admin',
    'active'
);

INSERT INTO Post_Tags (name, description)
VALUES (
    ('project', 'post about a project state/milestone'),
    ('ideas', 'just ideas'),
    ('tutorial', 'explaing something'),
    ('devlog', 'how is work going on a certain project'),
    ('snippet', 'pieces of code you can use'),
    ('life stuff', 'Whats going on in life'),
    ('cars', 'a post about some 4-wheeler'),
    ('planes', 'the pinacle of human engineering'),
    ('music', 'cool music'),
    ('diy', 'handmade stuff'),

    -- Languages/Solutions
    ('rust', 'beloved crab language'),
    ('ts', 'better js'),
    ('js', '"2" + 2 = 4'),
    ('cpp', 'segfult but better'),
    ('c', 'segfault'),
    ('postgresql', '"We have to fix relational databases... first of all"'),
    ('mysql', 'phpmyadmin my hated'),
    ('php', 'why?'),
    ('docker', 'big blue whale of desperation'),
    ('java', 'FeatureProviderFactoryBuilderFactory'),
    ('c#', 'java but somehow worse'),
    ('linux', 'funny penguin'),
    ('vim', 'my vim is over 5 seconds faster than your VSCode'),
    ('python', 'import app \n app.run()')
);
