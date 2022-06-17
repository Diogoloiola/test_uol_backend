class Player < ApplicationRecord
  validates :name, :email, presence: true

  before_save :choice_code_name

  enum group: {
    avengers: 1,
    'justice_league': 2
  }

  private

  def choice_code_name
    flag = false
    fetch_code_names.each do |object|
      result = Player.where(code_name: object.code_name)
      if result.empty?
        self.code_name = object.code_name
        flag = true
      end
    end
    raise 'Erro não foi possivel cadastrar esse usuário, todos os code nomes já foram utilizados' unless flag
  end

  def fetch_code_names
    case group
    when 'avengers'
      Uol::Client.new.avengers.all
    when 'justice_league'
      Uol::Client.new.justice_league.all
    else
      raise 'INVALID OPTION'
    end
  end
end
