# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action do
      if session[:user_id]
        Current.user ||= User.cached_find(session[:user_id])
      elsif cookies.signed[:user_id]
        user = User.cached_find(cookies.signed[:user_id])
        if user && user.authenticated?(:remember, cookies[:remember_token])
          log_in user
          Current.user = user
        end
      elsif Rails.env.test?
        Current.user ||= User.find_by(id: ENV.fetch("user_id") { nil })
      end
    end
  end

  def authenticate
    store_location
    redirect_to login_path
  end

  def log_in(user)
    session[:user_id] = user.id
    Current.user ||= user
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def logged_in?
    Current.user.present?
  end

  def log_out
    forget Current.user
    session.delete(:user_id)
    session.delete(:forwarding_url)
    Current.user = nil
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
