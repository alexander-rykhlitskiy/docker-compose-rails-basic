if ENV['RAILS_ENV'].in?(%w[test development]) && ENV['GLOBAL_PRY_HISTORY'].blank?
  Pry.config.history.file = Rails.root.join('.pry_history')
end
