class RichTextValidator < ActiveModel::Validator

  def validate(record)
    if record.has_attribute?(:body)
    unless record.body.to_plain_text.length > 250
      record.errors.add :body, "Body can not be less than 400 characters"

    end
    end
    if record.has_attribute?(:description)
      unless record.description.to_plain_text.length > 200
      record.errors.add :description, "Description can not be less than 200 characters"

      end
    end
  end
end