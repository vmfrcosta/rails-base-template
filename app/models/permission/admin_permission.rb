# frozen_string_literal: true

module Permission
  class AdminPermission < UserPermission
    def initialize(user)
      super
      allow_all
    end
  end
end
