class QuestionsController < ApiController
  before_action :fetch_data

  def show
    @question = @mission.questions.find_by(id: params[:question_id])
    return error_404 unless @question.present?
    success(@question.attributes.merge(question_options: @question.question_options,
                                       question_hints: @question.question_hints))
  end

  def answer
    @question = @mission.questions.find_by(id: params[:question_id])
    return error_404 unless @question.present?
    @question_option = @question.question_options.find_by(id: params[:question_option_id])
    return error_404 unless @question_option.present?
    if @question_option.correct?
      @student.gold += @question.gold_reward.to_i
    else
      @student.current_hp -= 1
    end
    @student.save
    answer_attempt = @mission_assignment.answer_attempts.create(question_option: @question_option)
    @mission_assignment.update_status!
    success(:ok)
  end

  def index
    success(@mission_assignment.mission_questions)
  end

  def answered
    success(@mission_assignment.answered_questions)
  end

  def unanswered
    success(@mission_assignment.mission_questions.where.not(id: @mission_assignment.answered_questions))
  end

  private
  def fetch_data
    @mission = Mission.find_by(id: params[:mission_id])
    return error_404 unless @mission.present?
    @student = Student.find_by(id: params[:student_id])
    return error_404 unless @mission.present?
    @mission_assignment = MissionAssignment.joins(:student)
                          .find_by(students: {id: @student.id},
                                   mission_assignments: {mission_id: @mission.id})
    return error_404 unless @mission_assignment.present?
    true
  end
end
