require 'spec_helper'

describe Brguia::GenerateDigito do

  it 'gera digito 3 para o valor 01230067896' do
    expect(Brguia::GenerateDigito.gerar('01230067896')).to eql('3')
  end

end
