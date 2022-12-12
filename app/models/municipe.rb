# frozen_string_literal: true
class Municipe < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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

  after_create :notify

  def to_hash
    @attributes
  end

  def self.search(query)
    params = {
      query: {
        bool: {
          should: [
            { match: { name: query }},
          ],
        }
      },
    }

    self.__elasticsearch__.search(params)
  end


  def notify
    unless Rails.env.test?
      EmailNotifyWorker.perform_async(email) if email.present?
      SmsNotifyWorker.perform_async(ENV['TWILLO_TO'], 'Municipe Criado!')
    end
  end
end
