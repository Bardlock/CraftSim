addonName, CraftSim = ...

CraftSim.PRICE_API = {}
CraftSim.PRICE_APIS = {}

CraftSimTSM = {name = "TradeSkillMaster"}
CraftSimAUCTIONATOR = {name = "Auctionator"}
CraftSimDEBUG_PRICE_API = {name = "Debug"}

CraftSimDebugData = CraftSimDebugData or {}

function CraftSim.PRICE_API:InitPriceSource()
    local loadedSources = CraftSim.PRICE_APIS:GetAvailablePriceSourceAddons()

    if #loadedSources == 0 then
        print("CraftSim: No Supported Price Source Available!")
        -- TODO ?
        return
    end

    local savedSource = CraftSimOptions.priceSource

    if tContains(loadedSources, savedSource) then
        CraftSim.PRICE_APIS:SwitchAPIByAddonName(savedSource)
    else
        CraftSim.PRICE_APIS:SwitchAPIByAddonName(loadedSources[1])
        CraftSimOptions.priceSource = loadedSources[1]
    end
end

function CraftSim.PRICE_APIS:SwitchAPIByAddonName(addonName)
    if addonName == "TradeSkillMaster" then
        CraftSim.PRICE_API = CraftSimTSM
    elseif addonName == "Auctionator" then
        CraftSim.PRICE_API = CraftSimAUCTIONATOR
    end
end

function CraftSim.PRICE_APIS:GetAvailablePriceSourceAddons()
    local loadedAddons = {}
    for _, addonName in pairs(CraftSim.CONST.SUPPORTED_PRICE_API_ADDONS) do
        if IsAddOnLoaded(addonName) then
            table.insert(loadedAddons, addonName)
        end
    end
    return loadedAddons
end

function CraftSim.PRICE_APIS:IsPriceApiAddonLoaded()
    local loaded = false
    for _, name in pairs(CraftSim.CONST.SUPPORTED_PRICE_API_ADDONS) do
        if IsAddOnLoaded(name) then
            return true
        end
    end
    return false
end

function CraftSim.PRICE_APIS:IsAddonPriceApiAddon(addon_name)
    local loading = false
    for _, name in pairs(CraftSim.CONST.SUPPORTED_PRICE_API_ADDONS) do
        if addon_name == name then
            return true
        end
    end
    return false
end

function CraftSim.PRICE_APIS:InitAvailablePriceAPI()
    local _, tsmLoaded = IsAddOnLoaded("TradeSkillMaster")
    local _, auctionatorLoaded = IsAddOnLoaded("Auctionator")
    if tsmLoaded then
        --print("Load TSM API")
        CraftSim.PRICE_API = CraftSimTSM
    elseif auctionatorLoaded then
        --print("Load Auctionator API")
        CraftSim.PRICE_API = CraftSimAUCTIONATOR
    else
        print("CraftSim: No supported price source found")
        print("Supported addons are: ")
        for _, name in pairs(CraftSim.CONST.SUPPORTED_PRICE_API_ADDONS) do
            print(name)
        end
    end
end

function CraftSimTSM:GetMinBuyoutByItemID(itemID, isReagent)
    if itemID == nil then
        return
    end
    local _, itemLink = GetItemInfo(itemID) 
    local tsmItemString = ""
    if itemLink == nil then
        tsmItemString = "i:" .. itemID -- manually, if the link was not generated
    else
        tsmItemString = TSM_API.ToItemString(itemLink)
    end
    
    return CraftSimTSM:GetMinBuyoutByTSMItemString(tsmItemString, isReagent)
end

function CraftSimTSM:GetMinBuyoutByTSMItemString(tsmItemString, isReagent)
    local minBuyoutPriceSourceKey = nil
    if isReagent then
        minBuyoutPriceSourceKey = CraftSimOptions.tsmPriceKeyMaterials
    else
        minBuyoutPriceSourceKey = CraftSimOptions.tsmPriceKeyItems

    end

    local vendorBuy = "VendorBuy"
    local vendorBuyPrice, error = TSM_API.GetCustomPriceValue(vendorBuy, tsmItemString)

    if vendorBuyPrice == nil then
        --print("found no vendor buy price for: " .. itemLink)
        local minBuyout, error = TSM_API.GetCustomPriceValue(minBuyoutPriceSourceKey, tsmItemString)
        return minBuyout
    else
        --print("found vendor buy price for: " .. itemLink)
        return vendorBuyPrice
    end
end

function CraftSimTSM:GetMinBuyoutByItemLink(itemLink, isReagent)
    if itemLink == nil then
        return
    end
    local tsmItemString = TSM_API.ToItemString(itemLink)
    -- NOTE: the bonusID 3524 which is often used for df crafted gear is not included in the tsm bonus id map yet
    return CraftSimTSM:GetMinBuyoutByTSMItemString(tsmItemString, isReagent)
end

function CraftSimAUCTIONATOR:GetMinBuyoutByItemID(itemID)
    local vendorPrice = Auctionator.API.v1.GetVendorPriceByItemID(CraftSim.CONST.AUCTIONATOR_CALLER_ID, itemID)
    if vendorPrice then
        return vendorPrice
    else
        return Auctionator.API.v1.GetAuctionPriceByItemID(CraftSim.CONST.AUCTIONATOR_CALLER_ID , itemID)
    end
end

function CraftSimAUCTIONATOR:GetMinBuyoutByItemLink(itemLink)
    local vendorPrice = Auctionator.API.v1.GetVendorPriceByItemLink(CraftSim.CONST.AUCTIONATOR_CALLER_ID, itemLink)
    if vendorPrice then
        return vendorPrice
    else
        return Auctionator.API.v1.GetAuctionPriceByItemLink(CraftSim.CONST.AUCTIONATOR_CALLER_ID , itemLink)
    end
end

function CraftSimDEBUG_PRICE_API:GetMinBuyoutByItemID(itemID)
    local debugItem = CraftSimDebugData[itemID]
    if debugItem == nil then
        local itemName = GetItemInfo(itemID)
        if itemName == nil then
            print("itemData not loaded yet, add to debugData next time..")
            return 0
        end
        print("PriceData not in ItemID Debugdata for: " .. tostring(itemName) .. " .. creating")
        CraftSimDebugData[itemID] = {
            itemName = itemName,
            minBuyout = 0
        }
    end
    return CraftSimDebugData[itemID].minBuyout
end

function CraftSimDEBUG_PRICE_API:GetMinBuyoutByItemLink(itemLink)
    local itemString = select(3, strfind(itemLink, "|H(.+)%["))
    --print("itemString: " .. itemString)
    local debugItem = CraftSimDebugData[itemString]
    if debugItem == nil then
        local itemName = GetItemInfo(itemLink)
        if itemName == nil then
            print("itemData not loaded yet, add to debugData next time..")
            return 0
        end
        print("PriceData not in ItemString Debugdata for: " .. itemName .. " .. creating")
        CraftSimDebugData[itemString] = {
            itemName = itemName,
            minBuyout = 0
        }
    end
    return CraftSimDebugData[itemString].minBuyout
end