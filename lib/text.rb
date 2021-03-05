class Text
  @@entires = {}
  @@total = 0
  attr_reader :id, :text, :board_id
  def initialize (text:, board_id:, id: nil)
    @text = text
    @board_id = board_id
    @id = (id || @@total += 1)
  end
  def self.all
    @@entires.values()
  end
  def save
    if @@entires[self.board_id]

      @@entires[self.board_id].store({
        self.id => Text.new(text: self.text, board_id: self.board_id, id: self.id)
      })
    else
      @@entires[self.board_id] = {self.id => Text.new(text: self.text, board_id: self.board_id, id: self.id)}
    end

  end
  def self.find(id)
    @@entires[id]
  end
end