require 'httparty'
require 'pry'
require_relative 'users'
require_relative 'users'
require_relative 'errors'
require_relative 'gists'
require_relative 'client/user'

module Github
  class Client
    include HTTParty
    include Users
    include Gists

    attr_reader :base_url, :user_suffix

    def initialize
      @base_url = "https://api.github.com/"
    end

    private

    def construct_query_params(options)
      options_string = "?"
      options.each do |k,v|
        options_string << "#{k}=#{v}"
        options_string << "&" unless options.keys[options.length - 1] = k
      end
      options_string
    end

    def construct_gist_body(body)
      final_hash = {}
      final_hash["description"] = body["description"]
      final_hash["public"] = true
      final_hash["files"] = {
        body["file"] => {
          "content" => body["content"]
        }
      }
      final_hash
    end
  end
end

