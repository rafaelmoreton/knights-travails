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
    [origin[0] - 1, origin[1] - 2],
    origin # to be referenced by the #path_search recursive call
  ].intersection(board)
end

def path_search(origin, destiny, edges = 1, queue = find_moves(origin),
                path = '')
  # iteration through the first tree level. On each of them add the possible
  # moves from that position to the subsequent ones
  path += origin.to_s
  queue.size.times do
    return p edges, path if queue[0] == destiny

    queue << find_moves(queue[0])
    queue.delete_at(0)
  end
  path_search(origin, destiny, edges + 1, queue.reduce(:+), path)
end

def knight_moves(origin, destiny) end

path_search([0, 0], [3, 8])
