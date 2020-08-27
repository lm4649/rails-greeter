class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :show, :preview, :send_card]
  skip_before_action :authenticate_user!, only: [:show, :preview]
  MAX_CARDS = 15

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    @card.event_date = Date.today if @card.event_date.blank?
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
    prepare_curated_contributions
  end

  def preview
    prepare_curated_contributions
    @fullscreen = true
  end

  def send_card
    CardMailer.with(card: @card).final_card.deliver_now
    send_to_contributors
    sleep(3)
    @card.update(draft: false)
    redirect_to card_preview_path(@card)
  end

  private

  def prepare_curated_contributions
    @contributions = @card.contributions
    @filtered_contributions = @card.contributions.reject { |contribution| contribution.rejected? }
    @curated_contributions = turn_pages(@filtered_contributions)
  end

  def turn_pages(contributions)
    @page_num =  (contributions.count / MAX_CARDS.to_f).ceil
    @page = params[:page].blank? ? 1 : params[:page].to_i
    @page = 1 if @page > @page_num
    @page = @page_num if @page < 1
    @last_contribution = @page_num > 1 ? @page * MAX_CARDS : contributions.count
    @first_contribution = @page_num > 1 ?  @last_contribution - MAX_CARDS : 0
    contributions[@first_contribution...@last_contribution]
  end

  def send_to_contributors
    @filtered_contributions = @card.contributions.reject { |contribution| contribution.rejected || contribution.contributor_email.blank? }
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
    params.require(:card).permit(:title, :recipient, :recipient_email, :event_date, :description, :draft, :preview, :photo, :template)
  end
end
