Rails.application.configure do
  # ここで指定した設定は、config/application.rbの設定よりも優先されます。

  # 開発環境では、アプリケーションのコードはリクエストごとにリロードされます。
  # これにより応答時間が遅くなりますが、
  # コードを変更したときにWebサーバーを再起動する必要がないため、開発には最適です。
  config.cache_classes = false

  # ログを標準出力に表示
  config.logger = Logger.new(STDOUT)

  # 起動時にeager_loadをロードしない
  # これにより、ほとんどのRailsとアプリケーションがメモリに読み込まれ、
  # スレッド化されたWebサーバーとコピーオンライトに依存するWebサーバーの両方のパフォーマンスが向上します。
  # Rakeタスクはパフォーマンスのためにこのオプションを自動的に無視します。
  config.eager_load = false

  # 完全なエラーレポートを表示します。
  config.consider_all_requests_local = true

  # キャッシュを有効/無効にします。デフォルトでは、キャッシングは無効になっています。
  # rails dev:cacheで実行でき、キャッシングを切り替えます。
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # アップロードしたファイルをローカルファイルシステムに保存します
  #(オプションについてはconfig/storage.ymlを参照してください)
  config.active_storage.service = :local

  # メーラーが送れなくても気にしない。
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # 非推奨の通知をRailsロガーに出力します。
  config.active_support.deprecation = :log

  # pending migrationsがある場合、ページの読み込み時に(raise)エラーを発生させます。
  config.active_record.migration_error = :page_load

  # ログでデータベースクエリをトリガーしたコードを強調表示します。
  config.active_record.verbose_query_logs = true

  # デバッグモードでは、アセットの連結と前処理が無効になります。
  # このオプションは、多数の複雑なアセットを使用したビューのレンダリングで大幅な遅延を引き起こす可能性があります。
  config.assets.debug = true

  # アセットリクエストのロガー出力を抑制します
  config.assets.quiet = true

  # 欠落している翻訳のエラーを発生させます
  # config.action_view.raise_on_missing_translations = true

  # イベントファイルウォッチャーを使用して、route,localesなどのソースコードの変更を非同期的に検出する
  # この機能は、listen という gem に依存します。
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  BetterErrors::Middleware.allow_ip! "0.0.0.0/0"
end