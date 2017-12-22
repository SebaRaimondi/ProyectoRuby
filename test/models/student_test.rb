require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # surname
  test 'should not save if surname is not present' do
    st = students(:one)
    st.surname = nil
    assert_not st.save
  end

  # name
  test 'should not save if name is not present' do
    st = students(:one)
    st.name = nil
    assert_not st.save
  end

  test 'should titleize names before save' do
    st = students(:one)
    st.surname = 'raimondi'
    st.name = 'sebastian'
    st.save

    assert st.surname == 'Raimondi'
    assert st.name == 'Sebastian'
  end

  # dni
  test 'should not save if dni is not present' do
    st = students(:one)
    st.dni = nil
    assert_not st.save
  end

  test 'should not save if dni length is not between 5 and 8' do
    st = students(:one)

    st.dni = '1234'
    assert_not st.save

    st.dni = '123456'
    assert st.save

    st.dni = '123456789'
    assert_not st.save
  end

  test 'should not save if dni already registered in course' do
    st = students(:one)
    st2 = students(:two)
    st.dni = st2.dni
    assert_not st.save
  end

  # number
  test 'should not save if number is not present' do
    st = students(:one)
    st.number = nil
    assert_not st.save
  end

  test 'should not save if number is invalid' do
    st = students(:one)

    st.number = 'adsad/516a'
    assert_not st.save

    st.number = '12345/5'
    assert st.save
  end

  test 'should not save if number already registered in course' do
    st = students(:one)
    st2 = students(:two)
    st.number = st2.number
    assert_not st.save
  end

  # email
  test 'should not save if email is not present' do
    st = students(:one)
    st.email = nil
    assert_not st.save
  end

  test 'should not save if email is invalid' do
    st = students(:one)

    st.email = 'asdas@asmdla'
    assert_not st.save

    st.email = 'mailejemplo@mail.com'
    assert st.save
  end

  test 'should not save if email already registered in course' do
    st = students(:one)
    st2 = students(:two)
    st.email = st2.email
    assert_not st.save
  end

  # Associations
  test 'should have course set' do
    st = students(:one)
    c = courses(:one)
    assert st.course == c
  end

  test 'should associate results' do
    st = students(:one)
    assert st.results.size == 2
  end

  test 'should associate exams' do
    st = students(:one)
    assert st.exams.size == 2
  end

  # Methods
  test 'should get mark for an exam' do
    st = students(:one)
    ex = exams(:one)
    assert st.mark_for(ex) == 4
  end

  test 'should get full_name' do
    st = students(:one)
    st.name = 'Sebastian'
    st.surname = 'Raimondi'
    assert st.full_name == 'Raimondi, Sebastian'
  end
end
