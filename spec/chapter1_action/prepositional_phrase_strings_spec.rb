require 'spec_helper'

describe 'Revising Prose' do
  describe "Chapter 1 - Action" do
    describe "Prepositional-Phrase Strings" do
      describe "'This sentence is in need of an active verb'" do
        it "Contains the complex active verb 'in need of'" do
          sentence.should include 'in need of'
        end

        it "Could use the simple active verb 'needs'" do
          'This sentence needs an active verb'.should include 'needs'
        end
      end

      describe "'Physical satisfaction is the most obvious consequence of premarital sex'" do
        it "Contains the 'to be' form 'is'" do
          sentence.should include 'is'
        end

        it "Could more concisely be written 'People usually enjoy premarital sex.'" do
          concise_sentence = 'People usually enjoy premarital sex'
          lard_factor(sentence, concise_sentence).should == 0.5
        end
      end

      describe "'In response to the issue of equality for educational and occupational mobility, it is my belief that a system of inequality exists in the school system.'" do
        it "Contains the 'to be' form 'is'" do
          sentence.should include ' is '
        end

        it "Contains 6 prepositional phrases" do
          sentence.should include 'In response'
          sentence.should include 'to the issue'
          sentence.should include 'of equality'
          sentence.should include 'for educational and occupational mobility'
          sentence.should include 'a system of inequality'
          sentence.should include 'exists in the school system.'
        end

        it "Could use the active voice 'I believe' instead of 'it is my belief'" do
          "In response to the issue of equality for educational and occupational mobility,
           I believe that a system of inequality exists in the school system.".should include 'I believe'
        end

        it "Could be written 'I believe inequality exists in the schools.'" do
          concise_sentence = 'I believe inequality exists in the schools'
          lard_factor(sentence, concise_sentence).should == 0.73
        end
      end

      describe "'The history of new regulatory provisions is that there is generally an immediate resistance to them.'" do
        it "Contains two 'to be' forms 'is' and 'is'" do
          sentence.should =~ /is\s.*\sis/
        end

        it "Contains 1 prepositional phrases" do
          sentence.should include 'of new regulatory provisions'
        end

        it "Contains the 'resistance' action hidden behind 'is that there is'" do
          sentence.should =~ /is that there is\s.*\sresistance/
        end

        it "Could be written 'People usually resist new regulations.'" do
          concise_sentence = 'People usually resist new regulations.'
          lard_factor(sentence, concise_sentence).should == 0.69
        end
      end

      describe "'The project is likely to result in a minor population increase in the city from families relocating to the site from outside the community'" do
        it "Contains the 'to be' form 'is'" do
          sentence.should include ' is '
        end

        it "Contains 1 infinitive phrase 'to result'" do
          sentence.should include 'to result'
        end

        it "Contains 5 prepositional phrases" do
          sentence.should include 'in a minor population increase'
          sentence.should include 'in the city'
          sentence.should include 'from families relocating'
          sentence.should include 'to the site'
          sentence.should include 'from outside the community'
        end

        it "Contains 'The project' as the actor" do
          sentence.should include 'The project'
        end

        it "Contains the active verb 'increase'" do
          sentence.should include ' increase '
        end

        it "Could concisely replace 'a minor population increase from outside the city to inside the city' with 'attract'" do
          'attract'.length.should be < 'a minor population increase from outside the city to inside the city'.length
        end

        it "Could concisely replace 'from families relocating to the site from outside the community' with 'new families to the city'" do
          'new families to the city'.length.should be < 'from families relocating to the site from outside the community'.length
        end

        it "Could concisely replace 'is likely to result' with 'will probably'" do
          'will probably'.length.should be < 'is likely to result'.length
        end

        it "Could be written 'The project will probably attract new families to the city'" do
          concise_sentence = 'The project will probably attract new families to the city'
          lard_factor(sentence, concise_sentence).should == 0.58
        end
      end

      describe "The type of writing that I have an interest in is in the area of creative writing" do

        it "Contains the 'to be' form 'is'" do
          sentence.should include ' is '
        end

        it "Contains the active verb 'interest'"do
          sentence.should include 'interest'
        end

        it "Contains 4 prepositional phrases" do
          sentence.should include 'of writing'
          sentence.should include 'an interest'
          sentence.should include 'in the area'
          sentence.should include 'of creative writing'
        end

        it "Could be written 'I want to study creative writing'" do
          concise_sentence = 'I want to study creative writing'
          lard_factor(sentence, concise_sentence).should == 0.65
        end
      end

      describe "There are several examples of this selection process present in the Listerine ad." do

        it "Contains 2 prepositional strings" do
          sentence.should include 'of this selection process'
          sentence.should include 'in the Listerine ad'
        end

        it "Could concisely replace 'several examples' with 'exemplifies'" do
          'exemplifies'.length.should < 'several examples'.length
        end

        it "Could be written 'The Listerine ad exemplifies this selection process.'" do
          concise_sentence = 'The Listerine ad exemplifies this selection process.'
          lard_factor(sentence, concise_sentence).should == 0.46
        end
      end
    end
  end
end
