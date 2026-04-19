# properties

Domínio principal do monorepo `analizza` para leilões de propriedades.

## Estrutura

- `properties-api` - backend REST em Kotlin
- `properties-core` - core de backend em Kotlin
- `properties-web` - frontend web em Next.js
- `properties-mobile` - frontend mobile em Expo
- `properties-ui` - UI do domínio compartilhada entre web e mobile

## Relacionados no root

- `shared-libs` - backend compartilhado entre domínios
- `shared-front` - componentes compartilhados entre vários frontends
- `properties-ui` é consumido por `properties-web` e `properties-mobile`
- `package.json` do frontend fica em `properties/`
