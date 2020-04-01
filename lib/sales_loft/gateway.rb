class SalesLoft::Gateway
  def initialize
    @api = SalesLoft::Api.new(
      ENV.fetch("SALES_LOFT_URL"),
      ENV.fetch("SALESLOFT_APPLICATION_ID"),
    )
  end

  def get_people(page: 1, per_page: 25)
    @api.get_people(page, per_page)
  end

  def get_all_people
    all_available_people = {
      total: 0,
      data: []
    }

    people = @api.get_people(page = 1, 100)
    all_available_people[:data] << people["data"]
    all_available_people[:total] =+ people["data"].size

    next_page = people["metadata"]["paging"]["next_page"]
    while !next_page.nil? do
      people = @api.get_people(page = next_page, 100)
      all_available_people[:data] << people["data"]
      all_available_people[:total] += people["data"].size
      next_page = people["metadata"]["paging"]["next_page"]
    end

    all_available_people[:data] = all_available_people[:data].flatten
    all_available_people
  end
end
