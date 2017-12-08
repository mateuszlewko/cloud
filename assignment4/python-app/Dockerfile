FROM python:3-alpine

ADD main.py /

RUN pip3 install flask

EXPOSE 5000

ENV FLASK_APP 'main.py'
CMD ["python", "main.py"]
