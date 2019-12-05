class User < ApplicationRecord
  # Direct associations

  has_many   :restrictions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
