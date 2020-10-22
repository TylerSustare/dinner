# frozen_string_literal: true

# Ingredient is a Mongoid model
class Ingredient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  belongs_to :meal
end
