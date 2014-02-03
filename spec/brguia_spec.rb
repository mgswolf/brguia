require 'spec_helper'

describe Brguia do
  pending "generate barcode"

  context 'gera valores padrão' do
    subject { Brguia::Generate.new(parametros_guia)}

    its(:arrecadacao) { should == '8'}
    its(:segmento) { should == '5'}
    its(:tipo_moeda) { should == '6'}
    its(:vago) { should == '0000'}
  end

  def parametros_guia
    {
      valor: 'R$75,90',
      numero_guia: 123,
      data_vencimento: '2014/02/28',
      tipo_guia: 1
    }
  end
end
