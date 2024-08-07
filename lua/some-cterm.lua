local function dark_palette()
  local names = {
    "black",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white",
    "brightblack",
    "brightred",
    "brightgreen",
    "brightyellow",
    "brightblue",
    "brightmagenta",
    "brightcyan",
    "brightwhite",
  }
  local set = {}
  for i, v in ipairs(names) do
    set[v] = {
      name = v,
      cterm = i - 1,
    }
  end
  return set
end

local function light_palette()
  local names = {
    "brightwhite",
    "brightred",
    "brightgreen",
    "brightyellow",
    "brightblue",
    "brightmagenta",
    "brightcyan",
    "brightblack",
    "white",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "black",
  }
  local set = {}
  for i, v in ipairs(names) do
    set[v] = {
      name = v,
      cterm = i - 1,
    }
  end
  return set
end

local current_palette

local function set_current_palette(palette)
  current_palette = palette
end

local function get_current_palette()
  return current_palette
end

return {
  dark_palette = dark_palette,
  light_palette = light_palette,
  set_current_palette = set_current_palette,
  get_current_palette = get_current_palette,
}

