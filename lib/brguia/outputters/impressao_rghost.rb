    require 'rghost'
    require 'rghost_barcode'
class ImpressaoRGhost < Brguia::Impressao

    def codificacao_default
      :rghost
    end

    def filename_default
      'guia'
    end

    def format_default
      :pdf
    end

  def gerar
    doc = RGhost::Document.new
    doc.barcode_interleaved2of5(@guia.codigo_de_barras,:text => {:size => 6, :width => 1, :heigth => 2})
    doc.render format, :filename => filename
  end
end
