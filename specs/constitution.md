# Constitution

## 1. Arquitetura

- Cada domínio vive em `*-api` e `*-core`.
- `*-api` pode depender de `*-core`.
- `*-core` não depende de `*-api`.
- Bibliotecas compartilhadas ficam em `shared-libs/`.

## 2. Linguagem e plataforma

- Kotlin como linguagem principal.
- Java toolchain alinhada ao bytecode do projeto.
- Spring Boot para aplicações `*-api`.
- Jakarta EE e APIs Spring somente onde fizer sentido no módulo de aplicação.

## 3. Convenções de código

- Pacotes seguem `com.analizza.<dominio>`.
- DTOs, comandos, queries e excecoes de domínio devem ficar no módulo correto.
- Nomes de módulos usam kebab-case no Gradle e camel/pascal case no código.

## 4. Runtime

- Cada app define `spring.application.name`.
- Portas locais devem ser explícitas em `application.yml` quando houver mais de uma API.
- Variáveis de ambiente são preferidas para configuração sensível.

## 5. Persistência

- Cada serviço controla seu schema.
- Migrations vivem junto do módulo dono.
- Acesso cruzado a banco de outro módulo não é permitido.

## 6. Testes

- JUnit Platform como base.
- Testes de slice devem ser usados quando bastarem.
- Critérios de aceitação devem ser cobertos por teste automatizado.

## 7. Observabilidade

- Logs devem ser úteis para diagnóstico e curtos o bastante para leitura.
- Métricas e traces entram por necessidade real, não por padrão.

## 8. Speckit

- Toda mudança de comportamento começa em `specs/`.
- A spec vem antes ou junto do código.

## 9. Processo

- PRs devem referenciar a pasta da feature.
- Mudanças pequenas devem atualizar a spec correspondente.

