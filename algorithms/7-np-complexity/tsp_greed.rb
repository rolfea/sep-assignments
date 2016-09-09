# cities and if they have been visited
cities_visited = {A: false, B: false, C: false, D: false}
# each city and it's neighbors, which should be an object with a distance property
A.neighbors = [B = 2, C = 3, D = 11]
B.neighbors = [A = 2, C = 4, D = 10]
C.neighbors = [A = 3, B = 4, D = 9]
D.neighbors = [A = 11, B = 10, C = 9]

def nearest_possible_neighbor(cities_graph, current_city)
  all_cities_visited = false

  while all_cities_visited == false
    neighbor_cities = current_city.neighbors
    next_city = nil
    # searches for an unvisited neighbor city
    for i in 0..neighbor_cities.length - 1
      if cities_visited[:neighbor_cities[i]] == false
        next_city = neighbor_cities[i]
        break
      end
    end
    # if all neighbors are visited, you are finished
    return if next_city == nil
    # loops through the neighbors to find the smallest distance to an unvisited city
    for i in 0..neighbor_cities.length - 1
      if neighbor_cities[i].distance < next_city.distance && cities_visited[:neighbor_cities[i]] == false
        next_city = neighbor_cities[i]
      end
    end
    # sets the current city to visited
    cities_visited[:current_city] = true
    # sets the loop to the next city
    current_city = next_city
    # checks if all cities have been visited
    cities_visited.each_value do |value|
      if value == true
		    all_cities_visited = true
	    else
		    all_cities_visited = false
		    break
	    end
    end
  end
end
# sample that highlights the bug
ab = 2
ac = 3
ad = 11
bc = 4
bd = 10
cd = 9
