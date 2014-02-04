require 'rghost'
require 'rghost_barcode'
module Brguia
  class Impressao

    attr_reader :filename
    def initialize(codigo, options = {})
      @codigo = codigo
      @codificacao = options[:codificacao] || codificacao_default
      @filename = options[:filename] || filename_default
      gerar
    end

    def codificacao_default
      'barcode_code2of5'
    end

    def filename_default
      'guia.pdf'
    end

    def gerar
      doc = RGhost::Document.new
      doc.barcode_interleaved2of5(@codigo,:text => {:size => 6, :width => 1, :heigth => 2})
      doc.render :pdf, :filename => filename
    end
  end
end
