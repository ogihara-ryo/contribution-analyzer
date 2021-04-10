namespace :github do
  desc "Sync GitHub's Activity Event"

  task sync_activity_events: :environment do
    GitHub::ActivityEvent.sync
  end
end
