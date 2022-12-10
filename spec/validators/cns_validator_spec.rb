# frozen_string_literal: true

require 'active_model'
require File.expand_path('app/models/cns')
require File.expand_path('app/validators/cns_validator')

class CnsValidatable
  include ActiveModel::Validations
  attr_accessor :cns

  validates :cns, cns: true
end

RSpec.describe CnsValidatable do
  it 'validates if cns is valid' do
    subject.cns = '255505685780007'
    expect(subject.valid?).to be(true)
  end

  it 'validates if cns is invalid' do
    subject.cns = '123987'
    expect(subject.valid?).to be(false)
    expect(subject.errors['cns']).to eq ['não é válido']
  end
end
