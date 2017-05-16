class ApplicationController < ActionController::API
  include JsonResponse
  include PaginationInfo
end
