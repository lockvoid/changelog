module Constraints
  class Authenticated
    def matches?(request)
      user = current_user(request)

      user.present?
    end

  protected

    def current_user(request)
      User.find_by_id request.session[:user_id]
    end
  end
end