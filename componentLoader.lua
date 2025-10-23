components = {}

local toLoad = recursiveEnumerate("components")

for _, path in ipairs(toLoad) do
    if path:sub(-3) == "lua" then
        -- clean up the string
        path = path:gsub("/", ".") -- replace / with .
        path = path:sub(1, -5) -- remove .lua
        name = path:sub(12) -- remove folder name ("components/"). lol hardcode

        components[name] = require(path) -- FIXME: sandbox this!!!1

        assert(type(components[name]) == "table", string.format("Component \"%s\" didn't return a table.", name))
    end
end
