module Brguia
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
      Brguia::Helper.limpar_numero(@valor)
    end

    def numero_guia
      Brguia::Helper.completa_zeros(@numero_guia,11)
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
  end
end
