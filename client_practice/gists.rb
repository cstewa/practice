module Gists
  def post_gist(body)
    body = construct_gist_body(body)
    response = self.class.post(base_url + "gists", body: body.to_json, headers: { "Content-Type" => "application/json", "User-Agent" => "cstewa" } )
    binding.pry
    case response.code
    when 201
      response
    when 400
      raise GithubClient::Error
    end
  end
end