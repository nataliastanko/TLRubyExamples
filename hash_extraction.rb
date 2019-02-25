require 'HTTParty'
require 'json'

filename = 'stethoscope_london_sciencemuseum_pretty.json'

unless File.file? filename 
  # Make a HTTP request to UK science museum collections
  response = HTTParty.get('https://collection.sciencemuseum.org.uk/search/objects?categories=clinical-diagnosis&places=london&date[to]=1900&object_type=stethoscope',
    # query: {
    #   categories: 'clinical-diagnosis',
    #   object_type: 'stethoscope',
    #   'date[to]': 1900,
    #   places: 'New York'
    # },
    headers: {Accept: 'application/json'})

  # save reasult to json file with pretty format
  File.open(filename, 'w') { 
    |f| f.write(JSON.pretty_generate(response.parsed_response.slice('data')))
  }
end

# read json file
data_hash = JSON.parse(File.read filename)
# extract link to each stethoscope
data_hash.dig('data').each{ |stethoscope| puts stethoscope.dig('links', 'self') }
