require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many (:bands) }
  it('validates presence of venue name') do
    venue = Venue.new({:name => ''})
    expect(venue.save()).to(eq(false))
  end

  it("will capitalize the venue name") do
    venue = Venue.create({:name => "aladin"})
    expect(venue.name()).to(eq("Aladin"))
  end

  it("will alphabetize the venue names") do
    venue1 = Venue.create({:name => "mississippi pizza"})
    venue2 = Venue.create({:name => "aladin"})
    expect(Venue.alphabetize()).to(eq([venue2, venue1]))
  end
end
