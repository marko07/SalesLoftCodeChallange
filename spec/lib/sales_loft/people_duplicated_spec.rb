require 'rails_helper'

describe SalesLoft::PeopleDuplicated do
  let(:people_duplicated) { SalesLoft::PeopleDuplicated.new(1, email) }
  let(:email) { "sakatius@gmail.com" } #first email on the API call
  let(:duplicated_email) { "sakatiuss@gmail.com" } 
  let(:different_email) { "its_a_new_different_email@test.com" }

  it 'validates if the email is duplicated' do
    duplicated = people_duplicated.is_duplicated?(duplicated_email)
    expect(duplicated).to be_truthy

    duplicated = people_duplicated.is_duplicated?(different_email)
    expect(duplicated).to be_falsey
  end

  it 'return the list of duplicate people' do
    list = people_duplicated.get_users_duplicated(list_of_people)
    expect(list.size).to eq 2
    expect(list.first["email_address"]).to eq duplicated_email
    expect(list.first["display_name"]).to eq "Possibly Duplicate"
  end

  private

  def list_of_people
    {
      "metadata" => {},
      "data" =>
      [
        {
          "id" => 1,
          "first_name" => "Steven",
          "last_name" => "Pease",
          "display_name" => "Steven Pease",
          "email_address" => "sakatius@gmail.com",
        },
        {
          "id" => 2,
          "first_name" => "Possibly",
          "last_name" => "Duplicate",
          "display_name" => "Possibly Duplicate",
          "email_address" => "sakatiuss@gmail.com",
        },
        {
          "id" => 3,
          "first_name" => "Other Possibly",
          "last_name" => "Duplicate",
          "display_name" => "Possibly Duplicate",
          "email_address" => "sbkatius@gmail.com",
        },
        {
          "id" => 4,
          "first_name" => "Marco",
          "last_name" => "Pacheco",
          "display_name" => "Marco Pacheco",
          "email_address" => "marcopache@gmail.com",
        },
      ]
    }
  end
end
