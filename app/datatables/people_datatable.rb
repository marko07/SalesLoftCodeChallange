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
      columns << add_ajax_button(person["id"], email)
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

  def add_ajax_button(user_id, email)
    "<a data-remote='true' class='btn btn-info' rel='nofollow' data-method='get' href='/people/#{user_id}/duplicated_users?email=#{email}'>Duplicates</a>"
  end
end
