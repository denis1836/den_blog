-- 01 - Add Enums

CREATE TYPE user_role AS ENUM ('admin', 'user', 'guest');
CREATE TYPE user_state AS ENUM('active', 'banned', 'removed');
CREATE TYPE post_state AS ENUM ('draft', 'posted', 'edited');
CREATE TYPE comment_state AS ENUM ('draft', 'posted', 'edited');
CREATE TYPE data_type AS ENUM ('link', 'github', 'gitlab', 'twitter', 'linkedin', 'gitlab' ,'other');

