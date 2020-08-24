class ContributionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    # @contribution.user = current_user
    @card = Card.find(params[:card_id])
    @contribution.card = @card
    @contribution.user = current_user if @card.user == current_user
    # raise
    if @contribution.save
      if @contribution.user
        redirect_to card_path(@card)
      else
        sleep(3)
        redirect_to card_preview_path(@card)
      end
    else
      # raise
      redirect_to card_path(@card), alert: "invalid name or invalid email"
    end
  end

  def update
    @contribution = Contribution.find(params[:id])
    @contribution.update(rejected: params[:rejected])
    redirect_to card_path(@contribution.card, anchor: "glide-anchor")
  end

  private

  def contribution_params
    params.require(:contribution).permit(:contributor_name, :contributor_email, :content, :rejected, :photo)
  end
end
