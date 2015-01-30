require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }

  it("must have a name") do
    venue1 = Venue.new({:name => ""})
    expect(venue1.save).to(eq(false))
  end

  it("will always be in title case") do
    venue1 = Venue.create({:name => "the cool coats club"})
    expect(venue1.name()).to(eq("The Cool Coats Club"))
  end

end
