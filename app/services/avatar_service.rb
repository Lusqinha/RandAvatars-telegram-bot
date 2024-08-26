require 'httparty'
require 'mini_magick'

class AvatarService
  BASE_URL = 'https://api.dicebear.com/9.x'
  def self.generate_avatar(style)

    seed = rand(255)*rand(255)

    url = "#{BASE_URL}/#{style}/svg?seed=#{seed}&size=1024"
    response = HTTParty.get(url)
    
    if response.success?
      svg_filename = "avatar_#{seed}.svg"
      png_filename = "avatar_#{seed}.png"

      File.open("./temp/#{svg_filename}", "w") do |file|
        file.write(response.body)
      end

      convert_svg_to_png(svg_filename, png_filename)

      "./temp/#{png_filename}"
    else
      puts "Erro ao gerar avatar: #{response.body}"
      nil
    end
  end

  def self.convert_svg_to_png(svg_ph, png_ph)
    img = MiniMagick::Image.open("./temp/#{svg_ph}")

    img.format "png"
    img.write("./temp/#{png_ph}")

    puts "Convertido: #{svg_ph}"
  end

end
