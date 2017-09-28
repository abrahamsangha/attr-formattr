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

  test 'snakecase key with its nested attributes should all be underscored' do
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

  test 'underscore key with its nested attributes should all be underscored' do
    post(:create, params: { thing: {
      nested_under_score_attributes: {
        meAsWell: 'yes',
        alsoMe: 'please',
        not_me_either: 'nope'
      }
    } })
    assert_response :ok
    assert_equal({ 'nested_under_score_attributes' => {
                     'me_as_well' => 'yes',
                     'also_me' => 'please',
                     'not_me_either' => 'nope'
                 }}, JSON.parse(@response.body)
                )
  end

  test 'single word key with nested attributes should be underscored' do
    post(:create, params: { thing: {
      nested: {
        whatAboutMe: 'yes',
        and_me: 'please',
        hello: 'nope'
      }
    } })
    assert_response :ok
    assert_equal({ 'nested' => {
                     'what_about_me' => 'yes',
                     'and_me' => 'please',
                     'hello' => 'nope'
                 }}, JSON.parse(@response.body)
                )
  end

  test 'single word key with array of nested attributes should all be underscored' do
    post(:create, params: { thing: {
      nested: [
        {
          whatAboutMe: 'yes',
          and_me: 'please',
          hello: 'nope'
        },
        {
          whatAboutMe: 'really',
          and_me: 'yeah',
          hello: 'n/a'

        }
      ]
    } })
    assert_response :ok
    assert_equal({ 'nested' => [
                   {
                     'what_about_me' => 'yes',
                     'and_me' => 'please',
                     'hello' => 'nope'
                   },
                   {
                     'what_about_me' => 'really',
                     'and_me' => 'yeah',
                     'hello' => 'n/a'
                   }
                 ]}, JSON.parse(@response.body)
                )
  end
end
