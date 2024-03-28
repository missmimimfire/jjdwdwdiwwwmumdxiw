print('Session has started');
if not game:IsLoaded() then game.Loaded:Wait() end
print('Game Loaded');

local player = game.Players.LocalPlayer
local Players = game:GetService('Players')
local diamonds = "💎 Diamonds"
local webhook = "https://discord.com/api/webhooks/1222361309622964275/BOcIuu88Irh_NkfISo5udzfA0XxoE25-T0kCmoB3XqWu7aMwXSl0m9Oacb4Wsb2XVJxI"
local Http = game:GetService("HttpService")

local function send()
    local totalDiamonds = player.leaderstats[diamonds].Value
    local formattedDiamonds = string.format("%d", totalDiamonds)
    formattedDiamonds = formattedDiamonds:reverse():gsub("(%d%d%d)","%1,"):reverse():gsub("^,", "")

    local RequestBody = {
        ["content"]="".. Players.LocalPlayer.Name .. " " .. formattedDiamonds .. "",
    }

    request({
        Url = webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = Http:JSONEncode(RequestBody),
    })
end

while true do
    send()
    wait(1)
end
