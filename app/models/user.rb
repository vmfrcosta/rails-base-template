class User < ApplicationRecord
  include HasAddresses
  include Destroyable, Registarable

  has_secure_password
end
