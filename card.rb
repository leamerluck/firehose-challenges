
require "pry"

class Card
	attr_accessor :rank, :suit

	def initialize(rank, suit)
		self.rank = rank
		self.suit = suit
	end

	def output_card
		puts "#{self.rank} of #{self.suit}"
	end

end


class Deck
	def initialize
		@cards = []
		ranks = [2,3,4,5,6,7,8,9,10, "Jack", "Queen", "King", "Ace"]
		suits = ["spades", "diamonds", "hearts", "clubs"]
		
		ranks.each do |rank|
			suits.each do |suit|
				@cards << Card.new(rank,suit)
			end
		end
	end

	def output
		@cards.each do |card|
			card.output_card
		end
	end

	def shuffle
		@cards.shuffle!
	end

	def deal
		@cards.shift
	end

	def count
		@cards.count
	end
end

deck = Deck.new
deck.shuffle

puts "Cards are shuffled. Type \"deal\" if you'd like to have a card dealt."
deal = "deal"

while deal != "quit" && deck.count > 0
	print "> "
	deal = $stdin.gets.chomp.downcase

	if deal == "deal"
		user_card = deck.deal
		user_card.output_card
		if deck.count > 0
			puts "#{deck.count} cards remain. Deal again or quit?"
		else 
			puts "Game over."
		end
	elsif deal != "quit"
		puts "Type \"deal\" to deal a card or \"quit\" to quit."
	end
end

