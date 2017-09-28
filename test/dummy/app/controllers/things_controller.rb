class ThingsController < ApplicationController
  def create
    render json: formatted_params(create_params, :importantAttribute)
  end

  private

  def create_params
    params.require(:thing).permit(:importantAttribute,
                                  :less_important_attribute,
                                  :attribute,
                                  nestedSnakeCaseAttributes: [
                                    :pleaseUnderscoreMe,
                                    :meToo,
                                    :not_me,
                                    :norme
                                  ],
                                  nested_under_score_attributes: [
                                    :meAsWell,
                                    :alsoMe,
                                    :not_me_either
                                  ],
                                  nested: [
                                    :whatAboutMe,
                                    :and_me,
                                    :hello
                                  ]
                                 )
  end

  def formatted_params(whitelist, *attrs)
    underscore_attrs(whitelist,
                     :importantAttribute,
                     :nestedSnakeCaseAttributes,
                     :pleaseUnderscoreMe,
                     :meToo,
                     :nested_under_score_attributes,
                     :meAsWell,
                     :alsoMe,
                     :nested,
                     :whatAboutMe
                    )
  end
end
