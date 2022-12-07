# frozen_string_literal: true

class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless Cns.valid?(value)
  end
end
