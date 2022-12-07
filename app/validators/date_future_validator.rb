# frozen_string_literal: true

class DateFutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) if value.present? && value > Date.current
  end
end
