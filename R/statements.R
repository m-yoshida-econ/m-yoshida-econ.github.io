# Statement buttons (English / Japanese).
# Put the PDF at statements/<base>_en.pdf or statements/<base>_ja.pdf and the
# button becomes a live link on the next render; until then it shows as a
# greyed-out "coming soon" button.
statement_buttons <- function(base, label) {
  langs <- c(en = "English", ja = "日本語")
  btns <- vapply(names(langs), function(l) {
    f <- sprintf("statements/%s_%s.pdf", base, l)
    txt <- sprintf('<i class="bi bi-file-earmark-pdf"></i> %s (%s)', label, langs[[l]])
    if (file.exists(f)) {
      sprintf('<a class="stmt-btn" href="%s" target="_blank" rel="noopener">%s</a>', f, txt)
    } else {
      sprintf('<span class="stmt-btn is-dummy" title="Coming soon">%s <small>coming soon</small></span>', txt)
    }
  }, character(1))
  cat(sprintf('<div class="stmt-links">%s</div>\n', paste(btns, collapse = "")))
}
