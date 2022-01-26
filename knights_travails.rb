# frozen_string_literal: true

def find_moves(origin)
  board = (1..8).to_a.repeated_permutation(2).to_a
  [
    [origin[0] + 2, origin[1] + 1],
    [origin[0] + 2, origin[1] - 1],
    [origin[0] - 2, origin[1] + 1],
    [origin[0] - 2, origin[1] - 1],
    [origin[0] + 1, origin[1] + 2],
    [origin[0] + 1, origin[1] - 2],
    [origin[0] - 1, origin[1] + 2],
    [origin[0] - 1, origin[1] - 2]
  ].intersection(board).map { |possibility| [possibility] << [origin] }
end

def knight_moves(origin, destiny, edges = 1, queue = find_moves(origin))
  # iteration through each tree's level. On each of them add the possible
  # moves from that position to the subsequent ones
  queue.size.times do
    if queue[0][0] == destiny
      path_taken = (queue[0][1].reverse << destiny).reduce do |message, move|
        message.to_s + '-->' + move.to_s
      end
      message = "Took #{edges} moves to reach destination.\nThe moves were: #{path_taken}"
      return puts message
    end

    # populate the next level queue
    next_level = find_moves(queue[0][0])
    next_level = next_level.map do |path| # add reference to the path taken
      path[1] += queue[0][1]
      path
    end
    queue << next_level

    queue.delete_at(0)
  end
  knight_moves(origin, destiny, edges + 1, queue.reduce(:+))
end

knight_moves([4, 1], [7, 7])
