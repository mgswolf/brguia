# Brguia

Guia de Recolhimento para orgãos governamentais

## Installation

Add this line to your application's Gemfile:

    gem 'brguia'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brguia

## Usage

  guia = Bguia::Generate.new({:valor => '99,00', :codigo_febraban => '1234' })
  guia.codigo_de_barras

## Layout

| POSIÇÃO   |TAMANHO | CONTEÚDO                                  |
| 01 – 01   | 1      | Identificação do Produto                  |
| 02 – 02   | 1      | Identificação do Segmento                 |
| 03 – 03   | 1      | Identificação do valor real ou referência |
| 04 – 04   | 1      | Dígito verificador geral (módulo 10 ou 11)|
| 05 – 15   | 11     | Valor                                     |
| 16 – 19   | 4      | Identificação da Empresa/Órgão            |
| 20 – 44   | 25     | Campo livre de utilização da Empresa/Órgão|

## Impressão
  A gem Brguia gera apenas o código númerico de acordo com a FEBRABAN.
  A geração e impressão do código de barras deve ser realizada à parte,
  a codificação que deve ser utilizada é: "2 de 5 intercalado"
  recomendo a gem [ghost_barcode](http://github.com/shairontoledo/rghost-barcode "RGhost Barcode").


## Contributing

1. Fork it ( http://github.com/mgswolf/brguia/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
