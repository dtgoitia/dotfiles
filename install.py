#!/usr/local/bin/python

import getpass
import os
import platform
import shutil
import sys

DOTFILES_REPO_URL = 'https://github.com/dtgoitia/dotfiles.git'
DOTFILES_DIR = os.path.join(os.sep, 'opt', 'dotfiles')
USER=getpass.getuser()
HOME=os.environ['HOME']
CONFIG_DIR = '.config'

LINUX = 'Linux'
MACOS = 'Darwin'
WINDOWS = 'Windows'

def create_user_folder(user = USER):
    global HOME
    HOME = os.path.join('/home', user)
    os.mkdir(HOME)

def get_current_os():
    """https://docs.python.org/3.8/library/platform.html#platform.system"""
    return platform.system()

def download_dotfiles():
    clone_dotfiles_repo = f'git clone {DOTFILES_REPO_URL} {DOTFILES_DIR}'
    print(clone_dotfiles_repo)
    os.system(clone_dotfiles_repo)

def set_up_fish():
    config_dir = 'fish/'
    source = os.path.join(DOTFILES_DIR, CONFIG_DIR, config_dir)
    target = os.path.join(HOME, CONFIG_DIR, config_dir)
    shutil.copytree(source, target)

def set_up_tmux():
    config_file = '.tmux.conf'
    source = os.path.join(DOTFILES_DIR, config_file)
    target = os.path.join(HOME, config_file)
    shutil.copy(source, target)

def set_up_vim():
    config_file = '.vimrc'
    source = os.path.join(DOTFILES_DIR, config_file)
    target = os.path.join(HOME, config_file)
    shutil.copy(source, target)

def clone_and_copy():
    download_dotfiles()
    set_up_fish()
    set_up_tmux()
    set_up_vim()


# =============================================================================
# =============================================================================

def is_vcsh_installed():
    # TODO
    pass

def clone_dotfiles():
    # TODO
    # clone the dotfiles using VCSH
    pass

def clone_work_dotfiles():
    # TODO
    # clone the babylon specific dotfiles using VCSH
    pass

def vcsh():
    if not is_vcsh_installed():
        print('vcsh is not installed, aborting dotfile installation...')
        sys.exit(1)
    clone_dotfiles()
    clone_work_dotfiles()


vcsh()
