class SalesLoft::Api < SalesLoft::JsonApi
  def initialize(url, key)
    @url = url
    @key = key
  end

  def get_people(page, per_page)
    get "/people.json?page=#{page}&per_page=#{per_page}"
  end

  private 
  def base_url
    @url
  end

  def api_key
    @key
  end
end
