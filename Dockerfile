FROM python:3.9.0

WORKDIR /home/

RUN echo "testing1"

RUN git clone https://github.com/Sangbin-K/Pragmatic.git

WORKDIR /home/Pragmatic/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=django-insecure-(%okw!*2$bp!n3hd5&b4e7^9a*24=3n#-^^h8yzs512x!ju(vp" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy --bind 0.0.0.0:8000"]
