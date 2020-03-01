require 'net/http'
require 'uri'
require 'json'

namespace :post_date do
  desc "post_slack"
  task post_slack: :environment do
    uri = URI("https://api.thecatapi.com/v1/images/search")
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(req)
    end
    img_url = JSON.parse(res.body)[0]["url"]

    Slack.chat_postMessage text: img_url,
                           username: '猫画像Bot',
                           channel: '#random'
  end
end
