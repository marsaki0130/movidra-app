require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'タイトル・ジャンル・娯楽が入力されている場合' do 
   let!(:user) { create(:user)}
    

   let!(:movie) do
    user.movie.build({
      title: '名探偵コナン',
      entertainment: '映画',
      genre: 'アクション'
    })
   end


    it '作品を登録できる' do
      expect(movie).to be_valid
    end
  end
end
