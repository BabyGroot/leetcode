class LogEntry
  attr_accessor :timestamp, :level, :message, :ip, :method, :path, :status

  def initialize(log_string)
    parse_log(log_string)
  end

  private

  def parse_log(log_string)
    # Example: "2023-01-01 10:00:00 INFO 192.168.1.1 GET /api/users 200 User data retrieved"
    parts = log_string.split(' ', 7)
    @timestamp = "#{parts[0]} #{parts[1]}"
    @level = parts[2]
    @ip = parts[3]
    @method = parts[4]
    @path = parts[5]
    @status = parts[6]&.to_i
    @message = parts[7] || ""
  end
end

def query_logs(logs, queries)
  log_entries = logs.map { |log| LogEntry.new(log) }
  results = {}

  queries.each do |query_name, conditions|
    results[query_name] = log_entries.select do |entry|
      conditions.all? do |field, value|
        case field
        when :level
          entry.level == value
        when :status_range
          value.include?(entry.status)
        when :method
          entry.method == value
        when :contains
          entry.message.downcase.include?(value.downcase)
        else
          entry.send(field) == value if entry.respond_to?(field)
        end
      end
    end
  end

  results
end

# Example usage:
logs = [
  "2023-01-01 10:00:00 ERROR 192.168.1.1 GET /api/users 500 Database error",
  "2023-01-01 10:01:00 INFO 10.0.0.5 POST /login 200 Login successful",
  "2023-01-01 10:02:00 WARN 192.168.1.15 GET /dashboard 404 Page not found"
]

queries = {
  "errors" => { level: "ERROR" },
  "successful_requests" => { status_range: (200..299) },
  "login_attempts" => { path: "/login" },
  "database_issues" => { contains: "database" }
}

result = query_logs(logs, queries)
