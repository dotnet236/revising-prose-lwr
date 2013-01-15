def sentence
  self.class.description
end

def lard_factor(original_sentence, concise_sentence)
  original_word_count = original_sentence.split.size
  concise_word_count = concise_sentence.split.size

  ((Float(original_word_count) - Float(concise_word_count)) / Float(original_word_count)).round 2
end

RSpec::Matchers.define :be_less_than do |expected|
  match do |actual|
    actual < expected
  end
end

describe 'Revising Prose' do
  describe "Chapter 1 - Action" do
    describe "Prepositional-Phrase Strings" do
      describe "'This sentence is in need of an active verb'" do
        it "contains the complex active verb 'in need of'" do
          sentence.should include 'in need of'
        end

        it "could use the simple active verb 'needs'" do
          'This sentence needs an active verb'.should include 'needs'
        end
      end

      describe "'Physical satisfaction is the most obvious consequence of premarital sex'" do
        it "contains the 'to be' form 'is'" do
          sentence.should include 'is'
        end

        it "could more concisely be written 'People usually enjoy premarital sex.'" do
          concise_sentence = 'People usually enjoy premarital sex'
          concise_sentence.length.should be_less_than sentence.length
          lard_factor(sentence, concise_sentence).should == 0.5
        end
      end

      describe "'In response to the issue of equality for educational and occupational mobility, it is my belief that a system of inequality exists in the school system.'" do
        it "contains the 'to be' form 'is'" do
          sentence.should include ' is '
        end

        it "contains 6 prepositional phrases" do
          sentence.should include 'In response'
          sentence.should include 'to the issue'
          sentence.should include 'of equality'
          sentence.should include 'for educational and occupational mobility'
          sentence.should include 'a system of inequality'
          sentence.should include 'exists in the school system.'
        end

        it "could use the active voice 'I believe' instead of 'it is my belief'" do
          "In response to the issue of equality for educational and occupational mobility,
           I believe that a system of inequality exists in the school system.".should include 'I believe'
        end

        it "could be written 'I believe inequality exists in the schools.'" do
          concise_sentence = 'I believe inequality exists in the schools'
          concise_sentence.length.should be_less_than sentence.length
          lard_factor(sentence, concise_sentence).should == 0.73
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
          concise_sentence = 'People usually resist new regulations.'
          concise_sentence.length.should be_less_than sentence.length
          lard_factor(sentence, concise_sentence).should == 0.69
        end
      end
    end
  end
end
