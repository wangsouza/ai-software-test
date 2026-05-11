# Prompts para Desenvolvimento Assistido por IA - Shop4u

Documentação dos prompts utilizados para automação e assistência por IA no projeto Shop4u.

## Backlog

### Prompt para criação de backlog inicial
```
Leia docs/meeting-notes.md e gere um backlog inicial para GitHub Issues do projeto Shop4u.

Gere exatamente:
- 1 Epic
- 4 Stories
- 1 Docs

Regras:
- A Epic representa o objetivo macro.
- As Stories representam entregas funcionais.
- A issue Docs representa documentação.
- Não crie tarefas técnicas como Issues separadas.
- Tarefas técnicas devem ficar como checklist dentro das Stories.
- Critérios de aceitação devem usar BDD com Dado / Quando / Então.

Títulos:
- [EPIC] ...
- [STORY] ...
- [DOCS] ...

Labels permitidas:
epic, story, docs, backend, frontend, ai, priority:high, priority:medium, priority:low

Cada Story deve conter:
- Parent Epic: #ID_DA_EPIC
- ## User Story
- ## Critérios de aceitação — BDD
- ## Checklist técnico
```

### Prompt para script de criação de issues
```
Regras obrigatórias para o script:
- Gere scripts/create_issues.sh completo.
- Crie primeiro a Epic.
- Capture a URL retornada pelo gh issue create.
- Extraia o número da Epic com sed.
- Use esse número como Parent Epic nas Stories.
- Use mktemp + --body-file para preservar Markdown.
- Não use \n escapado.
- Não use --body $"texto\ntexto".
- Não use --json nem --jq com gh issue create.
- Não execute o script automaticamente.
```

## UML

### Prompt para diagramas de arquitetura
```
Crie docs/prompts.md documentando os prompts usados neste projeto.

Organize:
- Visão geral do produto
- Problema resolvido
- Objetivos
- Público-alvo
- Funcionalidades principais
- Regras de negócio
- Requisitos funcionais
- Requisitos não funcionais
- Fluxo principal do usuário
- Arquitetura de alto nível
- Stack tecnológica
- Critérios de sucesso
- Limitações atuais
- Próximos passos
```

### Prompt para diagrama de componentes
```
Arquitetura de alto nível:

┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │   Backend API   │    │   Banco de      │
│   Mobile        │◄──►│   (Node.js)     │◄──►│   Dados         │
│   (React Native)│    │                 │    │   (PostgreSQL)  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                              │
                              ▼
                     ┌─────────────────┐
                     │   Serviço de    │
                     │   IA/ML         │
                     │   (Python)      │
                     └─────────────────┘
```

## Documentação

### Prompt para documentação técnica
```
Analise o arquivo src/search.js e gere documentação técnica.

Inclua:
- objetivo da função
- parâmetros
- retorno
- exemplo de uso
- limitações

Se fizer sentido, crie ou atualize docs/search-module.md.
```

### Prompt para documentação de estrutura
```
Documente o código em src/.

Considere:
- .github/ai-instructions.md
- docs/templates/
- src/

Use linguagem técnica.

Não invente funcionalidades.
```

### Prompt para atualização de README e CONTRIBUTING
```
Atualize README.md e CONTRIBUTING.md usando:

- .github/ai-instructions.md
- docs/templates/
- scripts/
- src/
- docs/

Não invente funcionalidades inexistentes.
```

## Testes

### Prompt para criação de testes (exemplo futuro)
```
Crie testes unitários para a função searchProducts em src/search.js.

Inclua:
- Testes para casos positivos (produtos encontrados)
- Testes para casos negativos (produtos não encontrados)
- Testes para edge cases (lista vazia, query vazia)
- Testes para case-insensitive
- Testes para validação de parâmetros

Use Jest como framework de testes.
```

### Prompt para critérios de aceitação BDD
```
Critérios de aceitação devem usar BDD com Dado / Quando / Então.

Exemplo:
- Dado que o usuário está na página inicial
- Quando ele digita um termo de busca
- Então deve ver produtos relacionados ao termo
- Dado que o usuário seleciona uma categoria
- Quando ele navega pela categoria
- Então deve ver produtos filtrados por essa categoria
```

## PRD (Product Requirements Document)

### Prompt para criação de PRD
```
Crie docs/PRD.md para o projeto Shop4u.

Estrutura:
- visão geral
- problema
- objetivos
- funcionalidades
- regras de negócio
- requisitos
- arquitetura
- stack
- critérios de sucesso

Não invente funcionalidades inexistentes.
```

### Prompt para requisitos funcionais e não funcionais
```
Organize requisitos em:

Requisitos funcionais:
- RF01 - Sistema de busca
  - RF01.1: Buscar produtos por nome (implementado)
  - RF01.2: Filtrar produtos por categoria (planejado)
  
Requisitos não funcionais:
- RNF01 - Performance
  - RNF01.1: Tempo de resposta da busca < 500ms
  - RNF01.2: Interface responsiva para mobile
```

## Instruções gerais para IA

### Prompt base do projeto
```
Este repositório é uma demonstração de Engenharia de Software Assistida por IA usando GitHub, GitHub Issues, GitHub Projects, branches, Pull Requests e documentação automatizada.

## Objetivo do projeto
O projeto simula o desenvolvimento do Shop4u, um aplicativo mobile de e-commerce com recomendação por IA.

## Regras gerais
- Use linguagem técnica, objetiva e didática.
- Não invente funcionalidades que não existam no repositório.
- Ao gerar documentação, considere apenas arquivos existentes e comportamentos implementados.
- Ao gerar Issues, use Markdown com quebras reais.
- Nunca use \n escapado no corpo de Issues.
- Para Issues via terminal, use --body-file ou heredoc.
- Não execute comandos automaticamente sem autorização explícita.
```

### Prompt para fluxo de desenvolvimento
```
Fluxo de desenvolvimento:
1. Escolher uma Issue
2. Rodar ./scripts/start_issue.sh
3. Implementar alteração
4. Fazer commit
5. Rodar ./scripts/open_pr.sh
6. Revisar Pull Request
7. Fazer merge
8. Apagar branch
```

### Prompt para convenções
```
Backlog:
Use a seguinte estrutura:
- [EPIC]
- [STORY]
- [DOCS]

Tasks pequenas devem ficar como checklist técnico dentro da Story.
```