class SalesLoft::Gateway
  def initialize
    @api = SalesLoft::Api.new(
      ENV.fetch("SALES_LOFT_URL"),
      ENV.fetch("SALESLOFT_APPLICATION_ID"),
    )
  end

  def get_people(page: 1)
    @api.get_people(page)
  end
end
