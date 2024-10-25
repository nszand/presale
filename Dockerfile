FROM hub.hamdocker.ir/library/python:3.12
WORKDIR /PreSale/
ADD ./requirements.txt ./
RUN pip install -r ./requirements.txt
RUN apt-get update && apt-get install -y gettext
ADD ./ ./
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8000", "PreSale.wsgi"]