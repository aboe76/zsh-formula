{% from "zsh/map.jinja" import zsh with context %}

zsh:
  pkg.installed:
    - name: {{ zsh.pkg }}
