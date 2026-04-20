build-front-back-properties-api:
	cd properties && pnpm install
	cd properties/properties-web && pnpm run build
	mkdir -p properties/properties-api/src/main/resources/static
	cp -r properties/properties-web/out/. properties/properties-api/src/main/resources/static/ 2>/dev/null || true
	cp -r properties/properties-web/public/. properties/properties-api/src/main/resources/static/ 2>/dev/null || true

run-back-properties-api: build-front-back-properties-api
	./gradlew :properties:properties-api:bootRun

build-front-back-properties-api-image: build-front-back-properties-api
	cd properties/properties-api && docker build -t properties-api:latest .

build-front-back-properties-async-image: build-front-back-properties-api
	cd properties/properties-api && docker build -t properties-api:latest .
