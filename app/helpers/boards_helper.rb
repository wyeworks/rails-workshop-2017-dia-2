module BoardsHelper
  def visibility_options
    [
      ['Public', 'public'],
      ['Private', 'private']
    ]
  end

  def trello_boards_options(trello_boards)
    trello_boards.map { |b| [b.name, b.id] }
  end
end
