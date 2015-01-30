require('spec_helper')

  describe(Band) do
    it { should have_and_belong_to_many (:venues) }
    it('validates presence of the band name') do
      band = Band.new({:name => ''})
      expect(band.save()).to(eq(false))
    end

    it("will capitalize the band name") do
      band = Band.create({:name => "white monkeys"})
      expect(band.name()).to(eq("White monkeys"))
    end

    it("will alphabetize the band names") do
      band1 = Band.create({:name => "white monkeys"})
      band2 = Band.create({:name => "arctic monkeys"})
      expect(Band.alphabetize()).to(eq([band2, band1]))
    end
  end
