# Guia de contribuição

## Fluxo de contribuição

1. **Escolha uma Issue** - Selecione uma Issue aberta no GitHub Projects
2. **Inicie uma branch** - Use `./scripts/start_issue.sh` para criar branch automaticamente
3. **Faça implementação** - Desenvolva a funcionalidade ou correção
4. **Commit** - Faça commit seguindo a convenção de commits
5. **Pull Request** - Use `./scripts/open_pr.sh` para abrir Pull Request
6. **Merge** - Após revisão e aprovação, faça merge da branch

## Como escolher Issues

- Acesse o GitHub Projects do Shop4u
- Filtre por Issues abertas com labels como `story`, `docs`, `bug`
- Use `./scripts/start_issue.sh` para listar Issues e selecionar uma

## Como abrir branches

O script `./scripts/start_issue.sh` automatiza a criação de branches:
- Extrai o número da Issue
- Gera um slug a partir do título
- Cria branch no padrão: `tipo/numero-issue-slug`
- Tipos: `feature` (para stories), `docs` (para documentação), `fix` (para bugs)

## Como abrir Pull Requests

O script `./scripts/open_pr.sh` automatiza a criação de Pull Requests:
- Identifica a Issue relacionada pela branch
- Gera título do PR baseado no título da Issue
- Cria corpo do PR com checklist de validação
- Vincula automaticamente à Issue (Closes #número)

## Como revisar checklist

Cada Pull Request inclui um checklist de validação:
- [ ] Todos os itens aplicáveis do checklist técnico da Issue foram concluídos
- [ ] Os critérios BDD foram considerados, quando aplicável
- [ ] A Issue relacionada está pronta para ser fechada
- [ ] A User Story foi considerada, quando aplicável
- [ ] O código foi testado, quando aplicável
- [ ] A documentação foi atualizada, quando necessário

## Boas práticas

- Siga as instruções em `.github/ai-instructions.md`
- Não invente funcionalidades que não existam no repositório
- Use Markdown com quebras reais (não use `\n` escapado)
- Para Issues via terminal, use `--body-file` ou heredoc
- Tasks pequenas devem ficar como checklist técnico dentro das Stories

## Convenção de commits

- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Alteração na documentação
- `chore:` Tarefas de manutenção