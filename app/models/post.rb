class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :messages, dependent: :destroy
  has_many :comments, as: :table

  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true, length: {minimum: 5}
end
