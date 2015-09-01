require_relative 'github_client'

describe "GithubClient" do
  let(:client) { Github::Client.new }

  it 'instantiates with base_url' do
    expect(Github::Client.new.base_url).to eq "https://api.github.com/"
  end

  context "users" do
    describe "#get_user" do
      it "gets just user login and name" do
        expect(client.get_user('cstewa')).to include "login"
        expect(client.get_user('cstewa')).to include "name"
        expect(client.get_user('cstewa').length).to eq 2
      end

      it "is a hash" do
        expect(client.get_user('cstewa')).to be_a Hash
      end
    end

    describe "#get_users" do
      let(:options) {{ per_page: 10 }}

      it "returns hash of logins and avatars" do
        expect(client.get_users(options).first).to include "login"
        expect(client.get_users(options).first).to include "avatar_url"
      end

      it "returns 10 results" do
        expect(client.get_users(options).length).to eq 10
      end
    end
  end

  context "gists" do
    describe "#post_gist" do
      let(:body) {{
        "description" => "my description",
        "file" => 'file.txt',
        "content" => 'my content'
      }}

      it "returns url of gist" do
        expect(client.post_gist(body).url).to be_a String
      end
    end
  end
end