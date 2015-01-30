require('spec_helper')

describe(Band) do
  it {should have_and_belong_to_many(:venues)}

  it("must have a name") do
    band1 = Band.new({:name => ""})
    expect(band1.save).to(eq(false))

  end

  it("will always be in titlecase") do
    band1 = Band.create({:name => "the hash Rockets"})
    expect(band1.name()).to(eq("The Hash Rockets"))
  end
end
