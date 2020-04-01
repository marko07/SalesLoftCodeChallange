require 'similar_text'

class SalesLoft::PeopleDuplicated
  def initialize(id, email)
    @id = id
    @email = email
  end

  def get_users_duplicated(list_of_people)
    duplicate_people = []

    list_of_people["data"].each do |person|
      if @id != person["id"] && is_duplicated?(person["email_address"])
        duplicate_people << person
      end
    end

    duplicate_people
  end

  def is_duplicated?(other_email)
    email_root = @email.split("@").first
    other_email_root = other_email.split("@").first
    email_root.similar(other_email_root) > 85
  end
end
