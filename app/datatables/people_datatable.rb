class PeopleDatatable < ApplicationDatatable

  private

  def data
    rows = []
    fetch_people.each do |person|
      columns = []
      email = person["email_address"]
      columns << person["display_name"]
      columns << email
      columns << person["title"]
      columns << button_char_email_count(email, person["id"])
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

  def button_char_email_count(email, user_id)
    "<button type='button' class='btn btn-primary btn-char-count'" \
      "data-user-id=#{user_id}, data-user-email=#{email}>Count</button>"
  end
end
