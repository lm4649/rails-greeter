class UsersController < ApplicationController
  def dashboard
    @cards = Card.where(user: current_user).order(event_date: :asc)
    @contributions = current_user.contributions
  end
end
