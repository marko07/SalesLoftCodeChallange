class PeopleDatatable < ApplicationDatatable

  private

  def data
    rows = []
    fetch_people.each do |person|
      columns = []
      columns << person["display_name"]
      columns << person["email_address"]
      columns << person["title"]
      rows << columns
    end
    rows
  end

  def people
    @people ||= fetch_people
  end

  def fetch_people
    gateway = SalesLoft::Gateway.new
    raw_people = gateway.get_people(page: page)
    @people = raw_people["data"]
  end
end
