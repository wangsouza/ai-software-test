# Instruções do projeto para IA

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

## Backlog

Use a seguinte estrutura:

- [EPIC]
- [STORY]
- [DOCS]

Tasks pequenas devem ficar como checklist técnico dentro da Story.

## Fluxo de desenvolvimento

1. Escolher uma Issue
2. Rodar ./scripts/start_issue.sh
3. Implementar alteração
4. Fazer commit
5. Rodar ./scripts/open_pr.sh
6. Revisar Pull Request
7. Fazer merge
8. Apagar branch