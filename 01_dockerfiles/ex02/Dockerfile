FROM ruby
RUN apt update && apt install -y sqlite3 nodejs build-essential  git
ONBUILD RUN git clone  https://github.com/InfoAze/my-app.git  /opt/app/
ONBUILD WORKDIR /opt/app/
ONBUILD RUN bundle install
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed
