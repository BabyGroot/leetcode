def match_logs_to_queries(logs, queries)
  results = {}

  queries.each do |query|
    results[query] = []

    logs.each do |log|
      if matches_query?(log, query)
        results[query] << log
      end
    end
  end

  results
end

def matches_query?(log, query)
  # Simple keyword matching
  query.split.all? { |keyword| log.downcase.include?(keyword.downcase) }
end

# Example usage:
logs = [
  "2023-01-01 ERROR: Database connection failed",
  "2023-01-01 INFO: User login successful",
  "2023-01-02 ERROR: Timeout occurred",
  "2023-01-02 WARN: High memory usage detected"
]

queries = [
  "ERROR Database",
  "User login",
  "memory usage"
]

result = match_logs_to_queries(logs, queries)
# => {
#   "ERROR Database" => ["2023-01-01 ERROR: Database connection failed"],
#   "User login" => ["2023-01-01 INFO: User login successful"],
#   "memory usage" => ["2023-01-02 WARN: High memory usage detected"]
# }
