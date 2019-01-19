module ApplicationHelper
  STYLE_KEYS = { greeting: 'info', notice: 'success', alert: 'danger' }.freeze
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def key_to_style(key)
    "alert-#{STYLE_KEYS[key.to_sym]}"
  end
end
