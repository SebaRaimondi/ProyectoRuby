class ExamsController < ApplicationController
  before_action :set_exams
  before_action :set_exam, only: %i[show edit update destroy]

  # GET courses/1/exams
  def index
    @exams = @course.exams
  end

  # GET courses/1/exams/1
  def show; end

  # GET courses/1/exams/new
  def new
    @exam = @course.exams.build
  end

  # GET courses/1/exams/1/edit
  def edit; end

  # POST courses/1/exams
  def create
    @exam = @course.exams.build(exam_params)

    if @exam.save
      redirect_to([@exam.course, @exam], notice: 'Exam was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT courses/1/exams/1
  def update
    if @exam.update_attributes(exam_params)
      redirect_to([@exam.course, @exam], notice: 'Exam was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE courses/1/exams/1
  def destroy
    @exam.destroy

    redirect_to course_exams_url(@course)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exams
    @course = Course.find(params[:course_id])
  end

  def set_exam
    @exam = @course.exams.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def exam_params
    params.require(:exam).permit(:title, :date, :min)
  end
end
