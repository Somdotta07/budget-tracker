class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end


  def show

    @group = Group.find(params[:id])
  end


  def new

    @group = Group.new
  end

  def create

    @group = Group.create(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  def destroy

    @group = Group.find_by(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
