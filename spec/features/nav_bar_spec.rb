require 'rails_helper'

describe "Navigation bar" do
  it 'changes to /notes page' do
    visit root_path
    click_on "Notes"
    expect(page).to have_content "Some particulary notes about the process"
  end

  it 'changes to /marco page' do
    visit root_path
    click_on "Marco"
    expect(page).to have_content "About me!"
  end

  it 'changes to /people page' do
    visit marco_path
    click_on "People"
    expect(page).to have_content "This is the list of available People"
  end
end
