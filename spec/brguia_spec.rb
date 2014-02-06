require 'spec_helper'

describe Brguia do
  let(:guia) { Brguia::Generate.new(parametros_guia)}

  context 'gera valores padrão' do
    subject { guia }

    its(:arrecadacao) { should == '8'}
    its(:segmento) { should == '5'}
    its(:tipo_moeda) { should == '6'}
  end

  it 'gera codigo sem verificador' do
    expect(guia.codigo_sem_verificador).to eq('8560000000759000000000000000000123201402281')
  end

  it 'gera codigo com verificador' do
    expect(guia.codigo_com_verificador).to eql('85620000000759000000000000000000123201402281')
  end

  it "gera codigo de barras" do
    expect(guia.codigo_de_barras).to eql('856200000003759000000001000000000018232014022817')
  end

  def parametros_guia
    {valor: 'R$75,90', uso_do_orgao: '123201402281' }
  end
end
