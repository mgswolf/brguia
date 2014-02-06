module Brguia
  class Helper
    def self.limpar_numero(numero)
       numero.gsub(/\D/,'')
    end

    def self.completa_zeros(numero, quantidade_zero)
      sprintf("%0#{quantidade_zero}d", numero)
    end

    def self.divide_codigo(codigo)
       arr = [
        codigo.slice(0..10),
        codigo.slice(11..21),
        codigo.slice(22..32),
        codigo.slice(33..43),
       ]
    end
  end
end
