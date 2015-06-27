{% from "zsh/map.jinja" import zsh with context %}

{% if grains['os_family'] in ['Arch'] %}
zsh_completions:
  pkg.installed:
    - name: {{ zsh.completions_pkg }}

{% endif %}
