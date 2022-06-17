class Player < ApplicationRecord
  validades :name, :email, presence: true
end
