require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get('/') do

  erb(:index)
end

# CRUD bands
get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  name = params['band_name']
  Band.create({:name => name})
  redirect back
end

patch('/bands') do
  band_id = params['band_id']
  band = Band.find(band_id)
  new_name = params['new_name']
  band.update({:name => new_name})
  redirect back
end

# delete('/bands/:id') do
#
#   redirect back
# end

# Individual Band Page

get('/band/:id') do
  band_id = params['id']
  @band = Band.find(band_id)
  erb(:band)
end



#CRUD venues

# get('/venues') do
#
#   erb(:venues)
# end
