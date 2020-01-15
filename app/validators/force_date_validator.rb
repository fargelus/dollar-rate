# frozen_string_literal: true

class ForceDateValidator < ActiveModel::Validator
  def validate(record)
    if record.force_date&.past?
      record.errors[:force_date] << 'Указанная дата уже прошла!'
    end
  end
end
