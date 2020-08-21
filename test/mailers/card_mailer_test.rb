require 'test_helper'

class CardMailerTest < ActionMailer::TestCase
  test "final_card" do
    mail = CardMailer.final_card
    assert_equal "Final card", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
