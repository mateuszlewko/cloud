FROM python:3-alpine

ADD main.py /

RUN pip3 install flask

ENV FLASK_APP 'main.py'
CMD ["flask", "run", "-h", "0.0.0.0"]
