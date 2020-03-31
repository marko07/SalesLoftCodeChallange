require 'rails_helper'

describe "People" do
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

  it 'display the list of available People', js: true do
    visit people_path
    expect(page).to have_content "This is the list of available People"
    expect_first_person_of_list
  end

  private

  def expect_first_person_of_list
    expect(page).to have_content "Steven Pease"
    expect(page).to have_content "sakatius@gmail.com"
    expect(page).to have_content "Software Engineer"
  end
end
