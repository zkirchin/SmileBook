class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  has_many :posts, dependent: :destroy

  #making request for friendship
  def request_friendship(user_2)
    self.friendships.create(friend: user_2)
  end

  # selecting active friends
  def active_friends
    #grabbing friendships only
    #self.friendships + self.inverse_friendships

    #grabbing friends (active and pending)
    #self.friendships.map(&:friend) + self.inverse_friendships.map(&:user)

    #grabbing friends (active)
    self.friendships.where(state: 'active').map(&:friend) + self.inverse_friendships.where(state: 'active').map(&:user)
  end

  # grab pending friend requests from other users
  def pending_friend_requests_from
    self.inverse_friendships.where(state: 'pending').map(&:user)
  end

  # grab pending friend request to other users
  def pending_friend_requests_to
    self.friendships.where(state: 'pending').map(&:friend)
  end

  #checks the status of friendship and returns string status to be used in user helper
  def friendship_status(user_2)
    friendship = Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id])
    if friendship.any? == false
      return 'not_friends'
    elsif friendship.first.state == 'active'
      return 'friends'
    elsif friendship.first.user == self
      return 'pending'
    elsif friendship.first.friend == self
      return 'requested'
    end
  end

  #
  def friendship_relation(user_2)
    Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id]).first
  end

end
