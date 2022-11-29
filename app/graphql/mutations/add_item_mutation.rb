module Mutations
  class AddItemMutation < BaseMutation
    # DONE: define return fields
    field :item, Types::ItemType, null: true, description: "The new item created"
    field :errors, [String], null: false

    # DONE: define arguments
    argument :title, String, required: true
    argument :description, String, required: false
    argument :image_url, String, required: false

    # DONE: define resolve method
    def resolve(title:, description: nil, image_url: nil)
      check_authentication!

      item = Item.new(
        title: title,
        description: description,
        image_url: image_url,
        user: context[:current_user]
      )
      
      if item.save
        {item: item}
      else
        {errors: item.errors.full_messages}
      end
    end
  end
end
