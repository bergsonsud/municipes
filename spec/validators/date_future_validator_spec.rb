# frozen_string_literal: true

require 'active_model'
require 'active_support/all'
require File.expand_path('app/validators/date_future_validator')

class DateFutureValidatable
  include ActiveModel::Validations
  attr_accessor :birthdate

  validates :birthdate, date_future: true
end

RSpec.describe DateFutureValidatable do
  it 'validates if birthdate is valid' do
    subject.birthdate = Date.new(1998, 12, 31)
    expect(subject.valid?).to be(true)
  end

  it 'validates if birthdate is invalid' do
    subject.birthdate = Date.current + 2.days
    expect(subject.valid?).to be(false)
    expect(subject.errors['birthdate']).to eq ['is invalid']
  end
end
