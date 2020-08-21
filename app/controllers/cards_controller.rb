class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :show, :preview]
  skip_before_action :authenticate_user!, only: :show

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    @card.event_date = Date.today
    if @card.save
      redirect_to edit_card_path(@card)
    else
      render :new
    end
  end

  def edit
    # @card = Card.find(params[:id])
    @manager_contribution = manager_contribution(@card)
  end

  def update
    # @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to card_path(@card)
    else
      render :edit
    end
  end

  def show
    # @card = Card.find(params[:id])
    @contribution = Contribution.new
    @manager_contribution = manager_contribution(@card)
    # @external_contributions = @card.contributions.select { |contribution| contribution.user.nil? }
    @contributions = @card.contributions
    @curated_contributions = @card.contributions.reject { |contribution| contribution.rejected? }
  end

  def preview
    @external_contributions = @card.contributions.select { |contribution| contribution.user.nil? }
    @curated_contributions = @card.contributions.reject { |contribution| contribution.rejected? }
  end

  private

  def manager_contribution(card)
    # return the manager contribution to the card or nill
    card.contributions.select { |contribution| contribution.user == current_user }.first
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :recipient, :event_date, :description, :draft, :preview)
  end
end
