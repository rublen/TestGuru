class TestsMailer < ApplicationMailer
  default from: 'aprilsunday.lr@gmail.com'

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: "You just completed the TestGuru test!"
  end
end
