# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :municipe
  validates :street, :zipcode, :neighborhood, :city, :uf, presence: true
end
