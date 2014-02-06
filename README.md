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

    guia = Bguia::Generate.new(:valor => '99,00', :codigo_febraban => '1234')
    guia.codigo_de_barras

## Layout

  <table>
    <tr>
      <td>POSIÇÃO</td>
      <td>TAMANHO</td>
      <td>CONTEÚDO</td>
    </tr>
    <tr>
      <td>01 – 01</td>
      <td>1</td>
      <td>Identificação do Produto</td>
    </tr>
    <tr>
      <td>02 – 02</td>
      <td>1</td>
      <td>Identificação do Segmento </td>
    </tr>
    <tr>
      <td>03 – 03</td>
      <td>1</td>
      <td> Identificação do valor real ou referência </td>
    </tr>
    <tr>
      <td>04 – 04</td>
      <td>1</td>
      <td>Dígito verificador geral (módulo 10 ou 11) </td>
    </tr>
    <tr>
      <td>05 – 15</td>
      <td>11</td>
      <td>Valor </td>
    </tr>
    <tr>
      <td>16 – 19</td>
      <td>4</td>
      <td>Identificação da Empresa/Órgão </td>
    </tr>
    <tr>
      <td>20 – 44</td>
      <td>25</td>
      <td>Campo livre de utilização da Empresa/Órgão </td>
    </tr>
  </table>

## Impressão
  A gem Brguia gera apenas o código númerico de acordo com a FEBRABAN.
  A geração e impressão do código de barras deve ser realizada à parte.
  A codificação que deve ser utilizada é: "2 de 5 intercalado"
  recomendo a gem [ghost_barcode](http://github.com/shairontoledo/rghost-barcode "RGhost Barcode").


## Contributing

1. Fork it ( http://github.com/mgswolf/brguia/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
