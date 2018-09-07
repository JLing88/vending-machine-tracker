require 'rails_helper'

describe 'As a user' do
  context 'they visit the machine show page' do
    it 'it displays a list of snack names and prices' do

      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
      snack_1 = machine_1.snacks.create(name: "White Castle Burger", price: 3.50)
      snack_2 = machine_1.snacks.create(name: "Pop Rocks", price: 1.50)
      snack_3 = machine_1.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)

      visit machine_path(machine_1)

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_2.name)
      expect(page).to have_content(snack_3.name)
      expect(page).to have_content("$#{snack_1.price}")
      expect(page).to have_content("$#{snack_2.price}")
      expect(page).to have_content("$#{snack_3.price}")
    end

    it 'displays the average price of all snacks in the machine' do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
      snack_1 = machine_1.snacks.create(name: "White Castle Burger", price: 3.50)
      snack_2 = machine_1.snacks.create(name: "Pop Rocks", price: 1.50)
      snack_3 = machine_1.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)

      visit machine_path(machine_1)
      expect(page).to have_content("Average Price: $#{machine_1.average_price}")
    end
  end
end
