module ApplicationHelper
  STYLE_KEYS = { greeting: 'info', notice: 'success', alert: 'danger' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def key_to_style(key)
    clean_key = key.to_s.delete_suffix('_html')
    "alert-#{STYLE_KEYS[clean_key.to_sym]}"
  end

  def html_safe_flash_key?(key)
    key.to_s.end_with?('_html')
  end
end
