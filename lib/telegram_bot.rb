require 'telegram/bot'
require 'logger'
require_relative '../config/bot_config'
require_relative '../app/services/bot_service'

class TelegramBot

  def self.run

    logger = Logger.new('bot_errors.log')
    logger.datetime_format = '%d-%m-%Y %H:%M:%S'

    token = BotConfig.token

    Telegram::Bot::Client.run(token) do |bot|
      begin
        bot.listen do |message|
          begin
            BotService.new(bot,message).call
          rescue StandardError => e
            logger.error("Erro ao processar a mensagem: #{e.message}")
            puts "Ocorreu um ao processar a mensagem, verifique o arquivo de log! -- #{e.message} --"
            logger.error(e.backtrace.join("\n"))
          end
        end
      rescue StandardError => e
        logger.error("Erro no bot: #{e.message}")
        puts "Ocorreu um erro no bot, verifiquei o arquivo de log! -- msg: #{e.message} --"
        logger.error(e.backtrace.join("\n")) 

      end
  
    end

  end

end
