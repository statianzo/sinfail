FROM peer60/ruby-runner

ADD . /app
WORKDIR /app
RUN sudo chown -R app:app /app
USER app

RUN bundle install --path=vendor/bundle --without development test
RUN proc2super < /app/Procfile > /app/supervisord.conf
CMD supervisord -c supervisord.conf
