# Estrutura do diretório src/

## Visão geral

O diretório `src/` contém o código fonte do sistema Shop4u. Atualmente implementa a funcionalidade de busca de produtos.

## Arquivos

### search.js
- **Localização**: `src/search.js`
- **Propósito**: Implementa a função de busca de produtos por nome
- **Função principal**: `searchProducts(products, query)`
- **Documentação detalhada**: [search-module.md](../docs/search-module.md)

## Convenções de código

### Nomenclatura
- Funções: camelCase (`searchProducts`)
- Arquivos: kebab-case (`search.js`)

### Estilo
- JavaScript ES6+
- 2 espaços de indentação
- Ponto e vírgula no final das instruções
- Chaves na mesma linha da declaração da função

## Padrões de implementação

### Funções puras
As funções devem ser puras sempre que possível:
- Não modificar parâmetros de entrada
- Retornar novos valores em vez de modificar existentes
- Ter comportamento determinístico

### Documentação
Cada função deve ter:
- Comentário descritivo da funcionalidade
- Especificação de parâmetros e retorno
- Exemplo de uso quando aplicável

## Fluxo de desenvolvimento

### Adicionar novo módulo
1. Criar arquivo em `src/` com nome descritivo
2. Implementar funcionalidade seguindo convenções
3. Adicionar documentação em `docs/`
4. Atualizar `README.md` se necessário

### Modificar módulo existente
1. Verificar documentação atual em `docs/`
2. Implementar alterações mantendo compatibilidade
3. Atualizar documentação correspondente
4. Testar funcionalidades existentes

## Próximos passos (baseado nas meeting notes)

Conforme discutido nas meeting notes, as seguintes funcionalidades devem ser implementadas:

1. **Sistema de carrinho de compras**
2. **Checkout com autenticação**
3. **Recomendações personalizadas com IA**
4. **Notificações de pedido**

Cada nova funcionalidade deve seguir a mesma estrutura e convenções estabelecidas no módulo `search.js`.