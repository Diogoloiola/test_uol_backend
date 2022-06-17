module Uol
  module Models
    class SuperHero < Dry::Struct
      attribute :code_name, Types::Strict::String
    end
  end
end
