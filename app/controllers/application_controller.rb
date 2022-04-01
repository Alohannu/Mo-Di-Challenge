class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[home redirect]
end
