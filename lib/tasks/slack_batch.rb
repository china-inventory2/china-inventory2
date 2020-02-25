require 'clockwork'
include Clockwork

every(1.day, 'regular_slack') do
  system "rake post_date:post_slack"
end
