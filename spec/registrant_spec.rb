require './lib/registrant'

RSpec.describe Registrant do

    it "exists" do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        expect(registrant_1).to be_a(Registrant)
    end
    
end