class UsersController < ApplicationController
 def index
   @users=User.all
   @user = current_user
 end
 def current
 @user = current_user
 end
 def show
  @t=0
  @user = User.find(params[:id])
  
 end
 
  def sign_in
  end
 def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count<1
  end
end
