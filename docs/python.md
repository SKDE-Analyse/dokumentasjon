# Python

- Installér Python 3, lastet ned fra [python.org](https://www.python.org/downloads/)
- For å installere numpy (og andre python-pakker), last ned wheel-pakke manuelt og installer med *pip* (i en terminal)
```
$ pip install filename.whl
```
- For å få *vim* til å være mer python-vennlig, installer [Vundle](https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions)
```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Virtualenv


### installere

```
pip install virtualenv
```

### Bruke

```
cd my_project_folder
virtualenv my_project

source my_project/bin/activate # for linux/unix
source my_project/Scripts/activate # for windows
##
## Install whatever packages
##
pip install <pythonpakke>
##
## Deactivate current env
##
deactivate
##
## "Freeze" the current state
##
pip freeze > requirements.txt
pip install -r requirements.txt
```

