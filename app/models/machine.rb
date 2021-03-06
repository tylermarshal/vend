class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def average_price
    snacks.average(:price)
  end

  def count_unique_items
    snacks.uniq.count
  end
end
