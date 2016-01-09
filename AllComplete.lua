local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_LOGIN")
EventFrame:SetScript("OnEvent", function(self, event,...)
  ChatFrame1:AddMessage("AllComplete Loaded")
end)

SLASH_COMPLETE1 = '/completeQuests'
function SlashCmdList.COMPLETE(msg, editbox)
  numEntries, numQuests = GetNumQuestLogEntries()
  local i = 1
  while GetQuestLogTitle(i) do
   local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(i)
   if ( not isHeader ) then
    DEFAULT_CHAT_FRAME:AddMessage(questTitle .. " [" .. level .. "] " .. questID)
    local link = GetQuestLink(questID)
    SendChatMessage(".quest complete " .. questID)
    SendChatMessage(".quest reward " .. questID)
   end
   i = i + 1
  end
end
