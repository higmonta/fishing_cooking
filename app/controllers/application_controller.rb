class ApplicationController < ActionController::Base
  before_action :ensure_domain
  FQDN = 'www.fishing-cook.com'.freeze

  private

  def not_authenticated
    flash[:danger] = t 'defaults.login_required'
    redirect_to login_path
  end

  def ensure_domain
    return unless /\.herokuapp.com/ =~ request.host

    # 主にlocalテスト用の対策で80と443以外でアクセスされた場合ポート番号をURLに含める
    port = ":#{request.port}" unless [80, 443].include?(request.port)
    redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}"
  end
end
