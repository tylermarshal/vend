class Snack < ApplicationRecord
  has_many :machines, through: :snack_machines
  has_many :snack_machines

end
