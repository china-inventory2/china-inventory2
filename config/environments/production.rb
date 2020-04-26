Rails.application.configure do
  # ここで指定した設定は、config / application.rbの設定よりも優先されます。
​
  # コードはリクエスト間でリロードされない。
  config.cache_classes = true
​
  # 起動時にeager_loadをロードしない
  # これにより、ほとんどのRailsとアプリケーションがメモリに読み込まれ、
  # スレッド化されたWebサーバーとコピーオンライトに依存するWebサーバーの両方のパフォーマンスが向上します。
  # Rakeタスクはパフォーマンスのためにこのオプションを自動的に無視します。
  config.eager_load = true
​
  # 完全なエラーレポートが無効になり、キャッシュがオンになります。
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
​
  # ENV ["RAILS_MASTER_KEY"]またはconfig / master.keyのいずれかで
  # マスターキーが使用可能になっていることを確認します。
  # このキーは、資格情報（およびその他の暗号化されたファイル）を復号化するために使用されます。
  # config.require_master_key = true
​
  # 以降、デフォルトで /public フォルダからの静的ファイルの提供を無効にします
  # ApacheまたはNGINXはこれをすでに処理しています。
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
​
  # JavaScriptとCSSを圧縮します。
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass
​
  # プリコンパイルされたアセットがない場合は、アセットパイプラインにフォールバックしないでください。
  config.assets.compile = false
​
  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb
​
  # アセットサーバーからの画像、スタイルシート、JavaScriptの提供を有効にします。
  # config.action_controller.asset_host = 'http://assets.example.com'
​
  # サーバーがファイルの送信に使用するヘッダーを指定します。
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX
​
  # アップロードしたファイルをローカルファイルシステムに保存します（オプションについてはconfig / storage.ymlを参照してください）
  config.active_storage.service = :local
​
  # Action_cableをメインプロセスまたはドメイン外にマウントします
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]
​
  # SSL経由でアプリへのすべてのアクセスを強制し、Strict-Transport-Securityを使用し、安全なCookieを使用します。
  # config.force_ssl = true
​
  # 最も低いログレベルを使用して、問題が発生したときに診断情報を利用できるようにする
  config.log_level = :error
​
  # すべてのログ行の前に次のタグを付ける
  config.log_tags = [ :request_id ]
​
  # 本番環境では別のキャッシュストアを使用させるかどうか
  # config.cache_store = :mem_cache_store
​
  # Active_Job（および環境ごとに個別のキュー）に実際のキューバックエンドを使用するかどうか
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "myapp_#{Rails.env}"
​
  config.action_mailer.perform_caching = false
​
  # 不正なメールアドレスを無視し、メール配信エラーを発生させないかどうか
  # これをtrueに設定し、電子メールサーバーを即時配信用に構成して、配信エラーを発生させます。
  # config.action_mailer.raise_delivery_errors = false
​
  # I18nのロケールフォールバックを有効にするかどうか
  #（翻訳が見つからない場合、すべてのロケールのルックアップをI18n.default_localeにフォールバックします）
  config.i18n.fallbacks = true
​
  # 登録済みのリスナーに廃止通知を送信します。
  config.active_support.deprecation = :notify
​
  # PIDとタイムスタンプが抑制されないように、デフォルトのロギングフォーマッタを使用します。
  config.log_formatter = ::Logger::Formatter.new
​
  # distributd setups には別のロガーを使用するようにする。
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')
​
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
​
  # マイグレーション後にスキーマをダンプしないようにする。
  config.active_record.dump_schema_after_migration = false
end