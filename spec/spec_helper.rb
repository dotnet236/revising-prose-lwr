def sentence
  self.class.description
end

def lard_factor(original_sentence, concise_sentence)
  original_word_count = original_sentence.split.size
  concise_word_count = concise_sentence.split.size

  ((Float(original_word_count) - Float(concise_word_count)) / Float(original_word_count)).round 2
end
