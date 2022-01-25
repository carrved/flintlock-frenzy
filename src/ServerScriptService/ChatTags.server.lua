--- Allow a player to occupy a single chat tag
-- @author colbert2677

local ServerScriptService = game:GetService("ServerScriptService")
local ChatService = require(ServerScriptService:WaitForChild("ChatServiceRunner").ChatService)

local TAGS = {
    [152013531] = {TagText = "👑 OWNER", TagColor = Color3.new(255, 0, 0)},
	[277308713] = {TagText = "👑 ADMIN", TagColor = Color3.new(1, 0.368627, 0.380392)},
	[1663928286] = {TagText = "👑 ADMIN", TagColor = Color3.new(1, 0.368627, 0.380392)},
	[2788251667] = {TagText = "🛡️ MOD", TagColor = Color3.new(0, 0.75, 1)},
	[3233287182] = {TagText = "💎 VIP", TagColor = Color3.new(1, 0.368627, 0.380392)},
	[2563279226] = {TagText = "💎 VIP", TagColor = Color3.new(1, 0.368627, 0.380392)},
	[2242632237] = {TagText = "💎 VIP", TagColor = Color3.new(1, 0.368627, 0.380392)},
}	

--- Call on chat speakers to apply their tags
-- For player speakers only
local function speakerAdded(speakerName)
    local speaker = ChatService:GetSpeaker(speakerName)
    local player = speaker:GetPlayer()

    -- Safe, as if statement fails if first condition is falsy
    if player and TAGS[player.UserId] then
        -- Wrap tag in table, as Tags expects a table value worth of tags
        speaker:SetExtraData("Tags", {TAGS[player.UserId]})
    end
end

ChatService.SpeakerAdded:Connect(speakerAdded)
for _, speaker in ipairs(ChatService:GetSpeakerList()) do
    speakerAdded(speaker)
end