module Types
  class MutationType < Types::BaseObject
    field :add_item, mutation: Mutations::AddItemMutation
    field :sign_in, mutation: Mutations::SignInMutation
    field :update_item, mutation: Mutations::ItemUpdate
  end
end
