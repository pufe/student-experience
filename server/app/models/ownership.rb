class Ownership < ActiveRecord::Base
  belongs_to :student
  belongs_to :item

  scope :equipped, ->{ where(equipped: true) }
  scope :unequipped, ->{ where(equipped: false) }

  def consume(mission_assignment, question)
    case item.effect
    when 'heal'
      student.current_hp = [student.current_hp + 1, student.max_hp].min
      student.save
    when 'skip'
      right_answer = question.question_options.where(correct: true).first
      mission_assignment.answer_attempts.create(question_option: right_answer)
      mission_assignment.update_status!
    end
  end
end
