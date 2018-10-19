# Padrões para contribuir com o Projeto

## Primeiro crie `issue` Envie relatórios de bugs ou solicitações de recursos 

Por favor, discuta as mudanças conosco com antecedência para garantir que elas serão mescladas.

### Enviar solicitações de pull ()
 * [Fork](https://github.com/invoiceninja/invoiceninja#fork-destination-box) o repositório [Invoice Ninja] (https://github.com/invoiceninja/invoiceninja)
 * Crie um novo branch com o nome `# issue_number-Short-description`
   * _Exemplo: _ `# 100-Adicionar-GoogleAnalytics`
 * Faça suas mudanças e cometa
 * Verifique se a sua filial ainda está em sincronia com os repositórios ** `develop` ** branch
   * _Leia: _ [Sincronizando um fork] (https://help.github.com/articles/syncing-a-fork/)
   * _Também leia: _ [Como rebase uma solicitação pull] (https://github.com/edx/edx-platform/wiki/How-to-Rebase-a-Pull-Request)
 * Empurre o seu ramo e crie um PR contra o ramo Invoice Ninja ** `develop` **
 * Atualize o [Changelog] (CHANGELOG.md)

### Algumas regras

Para tornar o processo de contribuição agradável e fácil para qualquer pessoa, siga algumas regras:
 * Cada contribuição (bug ou característica) deve ter um [problema no Github] (https://github.com/invoiceninja/invoiceninja/issues)
para dar uma explicação mais detalhada.
 * Apenas um recurso / bugfix por edição. Se você quiser enviar mais, crie vários problemas.
 * Apenas um recurso / bugfix por PR (pull request). Divida mais alterações em vários PRs.

#### Estilo de codificação
Tente seguir as diretrizes [PSR-2] (https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-2-coding-style-guide.md)

_Exemplo de estilo: _

```php
/ **
 * Obtém uma prévia do email
 *
 * @param TemplateService $ templateService
 *
 * @return \ Illuminate \ Http \ Response
 * /
função public previewEmail (TemplateService $ templateService)
{
    //
}
```
