class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snacks, through: :snack_machines
  has_many :snack_machines

  def average_price
    snacks.average(:price)
  end
end
