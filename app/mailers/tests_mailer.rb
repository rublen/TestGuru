class TestsMailer < ApplicationMailer
  default from: 'dasharub2003@gmail.com'

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: "You just completed the TestGuru test!"
  end
end
