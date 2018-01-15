# frozen_string_literal: true

namespace :active_storage do
  desc "Copy over the migration needed to the application"
  task install: :environment do
    if Rake::Task.task_defined?("active_storage:install:migrations")
      Rake::Task["active_storage:install:migrations"].invoke
    else
      Rake::Task["app:active_storage:install:migrations"].invoke
    end
  end

  desc "Clear storage"
  task clear: :environment do
    puts "foo"
  end
end

Rake::Task["active_storage:clear"].enhance ["db:migrate:status"]
