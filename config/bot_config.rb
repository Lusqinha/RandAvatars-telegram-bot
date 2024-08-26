require 'dotenv/load'


class BotConfig
  def self.token
    ENV['TELEGRAM_BOT_TOKEN'] || 'PERSONAL_TOKEN'
  end
end
