require 'rails_helper'

describe SalesLoft::Api do
  let(:url) { ENV.fetch("SALES_LOFT_URL") }
  let(:key) { ENV.fetch("SALESLOFT_APPLICATION_ID") }
  
  it "returns a list of available people" do
    people = SalesLoft::Api.new(url, key).get_people(page = 1, 25)
    expect_any_data(people)
  end

  it 'retrieves the second page of the list' do
    people = SalesLoft::Api.new(url, key).get_people(page = 2, 25)
    expect_any_data(people)
  end

  it 'retrives data by per_page param' do
    people = SalesLoft::Api.new(url, key).get_people(page = 2, 100)
    expect(people["data"].size).to eq 100
  end

  private

  def expect_any_data(people)
    expect(people["metadata"]).not_to be_empty
  end
end
