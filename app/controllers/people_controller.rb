class PeopleController < ApplicationController
  def index
    gateway = SalesLoft::Gateway.new
    raw_people = gateway.get_people
    @people = raw_people["data"]
  end
end
