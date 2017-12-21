require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # year
  test 'should not save if year is not present' do
    course = courses(:one)
    course.year = nil
    assert_not course.save
  end

  test 'should not save if year is not integer' do
    course = courses(:one)
    course.year = 'Soy un anio'
    assert_not course.save
  end

  test 'should not save if year is negative' do
    course = courses(:one)
    course.year = -2017
    assert_not course.save
  end

  test 'should not save if year has less than 4 digits' do
    course = courses(:one)
    course.year = 33
    assert_not course.save
  end

  # title
  test 'should not save if title is not present' do
    course = courses(:one)
    course.title = nil
    assert_not course.save
  end

  test 'should titleize title' do
    course = courses(:one)
    course.title = 'soy un titulo'
    course.save
    assert course.title = 'Soy Un Titulo'
  end

  test 'should build full_title' do
    course = courses(:one)
    course.title = 'Soy Un Titulo'
    course.year = 2017
    assert course.full_title == 'Soy Un Titulo - 2017'
  end

  # Associations
  test 'should associate students' do
    course = courses(:one)
    assert course.students.size == 3
    assert course.students.include? students(:one)
    assert course.students.include? students(:two)
    assert course.students.include? students(:three)
  end

  test 'should associate exams' do
    course = courses(:one)
    assert course.exams.size == 3
    assert course.exams.include? exams(:one)
    assert course.exams.include? exams(:two)
    assert course.exams.include? exams(:three)
  end
end
