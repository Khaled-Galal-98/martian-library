module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :items, [Types::ItemType], null: false,
      description: "Returns a list of items in martian library"

    # field :test, Types::GelleshType,
    #   description: "Returns a dummy type a created  "

    field :me, Types::UserType, null: true
    
    def items
      Item.lazy_preload(:user) # to fix n+1 problem for model have associations
    end

    def me
      context[:current_user]
    end

    # def test
    #   Item.first
    # end
  end
end
