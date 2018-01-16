# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include JsonResponse
  include PaginationInfo
end
