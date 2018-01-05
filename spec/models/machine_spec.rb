require 'rails_helper'

describe Machine do
  context "instance methods" do
    it "#average_price" do
      owner = Owner.create!(name: "Jeff")
      machine = Machine.create!(location: "Turing", owner: owner)
      snack1 = Snack.create!(name: "Chips", price: 1)
      snack2 = Snack.create!(name: "Cookies", price: 3)
      snack_machine = SnackMachine.create!(machine: machine, snack: snack1)
      snack_machine = SnackMachine.create!(machine: machine, snack: snack2)

      expect(machine.average_price).to eq(2)
    end
    it "#count_unique_items" do
      owner = Owner.create!(name: "Tyler")
      machine1 = Machine.create!(location: "Mars", owner: owner)
      machine2 = Machine.create!(location: "Earth", owner: owner)
      snack1 = Snack.create!(name: "Beef Jerky", price: 5)
      snack2 = Snack.create!(name: "Granola Bar", price: 3)
      SnackMachine.create!(machine: machine1, snack: snack1)
      SnackMachine.create!(machine: machine2, snack: snack1)
      SnackMachine.create!(machine: machine2, snack: snack2)

      expect(machine1.count_unique_items).to eq(2)
    end
  end
end
