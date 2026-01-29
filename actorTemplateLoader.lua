actorTemplates = {}
actorTemplates.list = {}
actorTemplates.map = {}

local function getAllFiles(path, files, root)
    files = files or {}
    root = root or path

    for _, item in ipairs(love.filesystem.getDirectoryItems(path)) do
        local itemPath = path .. "/" .. item
        local info = love.filesystem.getInfo(itemPath)

        if info then
            if info.type == "file" then
                local relativePath = itemPath:sub(#root + 2)
                files[#files + 1] = {relativePath, item}
            elseif info.type == "directory" then
                getAllFiles(itemPath, files, root)
            end
        end
    end

    return files
end

local dir = "actorTemplates/"

local files = getAllFiles(dir)

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

        actorTemplates[name] = template
		
		if not template.dontShowOnEditor then
			assert(not template.dontShowOnEditor, template.name .. " has dontAutoQuad enabled and dontShowOnEditor disabled. Actors currently need quads to appear on the editor.")
			table.insert(actorTemplates.list, name)
			actorTemplates.map[name] = #actorTemplates.list
		end
    end
end
