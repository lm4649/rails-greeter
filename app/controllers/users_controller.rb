class UsersController < ApplicationController
  def dashboard
    @cards = User.cards
    @contributions = User.contributions
  end
end
