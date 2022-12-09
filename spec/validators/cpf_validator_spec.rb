# frozen_string_literal: true

require 'active_model'
require 'cpf_cnpj'
require File.expand_path('app/validators/cpf_validator')

class CpfValidatable
  include ActiveModel::Validations
  attr_accessor :cpf

  validates :cpf, cpf: true
end

RSpec.describe CpfValidatable do
  it 'validates if cpf is valid' do
    subject.cpf = '921.428.710-46'
    expect(subject.valid?).to be(true)
  end

  it 'validates if cpf is invalid' do
    subject.cpf = '123.654.987-11'
    expect(subject.valid?).to be(false)
    expect(subject.errors['cpf']).to eq ['is invalid']
  end
end
