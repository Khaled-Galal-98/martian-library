module Analyzers
  class LogQueryComplexityAnalyzer < GraphQL::Analysis::AST::QueryComplexity
    # Override this method to _do something_ with the calculated complexity value
    def result
      complexity = super
      message = "[GraphQL Query Complexity] #{complexity} "
      Rails.logger.info(message)
    end
  end
end