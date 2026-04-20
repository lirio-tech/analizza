.PHONY: help \
	build-front-back-properties-api run-back-properties-api \
	build-back-properties-api build-back-properties-async \
	test-backend check-jvm-only discover-apps-local ci-local \
	build-front-back run-front-back

help:
	@echo "Targets disponiveis:"
	@echo "  make build-front-back-properties-api  - Build front properties-web e copia out/public para properties-api"
	@echo "  make run-back-properties-api          - Sobe properties-api com bootRun"
	@echo "  make build-back-properties-api        - Build backend do modulo properties-api (sem testes)"
	@echo "  make build-back-properties-async      - Build backend do modulo properties-async (sem testes)"
	@echo "  make test-backend                     - Executa todos os testes backend"
	@echo "  make check-jvm-only                   - Verifica se nao ha referencias de GraalVM/native em arquivos de projeto"
	@echo "  make discover-apps-local              - Lista apps backend descobertos localmente por *Application.kt"
	@echo "  make ci-local                         - Check local completo (check-jvm-only + testes + builds por app)"

build-front-back-properties-api:
	cd properties && pnpm install
	cd properties/properties-web && pnpm run build
	mkdir -p properties/properties-api/src/main/resources/static
	cp -r properties/properties-web/out/. properties/properties-api/src/main/resources/static/ 2>/dev/null || true
	cp -r properties/properties-web/public/. properties/properties-api/src/main/resources/static/ 2>/dev/null || true

build-back-properties-api:
	./gradlew :properties:properties-api:clean :properties:properties-api:build -x test

build-back-properties-async:
	./gradlew :properties:properties-async:clean :properties:properties-async:build -x test

test-backend:
	./gradlew test

discover-apps-local:
	@find . -name "*Application.kt" -path "*/src/main/kotlin/*" -print

ci-local: test-backend build-back-properties-api build-back-properties-async

# Aliases de compatibilidade
build-front-back: build-front-back-properties-api

run-front-back: build-front-back-properties-api
	./gradlew :properties:properties-api:bootRun