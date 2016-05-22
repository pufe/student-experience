class Adventure < ActiveRecord::Base
  has_many :missions
  belongs_to :previous_adventure, class_name: 'Adventure'
  has_one :next_adventure, class_name: 'Adventure', foreign_key: :previous_adventure_id
end
