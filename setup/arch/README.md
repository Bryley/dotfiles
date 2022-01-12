

# Arch setup

## Python

As arch uses latest version of packages then when installing python it will be the latest version (3.10 at the time of writing).
This sometimes creates issues with pip packages.
For example pandas was not installing correctly so to fix it I ran:

```
sudo pacman -S python-pandas
pip install pandas # (Only after activating venv)
pip install -r ./requriements.txt
```

This should fix the issue of pandas not building correctly

Also note for mysql to work install these packages:

```
sudo pacman -S mysql python-mysqlclient
```
