module Brguia
  class Impressao

    attr_reader :format, :codificacao
    # recebe o objeto gerado no Generate.new
    # @param [Generate] Instancia da classe Brguia::Generate.
    # @param [Hash] options Opção para a impressão da guia.
    # @option options [Symbol] :format [:pdf, :png, :jpeg, :tif, :ps]
    def initialize(guia, options = {})
      @guia = guia
      @filename = options[:filename] || filename_default
      @format = options[:format] || format_default
      gerar
    end

    def filename_default
      'guia'
    end

    def format_default
      :pdf
    end

    def filename
      "#{@filename}.#{@format.to_s}"
    end

    def gerar
      raise NotImplementedError
    end

  end
end
