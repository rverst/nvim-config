-- https://github.com/blopker/codebook
-- Code-aware spell checker (Tree-sitter + Spellbook). Wird von mason-lspconfig
-- automatisch aktiviert, weil codebook-lsp via Mason installiert ist.
--
-- Dictionaries/Overrides (u.a. Deutsch für Markdown/Typst) liegen in
-- ~/.config/codebook/codebook.toml.

return {
  init_options = {
    -- Diagnostics erst beim Speichern, nicht bei jedem Tastendruck.
    checkWhileTyping = false,
    -- Rechtschreibung ist kein Fehler — als Hint einsortieren, damit sie
    -- nicht mit echten LSP-Diagnostics um Aufmerksamkeit konkurriert.
    diagnosticSeverity = 'hint',
  },
}
