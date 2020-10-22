# frozen_string_literal: true

# Meal is a Mongoid model
class Meal
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: String

  has_many :ingredients, dependent: :destroy
end
