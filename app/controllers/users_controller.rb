class UsersController < ApplicationController
  def dashboard
    @cards = current_user.cards
    @contributions = current_user.contributions
  end
end
