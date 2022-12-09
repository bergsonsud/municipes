# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipe do
  describe "relations" do
    it { should have_one(:address).dependent(:destroy) }
    it { should accept_nested_attributes_for :address }
    it { should have_one_attached(:picture) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:cpf) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birthdate) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:picture) }
    it { is_expected.to have_one_attached(:picture) }

    context 'with birthdate' do
      it 'validates if birthdate is invalid' do
        subject.birthdate = Date.current + 1.year
        subject.validate
        expect(subject.errors).to have_key(:birthdate)
      end

      it 'validates if birthdate is valid' do
        subject.birthdate = Date.new(2022, 1, 1)
        subject.validate
        expect(subject.errors).not_to have_key(:birthdate)
      end
    end

    it 'validates if email is invalid' do
      subject.email = 'fulano123@@bol.com'
      subject.validate
      expect(subject.errors).to have_key(:email)
    end

    it 'validates if email is valid' do
      subject.email = 'richarlison@gol.com.br'
      subject.validate
      expect(subject.errors).not_to have_key(:email)
    end

    it 'validates if cns is invalid' do
      subject.cns = '99988877766'
      subject.validate
      expect(subject.errors).to have_key(:cns)
    end

    it 'validates if cns is valid' do
      subject.cns = '224763509480000'
      subject.validate
      expect(subject.errors).not_to have_key(:cns)
    end

    it 'validates if cpf is invalid' do
      subject.cpf = '999.888.777-66'
      subject.validate
      expect(subject.errors).to have_key(:cpf)
    end

    it 'validates if cpf is valid' do
      subject.cpf = '921.428.710-46'
      subject.validate
      expect(subject.errors).not_to have_key(:cpf)
    end
  end
end
