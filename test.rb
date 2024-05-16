require 'net/http'
require 'json'
require 'pp'

# Define the URL for the subset of the tree dataset
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'

# Create a URI object from the URL
uri = URI(url)

# Send an HTTP GET request to the specified URI
response = Net::HTTP.get(uri)

# Parse the JSON response to convert it into Ruby data
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
