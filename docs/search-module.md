# Módulo de Busca - search.js

## Visão geral

O módulo `search.js` implementa a funcionalidade de busca de produtos por nome no sistema Shop4u, permitindo filtrar produtos com base em termos de busca fornecidos pelo usuário.

## Função `searchProducts`

### Objetivo
Filtrar uma lista de produtos com base em um termo de busca, retornando apenas os produtos cujos nomes contêm o termo pesquisado.

### Assinatura
```javascript
function searchProducts(products, query)
```

### Parâmetros
- `products` (Array): Lista de objetos produto. Cada objeto deve ter uma propriedade `name` do tipo String.
- `query` (String): Termo de busca a ser pesquisado nos nomes dos produtos.

### Retorno
- Retorna um novo array contendo apenas os produtos cujos nomes contêm o termo de busca (case-insensitive).
- Retorna um array vazio `[]` se nenhum produto corresponder ao termo de busca.
- Retorna um array vazio `[]` se a lista de produtos estiver vazia.

### Exemplo de uso
```javascript
// Dados de exemplo
const produtos = [
  { id: 1, name: "Camiseta Azul", price: 29.99, category: "Roupas" },
  { id: 2, name: "Calça Jeans", price: 89.99, category: "Roupas" },
  { id: 3, name: "Camiseta Branca", price: 24.99, category: "Roupas" },
  { id: 4, name: "Tênis Esportivo", price: 129.99, category: "Calçados" }
];

// Busca por "camiseta" (case-insensitive)
const resultado1 = searchProducts(produtos, "camiseta");
// Retorna: [
//   { id: 1, name: "Camiseta Azul", price: 29.99, category: "Roupas" },
//   { id: 3, name: "Camiseta Branca", price: 24.99, category: "Roupas" }
// ]

// Busca por "JEANS" (maiúsculas)
const resultado2 = searchProducts(produtos, "JEANS");
// Retorna: [{ id: 2, name: "Calça Jeans", price: 89.99, category: "Roupas" }]

// Busca por termo não encontrado
const resultado3 = searchProducts(produtos, "computador");
// Retorna: []

// Busca em lista vazia
const resultado4 = searchProducts([], "camiseta");
// Retorna: []
```

### Comportamento detalhado
1. Converte o termo `query` para minúsculas usando `query.toLowerCase()`
2. Itera sobre cada produto no array `products` usando `Array.prototype.filter()`
3. Para cada produto, converte `product.name` para minúsculas
4. Verifica se o nome do produto contém o termo de busca usando `String.prototype.includes()`
5. Retorna um novo array com os produtos que passam no teste

## Considerações técnicas

### Case-insensitive
A busca é case-insensitive, convertendo tanto o termo de busca quanto os nomes dos produtos para minúsculas antes da comparação. Isso significa que "CAMISETA", "Camiseta" e "camiseta" produzem os mesmos resultados.

### Filtragem funcional
Utiliza o método `Array.prototype.filter()` que cria um novo array com todos os elementos que passam no teste implementado pela função.

### Imutabilidade
A função é pura e não modifica o array original de produtos, retornando sempre um novo array. Isso segue o princípio de imutabilidade.

### Performance
- Complexidade temporal: O(n), onde n é o número de produtos
- Complexidade espacial: O(m), onde m é o número de produtos que correspondem à busca

## Dependências
- JavaScript ES6+
- Nenhuma dependência externa
- Requer que os objetos produto tenham propriedade `name`

## Limitações atuais

### Funcionais
1. **Busca apenas por nome**: Suporta apenas busca na propriedade `name`, não em outros campos como descrição ou categoria.
2. **Correspondência exata de substring**: Requer que o termo de busca apareça exatamente como substring no nome do produto.
3. **Sem busca por categoria**: Não implementa filtragem por categoria, conforme mencionado nas meeting notes.

### Técnicas
1. **Sem normalização de texto**: Não remove acentos ou caracteres especiais (ex: "camiseta" ≠ "camisétà").
2. **Sem busca fuzzy**: Não suporta busca por similaridade ou com tolerância a erros de digitação.
3. **Sem paginação**: Retorna todos os resultados de uma vez, sem limite de quantidade.

### Validação
1. **Sem validação de entrada**: Não valida se `products` é um array ou se `query` é uma string.
2. **Sem tratamento de erros**: Não trata casos onde `product.name` não existe ou não é uma string.