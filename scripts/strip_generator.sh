#!/bin/sh
# Quarto post-render: remove <meta name="generator"> so the site does not advertise its generator.
# perl is used because `sed -i` differs between macOS (BSD) and Linux (GNU).
find "${QUARTO_PROJECT_OUTPUT_DIR:-_site}" -name '*.html' -exec perl -0pi -e 's/<meta name="generator"[^>]*>\n?//g' {} +
