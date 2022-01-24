board = (1..8).to_a.repeated_permutation(2).to_a

def find_moves(origin)
  board = (1..8).to_a.repeated_permutation(2).to_a
  [[origin[0] + 2, origin[1] + 1],
  [origin[0] + 2, origin[1] - 1],
  [origin[0] - 2, origin[1] + 1],
  [origin[0] - 2, origin[1] - 1],
  [origin[0] + 1, origin[1] + 2],
  [origin[0] + 1, origin[1] - 2],
  [origin[0] - 1, origin[1] + 2],
  [origin[0] - 1, origin[1] - 2]].
  intersection(board)
end

def path_search(origin, destiny, edges = 0, queue = [])
  return edges += 1 if find_moves(origin).one?(destiny)

  queue = find_moves(origin)
  queue.size.times do
    queue <<
  end
end

def knight_moves(origin, destiny)

end

p path_search([0,0],[1,3])