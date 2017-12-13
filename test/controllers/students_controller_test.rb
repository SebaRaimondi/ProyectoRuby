require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
    @student = students(:one)
  end

  test "should get index" do
    get :index, params: { course_id: @course }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { course_id: @course }
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, params: { course_id: @course, student: @student.attributes }
    end

    assert_redirected_to course_student_path(@course, Student.last)
  end

  test "should show student" do
    get :show, params: { course_id: @course, id: @student }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { course_id: @course, id: @student }
    assert_response :success
  end

  test "should update student" do
    put :update, params: { course_id: @course, id: @student, student: @student.attributes }
    assert_redirected_to course_student_path(@course, Student.last)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, params: { course_id: @course, id: @student }
    end

    assert_redirected_to course_students_path(@course)
  end
end
