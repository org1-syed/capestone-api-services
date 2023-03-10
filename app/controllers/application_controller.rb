class ApplicationController < ActionController::API

  private
  # Ensures the request is in json format
  def ensure_json_request
    render plain: 'The content-type header is invalid.', status: :unsupported_media_type unless json_request?
  end

  # Returns boolean for request type
  def json_request?
    request.content_type.try(:include?, 'application/json')
  end

  # Render error in json format if record not destroyed
  def not_destroyed(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end
end
