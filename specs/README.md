# Speckit

Este diretório organiza o desenvolvimento orientado a spec do monorepo `analizza`.

## Como usar

1. Escolha o domínio ou lib compartilhada afetado.
2. Crie uma pasta de feature a partir de `_templates/`.
3. Escreva `spec.md`, depois `plan.md` e `tasks.md`.
4. Implemente o código a partir da pasta da feature.

## Mapeamento para o código

- `specs/properties/*` -> `:properties:properties-api` e `:properties:properties-core`
- `specs/properties-ui/*` -> `properties/properties-ui`
- `specs/shared-libs/*` -> `:shared-libs:*`
- `specs/shared-front/*` -> `shared-front`
- `specs/_cross/*` -> mudanças transversais sem dono natural
