def nearest_possible_neighbor(cities_graph, current_city)
  starting_city = current_city

  while current_city.visited == false
    neighbor_cities = current_city.neighbors
    next_city = neighbor_cities[0]

    for current_neighbor in neighbor_cities
      if next_city.visited == true && current_neighbor.distance < next_city.distance
        next_city = current_neighbor
      end
    end
    current_city.visited = true
    current_city = next_city
  end
end

def nearest_possible_neighbor2(cities_graph, current_city)
  neighbor_cities = current_city.neighbors
  next_city = neighbor_cities[0]
  for current_neighbor in neighbor_cities
    if current_neighbor.distance < next_city.distance
      next_city = current_neighbor
    end
  end
  current_city.visited = true
  current_city = next_city
  if # all cities have been visited
    return
  else
    nearest_possible_neighbor2(cities_graph, current_city)
  end
end

# sample that highlights the bug
city_a.neighbor_cities = {city_b: 1, city_c: 3}
city_b.neighbor_cities = {city_c: 2, city_d: 4}
city_c.neighbor_cities = {city_a: 3, city_d: 5}
city_d.neighbor_cities = {city_b: 4, city_c: 5}
