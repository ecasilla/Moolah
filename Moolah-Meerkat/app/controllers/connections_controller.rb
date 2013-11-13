class ConnectionsController < ApplicationController

  before_action :current_user

  def create
    @connection1 = Connection.new(user_id: @current_user.id, friend_id: params[:friend_id])
    @connection2 = Connection.new(user_id: params[:friend_id], friend_id: @current_user.id)
    if @connection1.save && @connection2.save
      redirect_to user_path(@current_user)
    else
      redirect to user_path(params[:friend_id])
    end
  end

  def index
  end

  def destroy
  end

  private

  def connection_params
    params.require(:connection).permit(:friend_id, :id)
  end

end