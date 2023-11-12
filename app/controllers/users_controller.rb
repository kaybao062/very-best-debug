class UsersController < ApplicationController

  def all_users
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "users_templates/all_users"})
  end
  
  def users_details
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "users_templates/user_details"})
  end
  
  def create
    @user = User.new
    @user.username = params.fetch("query_username")
    @user.save
    
    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "user created successfully." })
    else
      redirect_to("/users/#{@user.username}", { :notice => "user failed to create successfully." })
    end
  end
  
  def update
    the_name = params.fetch("user_name")
    matching_users = User.where({ :username => the_name })
    @user = matching_users.at(0)
    
    @user.username = params.fetch("query_username")
    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{@user.username}", { :notice => "User updated unsuccessfully."} )
    end
  end

end
