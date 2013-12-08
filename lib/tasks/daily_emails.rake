desc "send daily emails to admins"
task daily_emails: :environment do
  User.notify_about_orders_that_due_soon_or_overdue
end
