FROM python:3.7

RUN apt-get update && apt-get install -y \
  nginx-extras

COPY ./nginx /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

COPY ./echo /opt/echo

RUN pip install -r /opt/echo/requirements.txt


ENV FLASK_APP /opt/echo/app.py
ENV FLASK_ENV development

CMD supervisord -c /opt/echo/supervisor.conf 
