class Question < ActiveRecord::Base
  belongs_to :mission
  has_many :question_options
  has_many :question_hints
end
