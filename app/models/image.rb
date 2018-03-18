class Image < ApplicationRecord
  def as_json
    {
      image: file_url
    }
  end
end
