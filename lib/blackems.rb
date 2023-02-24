class Blackems
  def self.sendEmail(options = {}, data = {})
      url = options.fetch(:url)
      api_token = options.fetch(:api_token)
      to = options.fetch(:to)
      from = options.fetch(:from)
      subject = options.fetch(:subject)
      template_num = options.fetch(:template_num)

      uri = URI(url + api_token)
      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        request.body = {to: to, from: from, subject: subject, templateNum: template_num, data: data}.to_json
        response = http.request(request) # Net::HTTPResponse object
        puts "response #{response.body}"
      end

  end
end

require 'uri'
require 'net/http'
require 'json'