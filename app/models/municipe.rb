# frozen_string_literal: true

class Municipe < ApplicationRecord
  has_one_attached :picture

  validates :name, uniqueness: { scope: :cpf }
  validates :name, :cpf, :cns, :email, :birthdate, :phone, :status, presence: true
  validates :cns, cns: true
  validates :cpf, cpf: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :birthdate, date: true, date_future: true
  validates :picture, presence: true

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end
