require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  let!(:user) { create(:user)}
  let!(:movies) { create_list(:movie, 1, user: user)}

  describe 'GET /movies' do
    it '200ステータスが返ってくる' do
      get movies_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /movies' do
    context 'ログインしてる場合' do
      before do
        sign_in user
      end

      it '作品が保存される' do
        movie_params = attributes_for(:movie)
        post movies_path({movie: movie_params})
        expect(response).to have_http_status(200)
        expect(Movie.last.title).to eq(movie_params[:title])
        expect(Movie.last.entertainment).to eq(movie_params[:entertainment])
        expect(Movie.last.genre).to eq(movie_params[:genre])
      end
    end

    context 'ログインしてない場合' do
      it 'ログイン画面に遷移する' do
        movie_params = attributes_for(:movie)
        post movies_path({movie: movie_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
