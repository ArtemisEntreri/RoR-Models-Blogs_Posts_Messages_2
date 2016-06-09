class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :table, polymorphic: true
end
