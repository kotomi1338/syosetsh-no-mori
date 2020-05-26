# ==============================================================================
# lib - ignore must revalidate
# ==============================================================================
# https://qiita.com/mugi_uno/items/dcfbb14c8fae12b4e33f
class IgnoreMustRevalidate < Faraday::Middleware
  def initialize(app, *_args)
    super(app)
  end

  def call(env)
    dup.call!(env)
  end

  def call!(env)
    response = @app.call(env)
    # faraday-http-cacheでキャッシュさせるためにmust-revalidateをヘッダから落とす
    response.headers['cache-control'] = response.headers['cache-control'].gsub(/must-revalidate(, )?/, '')
    response
  end
end
