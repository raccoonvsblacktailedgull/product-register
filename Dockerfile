FROM ruby:2.6

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# bundler 2.4.22 をインストール ← ここがポイント！
RUN gem install bundler -v 2.4.22

# 作業ディレクトリ
WORKDIR /product-register

# Gemfile, Gemfile.lock をコピー
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# 依存関係をインストール
RUN bundle install

# 残りのコードをコピー
COPY . .

# サーバ起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]


