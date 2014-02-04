module Brguia
  # Gera o codigo do boleto
  # @param options Hash
  # @return [String] o codigo final com o digitos verificadores
  class Generate

    attr_reader :data_vencimento, :tipo_guia, :arrecadacao, :segmento,
                :tipo_moeda, :codigo_febraban, :vago

    def initialize(options= {})
      @valor           = options[:valor]
      @numero_guia     = options[:numero_guia]
      @data_vencimento = options[:data_vencimento]
      @tipo_guia       = options[:tipo_guia]
      @arrecadacao     = options[:arrecadacao] || arrecadacao_default
      @segmento        = options[:segmento] || segmento_default
      @tipo_moeda      = options[:tipo_moeda] || tipo_moeda_default
      @codigo_febraban = options[:codigo_febraban] || codigo_febraban_default
      @vago            = vago_default
    end

    def valor
      valor = Brguia::Helper.limpar_numero(@valor)
      Brguia::Helper.completa_zeros(valor,11)
    end

    def numero_guia
      Brguia::Helper.completa_zeros(@numero_guia,11)
    end

    def tipo_guia
      Brguia::Helper.completa_zeros(@tipo_guia,2)
    end

    def data_vencimento
      Brguia::Helper.formatar_data(@data_vencimento)
    end


    def arrecadacao_default
      '8'
    end

    def segmento_default
      '5' #Origem Governamental
    end

    def tipo_moeda_default
      '6' #BRL
    end

    def codigo_febraban_default
      '0143' #codigo febraban do tribunal TODO: usar config file
    end

    def vago_default
      '0000'
    end

    def codigo_sem_verificador
      codigo = arrecadacao + segmento + tipo_moeda + valor + codigo_febraban +
      numero_guia + data_vencimento + vago + tipo_guia
    end

    def codigo_com_verificador
      digito = Brguia::GenerateDigito.gerar(codigo_sem_verificador)
      codigo = codigo_sem_verificador.slice(0..2) + digito + codigo_sem_verificador.slice(3..43)
    end

    def codigo_de_barras
      arr = Brguia::Helper.divide_codigo(codigo_com_verificador)
      codigo = ""
      codigo << arr[0] + Brguia::GenerateDigito.gerar(arr[0])
      codigo << arr[1] + Brguia::GenerateDigito.gerar(arr[1])
      codigo << arr[2] + Brguia::GenerateDigito.gerar(arr[2])
      codigo << arr[3] + Brguia::GenerateDigito.gerar(arr[3])
    end

  end
end
