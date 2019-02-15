class BallotGroupsController < ApplicationController
  def index
    @ballot_groups = BallotGroup.accessible_by(current_ability, :read)
      .page(params[:page]).per(25)
  end

  def new
    authorize! :create, BallotGroup
    @ballot_group = BallotGroup.new
  end

  def edit
    @ballot_group = BallotGroup.find(params[:id])
    authorize! :update, @ballot_group
  end

  def create
    authorize! :create, BallotGroup
    @ballot_group = BallotGroup.new(ballot_group_params)
    @ballot_group.owner = current_user
    ActiveRecord::Base.transaction do
      if @ballot_group.save
        current_user.update(ballot_group: @ballot_group)
        redirect_to @ballot_group
      else
        render 'new' and return
      end
    end
  end

  def update
    @ballot_group = BallotGroup.find(params[:id])
    authorize! :update, @ballot_group
    if @ballot_group.update(ballot_group_params)
      redirect_to @ballot_group
    else
      render 'edit'
    end
  end

  def show
    @ballot_group = BallotGroup.eager_load(:members).find(params[:id])
    authorize! :read, @ballot_group
  end

  def destroy
    @ballot_group = BallotGroup.find(params[:id])
    authorize! :destroy, @ballot_group
    @ballot_group.destroy
    redirect_to ballot_groups_path
  end

  def order
    @ballot_groups = BallotGroup.accessible_by(current_ability, :read)
      .order(:position_in_ballot)
  end

  def join
    @ballot_group = BallotGroup.find(params[:id])
    authorize! :join, @ballot_group
    if params[:token] == @ballot_group.token
      current_user.update(ballot_group: @ballot_group)
    end
    redirect_to @ballot_group
  end

  private

  def ballot_group_params
    params.require(:ballot_group).permit(:name, :owner)
  end
end
