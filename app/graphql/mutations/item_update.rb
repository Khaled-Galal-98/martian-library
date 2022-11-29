# frozen_string_literal: true

module Mutations
  class ItemUpdate < BaseMutation
    description "Updates a item by id"

    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true
    # argument :item_input, Types::ItemInputType, required: true
    argument :title, String, required: true
    argument :description, String, required: false
    argument :image_url, String, required: false

    def resolve(id:, title:, description: nil, image_url: nil)
      check_authentication!

      item = Item.find(id)
      
      if item.update(title: title, description: description, image_url: image_url)
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
