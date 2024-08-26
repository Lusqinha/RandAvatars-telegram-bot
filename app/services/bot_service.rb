require_relative './avatar_service'
require 'mini_magick'

class BotService

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def call
  
    case @message
    when Telegram::Bot::Types::Message
      handle_message
    end
  end

  private
  def handle_message
    style_options = ["Adventurer", "Adventurer Neutral", "Big Smile", "Dylan", "Lorelei", "Lorelei Neutral", "Micah", "Thumbs"]
    
    case @message.text
    
    when "/avatar"
      question = "Escolha um modelo:"

      keyboard = style_options.map {|style|
        Telegram::Bot::Types::KeyboardButton.new(text:style) }

      style_answer = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: keyboard.each_slice(1).to_a, 
                                                                   one_time_keyboard: true,
                                                                   resize_keyboard: true)

      @bot.api.send_message(chat_id: @message.chat.id, text:question, reply_markup:style_answer)
      

    when *style_options
      style_answer = @message.text.downcase
      style_answer = style_answer.gsub(" ", "-")


      avatar_img = AvatarService.generate_avatar(style_answer)
      
      if File.exist?(avatar_img) 
        @bot.api.send_photo(chat_id: @message.chat.id, photo: Faraday::UploadIO.new(avatar_img, 'image/png'))
      else
        @bot.api.send_message(chat_id: @message.chat.id, text: 'Desculpe, não consegui gerar o seu avatar')
      end
   
    when "/start"
      @bot.api.send_message(chat_id: @message.chat.id, text: 'Bem-vindo! digite /start seu_prompt para gerar um avatar')

    else
      @bot.api.send_message(chat_id: @message.chat.id, text: 'Por favor, escolha um modelo válido ou digite /avatar para começar')

    end
  end
end
