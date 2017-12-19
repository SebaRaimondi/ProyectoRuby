class StudentsController < ApplicationController
  before_action :set_students
  before_action :set_student, only: %i[show edit update destroy]

  # GET courses/1/students
  def index
    @students = @course.students
  end

  # GET courses/1/students/1
  def show; end

  # GET courses/1/students/new
  def new
    @student = @course.students.build
  end

  # GET courses/1/students/1/edit
  def edit; end

  # POST courses/1/students
  def create
    @student = @course.students.build(student_params)

    if @student.save
      redirect_to(course_students_path, notice: 'El alumno se creo exitosamente.')
    else
      render action: 'new'
    end
  end

  # PUT courses/1/students/1
  def update
    if @student.update_attributes(student_params)
      redirect_to(course_students_path, notice: 'El alumno se modifico exitosamente.')
    else
      render action: 'edit'
    end
  end

  # DELETE courses/1/students/1
  def destroy
    if @student.results.empty?
      @student.destroy
      redirect_to(course_students_url(@course), notice: 'El alumno se elimino exitosamente.')
    else
      redirect_to(course_students_url(@course), notice: 'El alumno no se elimino porque tiene notas asociadas.')
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_students
    @course = Course.find(params[:course_id])
  end

  def set_student
    @student = @course.students.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:surname, :name, :dni, :number, :email)
  end
end
