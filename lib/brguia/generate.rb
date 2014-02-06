module Brguia
  # Gera o codigo do boleto
  # @param options Hash
  # @return [String] o codigo final com o digitos verificadores
  class Generate

    attr_reader :arrecadacao, :segmento, :tipo_moeda, :codigo_febraban, :campo_livre

    def initialize(options= {})
      @valor           = options[:valor] || 0
      @arrecadacao     = options[:arrecadacao] || arrecadacao_default
      @segmento        = options[:segmento] || segmento_default
      @tipo_moeda      = options[:tipo_moeda] || tipo_moeda_default
      @codigo_febraban = options[:codigo_febraban] || codigo_febraban_default
      @uso_do_orgao    = options[:uso_do_orgao] || uso_do_orgao_default
    end

    def valor
      valor = Brguia::Helper.limpar_numero(@valor)
      Brguia::Helper.completa_zeros(valor,11)
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

    def uso_do_orgao
      Brguia::Helper.completa_zeros(@uso_do_orgao,25)
    end

    def codigo_febraban_default
      '0000'
    end

    def uso_do_orgao_default
      Brguia::Helper.completa_zeros(0,25)
    end

    def codigo_sem_verificador
      codigo = arrecadacao + segmento + tipo_moeda + valor + codigo_febraban + uso_do_orgao
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
