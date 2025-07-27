# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  current = min = min_index = 0

  gas.each_with_index do |g, i|
    current += g - cost[i]

    next unless current < min

    min = current
    min_index = i + 1
  end

  current < 0 ? -1 : min_index
end
