# frozen_string_literal: true

module Referer
  extend ActiveSupport::Concern

  included do
    before_action do
      @referer = params[:referer] || request.referer
      @referer = nil if @referer == request.original_url
    end
  end
end
