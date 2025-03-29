---@type vim.lsp.Config
return {
  cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
  filetypes = { "typescript", "html", "angular", "htmlangular" },
  root_markers = { "angular.json" },
}
