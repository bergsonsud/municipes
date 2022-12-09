# frozen_string_literal: true

class Cns
  attr_accessor :cns

  def initialize(cns)
    self.cns = cns
  end

  def self.valid?(cns)
    new(cns).valid?
  end

  def valid?
    return false if cns.to_s.length != 15

    numbers = []
    15.times do |i|
      numbers << (cns.to_s[i].to_i * (15 - i))
    end
    (numbers.sum % 11).zero?
  end

  def invalid?
    cns.to_s.length != 15
  end
end
