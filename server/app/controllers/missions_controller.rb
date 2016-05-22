class MissionsController < ApiController
  before_action :get_adventure_assignment

  def available
    success(@adventure_assignment.available_missions)
  end

  def completed
    success(@adventure_assignment.completed_missions)
  end

  def todo
    success(@adventure_assignment.todo_missions)
  end

  def show
    mission = @adventure_assignment.missions.find_by(id: params[:mission_id])
    return error_404 unless mission.present?
    return success(mission.attributes.merge(questions: mission.questions))
  end

  def accept
    mission = @adventure_assignment.adventure.missions.find_by(id: params[:mission_id])
    return error_404 unless mission.present?
    return error(401, 'Already in this mission') if @adventure_assignment.missions.where(id: mission.id).exists?

    mission_assignment = @adventure_assignment.mission_assignments.create(mission_id: mission.id)
    return success(mission_assignment)
  end

  def reject
    mission_assignment = @adventure_assignment.mission_assignments.find_by(mission_id: params[:mission_id])
    return error_404 unless mission_assignment.present?
    mission_assignment.destroy
    return success(:ok)
  end

  private
  def get_adventure_assignment
    @adventure = Adventure.find_by(id: params[:adventure_id])
    @student = Student.find_by(id: params[:student_id])
    @adventure_assignment = AdventureAssignment.find_by(student_id: params[:student_id],
                                                        adventure_id: params[:adventure_id])
    return error_404 unless [@adventure, @student, @adventure_assignment].all?(&:present?)
    true
  end
end
