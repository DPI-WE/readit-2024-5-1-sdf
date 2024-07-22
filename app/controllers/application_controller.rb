class ApplicationController < ActionController::Base
  include Punditable

  skip_forgery_protection
end
