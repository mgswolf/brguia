require 'spec_helper'

describe Brguia::Helper do
  it 'limpa numero' do
    expect(Brguia::Helper.limpar_numero('R$75,99')).to eql('7599')
  end

  it 'completa com zero' do
    expect(Brguia::Helper.completa_zeros(4585, 11)).to eql('00000004585')
  end

  it 'formata data' do
    expect(Brguia::Helper.formatar_data('2014/01/31')).to eql('20140131')
    expect(Brguia::Helper.formatar_data('31/01/2014')).to eql('20140131')
  end

end
