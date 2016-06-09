class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comments, as: :table

  validates :author, presence: true, length: {in: 2..15}
  validates :message, presence: true, length: {minimum: 5}
end
