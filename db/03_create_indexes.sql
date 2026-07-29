-- 03 - Indexes

-- posts table
CREATE INDEX IF NOT EXISTS idx_posts_user_id 
ON posts(user_ID); -- author user filter

CREATE INDEX IF NOT EXISTS idx_posts_tags_tag_id 
ON posts_tags(post_tag_id); -- tag filter

CREATE INDEX IF NOT EXISTS idx_posts_created_at_desc 
ON posts(created_at DESC); -- date filter

CREATE INDEX IF NOT EXISTS idx_posts_title_trgm 
ON posts USING gin (title gin_trgm_ops); -- text/regex searchin

-- posts comments table
CREATE INDEX IF NOT EXISTS idx_post_comments_post_id 
ON post_comments(post_ID); -- comments to post idx

CREATE INDEX IF NOT EXISTS idx_post_comments_created_at 
ON post_comments(created_at ASC); -- comments date filter

-- misc
CREATE INDEX IF NOT EXISTS idx_user_additional_data_user_id 
ON user_additional_data(user_ID); -- links/data filter

CREATE INDEX IF NOT EXISTS idx_post_images_post_id 
ON post_images(post_ID); -- post imgs fitler

CREATE INDEX IF NOT EXISTS idx_post_files_post_id 
ON post_files(post_ID); -- post files filter
