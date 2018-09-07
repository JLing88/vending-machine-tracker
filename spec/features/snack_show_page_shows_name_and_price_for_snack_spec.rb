require 'rails_helper'

describe 'As a visitor' do
  context 'they visit the show page for a snack' do
    it 'displays the name and price for that snack' do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
      snack_1 = machine_1.snacks.create(name: "White Castle Burger", price: 3.50)

      visit snack_path(snack_1)

      expect(page).to have_content("White Castle Burger")
      expect(page).to have_content("$#{snack_1.price}")
    end

    it "a list of locations with vending machines that carry that snack" do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
      machine_2 = sam.machines.create(location: "Pepsi Center")
      snack_1 = machine_1.snacks.create(name: "White Castle Burger", price: 3.50)
      snack_1 = machine_2.snacks.create(name: "White Castle Burger", price: 3.50)

      visit snack_path(snack_1)

      expect(page).to have_content(machine_1.location)
      expect(page).to have_content(machine_2.location)
    end
  end
end
