class ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.user = current_user
    @card = Card.find(params[:card_id])
    @contribution.card = @card if @card.user == current_user
    if @contribution.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  def update
    @contribution = Contribution.find(params[:id])
    @contribution.update(contribution_params)
    # TO DO RAISE AN ALERT IF THE UPDATE FAILS
    redirect_to card_path(@contribution.card)
  end

  private

  def contribution_params
    params.require(:contribution).permit(:contributor_name, :content, :rejected)
  end
end
