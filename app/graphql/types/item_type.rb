# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false, description: "Item Id"
    field :title, String, null: false, description: "Item Title" 
    field :description, String, null: true, description: "Item Description"
    field :image_url, String, null: true, description: "Item Image URL"
    field :user, Types::UserType, null: false
    # field :user_id, Integer
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

  end
end
