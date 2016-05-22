class AdventureAssignment < ActiveRecord::Base
  belongs_to :student
  belongs_to :adventure
  has_many :mission_assignments
  has_many :missions, through: :mission_assignments

  scope :complete, ->{ where(completed: true) }
  scope :incomplete, ->{ where(completed: false) }

  def available_missions
    adventure.missions.where(level: 0 .. student_level)
      .where.not(id: missions.merge(MissionAssignment.incomplete))
  end

  def completed_missions
    missions.merge(MissionAssignment.complete)
  end

  def todo_missions
    missions.merge(MissionAssignment.incomplete)
  end
end
