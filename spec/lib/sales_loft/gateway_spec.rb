require 'rails_helper'

describe SalesLoft::Gateway do
  let(:gateway) do
    SalesLoft::Gateway.new
  end

  it 'returns the list of available People' do
    people = gateway.get_people
    expect(people["data"].first).to include(person_from_api)
  end

  def person_from_api
    {
      "first_name" => "Steven",
      "last_name" => "Pease",
      "display_name" =>"Steven Pease",
      "email_address" => "sakatius@gmail.com",
    }
  end
end
