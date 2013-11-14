class TransactionsController < ApplicationController

before_action :authenticated!, :current_user

  def new
  end

  def create
    @user = current_user
    @goal = Goal.find(params[:goal_id])
    @transaction = Transaction.new(user: @user, amount: params[:amount], description: params[:description], goal: @goal)

    if @transaction.save
      @achievements = Achievement.where(user: @user, goal: @goal)
      render json: [@transaction, @achievements]
    else  
      render nothing: true, status: 400
    end
  end

  def show
  end

  def index
  end

  def update
  end

  def edit
  end

  def destroy
  end

end