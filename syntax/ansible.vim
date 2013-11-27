ru! syntax/yaml.vim
syntax match yamlInterpolate '$\w\+\|{{[^}]\+}}'
syntax match yamlInterpolate '$\w\+\|{{[^}]\+}}' contained containedin=yamlString
syntax match yamlConstant '\(with_items\|when\|name\|notify\|ignore_errors\|changed_when\|register\|with_password\):'
