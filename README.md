# Shop4u

Sistema de e-commerce mobile com recomendações personalizadas por IA.

## Objetivo

Desenvolver um aplicativo mobile de e-commerce completo com funcionalidades de busca, carrinho, checkout, recomendações personalizadas com IA e notificações de pedido.

## Funcionalidades

- Busca de produtos por nome e categoria
- Carrinho de compras
- Checkout com autenticação
- Recomendações personalizadas com IA
- Notificações de pedido

## Estrutura

```text
.
├── .github/           # Configurações do GitHub
│   ├── ai-instructions.md
│   ├── instructions/
│   └── ISSUE_TEMPLATE/
├── docs/              # Documentação
│   ├── meeting-notes.md
│   ├── product.md
│   ├── search-module.md
│   ├── src-structure.md
│   └── templates/
├── scripts/           # Scripts de automação
│   ├── create_issues.sh
│   ├── start_issue.sh
│   └── open_pr.sh
└── src/               # Código fonte
    └── search.js
```

## Fluxo de desenvolvimento

1. Escolher uma Issue aberta no GitHub
2. Executar `./scripts/start_issue.sh` para criar branch
3. Implementar as alterações necessárias
4. Fazer commit seguindo a convenção
5. Executar `./scripts/open_pr.sh` para abrir Pull Request
6. Revisar e aprovar o Pull Request
7. Fazer merge da branch
8. Apagar a branch após o merge

## Convenção de commits

- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Alteração na documentação
- `chore:` Tarefas de manutenção