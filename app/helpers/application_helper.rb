module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def user_root_path
    current_user&.is_a?(Admin) ? admin_tests_path : root_path
  end
end
