require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get('/') do

  erb(:index)
end

# CRUD Bands
get('/bands') do
  @bands = Band.all().order('name')
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

delete('/bands') do
  band_id = params['band_id']
  band = Band.find(band_id)
  band.venues.destroy
  band.destroy
  redirect back
end

# Individual Band Page

get('/band/:id') do
  band_id = params['id']
  @band = Band.find(band_id)
  @venues = Venue.all().order('name')
  erb(:band)
end

patch('/band/:id') do
  band_id = params['id']
  band = Band.find(band_id)
  if params['venue_ids'] != nil
    venue_ids = params['venue_ids']
    venue_ids.each do |v_id|
      venue = Venue.find(v_id)
      band.venues << venue
    end
  end
  if params['new_venue_name'] != ""
    name = params['new_venue_name']
    venue = Venue.create({:name => name})
    band.venues << venue
  end
  redirect back
end

delete('/band/:id') do
  band_id = params['id']
  band = Band.find(band_id)
  venue_ids = params['venue_ids']
  venue_ids.each do |v_id|
    venue = Venue.find(v_id)
    band.venues.delete(venue)
  end
  redirect back
end

#CRUD Venues

get('/venues') do
  @venues = Venue.all.order('name')
  erb(:venues)
end

post('/venues') do
  name = params['venue_name']
  Venue.create({:name => name})
  redirect back
end

patch('/venues') do
  venue_id = params['venue_id']
  venue = Venue.find(venue_id)
  new_name = params['new_name']
  venue.update({:name => new_name})
  redirect back
end

delete('/venues') do
  venue_id = params['venue_id']
  venue = Venue.find(venue_id)
  venue.bands.destroy
  venue.destroy
  redirect back
end
