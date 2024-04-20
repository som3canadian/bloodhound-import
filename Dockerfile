FROM python:3.9

RUN mkdir /app
RUN mkdir -p /app/bloodhound-import

WORKDIR /app/bloodhound-import
ADD . .

RUN pip install -r requirements.txt
RUN python setup.py install

# entrypoint
ENTRYPOINT [ "python", "bloodhound_import/__main__.py" ]