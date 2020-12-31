# frozen_string_literal: true

module HasAddresses
  extend ActiveSupport::Concern

  included do
    has_many :addresses
  end
end
