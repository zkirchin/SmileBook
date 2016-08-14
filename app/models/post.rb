class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  belongs_to :user
  validates :user_id, :content, presence: true
end
