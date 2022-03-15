class ExpensesController < ApplicationController
  load_and_authorize_resource
  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.all.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.new
  end

  def create

    @group = Group.find(params[:group_id])
    @expense = @group.expenses.create(name: expense_params[:name], amount: expense_params[:amount],
                                      user_id: current_user.id, group_id: @group.id)

    respond_to do |format|
      format.html do
        if @expense.save
          redirect_to group_expenses_path(@group.id), notice: 'You have successfully created a transaction.'
        else
          render :new, alert: 'Error: Transaction could not be saved'
        end
      end
    end
  end


  def destroy
  
    @expense = Expense.find_by(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
