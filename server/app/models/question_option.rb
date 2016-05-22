class QuestionOption < ActiveRecord::Base
  belongs_to :question
  has_many :answer_attempts
end
