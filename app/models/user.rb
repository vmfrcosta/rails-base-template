class User < ApplicationRecord
  include HasAddresses
  include Destroyable, Registrable

  has_secure_password
end
