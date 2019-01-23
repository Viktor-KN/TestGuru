module GistQuestionResultDecorator
  def success?
    !!self[:html_url]
  end
end
