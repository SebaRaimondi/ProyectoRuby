require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # title
  test 'should not save if title is not present' do
    exam = exams(:one)
    exam.title = nil
    assert_not exam.save
  end

  test 'should titleize title before save' do
    exam = exams(:one)
    exam.title = 'soy un titulo'
    exam.save
    assert exam.title = 'Soy Un Titulo'
  end

  # min
  test 'should not save if min is not present' do
    exam = exams(:one)
    exam.min = nil
    assert_not exam.save
  end

  test 'should not save if min is negative' do
    exam = exams(:one)
    exam.min = -2
    assert_not exam.save
  end

  test 'should not save if min is not integer' do
    exam = exams(:one)
    exam.min = 2.3
    assert_not exam.save
  end

  # date
  test 'should not save if date is not present' do
    exam = exams(:one)
    exam.date = nil
    assert_not exam.save
  end

  test 'should not save if year is not the same as course year' do
    exam = exams(:one)
    exam.date = '2016-12-10'
    assert_not exam.save
  end

  # Associations
  test 'should associate course' do
    exam = exams(:one)
    assert exam.course == courses(:one)
  end

  test 'should associate students' do
    exam = exams(:one)
    assert exam.students.size == 3
    assert exam.students.include? students(:one)
    assert exam.students.include? students(:two)
    assert exam.students.include? students(:three)

    exam_two = exams(:two)
    assert_not exam_two.students.include? students(:two)
  end

  test 'should associate results' do
    exam = exams(:one)
    assert exam.results.size == 3
    assert exam.results.include? results(:one)
    assert exam.results.include? results(:two)
    assert exam.results.include? results(:three)
    assert_not exam.results.include? results(:four)

    exam_two = exams(:two)
    assert exam_two.results.size == 1
  end

  test 'should get mark for student' do
    exam = exams(:one)
    student = students(:one)
    result = results(:one)
    assert exam.mark_for(student) == result.mark
  end

  test 'should say if has_mark_for' do
    exam = exams(:two)
    student_one = students(:one)
    student_two = students(:two)
    assert exam.has_mark_for(student_one)
    assert_not exam.has_mark_for(student_two)
  end

  test 'should say if student passed' do
    exam_one = exams(:one)
    exam_two = exams(:two)
    student_one = students(:one)
    student_two = students(:two)
    student_three = students(:three)

    assert_not exam_one.passed?(student_one)
    assert exam_one.passed?(student_two)
    assert exam_one.passed?(student_three)
    assert_not exam_two.passed?(student_two)
  end

  test 'should return passed students' do
    exam = exams(:one)
    assert exam.passed.size == 2
  end

  test 'should return failed students' do
    exam = exams(:one)
    assert exam.failed.size == 1
  end

  test 'should return not_present students' do
    exam = exams(:two)
    assert exam.not_present == 2
  end

  test 'should return pass percentage' do
    exam = exams(:one)
    assert exam.pass_percent == 2.0 / 3 * 100 # 66.6666...
  end
end
