FROM ruby:2.5
RUN apt-get update && apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs \
	postgresql-client \
	yarn
# hostと同じディレクトリ構成にするためにproduct-register dirを作成
WORKDIR /product-register
# build contextのGemfile Gemfile.lockをコンテナの/product-register/にコピー
COPY Gemfile Gemfile.lock /product-register/
RUN bundle install
