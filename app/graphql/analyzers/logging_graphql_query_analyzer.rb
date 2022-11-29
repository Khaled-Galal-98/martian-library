module Analyzers
  class LoggingGraphqlQueryAnalyzer < GraphQL::Analysis::AST::Analyzer
      def initialize(query_or_multiplex)
        super
        @nodes_map = {}
        @root_entries = []
        @operation_node = nil
      end
      def on_leave_field(node, parent_node, _visitor)
        @nodes_map[node] ||= { name: node.name }
        case parent_node
        when GraphQL::Language::Nodes::Field
          @nodes_map[parent_node] ||= { name: parent_node.name }
          parent_entry = @nodes_map[parent_node]
          parent_entry[:fields] ||= []
          parent_entry[:fields] << @nodes_map[node]
        when GraphQL::Language::Nodes::OperationDefinition
          @root_entries << @nodes_map[node]
          @operation_node = parent_node
        end
      end
      def result
        info =  {
          type: @operation_node&.operation_type,
          operation_name: @operation_node&.name,
          query: { fields: @root_entries },
        }
        puts info
        message = "[GraphQL Query Info] #{info} "
        Rails.logger.info(message)
        info    
      end
  end
end