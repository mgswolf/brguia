module Brguia
  class Helper
    def self.limpar_numero(numero)
       numero.gsub(/\D/,'')
    end

    def self.completa_zeros(numero, quantidade_zero)
      sprintf("%0#{quantidade_zero}d", numero)
    end

    def self.formatar_data(data)
      if data.match(/\d{2}\D\d{2}\D\d{4}/)
        data = data.split(/\D/).reverse.join('')
      end

      data.gsub(/\D/,'')
    end

  end
end
