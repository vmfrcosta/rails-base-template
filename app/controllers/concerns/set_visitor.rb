# frozen_string_literal: true

module SetVisitor
  extend ActiveSupport::Concern

  included do
    helper_method :visitor
    before_action :visitor
  end

  private
    def visitor
      unless platform.headless? || platform.bot?
        Current.visitor ||= Visitor.identify(Current.user, cookies)
      end
    end
end
