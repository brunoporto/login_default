require 'rails/generators/base'
require 'rails/generators/migration'

module LoginDefault
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      include Rails::Generators::Migration
      desc "Creates a Devise initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        template "login_default.rb", "config/initializers/login_default.rb"
      end

      def copy_config
        template "login_default.yml", "config/login_default.yml"
      end

      desc 'add the migrations'
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "login_default_users.rb", "db/migrate/login_default_users.rb"
      end

    end

  end
end