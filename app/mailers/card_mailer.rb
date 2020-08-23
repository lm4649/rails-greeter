class CardMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.card_mailer.final_card.subject
  #
  def final_card
    @card = params[:card]
    mail(to: @card.recipient_email, subject: "You got a Greet!")
  end

  def card_to_contributors
    @contribution = params[:contribution]
    email_with_name = %("#{@contribution.contributor_name}" <#{@contribution.contributor_email}>)
    mail(to: email_with_name, subject: "Greeter: #{@contribution.card.title}")
  end
end
