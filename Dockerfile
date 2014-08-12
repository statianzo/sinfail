FROM peer60/ruby-runner

ADD . /home/app/sinfail
RUN sudo chown -R app:app /home/app
USER app

RUN proc2super < /home/app/sinfail/Procfile > /home/app/sinfail/supervisord.conf
RUN cd /home/app/sinfail && bundle install --path=vendor/bundle

ENV PORT 5000

CMD cd /home/app/sinfail && supervisord -c supervisord.conf
