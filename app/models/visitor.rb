# frozen_string_literal: true

class Visitor < ApplicationRecord
  include HasPlatform
  
  has_one :account
  has_one :user
  
  has_many :events
  has_many :orders
  has_many :event_rsvps
  has_many :testimonial
  has_many :sympathy_cards
  
  def self.identify(user, cookies)
    # Get the visitor
    visitor ||= user&.visitor
    visitor ||= cookies.signed[:visitor_id] && Visitor.find_by(id: cookies.signed[:visitor_id])
    visitor ||= Visitor.create! user_agent: Current.user_agent, accept_language: Current.accept_language
    
    # If we have a user but not a visitor, assign visitor to user
    if user && user.visitor_id.nil?
      user.update_column :visitor_id, visitor.id
    end
    
    # If the id in the cookies is different from the id of the visitor we found, overwrite
    if cookies.signed[:visitor_id] != visitor.id
      cookies.permanent.signed[:visitor_id] = visitor.id
    end
    
    # All done, return the visitor
    visitor
  end
end
