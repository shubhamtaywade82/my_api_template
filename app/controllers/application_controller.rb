class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: "Access denied"}, status: :forbidden
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
