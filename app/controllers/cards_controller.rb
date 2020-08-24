class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :show, :preview, :send_card]
  skip_before_action :authenticate_user!, only: [:show, :preview]

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
    @contributions = @card.contributions
    @curated_contributions = @card.contributions.reject { |contribution| contribution.rejected? }
  end

  def send_card
    CardMailer.with(card: @card).final_card.deliver_now
    send_to_contributors
    redirect_to card_preview_path(@card)
  end

  private

  def send_to_contributors
    @filtered_contributions = card.contributions.reject { |contribution| contribution.rejected || contribution.contributor_email.nil? }
    @filtered_contributions.each { |contribution| CardMailer.with(contribution: contribution).card_to_contributors.deliver_now }
  end

  def manager_contribution(card)
    # return the manager contribution to the card or nill
    card.contributions.select { |contribution| contribution.user == current_user }.first
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :recipient, :recipient_email, :event_date, :description, :draft, :preview, :photo)
  end
end
