class MissionAssignment < ActiveRecord::Base
  belongs_to :mission
  belongs_to :student
  has_many :answer_attempts

  scope :completed, -> { where(status: 'success') }
  scope :todo, -> { where(status: 'new') }
  scope :failed, -> { where(status: 'failed') }


  STATES = %w(todo failed completed)

  validates :status, inclusion: {in: STATES}
end
