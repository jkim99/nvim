-- utils.lua
local function is_deno_project(root_dir)
  return vim.fn.glob(root_dir .. "/deno.json") ~= "" or vim.fn.glob(root_dir .. "/deno.jsonc") ~= ""
end

local function is_node_project(root_dir)
  return vim.fn.glob(root_dir .. "/package.json") ~= ""
end

return {
  is_deno_project = is_deno_project,
  is_node_project = is_node_project,
}

