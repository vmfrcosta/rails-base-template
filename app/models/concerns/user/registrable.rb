# frozen_string_literal: true

module User::Registrable
  extend ActiveSupport::Concern

  included do
    attr_accessor :current_password

    validate :validate_change_password, on: :password

    def self.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def self.new_token
      SecureRandom.urlsafe_base64
    end
  end

  def oauth?
    google? || facebook?
  end

  def google?
    self.google_uid.present?
  end

  def facebook?
    self.facebook_uid.present?
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update(remember_digest: nil,
           facebook_token: nil,
           facebook_expires_at: nil,
           google_token: nil,
           google_expires_at: nil)
  end
end
