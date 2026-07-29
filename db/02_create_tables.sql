-- 02 - Create Tables

CREATE TABLE IF NOT EXISTS Users (
    user_ID BIGSERIAL PRIMARY KEY,
        
    name VARCHAR(128),
    login VARCHAR(16) NOT NULL UNIQUE,
    email VARCHAR(256) NOT NULL UNIQUE,
    password_hash VARCHAR(256),
        
    role user_role DEFAULT 'guest',
    state user_state DEFAULT 'active',

    registration_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    last_login_date TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS User_Additinal_Data (
    user_ID BIGINT REFERNCES Users(user_ID) ON DELETE CASCADE,

    type data_type,
    content VARCHAR(256);
);

CREATE TABLE IF NOT EXISTS Post_Tags (
    post_tag_ID BIGSERIAL PRIMARY KEY,

    name VARCHAR(32),
    description VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS Posts (
    post_ID BIGSERIAL PRIMARY KEY,
    user_ID BIGINT REFERENCES users(user_ID) ON DELETE SET NULL,

    state post_state DEFAULT 'draft',
    title VARCHAR(256) NOT NULL,
    content TEXT,
    
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS Posts_Tags (
    post_ID BIGINT REFERENCES Posts(post_ID) ON DELETE CASCADE,
    post_tag_ID BIGINT REFERENCES Post_Tags(post_tag_ID) ON DELETE CASCADE,

    PRIMARY KEY (post_ID, post_tag_ID)
);

CREATE TABLE IF NOT EXISTS Post_Images (
    post_image_ID BIGSERIAL PRIMARY KEY,
    post_ID BIGINT REFERENCES posts(post_ID) ON DELETE CASCADE,

    description VARCHAR(512),
    hash VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS Post_Files (
    post_file_ID BIGSERIAL PRIMARY KEY,
    post_ID BIGINT REFERENCES posts(post_ID) ON DELETE CASCADE,

    name VARCHAR(128) NOT NULL,
    description VARCHAR(512),
    hash VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS Post_Comments (
    post_comment_ID BIGSERIAL PRIMARY KEY,
    post_ID BIGINT REFERENCES posts(post_ID) ON DELETE CASCADE,
    user_ID BIGINT REFERENCES users(user_ID) ON DELETE CASCADE,

    state comment_state DEFAULT 'posted',
    content VARCHAR(1024) NOT NULL,

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS pins (
    pin_ID BIGSERIAL PRIMARY KEY,
    user_ID BIGINT REFERENCES users(user_ID) ON DELETE CASCADE,
    post_ID BIGINT REFERENCES posts(post_ID) ON DELETE CASCADE,
    
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_ID, post_ID)
);
