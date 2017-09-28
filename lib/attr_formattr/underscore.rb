module Underscore
  module_function

  def underscore_attrs(whitelist, *attrs)
    result = {}
    whitelist.each do |key, value|
      if attrs.map(&:to_sym).include?(key.to_sym)
        new_key = key.to_s.underscore.to_sym
        result[new_key] = underscore_value(value, attrs)
      else
        result[key] = value
      end
    end
    result
  end

  def underscore_value(value, attrs)
    if value.is_a?(Array)
      value.map { |v| underscore_attrs(v, *attrs) }
    elsif value.is_a?(ActionController::Parameters)
      underscore_attrs(value, *attrs)
    else
      value
    end
  end
end
