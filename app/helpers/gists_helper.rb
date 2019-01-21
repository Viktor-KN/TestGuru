module GistsHelper
  def github_gist_url(gist)
    "https://gist.github.com/#{gist.hash_string}"
  end
end
