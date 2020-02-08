# Provided, don't edit
require 'directors_database'
require 'pp'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection) #iterate over movies collection. 
  new_array = []
  row_index = 0 
  while row_index < movies_collection.length do 
  new_array << movie_with_director_name(name, movies_collection[row_index]) 
  row_index += 1 
end
return new_array
end


def gross_per_studio(collection)
  new_hash = {}
  column_index = 0 
  while column_index < collection.length do 
movies_info = collection[column_index]
if !new_hash[movies_info[:studio]] # <- if studio doesn't exist in this hash at the moment in the loop, then add the studio and put its worldwide gross amount that you have from another source.
  new_hash[movies_info[:studio]] = movies_info[:worldwide_gross]
else 
new_hash[movies_info[:studio]] += movies_info[:worldwide_gross] #^if does exist in this new hash, then we increase the worldwide gross 
end 

  
column_index += 1 
end
return new_hash
end

def movies_with_directors_set(source)
  #"source" returns [{:name=>"Byron Poodle",sInName>)> source
  # :movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]},
 # {:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}]
 
  new_array = []
  
  column_index = 0
  while column_index < source.length do 
  name = source[column_index][:name]  # this line and the line below are needed, in addition to calling the past method below, because we need to show that method we called what names and movies we want it to operate on
  movies = source[column_index][:movies]
  new_array << movies_with_director_key(name, movies)
  column_index += 1   
  end
  return new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
