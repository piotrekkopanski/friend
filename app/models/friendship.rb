class Friendship < ActiveRecord::Base
belongs_to :user
belongs_to :friend, :class_name => "User"
 def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count<1
  end
end
