{% from "zsh/map.jinja" import zsh with context %}

{% if grains['os_family'] in ['Arch','Debian'] %}
grml:
  pkg.installed:
    - name: {{ zsh.grml_pkg }}
    - refresh: True

{% elif grains['os_family'] in ['RedHat','Suse'] %}
grml_zshrc:
  cmd.run:
    - name: wget -O /etc/zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
    - unless: grep -e grml /etc/zshrc

grml_zsh_skel:
  cmd.run:
    - name: wget -O /etc/skel/.zshrc http://git.grml.org/f/grml-etc-core/etc/skel/.zshrc
    - unless: grep -e grml /etc/skel/.zshrc
{% endif %}
