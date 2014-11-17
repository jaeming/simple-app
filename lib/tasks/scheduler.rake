task delete_items: :environment do
  Task.delete_old_tasks
end
