class PeopleController < ApplicationController
  def index
    @duplicated_people = []
    respond_to do |format|
      format.html
      format.json { render json: PeopleDatatable.new(view_context) }
    end
  end

  def duplicated_users
    email = params[:email]
    user_id = params[:person_id].to_i

    all_people = SalesLoft::Gateway.new.get_all_people
    @duplicated_people =
      SalesLoft::PeopleDuplicated.new(user_id, email).
        get_users_duplicated(all_people)
  end
end
