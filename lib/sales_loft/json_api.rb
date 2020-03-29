
require 'net/http'
require 'net/https'

class SalesLoft::JsonApi
  protected

  def get(path, params={})
    log_request("GET", path, params)
    query = urlencode(params)
    req = Net::HTTP::Get.new("#{full_path(path)}?#{query}")
    request(req)
  end

  def request(req)
    add_request_credentials!(req)
    with_benchmark do
      http_connection.start do |http|
        resp = http.request(req)
        extract_json(resp)
      end
    end
  end

  def with_benchmark
    result = nil
    delta = Benchmark.realtime do
      result = yield
    end
    logger.info("Request duration: %0.3f sec" % delta)
    result
  end

  def extract_json(resp)
    logger.info "Response #{resp.body}"
    JSON.parse resp.body
  end

  def add_request_credentials!(req)
    req.add_field "Authorization", "Bearer #{api_key}"
  end

  def http_connection
    logger.info(@url)
    uri = URI.parse(@url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == "https"
    http
  end

  def urlencode(params)
    params.map { |k,v| CGI.escape(k.to_s) + "=" + CGI.escape(v.to_s) }.join("&")
  end

  def full_path(path)
    path = "#{URI.parse(base_url).path}/#{path}"
    path.gsub("\/\/", "\/")
  end

  def base_url
  end

  def api_key
  end
  
  def log_request(method, endpoint, params)
    logger.info "Request to #{endpoint} via #{method}"
  end

  def logger
    Rails.logger
  end
end
