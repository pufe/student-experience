class AdventureAssignment < ActiveRecord::Base
  belongs_to :student

  belongs_to :adventure
  has_many :adventure_missions, through: :adventure, class_name: 'Mission', source: :missions

  has_many :mission_assignments
  has_many :assigned_missions, through: :mission_assignments, class_name: 'Mission', source: :mission

  scope :complete, ->{ where(completed: true) }
  scope :incomplete, ->{ where(completed: false) }

  def available_missions
    adventure_missions.where(level: 0 .. student_level)
      .where.not(id: assigned_missions)
  end

  def completed_missions
    assigned_missions.merge(MissionAssignment.complete)
  end

  def todo_missions
    assigned_missions.merge(MissionAssignment.incomplete)
  end

  def update_status
    level_up! if !available_missions.exists? && !todo_missions.exists?
    complete! if !available_missions.exists?
  end

  def level_up!
    student_level += 1
    save
  end

  def complete!
    completed = true
    save
  end
end
