# frozen_string_literal: true

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless CPF.new(value).valid?
  end
end
