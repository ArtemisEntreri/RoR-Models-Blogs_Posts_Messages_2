1. 	Create Models
	
		rails g model User first_name:string last_name:string email_address:string
		rails g model Blog name:string description:text
		rails g model Owner user:references blog:references
		rails g model Post blog:references user:references title:string content:text
		rails g model Message post:references user:references author:string messages:text
		
		rake db:migrate

2. 	Create 5 users

		User.create(first:_name:"Garett", last_name:"Entreri", email_address:"This@Gmail.com")
		...

3.  Create 5 blogs

		Blog.create(name:"Blog 1", description:"Description for blog number 1")
		Owner.create(user:User.first, blog:Blog.first)
		...

4. 	Have the third user own all of the blogs

		Blog.all.each{ |i| Owner.create(user:User.find(3), blog:i) }

5.  Have the first user create 3 posts for the blog with an id of 2

		Post.create(blog:Blog.find(2), user:User.first, title:"Post 1, Blog 2", content:"Filler, filler, filler, more filler")
		...

6. 	Have the second user create 5 posts for the last blog

		Post.create(blog:Blog.last, user:User.find(2), title:"Post 1, Blog 5", content:"Lots of ")
		...


7. 	Have the third user create different posts for different blogs
	
		Post.create(blog:Blog.find(2), user:User.find(3), title:"Another blog for another post", content:"filler content for the content part of this blog!")
		...

8.  Have the third user create 2 messages for the first post created and 3 messages for the second post created

		Message.create(post:Post.first, user:User.find(3), author:"Peyton Manning", message:"Not looking very good for the New England Patriots")
		...
		Message.create(post:Post.find(2), user:User.find(3), author:"Tom Brady", message:"Damn, those Broncos are really playing well...")
		...

9. 	Have the fourth user create 3 messages for the last post you created

		Message.create(post:Post.last, user:User.find(4), author:"Russel Wilson", message:"If we had beaten those Panthers, we'd be dominating this game.")
		...

10. Change the owner of the second post to the last user
	
		Post.find(2).update(user:User.last)

11. Change the second posts description to be something else

		Post.find(2).update(content:"This Content has just been changed!")

12. Retrieve all the blogs owned by the third user

		User.find(3).blogs

13. Retrieve all posts that were created by the third user

		User.find(3).posts

14. Retrieve all messages left by the third user

		User.find(3).messages

15. Retrieve all posts associated with the first blog as well as all who left those posts
		
		Blog.first.posts.select('posts.*, users.*').joins(:user)

16. Retrieve all messages associated with the 	first blog as well as all who left those messages

		Blog.first.messages.select('messages.*, users.*').joins(:user)

17. Grab all user information of those that own the first blog

		Blog.first.users

18. Change it so that the first blog is no longer owned by the first user
	
		Owner.find_by(blog:Blog.first, user:User.first).destroy