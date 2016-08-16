class Friendship < ActiveRecord::Base
	belongs_to :user
	#fake friends
	belongs_to :friend, class_name: "User"

	#accpets friends
	def accept_friendship
		self.update_attributes(state: "active", friended_at: Time.now)
	end

	def deny_friendship
		self.destroy
	end

	def cancel_friendship
		self.destroy
	end

end
