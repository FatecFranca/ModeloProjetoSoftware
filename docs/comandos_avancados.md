# Remover arquivos dos commits antigos

Se acaso der o commit em um arquivo com senha verdadeira ou um binário que não queria controlar o versionamento, 
mesmo colocando no gitignore o git mostrará este arquivo para commitar.

O comando abaixo remove de todos os históricos de commits o arquivo especificado

git filter-branch --force --index-filter "git rm --cached --ignore-unmatch caminho-e-nome-do-arquivo" --prune-empty --tag-name-filter cat -- --all

e por fim envie essas alterações para o servidor
git push origin --force --all
