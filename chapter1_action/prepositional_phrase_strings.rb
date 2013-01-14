def sentence
  self.class.description
end

describe 'Revising Prose' do
  describe "Chapter 1 - Action" do
    describe "Prepositional-Phrase Strings" do
      describe "'This sentence is in need of an active verb'" do
        it "contains the complex active verb 'in need of'" do
          sentence.should include 'in need of'
        end

        it "could use the simple active verb 'needs'" do

        end
      end

      describe "'Physical satisfaction is the most obvious consequence of premarital sex'" do
        it "contains the 'to be' form 'is'" do
          sentence.should include 'is'
        end

        it "could more concisely be written 'People usually enjoy premarital sex.'" do

        end
      end

      describe "'In response to the issue of equality for educational and occupational mobility, it is my belief that a system of inequality exists in the school system.'" do
        it "contains the 'to be' form 'is'" do
          sentence.should include ' is '
        end

        it "contains 6 prepositional phrases" do
          sentence.should include 'in response'
          sentence.should include 'to the issue'
          sentence.should include 'of equality'
          sentence.should include 'for educational and occupational mobility'
          sentence.should include 'a system of inequality'
          sentence.should include 'exists in the schools system.'
        end

        it "could use the active voice 'I believe' instead of 'it is my belief'" do
          #TODO What to test for here?
          'In response to the issue of equality for educational and occupational mobility, I believe that a system of inequality exists in the school system.'.include 'I believe'
        end

        it "could be written 'I believe inequality exists in the schools.'" do

        end
      end

      describe "'The history of new regulatory provisions is that there is generally an immediate resistance to them.'" do
        it "contains two 'to be' forms 'is' and 'is'" do
          sentence.should =~ /is\s.*\sis/
        end

        it "contains 1 prepositional phrases" do
          sentence.should include 'of new regulatory provisions'
        end

        it "contains the 'resistance' action hidden behind 'is that there is'" do
          sentence.should =~ /is that there is\s.*\sresistance/
        end

        it "could be written 'People usually resist new regulations.'" do

        end
      end
    end
  end
end
