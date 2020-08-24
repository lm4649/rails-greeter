# Preview all emails at http://localhost:3000/rails/mailers/card_mailer
class CardMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/card_mailer/final_card
  def final_card
    card = Card.last
    CardMailer.with(card: card).final_card
  end

  def card_to_contributors
    @contribution = Card.last.contributions.last
    CardMailer.with(contribution: @contribution).card_to_contributors
  end

end
