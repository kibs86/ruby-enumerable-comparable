# A simple representation of a playing card.

# all caps is standard for constant data
# freeze makes those arrays unchangeable
class Card
  SUITS = %w(C D H S).freeze
  RANKS = [(2..10).to_a, %w(J Q K A)].flatten.freeze

  include Comparable

  attr_reader :suit, :rank

  def <=>(other)
    rank_compare = RANKS.index(rank) <=> RANKS.index(other.rank)
    return rank_compare unless rank_compare.zero?
    SUITS.index(suit) <=> SUITS.index(other.suit)
  end

  def initialize(rank, suit)
    raise ArgumentError,
          "Suit: '#{suit}' not in #{SUITS}" unless SUITS.include? suit
    raise ArgumentError,
          "Rank: '#{rank}' not in #{RANKS}" unless RANKS.include? rank

    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank}:#{suit}"
  end
end
