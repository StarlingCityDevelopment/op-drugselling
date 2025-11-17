function formatWebHook(...)
    local args <const> = { ... }

    local appendStr = ''
    for _, v in ipairs(args) do
        appendStr = appendStr .. ' ' .. tostring(v)
    end
    return appendStr
end

function SendWebHook(title, color, message)
    local embedMsg = {}
    timestamp = os.date("%c")
    embedMsg = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = timestamp .. " (Server Time).",
            },
        }
    }
    PerformHttpRequest(ServerConfig.LogsWebhook,
        function(err, text, headers) end, 'POST', json.encode({ username = "OP DRUGSELLING", embeds = embedMsg }),
        { ['Content-Type'] = 'application/json' })
end
