class Ownership < ActiveRecord::Base
  belongs_to :student
  belongs_to :equipment

  scope :equipped, ->{ where(equipped: true) }
  scope :unequipped, ->{ where(equipped: false) }
end
