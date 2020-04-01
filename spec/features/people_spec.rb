require 'rails_helper'

describe "People", :js do
  let(:cvent_gateway) do
    OnsiteCheckin::CventOnsiteGateway.new(cvent_credentials)
  end
  let(:cvent_credentials) do
    {
      "cvent_api_url" => ENV.fetch("TEST_CVENT_SANDBOX_URL"),
      "cvent_api_key" => ENV.fetch("TEST_CVENT_API_KEY"),
      "cvent_api_secret" => ENV.fetch("TEST_CVENT_API_SECRET"),
      "cvent_event_id" => cvent_event_id,
    }
  end

  it 'display the list of available People' do
    visit people_path
    expect_first_person_of_list
  end

  it 'display last person available' do
    visit people_path
    find_by_id("DataTables_Table_0_last").click
    expect_last_person_of_list
  end

  it 'displays the modal for char counts' do
    visit people_path
    click_on("Count", match: :first)
    expect(page).to have_content "Email unique char count"
    expect(page).to have_content "a	3"
  end

  it 'displays duplicated users' do
    visit people_path
    click_on("Duplicates", match: :first)
    sleep(3)
    expect(page).to have_content "These are the possible duplicated users."
    expect(page).to have_content "Possibly Duplicate	sakatiuss@gmail.com"
  end

  private

  def expect_first_person_of_list
    expect(page).to have_content "Steven Pease"
    expect(page).to have_content "sakatius@gmail.com"
    expect(page).to have_content "Software Engineer"
  end

  def expect_last_person_of_list
    expect(page).to have_content "Camryn Quigley"
    expect(page).to have_content "llewellyn_witting@klocko.biz"
    expect(page).to have_content "Legacy Quality Technician"
  end
end
