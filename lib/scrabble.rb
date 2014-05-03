class Scrabble
  def self.score(word)
    letter_hash={
	  "A"=>1, "B"=>3, "C"=>3, "D"=>2,
	  "E"=>1, "F"=>4, "G"=>2, "H"=>4,
	  "I"=>1, "J"=>8, "K"=>5, "L"=>1,
	  "M"=>3, "N"=>1, "O"=>1, "P"=>3,
	  "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
	  "U"=>1, "V"=>4, "W"=>4, "X"=>8,
	  "Y"=>4, "Z"=>10
	}
	if word==nil
		return 0
	  end
	return letter_hash[word.upcase]
	end
	
	def self.highest_score_from(words)
		word_score=0
		greatest=0
		word_picker=[]
		seven_letter_word=""
		winning_word=""
		greatest_words=[]
		
		score_hash=Hash.new
		words.each do |word|
			value_array=word.split("")
			value_array.each do |letter|
				word_score+=score(letter)
			end
			score_hash[word]=word_score
			word_score=0
		end

		score_hash.each do |word, value|
			if value>greatest
				greatest=value
			end
		end

		score_hash.each do |word, value|
			word_picker<<word if value==greatest
		end
				

		word_picker.each do |word|
			greatest_words<<word.length
		end

		for i in 0...word_picker.length
			if word_picker[i].length==7
				seven_letter_word=word_picker[i]
				winning_word=seven_letter_word
			
			else
				winning_word=word_picker.find {|word| word.length==greatest_words.min}	
			end	
			
		end

		return winning_word
	end
end		