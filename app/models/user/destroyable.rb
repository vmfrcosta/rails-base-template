# frozen_string_literal: true

module User::Destroyable
  extend ActiveSupport::Concern

  def soft_destroy
    update_attributes! first_name: nil,
                       last_name: nil,
                       email: "#{SecureRandom.hex}@destroyed.com",
                       password: SecureRandom.hex,
                       phone: nil,
                       destroyed_at: Time.zone.now,
                       remember_digest: nil,
                       google_uid: nil,
                       google_expires_at: nil,
                       google_token: nil,
                       facebook_uid: nil,
                       facebook_expires_at: nil,
                       facebook_token: nil
  end

  def destroyed?
    destroyed_at.present?
  end
end
