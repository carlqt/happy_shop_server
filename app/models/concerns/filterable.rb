module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(params)
      result = self.where(nil)
      params.each do |key, val|
        result = result.public_send(key, val) if val.present?
      end

      result
    end
  end
end
