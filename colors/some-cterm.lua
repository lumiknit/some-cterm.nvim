local function apply_theme()
  -- Initialize configurations
  if vim.version().minor < 7 then
    vim.notify_once("some-cterm requires neovim>=0.7")
    return
  end
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.g.colors_name = "some-cterm"
  vim.o.termguicolors = false
  -- Set Palette
  local palette = require('some-cterm').get_current_palette()
  local styles = {}
  local function ss(targets, style)
    table.insert(styles, {
      targets = targets,
      style = style,
    })
  end
  ss({ "Normal", "LineNr", "VertSplit", "WinSeparator", "SignColumn" }, {})
  ss({ "Bold", "SpecialKey" }, {
    bold = true,
  })
  ss({ "Italic" }, {
    italic = true,
  })
  ss({ "BoldItalic" }, {
    bold = true,
    italic = true,
  })
  ss({ "Underline", "Underlined" }, {
    underline = true,
  })
  ss({ "BoldUnderline", "MatchParen" }, {
    bold = true,
    underline = true,
  })
  ss({ "Black", "NonText" }, {
    fg = "black",
  })
  ss({ "BrightWhiteBold", "MoreMsg", "ModeMsg", "TooLong" }, {
    fg = "brightwhite",
    bold = true,
  })
  ss({ "Red", "Error", "ErrorMsg", "Question" }, {
    fg = "red",
  })
  ss({ "RedBold", "Error", "Exception" }, {
    fg = "red",
    bold = true,
  })
  ss({ "Yellow", "Debug" }, {
    fg = "yellow",
  })
  ss({ "YellowBold", "WarningMsg" }, {
    fg = "yellow",
    bold = true,
  })
  ss({ "Green", "Debug" }, {
    fg = "green",
  })
  ss({ "Cyan", "Directory" }, {
    fg = "cyan",
  })
  ss({ "Folded", "FoldColumn" }, {
    fg = "black",
    bg = "cyan",
    bold = true,
  })
  ss({ "Cursor" }, {
    fg = "black",
    bg = "red",
  })
  ss({ "CursorLine", "CursorColumn", "ColorColumn" }, {
    bg = "black",
  })
  ss({ "CursorLineNr" }, {
    bold = true,
  })
  ss({ "IncSearch" }, {
    fg = "black",
    bg = "cyan",
    bold = true,
  })
  ss({ "Search", "Substitute" }, {
    fg = "black",
    bg = "cyan",
  })
  ss({ "Visual", "VisualNOS" }, {
    reverse = true,
  })
  ss({ "Title" }, {
    bold = true,
  })
  ss({ "StatusLine" }, {
    bold = true,
    reverse = true,
  })
  ss({ "StatusLineNC" }, {
    reverse = true,
  })
  ss({ "PMenu" }, {
    fg = "white",
    bg = "brightblack",
  })
  ss({ "PMenuSel" }, {
    fg = "brightwhite",
    bg = "brightblack",
    bold = true,
    underline = true,
  })
  -- GitGutter
  ss({ "GitGutterAdd", "GitSignsAdd" }, {
    fg = "green",
    bold = true,
  })
  ss({ "GitGutterChange", "GitSignsChange" }, {
    fg = "yellow",
    bold = true,
  })
  ss({ "GitGutterDelete", "GitSignsDelete" }, {
    fg = "red",
    bold = true,
  })
  ss({ "GitGutterChangedelete", "GitSignsChangedelete" }, {
    fg = "yellow",
    bold = true,
  })
  -- Lang
  ss({
    "Delimiter", "Operator",
    "TSOperator", "TSPunctDelimiter", "TSPunctBracket",
    "TSPunctSpecial", "TSKeywordOperator",
    "TSTagDelimiter",
    "@punctuation.delimiter", "@punctuation.delimiter.markdown",
    "@punctuation.bracket", "@punctuation.special",
    "@tag.delimiter"
  }, {
      fg = "none"
  })
  ss({
    "Boolean", "Character", "Float", "Number",
    "TSNumber", "TSFloat",
    "@number", "@boolean", "@float", "@int", "@char",
  }, {
    fg = "brightmagenta",
  })
  ss({
    "Constant", "Special", "TSConstant", "@constant",
  }, {
    fg = "brightmagenta",
    bold = true,
  })
  ss({
    "String", "StringDelimiter",
    "TSString",
    "@string",
  }, {
    fg = "brightgreen",
  })
  ss({ "SpecialChar" }, {
    fg = "green",
    bold = true,
  })
  ss({
    "Function",
    "TSFunction", "TSMethod",
    "@function", "@method", "@attribute"
  }, {
    fg = "brightyellow",
  })
  ss({ "Comment", "TSComment", "@comment" }, {
    fg = "blue",
    italic = true,
  })
  ss({
    "Identifier",
    "TSParameter", "TSParameterReference", "TSField",
    "TSVariable", "TSFunctionCall", "TSMethodCall",
    "@parameter", "@parameter.reference", "@field",
    "@identifier", "@variable",
    "@function.call", "@method.call",
  }, {
    fg = "none",
  })
  ss({
    "TSVariableBuiltin",
    "@variable.builtin",
  }, {
    fg = "brightgreen",
  })
  ss({
    "Property", "Symbol",
    "TSProperty", "TSSymbol",
    "@property", "@symbol",
  }, {
    fg = "brightcyan",
  })
  ss({
    "TSTagCustom", "TSTagAttribute",
    "@tag.custom", "@tag.attribute"
  }, {
    fg = "brightcyan",
  })
  ss({
    "Conditional", "Define", "Include", "Keyword",
    "Label", "PreProc", "Repeat", "Statement", "Macro",
    "TSConditional", "TSRepeat", "TSKeyword", "TSKeywordFunction",
    "TSKeywordReturn", "TSInclude", "TSStatement", "TSException",
    "@conditional", "@repeat", "@keyword", "@keyword.function", "@keyword.return",
    "@label", "@preproc", "@exception",
    "@statement", 
  }, {
    fg = "brightred",
    bold = true,
  })
  ss({
    "TSTypeQualifier", "TSTypeBuiltin",
    "@type.qualifier", "@type.builtin",
    "@type.dart"
  }, {
    fg = "brightcyan",
    bold = true,
  })
  ss({
    "StorageClass", "Structure", "Tag", "Type",
    "TSType", "TSTag",
    "@type", "@tag",
  }, {
    fg = "brightcyan",
  })
  ss({
    "Namespace", "TSNamespace", "@namespace",
  }, {
    fg = "brightred",
    bold = true,
  })
  ss({
    "TSError",
    "@error",
  }, {
    fg = "red",
    bold = true,
    underline = true,
  })
  for _, style in pairs(styles) do
    local opts = {}
    local s = style.style
    if s.fg == "none" then
      opts.ctermfg = "none"
    elseif s.fg ~= nil then
      opts.ctermfg = palette[s.fg].cterm
    end
    if s.bg ~= nil then
      opts.ctermbg = palette[s.bg].cterm
    end
    if s.bold ~= nil then
      opts.bold = true
    end
    if s.italic ~= nil then
      opts.italic = true
    end
    if s.underline ~= nil then
      opts.underline = true
    end
    if s.reverse ~= nil then
      opts.reverse = true
    end
    if s.link ~= nil then
      opts.link = s.link
    end
    for _, tgt in pairs(style.targets) do
      vim.api.nvim_set_hl(0, tgt, opts)
    end
  end
end

apply_theme()

