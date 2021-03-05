class Text
  @@entries = {}
  @@total = 0

  attr_reader :id, :text, :board_id
  def initialize (text:, board_id:, id: nil)
    @text = text
    @board_id = board_id
    @id = (id || @@total += 1)
  end

  def self.all
    @@entries.values()
  end

  def save
    if @@entries[self.board_id]
      @@entries[self.board_id][self.id] = Text.new(text: self.text, board_id: self.board_id, id: self.id)
    else
      @@entries[self.board_id] = { self.id => Text.new(text: self.text, board_id: self.board_id, id: self.id) }
    end
  end
  def self.find(id)
    @@entries[id]
  end

end