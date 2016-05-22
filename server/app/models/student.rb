class Student < ActiveRecord::Base
  has_many :adventure_assignments
  has_many :adventures, through: :adventure_assignments

  has_many :mission_assignments
  has_many :missions, through: :mission_assignments

  has_many :ownerships
  has_many :equipments, through: :ownerships

  def available_adventures
    Adventure.where.not(id: locked_adventures)
      .where.not(id: adventures)
  end

  def locked_adventures
    Adventure.where.not(unlocked_at: 1.year.ago ... Time.zone.now)
      .where.not(previous_adventure_id: completed_adventures)
      .where.not(previous_adventure_id: nil)
  end

  def completed_adventures
    adventures.merge(AdventureAssignment.complete)
  end

  def todo_adventures
    adventures.merge(AdventureAssignment.incomplete)
  end
end
