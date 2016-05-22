class StudentsController < ApiController
  def show
    student = Student.find_by(id: params[:id])
    return error_404 unless student.present?
    success(student)
  end

  def edit
    student = Student.find_by(id: params[:id])
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
    %i(nickname hair_style eye_color nose_style gender skin_color)
  end

  def login_attributes
    %i(email password)
  end
end
