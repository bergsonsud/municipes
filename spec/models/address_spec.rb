# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  describe 'relations' do
    it { is_expected.to belong_to(:municipe) }
  end
end
