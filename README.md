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
    profile_image, - pending
    cover_image, - pending
    password, - password
    emails, 
    mobile_numbers,
    language
rails generate migration CreateUsers first_name:string last_name:string middle_name:string gender:string date_of_birth:date relationship:string bio:string emails:string mobile_numbers:string language:string

  users_work
  users_education
  users_location

2. posts
    user_id, content(text or images) -> Active storage for images 
    rails generate migration CreatePosts content:string user:references
  posts_tags
3. comments
    user_id, content, post_id
    rails generate migration CreateComments content:string user:references post:references
4. likes
    user_id,type, id
    rails generate migration CreateLikes user:references likeable:references{polymorphic}
5. friends
    user_id1
    user_id2
    status('accepted','reject','sent','pending','follower')
    rails generate migration CreateFriends user1:references user2:references status:string
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
