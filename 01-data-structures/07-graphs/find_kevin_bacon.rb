counter = 0
returned_array = []
def find_kevin_bacon(starting_actor)
  # passed value is Kevin Bacon or terminating condition for recursion
  if starting_actor.name == "Kevin Bacon"
    return returned_array
  end
  # Check actor has been in any films with Kevin Bacon
  starting_actor.film_actor_hash.each do |film_title|
    if starting_actor.film_actor_hash[film_title].any? { |actor| actor == Kevin_Bacon }
      returned_array << film_title
      find_kevin_bacon(Kevin_Bacon)
    else
      # if not, check each actor (up to seven times) to see if
      # that current actor has been in a film with Kevin Bacon
      if counter < 7
        starting_actor.film_actor_hash[film_title].each do |actor|
          counter += 1
          returned_array << film_title
          find_kevin_bacon(actor)
        end
      else
        # empty the counter and array before next actor
        counter = 0
        returned_array = []
      end
    end
  end
end
