class AnswerAttempt < ActiveRecord::Base
  belongs_to :mission_assignment
  belongs_to :question_option
end
