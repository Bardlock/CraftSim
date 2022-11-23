CraftSimUTIL = {}

local inspirationFactor = 0.01
local multicraftFactor = 0.009
local resourcefulnessFactor = 0.0111

function CraftSimUTIL:GetInspirationStatByPercent(percent) 
    if percent == nil then 
        return 0 
    end
    return percent / inspirationFactor
end

function CraftSimUTIL:GetMulticraftStatByPercent(percent) 
    if percent == nil then 
        return 0 
    end
    return percent / multicraftFactor
end

function CraftSimUTIL:GetResourcefulnessStatByPercent(percent) 
    if percent == nil then 
        return 0 
    end
    return percent / resourcefulnessFactor
end

function CraftSimUTIL:GetInspirationPercentByStat(stat) 
    return stat * inspirationFactor
end

function CraftSimUTIL:GetMulticraftPercentByStat(stat) 
    return stat * multicraftFactor
end

function CraftSimUTIL:GetResourcefulnessPercentByStat(stat) 
    return stat * resourcefulnessFactor
end

function CraftSimUTIL:CloneTable(t)
    -- deep-copy a table
    if type(t) ~= "table" then return t end
    local target = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            target[k] = CraftSimUTIL:CloneTable(v)
        else
            target[k] = v
        end
    end
    return target
end

function CraftSimUTIL:round(number, decimals)
    return (("%%.%df"):format(decimals)):format(number)
end

function CraftSimUTIL:GetItemIDByLink(hyperlink)
    local _, _, foundID = string.find(hyperlink, "item:(%d+)")
    return tonumber(foundID)
end

function CraftSimUTIL:EquipItemByLink(link)
	for bag=BANK_CONTAINER, NUM_BAG_SLOTS+NUM_BANKBAGSLOTS do
		for slot=1,C_Container.GetContainerNumSlots(bag) do
			local item = C_Container.GetContainerItemLink(bag, slot)
			if item and item == link then
				if CursorHasItem() or CursorHasMoney() or CursorHasSpell() then ClearCursor() end
				C_Container.PickupContainerItem(bag, slot)
				AutoEquipCursorItem()
				return true
			end
		end
	end
end

-- thx ketho forum guy
function CraftSimUTIL:KethoEditBox_Show(text)
    if not KethoEditBox then
        local f = CreateFrame("Frame", "KethoEditBox", UIParent, "DialogBoxFrame")
        f:SetPoint("CENTER")
        f:SetSize(600, 500)
        
        f:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", -- this one is neat
            edgeSize = 16,
            insets = { left = 8, right = 6, top = 8, bottom = 8 },
        })
        f:SetBackdropBorderColor(0, .44, .87, 0.5) -- darkblue
        
        -- Movable
        f:SetMovable(true)
        f:SetClampedToScreen(true)
        f:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                self:StartMoving()
            end
        end)
        f:SetScript("OnMouseUp", f.StopMovingOrSizing)
        
        -- ScrollFrame
        local sf = CreateFrame("ScrollFrame", "KethoEditBoxScrollFrame", KethoEditBox, "UIPanelScrollFrameTemplate")
        sf:SetPoint("LEFT", 16, 0)
        sf:SetPoint("RIGHT", -32, 0)
        sf:SetPoint("TOP", 0, -16)
        sf:SetPoint("BOTTOM", KethoEditBoxButton, "TOP", 0, 0)
        
        -- EditBox
        local eb = CreateFrame("EditBox", "KethoEditBoxEditBox", KethoEditBoxScrollFrame)
        eb:SetSize(sf:GetSize())
        eb:SetMultiLine(true)
        eb:SetAutoFocus(true) -- dont automatically focus
        eb:SetFontObject("ChatFontNormal")
        eb:SetScript("OnEscapePressed", function() f:Hide() end)
        sf:SetScrollChild(eb)
        
        -- Resizable
        f:SetResizable(true)
        
        local rb = CreateFrame("Button", "KethoEditBoxResizeButton", KethoEditBox)
        rb:SetPoint("BOTTOMRIGHT", -6, 7)
        rb:SetSize(16, 16)
        
        rb:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
        rb:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
        rb:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
        
        rb:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                f:StartSizing("BOTTOMRIGHT")
                self:GetHighlightTexture():Hide() -- more noticeable
            end
        end)
        rb:SetScript("OnMouseUp", function(self, button)
            f:StopMovingOrSizing()
            self:GetHighlightTexture():Show()
            eb:SetWidth(sf:GetWidth())
        end)
        f:Show()
    end
    
    if text then
        KethoEditBoxEditBox:SetText(text)
    end
    KethoEditBox:Show()
end

function CraftSimUTIL:isRecipeNotProducingItem(recipeData)
    local hasNoItemID = recipeData.result.itemID == nil and recipeData.result.itemIDs == nil
    return recipeData.baseItemAmount == nil and hasNoItemID
end

function CraftSimUTIL:isRecipeProducingGear(recipeData)
    return recipeData.hasSingleItemOutput and recipeData.qualityIlvlBonuses ~= nil
end

function CraftSimUTIL:isRecipeProducingSoulbound(recipeData)
    local itemID = nil
    if recipeData.result.isGear or recipeData.result.isNoQuality then
        itemID = recipeData.result.itemID
    else
        itemID = recipeData.result.itemIDs[1]
    end
    return CraftSimUTIL:isItemSoulbound(itemID)
end

function CraftSimUTIL:isItemSoulbound(itemID)
    local _, _, _, _, _, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemID) 
    return bindType == CraftSimCONST.BINDTYPES.SOULBOUND
end

-- for debug purposes
function CraftSimUTIL:PrintTable(t)
    for k, v in pairs(t) do
        print(tostring(k) .. ": " .. tostring(v))
    end
end

function CraftSimUTIL:FormatMoney(copperValue)
    local absValue = abs(copperValue)
    local minusText = ""

    if copperValue < 0 then
        minusText = "-"
    end

    return minusText .. GetCoinTextureString(absValue)
end