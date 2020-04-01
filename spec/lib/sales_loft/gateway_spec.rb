require 'rails_helper'

describe SalesLoft::Gateway do
  let(:gateway) do
    SalesLoft::Gateway.new
  end

  it 'returns the list of available People' do
    people = gateway.get_people
    expect(people["data"].first).to include(person_from_api)
  end

  it 'returns the list of available People on second page' do
    people = gateway.get_people(page: 2)
    expect(people["data"].last).to include(person_from_second_page_api)
  end

  it 'returns all People in a single list' do
    people = gateway.get_all_people
    expect(people["data"].first).to include(person_from_api)
    expect(people["data"].last).to include(last_person)
  end

  def person_from_api
    {
      "first_name" => "Steven",
      "last_name" => "Pease",
      "display_name" =>"Steven Pease",
      "email_address" => "sakatius@gmail.com",
    }
  end

  def person_from_second_page_api
    {
      "first_name" => "Garret",
      "last_name" => "Jacobs",
      "display_name" =>"Garret Jacobs",
      "email_address" => "laurel_bode@white.com",
    }
  end

  def last_person
    {
      "first_name" => "Orlando",
      "last_name" => "Stanton",
      "display_name" => "Orlando Stanton",
      "email_address" => "katrina_langosh@kozey.io",
    }
  end
end
