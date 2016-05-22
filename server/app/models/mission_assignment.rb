class MissionAssignment < ActiveRecord::Base
  belongs_to :mission
  has_many :mission_questions, through: :mission, class_name: "Question", foreign_key: :questions_id

  has_many :answer_attempts, dependent: :destroy
  has_many :answered_questions, through: :answer_attempts, class_name: "Question", foreign_key: :questions_id

  belongs_to :adventure_assignment
  has_one :student, through: :adventure_assignment

  scope :complete, ->{ where(completed: true) }
  scope :incomplete, ->{ where(completed: false) }

  def update_status!
    if student.current_hp <= 0
      destroy!
    elsif !mission_questions.where.not(id: answered_questions).exists?
      complete!
    end
  end

  def complete!
    completed = true
    save!
    adventure_assignmnet.update_status!
  end
end
