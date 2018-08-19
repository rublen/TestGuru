class UsersController < AuthenticatedController
  def badges
    @badges = current_user.badges
  end
end
