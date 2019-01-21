class GistQuestionService
  GITHUB_GIST_TOKEN = ENV['GITHUB_GIST_TOKEN'].freeze

  def initialize(question, client = nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: GITHUB_GIST_TOKEN)
  end

  def call
    response = @client.create_gist(gist_params)
    response[:success] = @client.last_response.status == 201
    response
  end

  private

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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
