-- CarryAutoResponder.lua
local addonName, addon = ...
local frame = CreateFrame("Frame")

-- Configuration
local ENABLED = true
local COOLDOWN = 300 -- Time in seconds before sending another auto-reply to the same person (5 minutes)
local lastWhisper = {} -- Stores last whisper time by player name

-- Your custom message
local AUTO_REPLY_MESSAGE = "Thanks for your interest in our carry services! I'm currently in a dungeon/raid run. Please wait and I'll get back to you as soon as possible. For immediate booking, you can message my partner at [PARTNER_NAME]."

-- Function to check if player is in dungeon or raid content
local function IsInInstance()
    local inInstance, instanceType = IsInInstance()
    -- Check if we're in a dungeon or raid
    if inInstance and (instanceType == "party" or instanceType == "raid") then
        return true
    end
    return false
end

-- Event handling
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", function(self, event, ...)
    if not ENABLED then return end

    if event == "CHAT_MSG_WHISPER" then
        local msg, sender = ...
        -- Remove realm name from sender
        sender = string.match(sender, "([^-]+)")

        -- Check if we're in a dungeon or raid instance
        if IsInInstance() then
            -- Check if we've already replied to this person recently
            local currentTime = GetTime()
            if not lastWhisper[sender] or (currentTime - lastWhisper[sender] > COOLDOWN) then
                -- Send auto-reply
                SendChatMessage(AUTO_REPLY_MESSAGE, "WHISPER", nil, sender)
                lastWhisper[sender] = currentTime
                print("|cFF00FF00CarryAutoResponder:|r Auto-replied to "..sender)
            end
        end
    end
end)

-- Slash command to toggle the addon
SLASH_CARRYAUTORESPONDER1 = "/car"
SLASH_CARRYAUTORESPONDER2 = "/carryauto"
SlashCmdList["CARRYAUTORESPONDER"] = function(msg)
    if msg == "on" then
        ENABLED = true
        print("|cFF00FF00CarryAutoResponder:|r Auto-responses enabled.")
    elseif msg == "off" then
        ENABLED = false
        print("|cFF00FF00CarryAutoResponder:|r Auto-responses disabled.")
    elseif msg:find("message") then
        local newMessage = msg:match("message%s+(.+)")
        if newMessage and newMessage ~= "" then
            AUTO_REPLY_MESSAGE = newMessage
            print("|cFF00FF00CarryAutoResponder:|r Auto-response message updated.")
        end
    elseif msg == "status" then
        local status = ENABLED and "enabled" or "disabled"
        print("|cFF00FF00CarryAutoResponder:|r Currently " .. status)
        print("Current message: " .. AUTO_REPLY_MESSAGE)
    else
        print("|cFF00FF00CarryAutoResponder:|r Commands:")
        print("/car on - Enable auto-responses")
        print("/car off - Disable auto-responses")
        print("/car message [text] - Set custom auto-response message")
        print("/car status - Show current settings")
    end
end)

-- Print loaded message
print("|cFF00FF00CarryAutoResponder|r loaded. Type /car for commands.")
