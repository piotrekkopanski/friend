class FriendshipsController < ApplicationController
   

  def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Added friend."
    redirect_to root_url
  else
    flash[:error] = "Unable to add friend."
    redirect_to root_url
  end
end

 

def destroy

 
  @friendship = Friendship.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_user
end

  def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy,:current)
    end
 def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count<1
  end
  private

  def check_friendship
    redirect_to( current_user, alert: 'Already a friend' ) if current_user.friend_with?( params[ :friend_id ] )
  end
 
end
