# frozen_string_literal: true

class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
    @group = Group.new
    @user = User.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    @group.save
    redirect_to groups_path
  end

  def show
    @groups = Group.all
    @group = Group.new
    @groupId = Group.find(params[:id])
    $test =  @groupId.id
    p '---------'
    p @groupId.id
  end

  # def edit

  # end

  # def update

  # end

  def destroy
    @groupId = Group.find(params[:id])
    @users = UserGroup.where(group_id: @groupId.id)
    @users.each(&:destroy)
    @groupId.destroy
    redirect_to groups_path
  end

  def addUserGroup
    @usergroup = UserGroup.new
    @usergroup.user_id = User.find_by(name: params[:name]).id
    @usergroup.group_id = $test
    @usergroup.save
    #     # render plain: params.inspect
    redirect_to groups_path
      end
<<<<<<< HEAD
      @groupId.destroy
      redirect_to groups_path
    end

    

    def addUserGroup
        @usergroup = UserGroup.new
        @user = User.find_by(name: params[:name])
        if @user
           if UserGroup.find_by(user_id: @user.id,group_id: $test)
            redirect_to groups_path
           else
            @usergroup.user_id = @user.id
            @usergroup.group_id=$test
            @usergroup.save
            redirect_to groups_path
           end
           
        else
            puts "-------------"
            render html: "
            <div style='background-color:#e6fff9;border:2px;border-raduis:5px;width:60%;margin:0 auto;'>
            <h1 style='margin-left:40%'>ERROR</h1>
            <ul style='margin-left:15%;font-size:30px'><strong>#{params[:name]}</strong> is Not Found Please enter Found Name!</ul>
            <a style='margin-left:35%;font-size:30px' href='http://localhost:3000/groups/'>back to group page</a>
            </div>
            ".html_safe
            puts "error in finding user"
       
            
        end
       # render plain: params.inspect
        # redirect_to groups_path
        end
    
        # def deleteUserGroup
        #     @userGroup=UserGroup.find(params[:id])
        #     @userGroup.destroy
        #     redirect_to groups_path

        # end
    private 
        def group_params
            params.require(:group).permit(:name,:user_id)
        end
=======

  def deleteUserGroup
    @userGroup = UserGroup.find(params[:id])
    @userGroup.destroy
    redirect_to groups_path
  end
>>>>>>> e52e031b56339d493e98e85e7b40d896d06fe602

  private

  def group_params
    params.require(:group).permit(:name, :user_id)
  end
end
