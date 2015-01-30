require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get ('/bands') do
  @bands = Band.all()
  erb(:bands)
end

get("/bands/:id") do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @bands = Band.all()
  @venues = Venue.all()
  erb(:bands_edit)
end

get("/venues/:id") do
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  @bands = Band.all()
  @venues = Venue.all()
  erb(:venues_info)
end

patch ('/bands/:id') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  venue_ids = params.fetch("venue_ids") + @band.venue_ids
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  @bands = Band.all()
  erb(:bands_edit)
end

patch ('/bands/:id/edit') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  name = params.fetch("name")
  @band.update({:name => name})
  redirect('/')
end

delete ('/bands/:id/delete') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @band.delete()
  redirect('/')
end

get ('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post ('/bands') do
  name = params.fetch("name")
  @band = Band.create({:name => name})
  @bands = Band.all()
  if @band.save()
    erb(:bands)
  else
    erb(:errors_band)
  end
end

post ('/venues') do
  name = params.fetch("name")
  @venue = Venue.create({:name => name})
  @venues = Venue.all()
  if @venue.save()
    erb(:venues)
  else
    erb(:errors_venue)
  end
end
