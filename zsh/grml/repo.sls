{% if grains['os_family'] in ['Debian'] %}

{% from "zsh/map.jinja" import zsh with context %}
include:
  - zsh.grml

grml_repo:
  pkgrepo.managed:
    - name: deb http://deb.grml.org/ grml-stable main
    - file: /etc/apt/sources.list.d/grml.list
    - key_url: http://deb.grml.org/repo-key.asc
    - refresh_db: True
    - require_in:
      pkg: {{ zsh.grml_pkg }}
{% endif %}
