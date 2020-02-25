namespace :post_date do
  desc "post_slack" # このタスクの説明を書く
# タスクの名前。　「:environment」がないとDBやモデルにアクセスできないので、使う場合は付ける
  task post_slack: :environment do
    CATAPI_URL = "http://thecatapi.com/api/images/get?format=xml"
    doc = Nokogiri::XML(open(CATAPI_URL).read)
    img_url = doc.xpath("//url").text
    Slack.chat_postMessage text: img_url,
                           username: '猫画像Bot',
                           channel: '#random'
  end
end
