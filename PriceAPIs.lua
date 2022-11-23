CraftSimPriceAPI = {}
CraftSimPriceAPIs = {}

CraftSimTSM = {}
CraftSimAUCTIONATOR = {}

function CraftSimPriceAPIs:IsPriceApiAddonLoaded()
    local loaded = false
    for _, name in pairs(CraftSimCONST.SUPPORTED_PRICE_API_ADDONS) do
        if IsAddOnLoaded(name) then
            return true
        end
    end
    return false
end

function CraftSimPriceAPIs:IsAddonPriceApiAddon(addon_name)
    local loading = false
    for _, name in pairs(CraftSimCONST.SUPPORTED_PRICE_API_ADDONS) do
        if addon_name == name then
            return true
        end
    end
    return false
end

function CraftSimPriceAPIs:InitAvailablePriceAPI()
    local _, tsmLoaded = IsAddOnLoaded("TradeSkillMaster")
    local _, auctionatorLoaded = IsAddOnLoaded("Auctionator")
    -- TODO: currently tsm will be prioritized as the price source api if multiple are loaded.. maybe create an optionspanel with dropdown to let the player choose?
    if tsmLoaded then
        --print("Load TSM API")
        CraftSimPriceAPI = CraftSimTSM
    elseif auctionatorLoaded then
        --print("Load Auctionator API")
        CraftSimPriceAPI = CraftSimAUCTIONATOR
    else
        print("CraftSim: No supported price source found")
        print("Supported addons are: ")
        for _, name in pairs(CraftSimCONST.SUPPORTED_PRICE_API_ADDONS) do
            print(name)
        end
    end
end

function CraftSimTSM:GetMinBuyoutByItemID(itemID)
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
    
    local minBuyoutPriceSourceKey = "DBMinBuyout"
    local minBuyout, error = TSM_API.GetCustomPriceValue(minBuyoutPriceSourceKey, tsmItemString)
    return minBuyout
end

function CraftSimTSM:GetMinBuyoutByItemLink(itemLink)
    if itemLink == nil then
        return
    end
    local tsmItemString = TSM_API.ToItemString(itemLink)
    -- NOTE: the bonusID 3524 which is often used for df crafted gear is not included in the tsm bonus id map yet
    local minBuyoutPriceSourceKey = "DBMinBuyout"
    local minBuyout, error = TSM_API.GetCustomPriceValue(minBuyoutPriceSourceKey, tsmItemString)
    return minBuyout
end

function CraftSimAUCTIONATOR:GetMinBuyoutByItemID(itemID)
    return Auctionator.API.v1.GetAuctionPriceByItemID(CraftSimCONST.AUCTIONATOR_CALLER_ID , itemID)
end

function CraftSimAUCTIONATOR:GetMinBuyoutByItemLink(itemLink)
    return Auctionator.API.v1.GetAuctionPriceByItemLink(CraftSimCONST.AUCTIONATOR_CALLER_ID , itemLink)
end