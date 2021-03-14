class ApplicationController < ActionController::Base
private

  def current_donator
    @current_donator ||= Donator.find_by(id: session[:donator_id]) || Donator.new
  end
  helper_method :current_donator

  def current_admin; end

  def known_user?
    current_donator || current_admin
  end

  def error(message)
    Rails.logger.error(message)
    render json: { errors: [message] }, status: :unprocessable_entity
  end
end
