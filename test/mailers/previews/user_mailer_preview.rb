# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/final_card
  def final_card
    card = Card.last
    UserMailer.with(card: card).final_card
  end

end
