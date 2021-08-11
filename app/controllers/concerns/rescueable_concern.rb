# frozen_string_literal: true

module RescueableConcern
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordInvalid, with: :validation_failed
  end

  private

  def validation_failed(exception)
    render json: exception.exception, status: :unprocessable_entity
  end
end
