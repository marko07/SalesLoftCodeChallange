require 'rails_helper'

describe SalesLoft::Api do
  let(:url) { ENV.fetch("SALES_LOFT_URL") }
  let(:key) { ENV.fetch("SALESLOFT_APPLICATION_ID") }
  
  it "returns a list of available people" do
    people = SalesLoft::Api.new(url, key).get_people(page = 1)
    expect_any_data(people)
  end

  it 'retrieves the second page of the list' do
    people = SalesLoft::Api.new(url, key).get_people(page = 2)
    expect_any_data(people)
  end

  private

  def expect_any_data(people)
    expect(people["metadata"]).not_to be_empty
  end
end
