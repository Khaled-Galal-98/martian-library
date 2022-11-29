# frozen_string_literal: true

module Types
  class GelleshType < Types::BaseObject
    field :name, String
    field :age, Int
    field :married, Boolean

    def name
      'Khaled Galal'
    end

    def age
      23
    end

    def married
      false
    end
  end
end
