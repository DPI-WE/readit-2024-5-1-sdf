class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action { authorize(:dashboard) }
  skip_after_action :verify_policy_scoped

  def index
  end
end
