#!/usr/bin/env bash

function installit () {
  ORIG=$1
  LINK=$2
  if [ ! -L $LINK ]
  then
    ln -s $ORIG $LINK
  else
    echo "$LINK exist you'll need to make it manually"
  fi
}

ORIG=$PWD/nvim                      && LINK=$HOME/.config/nvim       && installit $ORIG $LINK
ORIG=$PWD/tmux                      && LINK=$HOME/.config/tmux       && installit $ORIG $LINK
ORIG=$PWD/tmuxinator                && LINK=$HOME/.config/tmuxinator && installit $ORIG $LINK
ORIG=$PWD/synergy                   && LINK=$HOME/.config/synergy    && installit $ORIG $LINK
ORIG=$PWD/termite                   && LINK=$HOME/.config/termite    && installit $ORIG $LINK
ORIG=$PWD/kitty                     && LINK=$HOME/.config/kitty      && installit $ORIG $LINK
ORIG=$PWD/dunst                     && LINK=$HOME/.config/dunst      && installit $ORIG $LINK
ORIG=$PWD/rofi                      && LINK=$HOME/.config/rofi       && installit $ORIG $LINK
ORIG=$PWD/spectrwm/spectrwm.conf    && LINK=$HOME/.spectrwm.conf     && installit $ORIG $LINK
ORIG=$PWD/spectrwm/spectrwm_es.conf && LINK=$HOME/.spectrwm_es.conf  && installit $ORIG $LINK
ORIG=$PWD/terminal/aliases          && LINK=$HOME/.aliases           && installit $ORIG $LINK
ORIG=$PWD/ninjakb                   && LINK=$HOME/.ninjakb           && installit $ORIG $LINK
ORIG=$PWD/commands                  && LINK=$HOME/bin                && installit $ORIG $LINK
ORIG=$PWD/x/xinitrc                 && LINK=$HOME/.xinitrc           && installit $ORIG $LINK
ORIG=$PWD/zshrc                     && LINK=$HOME/.zshrc             && installit $ORIG $LINK
ORIG=$PWD/mail                      && LINK=$HOME/.config/mail       && installit $ORIG $LINK
ORIG=$PWD/mail/muttrc               && LINK=$HOME/.muttrc            && installit $ORIG $LINK
