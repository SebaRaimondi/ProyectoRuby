require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'mark can only be integer or nil' do
    res = results(:one)
    res.mark = 'Soy una nota'
    assert_not res.save
  end

  test 'mark cant be negative' do
    res = results(:one)
    res.mark = -2
    assert_not res.save
  end

  test 'mark can be nil' do
    res = results(:one)
    res.mark = nil
    assert res.save
  end
end
