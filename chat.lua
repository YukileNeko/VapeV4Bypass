local Players = game:GetService('Players');
local textChatService = game:GetService('TextChatService');
local ReplicatedStorage = game:GetService('ReplicatedStorage');
local lplr = Players.LocalPlayer
shared.chattag = true

local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

local easywhitelist = {
    hwids = loadstring(game:HttpGet(""))(),
    users = loadstring(game:HttpGet(""))(),
}


textChatService.OnIncomingMessage = function(message)
    local properties = Instance.new("TextChatMessageProperties")
    if message.TextSource then
        local player = game:GetService("Players"):GetPlayerByUserId(message.TextSource.UserId)

        for i, v in pairs(easywhitelist.users) do 
            if v == player.Name then
                properties.PrefixText = "<font color='#ff0000'>[EASYWARE STAFF]</font> ".."<font color='#ff4800'>[DEVELOPER]</font> ".. message.PrefixText
            end
        end
    end
    return properties
end
