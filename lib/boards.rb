class Boards
  @@board = {}
  @@total = 0

  attr_reader :id, :topic
  def initialize(topic:, id: nil)
    @topic = topic
    @id = (id || @@total += 1)
  end

  def self.all
    @@board.values()
  end

  def save
    @@board[self.id] = Boards.new(topic: self.topic, id: self.id)
  end

  def self.find(id)
    @@board[id]
  end

end