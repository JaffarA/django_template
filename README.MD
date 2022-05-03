# <<project_name>>
<<project_description>>

### Makefile commands

```bash
make makemigrations  # runs makemigrations on docker container
make migrate  # runs migrations on docker container
make shell  # spawns a shell on docker container
make format  # formats project using black&isort
make build  # runs project using --build flag
make run  # runs project
```

## Install poetry

setup your VScode python path with 
```bash
poetry install
poetry run which python
# use that output to fill in your .vscode/settings.json {"python.defaultInterpreterPath": PATH}
```

## DB
```bash
# clear existing db volumes (if they exist)
sudo rm -r docker/volumes/postgres
# mkdir docker/volumes/postgres
mkdir docker/volumes; mkdir docker/volumes/postgres
# sudo chown -R $USER docker
```

## Populate your localenvars
```bash
cp <<project_name>>/.env.example <<project_name>>/.env
```

upgrade dependency versions
```bash
# returns all outdated non-dev packages
# https://github.com/python-poetry/poetry/issues/2684#issuecomment-1026715207
poetry show --outdated | grep --file=<(poetry show --tree | grep '^\w' | sed 's/^\([^ ]*\).*/^\1/')
# OR...
poetry update  # :)
```