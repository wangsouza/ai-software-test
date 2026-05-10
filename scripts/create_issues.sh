#!/bin/bash
set -e

echo "Criando Epic..."
EPIC_TEMP=$(mktemp)
cat > "$EPIC_TEMP" << 'EOF'
Desenvolver um aplicativo mobile de e-commerce completo com funcionalidades de busca, carrinho, checkout, recomendações personalizadas com IA e notificações de pedido.
EOF

EPIC_URL=$(gh issue create --title "[EPIC] Sistema de e-commerce mobile Shop4u" --label "epic,priority:high" --body-file "$EPIC_TEMP")
echo "Epic criada: $EPIC_URL"

EPIC_NUMBER=$(echo "$EPIC_URL" | sed -n 's|.*/\([0-9]*\)$|\1|p')
echo "Número da Epic: $EPIC_NUMBER"

echo ""
echo "Criando Stories..."

# Story 1: Sistema de autenticação e checkout
STORY1_TEMP=$(mktemp)
cat > "$STORY1_TEMP" << 'EOF'
**Parent Epic:** #'$EPIC_NUMBER'

## User Story
Como usuário, quero me autenticar e finalizar compras de forma segura para adquirir produtos.

## Critérios de aceitação — BDD
- Dado que o usuário está na tela de checkout
- Quando ele fornece credenciais válidas
- Então deve ser autenticado e poder prosseguir com o pagamento
- Dado que o usuário está autenticado
- Quando o pagamento é aprovado
- Então o pedido deve ser criado
- Dado que o pagamento é recusado
- Quando o usuário tenta finalizar compra
- Então o carrinho deve permanecer ativo

## Checklist técnico
- [ ] Implementar endpoint de autenticação
- [ ] Criar sistema de autorização para checkout
- [ ] Integrar com gateway de pagamento
- [ ] Implementar lógica de criação de pedido após pagamento aprovado
- [ ] Manter carrinho ativo em caso de pagamento recusado
EOF

gh issue create --title "[STORY] Sistema de autenticação e checkout" --label "story,backend,priority:high" --body-file "$STORY1_TEMP"

# Story 2: Busca de produtos por nome e categoria
STORY2_TEMP=$(mktemp)
cat > "$STORY2_TEMP" << 'EOF'
**Parent Epic:** #'$EPIC_NUMBER'

## User Story
Como usuário, quero buscar produtos por nome e categoria para encontrar o que preciso.

## Critérios de aceitação — BDD
- Dado que o usuário está na página inicial
- Quando ele digita um termo de busca
- Então deve ver produtos relacionados ao termo
- Dado que o usuário seleciona uma categoria
- Quando ele navega pela categoria
- Então deve ver produtos filtrados por essa categoria

## Checklist técnico
- [ ] Criar endpoint de busca por texto
- [ ] Implementar filtragem por categoria
- [ ] Desenvolver interface de busca no frontend
- [ ] Criar sistema de indexação de produtos
EOF

gh issue create --title "[STORY] Busca de produtos por nome e categoria" --label "story,backend,frontend,priority:medium" --body-file "$STORY2_TEMP"

# Story 3: Sistema de carrinho de compras
STORY3_TEMP=$(mktemp)
cat > "$STORY3_TEMP" << 'EOF'
**Parent Epic:** #'$EPIC_NUMBER'

## User Story
Como usuário, quero adicionar produtos ao carrinho e gerenciá-los antes do checkout.

## Critérios de aceitação — BDD
- Dado que o usuário está visualizando um produto
- Quando ele clica em "adicionar ao carrinho"
- Então o produto deve aparecer no carrinho
- Dado que o usuário tem itens no carrinho
- Quando ele remove um item
- Então o item deve ser removido do carrinho
- Dado que o usuário tem itens no carrinho
- Quando ele altera a quantidade de um item
- Então o total deve ser atualizado

## Checklist técnico
- [ ] Implementar endpoints para gerenciar carrinho
- [ ] Criar interface de carrinho no frontend
- [ ] Desenvolver lógica de cálculo de total
- [ ] Implementar persistência do carrinho
EOF

gh issue create --title "[STORY] Sistema de carrinho de compras" --label "story,backend,frontend,priority:medium" --body-file "$STORY3_TEMP"

# Story 4: Sistema de recomendações personalizadas com IA
STORY4_TEMP=$(mktemp)
cat > "$STORY4_TEMP" << 'EOF'
**Parent Epic:** #'$EPIC_NUMBER'

## User Story
Como usuário, quero receber recomendações personalizadas baseadas no meu histórico para descobrir produtos relevantes.

## Critérios de aceitação — BDD
- Dado que o usuário tem histórico de navegação
- Quando ele acessa a página inicial
- Então deve ver recomendações baseadas no seu histórico
- Dado que o usuário não tem histórico
- Quando ele acessa a página inicial
- Então deve ver produtos populares

## Checklist técnico
- [ ] Implementar coleta de histórico de navegação
- [ ] Desenvolver algoritmo de recomendação
- [ ] Criar fallback para produtos populares
- [ ] Integrar sistema de IA para personalização
EOF

gh issue create --title "[STORY] Sistema de recomendações personalizadas com IA" --label "story,backend,ai,priority:medium" --body-file "$STORY4_TEMP"

echo ""
echo "Criando Docs..."

DOCS_TEMP=$(mktemp)
cat > "$DOCS_TEMP" << 'EOF'
Criar documentação básica do projeto incluindo arquitetura, setup de desenvolvimento, convenções de código e guias de contribuição.
EOF

gh issue create --title "[DOCS] Documentação inicial do projeto Shop4u" --label "docs,priority:low" --body-file "$DOCS_TEMP"

echo ""
echo "Todas as issues foram criadas com sucesso!"
echo "Lembre-se de executar este script apenas após revisar as issues sugeridas."