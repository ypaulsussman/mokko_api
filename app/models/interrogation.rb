# frozen_string_literal: true

class Interrogation < ApplicationRecord
  belongs_to :note
  belongs_to :prompt
end
