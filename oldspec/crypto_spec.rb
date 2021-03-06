require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require_relative '../aes_cipher'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @key = 3
  end

  describe 'Using Caesar cipher' do
    it 'should encrypt/Decrypt card information' do
      enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
      dec = SubstitutionCipher::Caesar.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using Permutation cipher' do
    it 'should encrypt/Decrypt card information' do
      enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
      dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  # TODO: Add tests for double transposition and AES ciphers
  #       Can you DRY out the tests using metaprogramming? (see lecture slide)
  describe 'Using Double Transposition Cipher' do
    it 'should encrypt/decrypt card information' do
      enc = DoubleTranspositionCipher.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
      dec = DoubleTranspositionCipher.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using Double AES Cipher' do
    it 'should encrypt/decrypt card information' do
      enc = AesCipher.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
      dec = AesCipher.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end
end
