require 'net/http'
require 'json'
require 'pp'

#1)

carl  = {
          :toast => 'cosmos',
          :punctuation => [ ',', '.', '?' ],
          :words => [ 'know', 'for', 'we']
        }

sagan = [
          { :are => 'are', 'A' => 'a' },
          { 'waaaaaay' => 'way', :th3 => 'the' },
          'itself',
          { 2 => ['to']}
        ]

puts "#{carl[:words][2]} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]}  #{carl[:toast]} #{sagan[3][2][0]} #{carl[:words][0]} #{sagan[2]}#{carl[:punctuation][1]}"



#2) 

ghosts = [
  { name: 'Inky', age: 4, loves: 'reindeers', net_worth: 25 },
  { name: 'Pinky', age: 5, loves: 'garden tools', net_worth: 14 },
  { name: 'Blinky', age: 7, loves: 'ninjas', net_worth: 18.03 },
  { name: 'Clyde', age: 6, loves: 'yarn', net_worth: 0 }
]

ghosts.each do |ghost|
  ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
  ghost_info += "loves #{ghost[:loves]} and "
  ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
  puts ghost_info
end

#3) 

# Define the URL of the API endpoint
url = 'https://dog.ceo/api/breeds/list/all'

# Create a URI object from the URL
#The URI class in Ruby's standard library provides a way to parse and manipulate URIs. When you create a URI object,
# it properly parses the URL and ensures it's correctly formatted for HTTP requests. The Net::HTTP methods are designed 
#to work with URI objects because these objects contain parsed components of the URL, such as the scheme, host, port, path, and query.
uri = URI(url)

# Send an HTTP GET request to the specified URI
response = Net::HTTP.get(uri)

# Parse the JSON response
dog_breeds = JSON.parse(response)


# Extracting the breeds and sub-breeds
dog_breeds['message'].each do |breed, sub_breeds|
  if sub_breeds.empty?
    puts "* #{breed.capitalize}"
  else
    puts "* #{breed.capitalize}"
    sub_breeds.each do |sub_breed|
      puts "  * #{sub_breed.capitalize}"
    end
  end
end

  

#4) 

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response)

# Initialize a counter for Ash trees
ash_tree_count = 0

# Iterate through the tree data to count Ash trees
tree_data.each do |tree|
  if tree['common_name'] && tree['common_name'].downcase.include?('ash')
    ash_tree_count += 1
  end
end

# Print the count of Ash trees
puts "Total number of Ash trees: #{ash_tree_count}"

# To analyze the full dataset, replace the URL and repeat the process
full_url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
full_uri = URI(full_url)
full_response = Net::HTTP.get(full_uri)
full_tree_data = JSON.parse(full_response)

# Reset the Ash tree counter
ash_tree_count = 0

# Count Ash trees in the full dataset
full_tree_data.each do |tree|
  if  tree['common_name'].downcase.include?('ash')
    ash_tree_count += 1
  end
end

# Print the count of Ash trees in the full dataset
puts "Total number of Ash trees in the full dataset: #{ash_tree_count}"