# ==============================================================================
# lib - tasks - ridgepole
# ==============================================================================
namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    ActiveRecord::Schema.enable_extension(:pgcrypto)
    ridgepole('--apply', "--file #{schema_file}")
    Rake::Task['db:schema:dump'].invoke
  end

  task dry: :environment do
    ridgepole('--apply', '--dry-run', "--file #{schema_file}")
  end

  desc 'Export database schema'
  task export: :environment do
    ridgepole('--export --split', "--output #{schema_file}")
  end

  private

  def schema_file
    Rails.root.join('db/Schemafile')
  end

  def config_file
    if ENV['DATABASE_URL'].present?
      uri = URI.parse(ENV['DATABASE_URL'])

      if [uri.scheme, uri.user, uri.password, uri.host, uri.path].any?(&:nil?)
        raise "Invalid uri: #{uri}"
      end

      # for fuckin' heroku uri scheme
      uri.scheme = 'postgresql' if uri.scheme == 'postgres'

      "\'{
        adapter:  #{uri.scheme},
        username: #{uri.user},
        password: #{uri.password},
        host:     #{uri.host},
        database: #{uri.path.sub(%r{\A/}, '')},
      }\'"

    else
      Rails.root.join('config/database.yml')
    end
  end

  def ridgepole(*options)
    command = [
      'bundle exec ridgepole',
      "--config #{config_file}",
      '--dump-with-default-fk-name',
      '--allow-pk-change',
      "--env #{ENV['RAILS_ENV']}",
    ]
    system [command + options].join(' ')
  end
end
