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

  def html_safe_flash_key?(key)
    /(\b|_|\.)html$/.match?(key.to_s)
  end

  def trim_key_html_ending(key)
    key.to_s.delete_suffix('_html')
  end
end
