build-front-back:
	cd properties && pnpm install
	cd properties/properties-web && pnpm run build
	mkdir -p properties/properties-api/src/main/resources/static
	cp -r properties/properties-web/out/. properties/properties-api/src/main/resources/static/ 2>/dev/null || true
	cp -r properties/properties-web/public/. properties/properties-api/src/main/resources/static/ 2>/dev/null || true

run-front-back: build-front-back
	./gradlew :properties:properties-api:bootRun