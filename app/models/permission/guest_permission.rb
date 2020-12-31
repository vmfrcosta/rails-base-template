# frozen_string_literal: true

module Permission
  class GuestPermission < BasePermission
    def initialize
      guest_basic_permission
      guest_auth_permission
      guest_custom_permission
    end

    private
      def guest_basic_permission
        allow "users", [:new, :create]
      end

      def guest_auth_permission
        allow "invitations/images", "show" do |model, auth_token|
          model.signed_id == auth_token || Current.user&.admin?
        end
      end

      def guest_custom_permission
        allow "orders/gift_registries/order_items", [:create, :update] do |model|
          model.cart? # User specific authorization will be handled in the controller due to cookie requirements
        end
      end
  end
end
