actorTemplates = {}
actorTemplates.list = {}
actorTemplates.map = {}

local dir = "actorTemplates/"

local rawFiles = recursiveEnumerate("actorTemplates")
local files = {}
for _, filePath in ipairs(rawFiles) do
    local relativePath = filePath:sub(#"actorTemplates" + 2)
    local item = filePath:match("([^/]+)$")
    files[#files + 1] = {relativePath, item}
end

for _, file in ipairs(files) do
    if string.sub(file[2], -3) == "lua" then
        local name = string.sub(file[2], 1, -5)

        local templateCode = love.filesystem.read(dir .. file[1])
        local template = sandbox.run(templateCode, {env = {VAR = VAR, getRequiredSpeed = getRequiredSpeed}})

        template.name = name

        -- Load images
        if template.img then
            template.img = love.graphics.newImage(template.img) -- todo: replace with some smart-ass directory thing

            if not template.dontAutoQuad then
                -- create quads
                -- Check if image can be nicely divided into quadWidth/Height sized quads
                template.quads = {}

                for y = 1, template.img:getHeight()/template.quadHeight do
                    for x = 1, template.img:getWidth()/template.quadWidth do
                        table.insert(template.quads, love.graphics.newQuad(
                            (x-1)*template.quadWidth,
                            (y-1)*template.quadHeight,
                            template.quadWidth,
                            template.quadHeight,
                            template.img:getWidth(),
                            template.img:getHeight()
                        ))
                    end
                end
            end
        end
		
		if template.icon then
			template.icon = love.graphics.newImage(template.icon)
		end

        actorTemplates[name] = template
		
		if not template.dontShowOnEditor then
			assert(not template.dontAutoQuad, template.name .. " has dontAutoQuad enabled and dontShowOnEditor disabled. Actors currently need quads to appear on the editor.")
			table.insert(actorTemplates.list, name)
			actorTemplates.map[name] = #actorTemplates.list
		end
    end
end
