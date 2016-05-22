class StudentsController < ApiController
  def index
    success(Student.all)
  end

  def show
    student = Student.find_by(id: params[:student_id])
    return error_404 unless student.present?
    success(student)
  end

  def edit
    student = Student.find_by(id: params[:student_id])
    return error_404 unless student.present?

    appearance_attributes.each do |attr|
      student[attr] = params[attr] if params[attr].present?
    end

    if student.save
      success(student)
    else
      error(401, student.errors)
    end
  end

  private
  def appearance_attributes
    %i(nickname hair_style hair_color eye_color nose_style gender skin_color full_name email password)
  end

  def login_attributes
    %i(email password)
  end
end
