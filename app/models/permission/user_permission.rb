# frozen_string_literal: true

module Permission
  class UserPermission < GuestPermission
    def initialize(user)
      super()
      user_basic_permission
      user_resource_permission user
      user_custom_permission user
    end

    private
      def owner?(model, user)
        user.admin? || (model && model.try(:user_id) == user.id)
      end

      def user_basic_permission
        # i.e.:
        # allow "sessions", [:destroy]
      end

      def user_resource_permission(user)
        # i.e.:
        # allow "*", ["*"] do |model|
        #   model && model.try(:user_id) == user.id
        # end
      end

      def user_custom_permission(user)
        # i.e.:
        # allow "cart_items", [:update] do |model|
        #   owner?(model.order, user)
        # end
      end
  end
end
