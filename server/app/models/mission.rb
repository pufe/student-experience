class Mission < ActiveRecord::Base
  belongs_to :adventure
  has_many :questions
end
