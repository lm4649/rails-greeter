class CardsController < ApplicationController
  before_action :set_flat, only: [:edit, :update, :show]
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    if @card.save
      redirect_to edit_card(@card)
    else
      render :new
    end
  end

  def edit
    # @card = Card.find(params[:id])
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
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :recipient, :event_date, :description, :draft)
  end
end
