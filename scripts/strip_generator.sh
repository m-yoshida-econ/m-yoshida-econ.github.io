#!/bin/sh
# Quarto post-render: remove <meta name="generator"> so the site does not advertise its generator.
find "${QUARTO_PROJECT_OUTPUT_DIR:-_site}" -name '*.html' -exec sed -i '' -E '/<meta name="generator"[^>]*>/d' {} +
