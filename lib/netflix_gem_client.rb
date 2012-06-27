require 'faraday'
require 'json'
require 'openssl'
require 'base64'
require 'digest/sha1'

module NetflixGem
	class Client
		# id = '70144647'
		oauth_consumer_key = 'rbjwk4ehxmnnwtafhsmhyc2e'
		oauth_nonce = Random.rand(100000).to_s
		oauth_signature_method = 'HMAC-SHA1'
		oauth_timestamp = Time.now.to_i.to_s
		oauth_version = '1.0'

		url =  'http://api.netflix.com/catalog/titles/index'

		parameters = 'oauth_consumer_key=' +
		              oauth_consumer_key +
		              '&oauth_nonce=' +
		              oauth_nonce +
		              '&oauth_signature_method=' +
		              oauth_signature_method +
		              '&oauth_timestamp=' +
		              oauth_timestamp +
		              '&oauth_version=' +
		              oauth_version

		base_string = 'GET&' + CGI.escape(url) + '&' + CGI.escape(parameters)

	
		secret_key = 'mt7NtrAfwJ&' 
		oauth_signature = CGI.escape(Base64.encode64("#{OpenSSL::HMAC.digest('sha1',secret_key, base_string)}").chomp)

		testable_url = url + '?' + parameters + '&oauth_signature=' + oauth_signature
		p testable_url
# 		def initialize(options={})
# 			options[:url] ||= "http://api-public.netflix.com/"
# 			@conn = Faraday.new(:url => options[:url])
# 			@token = "rbjwk4ehxmnnwtafhsmhyc2e"
# 			@shared_secret = "mt7NtrAfwJ"
# 			@time = Time.now.to_i.to_s
#       @options = options
#       @nonce = rand(10 ** 30).to_s.rjust(30,'0')
#       @signature = sign(@token, @shared_secret, )
# 		end

# 		def get_netflix_movies
# 			resp = @conn.get do |req|
#         req.url "catalog/titles/movies/70189289"
#         req.params["oauth_consumer_key"] = @token
#         req.params["oauth_nonce"] = @nonce
#         req.params["oauth_signature_method"] = "HMAC-SHA1"
#         req.params["oauth_timestamp"] = @time
#         req.params["oauth_version"] = "1.0"
#         req.params["oauth_signature"] = URI.encode(@signature)
#       end
# 		end
	

# 		def sign(key, secret, base_string)
# 		  digest = OpenSSL::Digest::Digest.new( 'sha1' )
# 		  hmac = OpenSSL::HMAC.digest( digest, key, base_string  )
# 		  Base64.encode64( hmac ).chomp.gsub( /\n/, '' )
# 		end
	end	
end






