require 'test_helper'

class ThingsControllerTest < ActionController::TestCase
  test 'camelcase symbol params should be underscored' do
    post(:create, params: { thing: { importantAttribute: 'nice' } })
    assert_response :ok
    assert_equal({ 'important_attribute' => 'nice' }, JSON.parse(@response.body))
  end

  test 'camelcase string params should be underscored' do
    post(:create, params: { thing: { 'importantAttribute' => 'nice' } })
    assert_response :ok
  end

  test 'underscore and single-word symbol attributes should be unchanged' do
    post(:create, params: { thing: {
      less_important_attribute: 'ok',
      attribute: 'what'
    } })
    assert_response :ok
    assert_equal({ 'less_important_attribute' => 'ok',
                   'attribute' => 'what' },
                 JSON.parse(@response.body)
                )
  end

  test 'nested attributes should be underscored' do
    post(:create, params: { thing: {
      nestedSnakeCaseAttributes: {
        pleaseUnderscoreMe: 'yes',
        meToo: 'please',
        not_me: 'nope',
        norme: 'never'
      }
    } })
    assert_response :ok
    assert_equal({ 'nested_snake_case_attributes' => {
                     'please_underscore_me' => 'yes',
                     'me_too' => 'please',
                     'not_me' => 'nope',
                     'norme' => 'never'
                 }}, JSON.parse(@response.body)
                )
  end
end
