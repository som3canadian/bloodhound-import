# bloodhound-import

![Python 2.7 and 3 compatible](https://img.shields.io/badge/python-3.7-blue.svg)
![PyPI version](https://img.shields.io/pypi/v/bloodhound_import.svg)
![License: MIT](https://img.shields.io/pypi/l/bloodhound_import.svg)

Bloodhound-import is a tool to import bloodhound json files into neo4j.

## Fork info

This is a fork of the original bloodhound-import tool. This fork simply Dockerizes the tool to minize python version conflicts and to make it easier to run.

```bash
git clone https://github.com/som3canadian/bloodhound-import.git
cd bloodhound-import

sudo docker pull ghcr.io/som3canadian/bloodhound-import:master
# or: sudo docker build . -t bloodhound-import

# copy the bloodhound json files to the bhdata directory
cp /path/to/bloodhound/output/2024*.json bhdata/

# make sure data is in the bhdata directory
ls bhdata

sudo docker run -v $(pwd)/bhdata:/app/bloodhound-import/bhdata --network host -it $(sudo docker images --no-trunc | grep "bloodhound-import" | cut -d ':' -f2 | cut -d " " -f1) -du neo4j -dp 'your-neo4j-password' --database 127.0.0.1 -v bhdata/*.json
```

## Dependencies and installation

Bloodhound-import is compatible python 3.7+ and the latest version is only compatible with bloodhound 3 imports. It requires the `neo4j-driver` library.

Install with `pip install bloodhound_import` or clone the git and install with `sudo python setup.py install`.

`bloodhound-import` will be installed as a global command. Usage is as follows:

```bash
usage: bloodhound-import.py [-h] [-du DATABASE_USER] [-dp DATABASE_PASSWORD]
                            [--database DATABASE] [-p PORT] [-v]
                            files [files ...]
```

Example:
`bloodhound-import -du neo4j -dp neo4j ~/Desktop/SessionLoop_20190115133114*.json`

If the -du and -dp options are not specified, the tool will try to auto detect these values from the bloodhound config file.
