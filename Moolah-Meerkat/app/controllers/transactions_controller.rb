class TransactionsController < ApplicationController

before_action :authenticated!, :current_user

  def new
  end

  def create
    #@transaction = Transaction.new(transaction_params)
    @transaction = Transaction.new(user_id: params[:user_id], amount: params[:amount], description: params[:description])
      @goal = Goal.find(params[:goal_id])
    if @transaction.save
      @goal.transactions << @transaction
    end  
    redirect_to user_goal_path(@current_user, @goal)
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

# private

#   def transaction_params
    #params.require(:transaction).permit(:user_id, :goal_id, :description, :amount)

  # end

end