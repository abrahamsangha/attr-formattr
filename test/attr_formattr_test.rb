require 'test_helper'

class ThingsControllerTest < ActionController::TestCase
  test 'camel case attribute params should be underscored' do
    post(:create, params: { thing: { importantAttribute: 'nice' } })
    assert_response :ok
    assert_equal @response.body, 'foo'
  end
end
