require 'spec_helper'

describe Brguia do
  let(:guia) { Brguia::Generate.new(parametros_guia)}
  pending "generate barcode"

  context 'gera valores padrão' do
    subject { guia }

    its(:arrecadacao) { should == '8'}
    its(:segmento) { should == '5'}
    its(:tipo_moeda) { should == '6'}
    its(:vago) { should == '0000'}
  end

  it 'gera codigo sem verificador' do
    expect(guia.codigo_sem_verificador).to eq('8560000000759001430000000012320140228000001')
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