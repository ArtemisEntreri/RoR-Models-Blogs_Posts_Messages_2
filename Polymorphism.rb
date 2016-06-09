1.  Add the model

	rails g model Comment text:string user:references table:references
	# Change foreign key to polymorphic: :true

	rake db:migrate
	#add proper has_many :comments, as: :table
	#add polymorphic: :true to comments table

2.  Test to see if it works and allows comments to be added

		Comment.create(text: "This is comment text", user:User.first, table:Blog.first)
		Comment.create(text: "This is another comment", user:User.find(2), table:Post.find(4))
		# All Work
		