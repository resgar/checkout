# frozen_string_literal: true
FactoryBot.define do
  factory :product do
    code { "001" }
    name { "Lavender heart" }
    price { 9.25 }
  end
end
