# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
  User friends
  User Timeline
  Post like
  Post comment
  Comment like


Tables:
1. 
  users
    first_name,
    middle_name,
    last_name,
    date_of_birth,
    gender,
    relationship,
    bio, 
    profile_image,
    cover_image, 
    password,
    emails, 
    mobile_numbers,
    language

  users_work
  users_education
  users_location

2. posts
    user_id, content(text or images) -> Active storage for images 
  posts_tags
3. comments
    user_id, content, post_id
4. likes
    user_id,type, id
5. friends
    user_id1
    user_id2
    accepted_date
    status('accepted','reject','sent','pending')

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
