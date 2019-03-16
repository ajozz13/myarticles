class ApplicationController < ActionController::API

  def respond obj, code, msg, stat=:not_found
    render json: { code: code, message: msg, data: obj, url: request.url, is_error: ( code > 0 ) }, status: stat
  end

end
