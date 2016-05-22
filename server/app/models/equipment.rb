class Equipment < ActiveRecord::Base
  self.table_name = :equipments

  has_many :ownerships
end
