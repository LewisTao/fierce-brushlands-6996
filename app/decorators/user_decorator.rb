class UserDecorator < Draper::Decorator
  delegate_all

  def user_info
    as_json(
      only: [:id, :email]
      )
  end
end
