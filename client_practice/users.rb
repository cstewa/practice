module Users
  USER_ATTRS = ["login", "name"]
  USERS_ATTRS = ["login", "gists"]

  def get_user(username)
    response = self.class.get(base_url + "users/" + username)
    response.select { |k| USER_ATTRS.include? k }
  end

  def get_users(options)
    options = construct_query_params(options)
    response = self.class.get(base_url + "users" + options)
    users = []
    response.each do |user|
      user_hash = {}
      user_hash["login"] = user["login"]
      user_hash["avatar_url"] = user["avatar_url"]
      users << user_hash
    end
    users
  end
end

class Fruit
  ["apple", "orange", "kiwi"].each do |fruit|
    define_method(fruit.to_sym) { return "#{fruit}s" }
  end
end