class AdventuresController < ApiController
  before_action :get_current_student

  def available
    adventures = @current_student.available_adventures
    if params['subject'].present?
      adventures = adventures.where(subject: params['subject'])
    end
    return success(adventures)
  end

  def todo
    adventures = @current_student.todo_adventures
    if params['subject'].present?
      adventures = adventures.where(subject: params['subject'])
    end
    return success(adventures)
  end

  def completed
    adventures = @current_student.completed_adventures
    if params['subject'].present?
      adventures = adventures.where(subject: params['subject'])
    end
    return success(adventures)
  end

  def show
    adventure = Adventure.find_by(id: params[:adventure_id])
    return error_404 unless adventure.present?
    return success(adventure)
  end

  def accept
    adventure = Adventure.find_by(id: params[:adventure_id])
    return error_404 unless adventure.present?

    if @current_student.adventures.where(id: adventure.id).exists?
      return error(401, 'Already has this adventure')
    end

    if !@current_student.available_adventures.where(id: adventure.id).exists?
      return error(403, 'Adventure not available for this student')
    end

    assignment = AdventureAssignment.create(student: @current_student,
                                            adventure: adventure)
    return error(500, 'Internal server error') unless assignment.present?
    return success(assignment)
  end

  private
  def get_current_student
    @current_student = Student.find_by(id: params[:student_id])
    return error_404 unless @current_student.present?
    true
  end
end
