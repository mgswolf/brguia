module Brguia
  class GenerateDigito
    def self.gerar(codigo)
      x, multiplicacao, acumulador = 0,0,0

      codigo.each_char do |c|
        x = 2 if (x == 0)
        multiplicacao = c.to_i * x
        x -= 1
        if multiplicacao > 9
          acumulador += (1 + (multiplicacao - 10))
        else
          acumulador += multiplicacao
        end
      end

      resto = acumulador % 10
      resultado = 10 - resto
      digito = resultado >= 10 ? '0' : resultado.to_s
    end
  end
end
