class ConnectionsController < ApplicationController

  before_action :current_user

  def create
    @connection = @current_user.connections.build(:friend_id => params[:friend_id])
    if @connection.save
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