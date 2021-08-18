FROM python
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD requirements.txt /usr/src/app
RUN pip install -r requirements.txt
ADD app.py /usr/src/app/
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8000", "--keep-alive", "10", "-k", "gevent", "-w", "4"]