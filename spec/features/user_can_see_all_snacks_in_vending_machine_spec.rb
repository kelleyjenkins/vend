require 'rails_helper'

feature "When a user visits the vending machine show" do
  scenario "they see a list of vending machine snacks and prices" do
    owner = Owner.create(name: "Sam's Snacks")
    machine = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = machine.snacks.create(name: "Twix", price: 1.50)
    snack_2 = machine.snacks.create(name: "Hersheys", price: 1.00)

    visit machine_path(machine)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)

  end
end
