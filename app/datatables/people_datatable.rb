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
      columns << new_button(email, person["id"], "btn-char-count", "Count")
      columns <<
        new_button(email, person["id"], "btn-user-duplicates", "Duplicates")
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

  def new_button(email, user_id, button_class, title)
    "<button type='button' class='btn btn-primary #{button_class}'" \
      "data-user-id=#{user_id}, data-user-email=#{email}>#{title}</button>"
  end
end
