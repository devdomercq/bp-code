require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "email_sender" do
    mail = ModelMailer.email_sender
    assert_equal "Email sender", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
