class ContributionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.user = current_user
    @card = Card.find(params[:card_id])
    @contribution.card = @card
    @contribution.user = current_user if @card.user == current_user
    if @contribution.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  def update
    @contribution = Contribution.find(params[:id])
    @contribution.update(rejected: params[:rejected])
    redirect_to card_path(@contribution.card)
  end

  private

  def contribution_params
    params.require(:contribution).permit(:contributor_name, :content, :rejected)
  end
end
