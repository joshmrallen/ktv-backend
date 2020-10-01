require 'uri'
require 'net/http'
require 'openssl'

# url = URI("https://canarado-lyrics.p.rapidapi.com/lyrics/money%2520maker")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-host"] = 'canarado-lyrics.p.rapidapi.com'
# request["x-rapidapi-key"] = '5c0b2e9061msh39f401d85a10f5ep18bdc6jsn464860f44595'

# response = http.request(request)
# results = JSON.parse(response.read_body)
# binding.pry
# puts response.read_body