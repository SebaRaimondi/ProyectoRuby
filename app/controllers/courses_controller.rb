class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show; end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit; end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :index }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    if @course.exams.empty? && @course.students.empty?
      @course.destroy
      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'El curso no pudo eliminarse porque tiene alumnos o examenes.' }
        format.json { head :no_content }
      end
    end
  end

  def results
    @course = set_course
    if @course.update_results(result_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render @course, notice: 'Ocurrio un error al intentar actualizar las notas'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    id = params[:id].blank? ? params[:course_id] : params[:id]
    @course = Course.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:year, :title)
  end

  def result_params
    params.require(:results)
  end
end
