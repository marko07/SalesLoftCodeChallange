class SalesLoft::Api < SalesLoft::JsonApi
  def initialize(url, key)
    @url = url
    @key = key
  end

  def get_people
    get "/people.json"
  end

  private 
  def base_url
    @url
  end

  def api_key
    @key
  end
end
