module ApplicationController::Punditable
  extend ActiveSupport::Concern
  include Pundit::Authorization

  included do
    after_action :verify_authorized, unless: :devise_controller?
    after_action :verify_policy_scoped, unless: :devise_controller?
  end
end
