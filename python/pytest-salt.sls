{% if grains['os'] not in ('Windows') %}
include:
  - python.pip
{% endif %}

pytest-salt:
  pip.installed:
    - name: git+https://github.com/saltstack/pytest-salt.git@master#egg=pytest-salt
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
{% if grains['os'] not in ('Windows') %}
    - require:
      - cmd: pip-install
{% endif %}
