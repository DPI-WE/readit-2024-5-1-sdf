class ApplicationController < ActionController::Base
  include Deviseable, Punditable

  skip_forgery_protection
end
