FROM python:3.10.3-buster

# set work directory
WORKDIR /tmp/app

# set environment variables
ENV PYTHONUNBUFFERED 1

# install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"

# copy requirements
COPY poetry.lock pyproject.toml /tmp/app/

# install requirements
RUN poetry install --no-dev

# copy project
COPY . /tmp/app/

# run server
CMD poetry run gunicorn -c gunicorn.conf.py --access-logfile -
