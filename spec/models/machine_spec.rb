require 'rails_helper'

describe Machine do
  it "#instance methods" do
    owner = Owner.create!(name: "Jeff")
    machine = Machine.create!(location: "Turing", owner: owner)
    snack1 = Snack.create!(name: "Chips", price: 1, machine: machine)
    snack2 = Snack.create!(name: "Cookies", price: 3, machine: machine)

    expect(machine.average_price).to eq(2)
  end
end