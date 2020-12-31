# frozen_string_literal: true

module HasAddresses
  extend ActiveSupport::Concern

  has_many :addresses
end
