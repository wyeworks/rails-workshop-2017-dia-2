class TrelloBoardsImporter

  def self.init_for_user(user)
    public_key = user.developer_public_key
    token = user.member_token

    new(public_key, token)
  end

  def initialize(public_key, token)
    @public_key = public_key
    @token = token
  end

  def boards
    me = trello_client.find('member', 'me')
    me.boards
  end

  private

  def trello_client
    @trello_client ||= Trello::Client.new(
      developer_public_key: @public_key,
      member_token: @token
    )
  end
end
