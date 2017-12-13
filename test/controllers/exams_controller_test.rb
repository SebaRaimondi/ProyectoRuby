require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
    @exam = exams(:one)
  end

  test "should get index" do
    get :index, params: { course_id: @course }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { course_id: @course }
    assert_response :success
  end

  test "should create exam" do
    assert_difference('Exam.count') do
      post :create, params: { course_id: @course, exam: @exam.attributes }
    end

    assert_redirected_to course_exam_path(@course, Exam.last)
  end

  test "should show exam" do
    get :show, params: { course_id: @course, id: @exam }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { course_id: @course, id: @exam }
    assert_response :success
  end

  test "should update exam" do
    put :update, params: { course_id: @course, id: @exam, exam: @exam.attributes }
    assert_redirected_to course_exam_path(@course, Exam.last)
  end

  test "should destroy exam" do
    assert_difference('Exam.count', -1) do
      delete :destroy, params: { course_id: @course, id: @exam }
    end

    assert_redirected_to course_exams_path(@course)
  end
end
