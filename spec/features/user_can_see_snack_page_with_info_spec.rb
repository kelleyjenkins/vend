require 'rails_helper'

feature "When a user visits the vending machine show" do
  scenario "they see a list of vending machine snacks and prices" do
    owner = Owner.create(name: "Sam's Snacks")
    machine = owner.machines.create(location: "Don's Mixed Drinks")
    machine2 = owner.machines.create(location: "Turing's Basement")

    snack = Snack.create(name: "Twix", price: 1.50)

    MachineSnack.create(snack: snack, machine: machine)
    MachineSnack.create(snack: snack, machine: machine2)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
    expect(page).to have_content(machine.location)
    expect(page).to have_content(machine.average_price)
    expect(page).to have_content(machine.snacks.count)

    expect(page).to have_content(machine2.location)
    expect(page).to have_content(machine2.average_price)
    expect(page).to have_content(machine2.snacks.count)

  end
end
