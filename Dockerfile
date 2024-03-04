FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/Sangbin-K/Pragmatic.git

WORKDIR /home/Pragmatic/

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=django-insecure-(%okw!*2$bp!n3hd5&b4e7^9a*24=3n#-^^h8yzs512x!ju(vp" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
