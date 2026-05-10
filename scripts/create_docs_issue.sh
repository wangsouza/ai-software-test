#!/bin/bash

echo
read -p "Título da documentação: " DOC_TITLE

BODY_FILE=$(mktemp)

cat > "$BODY_FILE" <<EOF
## Objetivo

Documentar tecnicamente o módulo.

## Checklist técnico

- [ ] Atualizar documentação
- [ ] Revisar Markdown
EOF

gh issue create \
 --title "[DOCS] ${DOC_TITLE}" \
 --body-file "$BODY_FILE" \
 --label docs

rm "$BODY_FILE"