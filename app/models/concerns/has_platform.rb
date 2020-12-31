# frozen_string_literal: true

module HasPlatform
  extend ActiveSupport::Concern

  included do
    enum platform: [:unknown, :desktop, :iphone, :android, :mobile]
    before_create -> { self.platform = PlatformAgent.new(Current.user_agent).to_i }
  end
end
