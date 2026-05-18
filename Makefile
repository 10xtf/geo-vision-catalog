SLUG  := catalog-d600a5a8
REPO  := 10xtf/geo-vision-catalog
URL   := https://10xtf.github.io/geo-vision-catalog/$(SLUG)/

.PHONY: deploy
deploy:
	@tmp=$$(mktemp -d) && \
	touch "$$tmp/.nojekyll" && \
	mkdir -p "$$tmp/$(SLUG)" && \
	cp $(SLUG)/index.html "$$tmp/$(SLUG)/index.html" && \
	uvx ghp-import -n -p -f -o "$$tmp" && \
	rm -rf "$$tmp"
	@echo "✓ deployed → $(URL)"

.PHONY: url
url:
	@echo $(URL)
