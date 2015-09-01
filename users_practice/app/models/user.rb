class User < ActiveRecord::Base
  extend Filterable

  scope :by_name, -> { order(:name) }
end
