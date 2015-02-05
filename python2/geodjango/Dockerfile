FROM docker.dragonfly.co.nz/python2/nz

RUN mkdir -p /var/www/src/app
WORKDIR /var/www/src/app

ONBUILD COPY . /var/www/src/app
ONBUILD RUN pip install -r requirements.txt
ONBUILD RUN DJANGO_CONFIGURATION=Common python manage.py collectstatic --noinput

RUN apt-get update && apt-get install -y postgresql-client binutils libproj-dev gdal-bin --no-install-recommends && rm -rf /var/lib/apt/lists/*
