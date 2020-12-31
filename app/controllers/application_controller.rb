class ApplicationController < ActionController::Base

  include SetCurrentRequestDetails
  include SetPlatform
  include Authentication
end
