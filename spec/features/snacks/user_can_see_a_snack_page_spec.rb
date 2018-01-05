require 'rails_helper'

describe "When a user visits a snacks page" do
  context "the user sees the snack name" do
    context "the user sees the snack price" do
      context "the user sees a list of locations and machines" do
        context "the user sees average price and count of different items for those machines" do
        it "sees the snacks attributes" do
          owner = Owner.create!(name: "Tyler")
          machine = Machine.create!(location: "Mars", owner: owner)
          machine = Machine.create!(location: "Earth", owner: owner)
          snack1 = Snack.create!(name: "Beef Jerky", price: 5, machine: machine)
          snack2 = Snack.create!(name: "Granola Bar", price: 3, machine: machine)

          visit machine_path(machine)

          expect(page).to have_content(snack1.name)
          expect(page).to have_content(snack1.price)
          expect(page).to_not have_content(snack2.name)
          expect(page).to_not have_content(snack2.price)
          expect(page).to have_content(machine.average_price)
        end
      end
    end
  end
end
