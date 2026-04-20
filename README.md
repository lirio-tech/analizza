# analizza

Monorepo para análise de leilões com backend Kotlin, web Next.js, mobile Expo e módulos compartilhados.

## Estrutura

```text
analizza/
├── properties/
│   ├── properties-api/      # REST API backend Kotlin
│   ├── properties-core/     # core backend Kotlin
│   ├── properties-async/    # processamento assíncrono backend Kotlin
│   ├── properties-web/      # Next.js frontend web
│   ├── properties-mobile/   # Expo frontend mobile
│   └── properties-ui/       # UI do domínio properties compartilhada entre web e mobile
├── shared-libs/             # backend compartilhado no root
└── shared-front/            # componentes compartilhados entre vários frontends
```

## Responsabilidades

- `properties-api`, `properties-core` e `properties-async` concentram o backend do domínio `properties`.
- `properties-web` e `properties-mobile` concentram as aplicações frontend do domínio `properties`.
- `properties-ui` reúne UI compartilhada do domínio `properties` entre web e mobile.
- `shared-libs` fica no root e é usado para backend compartilhado entre domínios.
- `shared-front` fica no root e é usado para componentes compartilhados entre vários frontends.
- o frontend do domínio `properties` é executado a partir de `properties/package.json`, de forma independente.

Documentação orientada a spec fica em `specs/`.
