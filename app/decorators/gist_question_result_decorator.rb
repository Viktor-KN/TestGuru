class GistQuestionResultDecorator
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def html_url
    data[:html_url]
  end

  def success?
    html_url.present?
  end
end
