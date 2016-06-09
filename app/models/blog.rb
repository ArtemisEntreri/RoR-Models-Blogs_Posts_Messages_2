class Blog < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :owners, dependent: :destroy
	has_many :users, through: :owners
	has_many :messages, through: :posts
	has_many :comments, as: :table

	validates :name, presence: true, length: {in: 2..15}
	validates :description, presence: true, length: {minimum: 5}
end
