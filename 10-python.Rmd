# Diverse om Python (i windows)

- Installér Python 3, lastet ned fra [python.org](http://python.org/downloads)
- For å installere numpy (og andre python-pakker), last ned wheel-pakke [herfra](http://www.lfd.uci.edu/~gohlke/pythonlibs/) og installer med *pip* (i en terminal)
```
$ pip install filename.whl
```
- For å få *vim* til å være mer python-vennlig, installer [Vundle](https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions)
```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Virtualenv

```
pip install virtualenv
cd my_project_folder
virtualenv my_project
source my_project/bin/activate
##
## Install whatever packages
##
pip install request
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

