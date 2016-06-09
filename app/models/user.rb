class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :messages, dependent: :destroy
	has_many :blogs, through: :owners
	has_many :comments, dependent: :destroy

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i 
	validates :first_name, presence: true, length: {in: 2..15}
	validates :last_name, presence: true, length: {in: 2..25}
	validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
