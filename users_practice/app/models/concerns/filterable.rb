module Filterable
  def filter(filter)
    return self.all if filter.nil?

    filter = "by_" + filter
    self.send(filter.to_sym)
  end
end