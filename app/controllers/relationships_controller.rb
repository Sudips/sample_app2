class RelationshipsController < ApplicationController
  include SessionsHelper
  
  before_filter :signed_in_user
  
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html {redirect_to @user }
      format.js {render layout: false}
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html {redirect_to @user }
      format.js {render layout: false}
    end
  end

end
