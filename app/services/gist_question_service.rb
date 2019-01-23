class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    response.extend(GistQuestionResultDecorator)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('services.gist.title', test_title: @test.title),
      files: {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
