require 'rails_helper'

describe "When a user visits a machines page" do
  context "the user sees a list of snacks" do
    context "the user sees the price for each snack" do
      context "the user sees the average price for all snacks" do
        it "sees the vending machines attributes" do
          owner = Owner.create!(name: "Jeff")
          machine = Machine.create!(location: "Turing", owner: owner)
          snack1 = Snack.create!(name: "Chips", price: 1, machine: machine)
          snack2 = Snack.create!(name: "Cookies", price: 3, machine: machine)

          visit machine_path(machine)

          expect(page).to have_content(snack1.name)
          expect(page).to have_content(snack1.price)
          expect(page).to have_content(snack2.name)
          expect(page).to have_content(snack2.price)
          expect(page).to have_content(machine.average_price)
        end
      end
    end
  end
end
