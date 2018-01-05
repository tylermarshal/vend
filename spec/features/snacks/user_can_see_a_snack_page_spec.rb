require 'rails_helper'

describe "When a user visits a snacks page" do
  context "the user sees the snack name" do
    context "the user sees the snack price" do
      context "the user sees a list of locations and machines" do
        context "the user sees average price and count of different items for those machines" do
        it "sees the snacks attributes" do
          owner = Owner.create!(name: "Tyler")
          machine1 = Machine.create!(location: "Mars", owner: owner)
          machine2 = Machine.create!(location: "Earth", owner: owner)
          snack1 = Snack.create!(name: "Beef Jerky", price: 5)
          snack2 = Snack.create!(name: "Granola Bar", price: 3)
          SnackMachine.create!(machine: machine1, snack: snack1)
          SnackMachine.create!(machine: machine2, snack: snack1)
          SnackMachine.create!(machine: machine2, snack: snack2)

          visit machine_path(machine)

          expect(page).to have_content(snack1.name)
          expect(page).to have_content(snack1.price)
          expect(page).to_not have_content(snack2.name)
          expect(page).to_not have_content(snack2.price)
          expect(page).to have_content("#{machine1.location} Vending Machine")
          expect(page).to have_content(machine1.average_price)
          expect(page).to have_content(machine1.count_unique_items)
          expect(page).to have_content("#{machine2.location} Vending Machine")
          expect(page).to have_content(machine1.average_price)
          expect(page).to have_content(machine2.count_unique_items)
        end
      end
    end
  end
end
