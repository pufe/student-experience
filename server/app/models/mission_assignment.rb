class MissionAssignment < ActiveRecord::Base
  belongs_to :mission
  belongs_to :student
  has_many :answer_attempts

  STATES = %w(new failed success abandoned)

  validates :state, inclusion: {in: STATES}
end
