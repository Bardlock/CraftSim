addonName, CraftSim = ...

CraftSim.DATAEXPORT = {}

CraftSimTooltipData = CraftSimTooltipData or {}
CraftSimItemCache = CraftSimItemCache or {}

LibCompress = LibStub:GetLibrary("LibCompress")

-- DEPRICATED
function CraftSim.DATAEXPORT:getExportString()
	local exportData = CraftSim.DATAEXPORT:exportRecipeData()
	-- now digest into an export string
	if exportData == nil then
		return "Current Recipe Type not supported"
	end
	local exportString = ""
	for property, value in pairs(exportData) do
		exportString = exportString .. tostring(property) .. "," .. tostring(value) .. "\n"
	end
	return exportString
end

function CraftSim.DATAEXPORT:GetDifferentQualityLinksByLink(itemLink)
	-- TODO: is this consistent enough?
	local linksByQuality = {}
	local itemString = select(3, strfind(itemLink, "|H(.+)|h%["))
	--print("itemstring: " .. itemString)
	for qualityID = 4, 8, 1 do
		local parts = { string.split(":", itemString) }
		
		parts[#parts-5] = qualityID
		local newString = table.concat(parts, ":")
		--print("item string q" .. qualityID .. " " .. tostring(newString))
		local _, link = GetItemInfo(newString)
		--print("link: " .. link)
		table.insert(linksByQuality, link)
	 end
	 return linksByQuality
end

function CraftSim.DATAEXPORT:AddSupportedRecipeStats(recipeData, operationInfo)
	local bonusStats = operationInfo.bonusStats
	recipeData.stats = {}
	for _, statInfo in pairs(bonusStats) do
		local statName = string.lower(statInfo.bonusStatName)
		-- check each stat individually to consider localization
		local inspiration = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_INSPIRATION))
		local multicraft = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_MULTICRAFT))
		local resourcefulness = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_RESOURCEFULNESS))
		local craftingspeed = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_CRAFTINGSPEED))
		if statName == craftingspeed then
			recipeData.stats.craftingspeed = {}
		elseif statName == inspiration then
			--print("add inspiration")
			recipeData.stats.inspiration = {}
		elseif statName == multicraft then
			recipeData.stats.multicraft = {}
		elseif statName == resourcefulness then
			recipeData.stats.resourcefulness = {}
		end
	end
end

function CraftSim.DATAEXPORT:handlePlayerProfessionStatsV1(recipeData, operationInfo)
	local bonusStats = operationInfo.bonusStats
	for _, statInfo in pairs(bonusStats) do
		local statName = string.lower(statInfo.bonusStatName)
		-- check each stat individually to consider localization
		local inspiration = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_INSPIRATION))
		local multicraft = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_MULTICRAFT))
		local resourcefulness = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_RESOURCEFULNESS))
		local craftingspeed = string.lower(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_CRAFTINGSPEED))

		if statName == craftingspeed then
			recipeData.stats.craftingspeed.value = statInfo.bonusStatValue
			recipeData.stats.craftingspeed.description = statInfo.ratingDescription
			recipeData.stats.craftingspeed.percent = statInfo.ratingPct
		elseif statName == inspiration then
			recipeData.stats.inspiration.value = statInfo.bonusStatValue
			recipeData.stats.inspiration.description = statInfo.ratingDescription
			recipeData.stats.inspiration.percent = statInfo.ratingPct

			-- matches a row of numbers coming after the % character and any characters in between plus a space, should hopefully match in every localization...
			local _, _, bonusSkill = string.find(statInfo.ratingDescription, "%%.* (%d+)") 
			recipeData.stats.inspiration.bonusskill = bonusSkill
		elseif statName == multicraft then
			recipeData.stats.multicraft.value = statInfo.bonusStatValue
			recipeData.stats.multicraft.description = statInfo.ratingDescription
			recipeData.stats.multicraft.percent = statInfo.ratingPct
		elseif statName == resourcefulness then
			recipeData.stats.resourcefulness.value = statInfo.bonusStatValue
			recipeData.stats.resourcefulness.description = statInfo.ratingDescription
			recipeData.stats.resourcefulness.percent = statInfo.ratingPct
		end
	end

	-- baseSkill is like the base of the players skill and bonusSkill is what is added through reagents
	recipeData.stats.skill = operationInfo.baseSkill + operationInfo.bonusSkill
	recipeData.stats.baseSkill = operationInfo.baseSkill -- Needed for reagent optimization

	-- crafting speed is always relevant but it is not shown in details when it is zero
	if not recipeData.stats.craftingspeed then
		recipeData.stats.craftingspeed = {
			value = 0,
			percent = 0,
			description = ""
		}
	end
end

function CraftSim.DATAEXPORT:GetStatsFromBuffs(buffData)
	-- TODO: Implement
    return {	
        inspiration = 0,
        inspirationBonusSkillPercent = 0,
        multicraft = 0,
        multicraftBonusItemsFactor = 1,
        resourcefulness = 0,
        resourcefulnessBonusItemsFactor = 1,
        craftingspeed = 0,
		craftingspeedBonusFactor = 1,
        skill = 0
    }
end

function CraftSim.DATAEXPORT:exportBuffData(recipeData)
	return { -- TODO: information about relevant stats like crafting speed / inspiration incense / inspiration portrait (?)

	}
end

function CraftSim.DATAEXPORT:exportSpecNodeData(recipeData)
	local skillLineID = C_TradeSkillUI.GetProfessionChildSkillLineID()
    local configID = C_ProfSpecs.GetConfigIDForSkillLine(skillLineID)

	local nodes = CraftSim.CONST.NODES()[recipeData.professionID] or {}

	local specNodeData = {}
	for _, currentNode in pairs(nodes) do
		--print("checking node -> " .. currentNode.name)
		local nodeInfo = C_Traits.GetNodeInfo(configID, currentNode.nodeID)
		if nodeInfo then
			specNodeData[currentNode.nodeID] = {
				nodeID = currentNode.nodeID,
				name = currentNode.name,
				activeRank = nodeInfo.activeRank
				-- parent nodes? and other stuff..
			}
		end
	end
	return specNodeData
end

function CraftSim.DATAEXPORT:GetStatsFromReagents(recipeData)
	-- TODO: export optional and finishing reagents and get their modifiers
	return {	
        inspiration = 0,
        inspirationBonusSkillFactor = 1,
        multicraft = 0,
        multicraftBonusItemsFactor = 1,
        resourcefulness = 0,
        resourcefulnessBonusItemsFactor = 1,
        craftingspeed = 0,
		craftingspeedBonusFactor = 1,
        skill = 0
    }
end

function CraftSim.DATAEXPORT:handlePlayerProfessionStatsV2(recipeData)
	print("player stats v2")
	local professionInfo = C_TradeSkillUI.GetChildProfessionInfo()
	local professionGearStats = CraftSim.DATAEXPORT:GetCurrentProfessionItemStats()

	local relevantNodes = CraftSim.SPEC_DATA.RELEVANT_NODES()[recipeData.professionID]

	local specNodeStats = CraftSim.SPEC_DATA:GetStatsFromSpecNodeData(recipeData, relevantNodes)
	local buffStats = CraftSim.DATAEXPORT:GetStatsFromBuffs(recipeData.buffData)
	local reagentStats = CraftSim.DATAEXPORT:GetStatsFromReagents(recipeData)

	print("specnodestats: ")
	CraftSim.UTIL:PrintTable(specNodeStats)

	-- skill
	local baseSkill = professionInfo.skillLevel
	local racialSkill = CraftSim.DATAEXPORT:GetRacialProfessionSkillBonus(recipeData.professionID)
	local itemSkill = professionGearStats.skill
	local specNodeSkill = specNodeStats.skill
	local reagentSkill = reagentStats.skill

	recipeData.stats.skill = baseSkill + racialSkill + itemSkill + specNodeSkill + reagentSkill

	-- inspiration
	if recipeData.stats.inspiration then
		local basePercent = 5 -- everyone has this as base 
		local baseInspirationBonusSkill = 0
		local specNodeBonus = specNodeStats.inspiration
		local itemBonus = professionGearStats.inspiration
		local itemBonusSkillFactor = 1 + (professionGearStats.inspirationBonusSkillPercent / 100) -- 15% -> 1.15
		local specNodeBonusSkillFactor = specNodeStats.inspirationBonusSkillFactor
		-- TODO: consider stable fluidic draconium 
		local finishingReagentsBonusSkillFactor = reagentStats.inspirationBonusSkillFactor

		if not recipeData.result.isNoQuality then
			if recipeData.maxQuality == 5 then
				baseInspirationBonusSkill = recipeData.baseDifficulty * (1/6)
			else -- its 3
				baseInspirationBonusSkill = recipeData.baseDifficulty * (1/3)
			end
		end

		recipeData.stats.inspiration.value = buffStats.inspiration + itemBonus + specNodeBonus
		recipeData.stats.inspiration.percent = basePercent + CraftSim.UTIL:GetInspirationPercentByStat(recipeData.stats.inspiration.value) * 100
		recipeData.stats.inspiration.bonusskill = baseInspirationBonusSkill * specNodeBonusSkillFactor * itemBonusSkillFactor * finishingReagentsBonusSkillFactor
	end

	-- multicraft
	if recipeData.stats.multicraft then
		-- TODO BUFFS?
		local specNodeBonus = specNodeStats.multicraft
		local itemBonus = professionGearStats.multicraft
		local specNodeBonusItemsFactor = specNodeStats.multicraftBonusItemsFactor
		-- TODO: consider ??? I think in cooking maybe
		local finishingReagentsBonusItemsFactor = reagentStats.multicraftBonusItemsFactor
		recipeData.stats.multicraft.value = buffStats.multicraft + itemBonus + specNodeBonus
		recipeData.stats.multicraft.percent = CraftSim.UTIL:GetMulticraftPercentByStat(recipeData.stats.multicraft.value) * 100
		recipeData.stats.multicraft.bonusItemsFactor = specNodeBonusItemsFactor * finishingReagentsBonusItemsFactor
	end

	-- resourcefulness
	if recipeData.stats.resourcefulness then
		-- TODO BUFFS?
		local specNodeBonus = specNodeStats.resourcefulness
		local itemBonus = professionGearStats.resourcefulness
		local specNodeBonusItemsFactor = specNodeStats.resourcefulnessBonusItemsFactor
		-- TODO: consider ??? Dont know if that even exists
		local finishingReagentsBonusItemsFactor = reagentStats.resourcefulnessBonusItemsFactor

		recipeData.stats.resourcefulness.value = buffStats.resourcefulness + itemBonus + specNodeBonus
		recipeData.stats.resourcefulness.percent = CraftSim.UTIL:GetResourcefulnessPercentByStat(recipeData.stats.resourcefulness.value) * 100
		recipeData.stats.resourcefulness.bonusItemsFactor = specNodeBonusItemsFactor * finishingReagentsBonusItemsFactor
	end

	-- craftingspeed
	if recipeData.stats.craftingspeed then
		-- TODO BUFFS?
		local specNodeBonus = specNodeStats.craftingspeed
		local itemBonus = professionGearStats.craftingspeed
		local specNodeBonusItemsFactor = specNodeStats.craftingspeedBonusFactor
		-- TODO: consider ??? Dont know if that even exists
		local finishingReagentsBonusFactor = reagentStats.craftingspeedBonusFactor

		recipeData.stats.craftingspeed.value = buffStats.craftingspeed + itemBonus + specNodeBonus
		recipeData.stats.craftingspeed.percent = CraftSim.UTIL:GetCraftingSpeedPercentByStat(recipeData.stats.craftingspeed.value) * 100
	end

	-- debug
	print("total skill: " .. tostring(recipeData.stats.skill))
	print("total inspiration: ")
	CraftSim.UTIL:PrintTable(recipeData.stats.inspiration or {})
	print("total multicraft: ")
	CraftSim.UTIL:PrintTable(recipeData.stats.multicraft or {})
	print("total resourcefulness: ")
	CraftSim.UTIL:PrintTable(recipeData.stats.resourcefulness or {})
end

function CraftSim.DATAEXPORT:handlePlayerProfessionStats(recipeData, operationInfo)
	local implemented = tContains(CraftSim.CONST.IMPLEMENTED_SKILL_BUILD_UP(), recipeData.professionID)

	if not implemented then
		CraftSim.DATAEXPORT:handlePlayerProfessionStatsV1(recipeData, operationInfo)
	else
		CraftSim.DATAEXPORT:handlePlayerProfessionStatsV2(recipeData)
	end
end

function CraftSim.DATAEXPORT:handleOutputIDs(recipeData, recipeInfo)
	-- I need both to identify the spec boni
	recipeData.categoryID = recipeInfo.categoryID
	local itemData = CraftSim.DATAEXPORT:GetItemFromCacheByItemID(recipeData.result.itemID or recipeData.result.itemIDs[1]) or {}
	recipeData.subtypeID = itemData.subclassID or nil
end

function CraftSim.DATAEXPORT:exportRecipeData()
	local recipeData = {}

	--local professionInfo = ProfessionsFrame.professionInfo
	local professionInfo = C_TradeSkillUI.GetChildProfessionInfo()
	local expansionName = professionInfo.expansionName
	local craftingPage = ProfessionsFrame.CraftingPage
	local schematicForm = craftingPage.SchematicForm

	recipeData.profession = professionInfo.parentProfessionName
	recipeData.professionID = professionInfo.profession
	local recipeInfo = CraftSim.MAIN.currentRecipeInfo --or schematicForm:GetRecipeInfo() -- should always be the first

	local recipeType = CraftSim.UTIL:GetRecipeType(recipeInfo)

	recipeData.recipeID = recipeInfo.recipeID
	recipeData.recipeType = recipeType
	
	local operationInfo = schematicForm:GetRecipeOperationInfo()
	
    if operationInfo == nil or recipeType == CraftSim.CONST.RECIPE_TYPES.GATHERING then
        return nil
    end
	recipeData.expectedQuality = operationInfo.craftingQuality


	local currentTransaction = schematicForm.transaction or schematicForm:GetTransaction()
	
	recipeData.currentTransaction = currentTransaction
	recipeData.reagents = {}

	local salvageAllocation = currentTransaction:GetSalvageAllocation()

	if salvageAllocation then
		recipeData.salvageReagent = {
			name = salvageAllocation:GetItemName(),
			itemLink = salvageAllocation:GetItemLink(),
			itemID = salvageAllocation:GetItemID(),
			requiredQuantity = schematicForm.salvageSlot.quantityRequired
		}
	end

	local hasReagentsWithQuality = false
	local schematicInfo = C_TradeSkillUI.GetRecipeSchematic(recipeInfo.recipeID, false)
	--print("export: reagentSlotSchematics: " .. #schematicInfo.reagentSlotSchematics)
	for slotIndex, currentSlot in pairs(schematicInfo.reagentSlotSchematics) do
		local reagents = currentSlot.reagents
		local reagentType = currentSlot.reagentType
		local reagentName = CraftSim.DATAEXPORT:GetReagentNameFromReagentData(reagents[1].itemID)
		-- for now only consider the required reagents
		if reagentType == CraftSim.CONST.REAGENT_TYPE.REQUIRED then --and currentSelected == currentSlot.quantityRequired then
			local hasMoreThanOneQuality = reagents[2] ~= nil

			if hasMoreThanOneQuality then
				hasReagentsWithQuality = true
			end

			recipeData.reagents[slotIndex] = {
				name = reagentName,
				requiredQuantity = currentSlot.quantityRequired,
				differentQualities = hasMoreThanOneQuality,
				reagentType = currentSlot.reagentType
			}
			
			local slotAllocations = currentTransaction:GetAllocations(slotIndex)
			local currentSelected = slotAllocations:Accumulate()
			recipeData.reagents[slotIndex].itemsInfo = {}

			for i, reagent in pairs(reagents) do
				local reagentAllocation = slotAllocations:FindAllocationByReagent(reagent)
				local allocations = 0
				if reagentAllocation ~= nil then
					allocations = reagentAllocation:GetQuantity()
				end
				local itemInfo = {
					itemID = reagent.itemID,
					allocations = allocations
				}
				table.insert(recipeData.reagents[slotIndex].itemsInfo, itemInfo)
			end
		else
			--print("reagent not required: " .. tostring(reagentName))
			-- TODO: export optional reagents
		end
	end
	recipeData.hasReagentsWithQuality = hasReagentsWithQuality

	recipeData.maxQuality = recipeInfo.maxQuality

	recipeData.baseItemAmount = (schematicInfo.quantityMin + schematicInfo.quantityMax) / 2
	recipeData.hasSingleItemOutput = recipeInfo.hasSingleItemOutput


	recipeData.recipeDifficulty = operationInfo.baseDifficulty + operationInfo.bonusDifficulty
	recipeData.baseDifficulty = operationInfo.baseDifficulty

	recipeData.result = {}

	local allocationItemGUID = currentTransaction:GetAllocationItemGUID()
	local craftingReagentInfoTbl = currentTransaction:CreateCraftingReagentInfoTbl()
	local outputItemData = C_TradeSkillUI.GetRecipeOutputItemData(recipeInfo.recipeID, craftingReagentInfoTbl, allocationItemGUID)

	if recipeType == CraftSim.CONST.RECIPE_TYPES.MULTIPLE or recipeType == CraftSim.CONST.RECIPE_TYPES.SINGLE then
		-- recipe is anything that results in 1-5 different itemids with quality
		local qualityItemIDs = CopyTable(recipeInfo.qualityItemIDs)
		if qualityItemIDs[1] > qualityItemIDs[3] then
			--print("itemIDs for qualities not in expected order, reordering..: " .. outputItemData.hyperlink)
			table.sort(qualityItemIDs)
			--print(unpack(qualityItemIDs))
		end
		recipeData.result.itemIDs = {
			qualityItemIDs[1],
			qualityItemIDs[2],
			qualityItemIDs[3],
			qualityItemIDs[4],
			qualityItemIDs[5]}
	elseif recipeType == CraftSim.CONST.RECIPE_TYPES.ENCHANT then
		if not CraftSim.ENCHANT_RECIPE_DATA[recipeData.recipeID] then
			error("CraftSim: Enchant Recipe Missing in Data: " .. recipeData.recipeID .. " Please contact the developer (discord: genju#4210)")
		end
		recipeData.result.itemIDs = {
			CraftSim.ENCHANT_RECIPE_DATA[recipeData.recipeID].q1,
			CraftSim.ENCHANT_RECIPE_DATA[recipeData.recipeID].q2,
			CraftSim.ENCHANT_RECIPE_DATA[recipeData.recipeID].q3}
	elseif recipeType == CraftSim.CONST.RECIPE_TYPES.GEAR or recipeType == CraftSim.CONST.RECIPE_TYPES.SOULBOUND_GEAR then
		recipeData.result.itemID = schematicInfo.outputItemID
		
		local outputItemData = C_TradeSkillUI.GetRecipeOutputItemData(recipeInfo.recipeID, craftingReagentInfoTbl, allocationItemGUID)
		recipeData.result.hyperlink = outputItemData.hyperlink
		local baseIlvl = recipeInfo.itemLevel
		recipeData.result.itemQualityLinks = CraftSim.DATAEXPORT:GetDifferentQualityLinksByLink(outputItemData.hyperlink)
		recipeData.result.baseILvL = baseIlvl
	elseif recipeType == CraftSim.CONST.RECIPE_TYPES.NO_QUALITY_MULTIPLE then
		-- Probably something like transmuting air reagent that creates non equip stuff without qualities
		recipeData.result.itemID = CraftSim.UTIL:GetItemIDByLink(recipeInfo.hyperlink)
		recipeData.result.isNoQuality = true		
	elseif recipeType == CraftSim.CONST.RECIPE_TYPES.NO_QUALITY_SINGLE then
		recipeData.result.itemID = CraftSim.UTIL:GetItemIDByLink(recipeInfo.hyperlink)
		recipeData.result.isNoQuality = true	
	elseif recipeType == CraftSim.CONST.RECIPE_TYPES.NO_ITEM then
		-- nothing cause there is no result
	else
		print("recipeType not covered in export: " .. tostring(recipeType))
	end

	if recipeType ~= CraftSim.CONST.RECIPE_TYPES.NO_ITEM and recipeType ~= CraftSim.CONST.RECIPE_TYPES.GATHERING then
		CraftSim.DATAEXPORT:handleOutputIDs(recipeData, recipeInfo)
	end

	CraftSim.DATAEXPORT:AddSupportedRecipeStats(recipeData, operationInfo)

	local implemented = tContains(CraftSim.CONST.IMPLEMENTED_SKILL_BUILD_UP(), recipeData.professionID)

	if not implemented then
		recipeData.extraItemFactors = CraftSim.SPEC_DATA:GetSpecExtraItemFactorsByRecipeData(recipeData)
	else
		recipeData.buffData = CraftSim.DATAEXPORT:exportBuffData()
		recipeData.specNodeData = CraftSim.DATAEXPORT:exportSpecNodeData(recipeData)
	end


	CraftSim.DATAEXPORT:handlePlayerProfessionStats(recipeData, operationInfo)

	
	CraftSim.MAIN.currentRecipeData = recipeData
	return recipeData
end

function CraftSim.DATAEXPORT:GetProfessionGearStatsByLink(itemLink)
	local extractedStats = GetItemStats(itemLink)
	local stats = {}

	for statKey, value in pairs(extractedStats) do
		if CraftSim.CONST.STAT_MAP[statKey] ~= nil then
			stats[CraftSim.CONST.STAT_MAP[statKey]] = value
		end
	end

	local parsedSkill = 0
	local parsedInspirationSkillBonusPercent = 0
	local tooltipData = C_TooltipInfo.GetHyperlink(itemLink)
	-- For now there is only inspiration and resourcefulness as enchant?
	local parsedEnchantingStats = {
		inspiration = 0,
		resourcefulness = 0
	}
	local equipMatchString = CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.EQUIP_MATCH_STRING)
	local inspirationIncreaseMatchString = CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.INSPIRATIONBONUS_SKILL_ITEM_MATCH_STRING)
	local enchantedMatchString = CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.ENCHANTED_MATCH_STRING)
	local inspirationMatchString = CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_INSPIRATION)
	local resourcefulnessMatchString = CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.STAT_RESOURCEFULNESS)
	for lineNum, line in pairs(tooltipData.lines) do
		for argNum, arg in pairs(line.args) do
			if arg.stringVal and string.find(arg.stringVal, equipMatchString) then
				-- here the stringVal looks like "Equip: +6 Blacksmithing Skill"
				parsedSkill = tonumber(string.match(arg.stringVal, "%+(%d+)"))
			end
			if arg.stringVal and string.find(arg.stringVal, inspirationIncreaseMatchString) then
				parsedInspirationSkillBonusPercent = tonumber(string.match(arg.stringVal, "(%d+)%%"))
			end
			if arg.stringVal and string.find(arg.stringVal, enchantedMatchString) then
				if string.find(arg.stringVal, inspirationMatchString) then
					parsedEnchantingStats.inspiration = tonumber(string.match(arg.stringVal, "%+(%d+)"))
				elseif string.find(arg.stringVal, resourcefulnessMatchString) then
					parsedEnchantingStats.resourcefulness = tonumber(string.match(arg.stringVal, "%+(%d+)"))
				end
			end
		end
	end
	stats.inspiration = (stats.inspiration or 0) + parsedEnchantingStats.inspiration
	stats.resourcefulness = (stats.resourcefulness or 0) + parsedEnchantingStats.resourcefulness

	stats.skill = parsedSkill
	stats.inspirationBonusSkillPercent = parsedInspirationSkillBonusPercent

	return stats
end

function CraftSim.DATAEXPORT:GetCurrentProfessionItemStats()
	local stats = {
		inspiration = 0,
		inspirationBonusSkillPercent = 0,
		multicraft = 0,
		resourcefulness = 0,
		craftingspeed = 0,
		skill = 0
	}
	local currentProfessionSlots = CraftSim.FRAME:GetProfessionEquipSlots()

	for _, slotName in pairs(currentProfessionSlots) do
		local slotID = GetInventorySlotInfo(slotName)
		local itemLink = GetInventoryItemLink("player", slotID)
		if itemLink ~= nil then
			local itemStats = CraftSim.DATAEXPORT:GetProfessionGearStatsByLink(itemLink)
			if itemStats.inspiration then
				stats.inspiration = stats.inspiration + itemStats.inspiration
			end
			if itemStats.multicraft then
				stats.multicraft = stats.multicraft + itemStats.multicraft
			end
			if itemStats.resourcefulness then
				stats.resourcefulness = stats.resourcefulness + itemStats.resourcefulness
			end
			if itemStats.craftingspeed then
				stats.craftingspeed = stats.craftingspeed + itemStats.craftingspeed
			end
			if itemStats.skill then
				stats.skill = stats.skill + itemStats.skill
			end

			if itemStats.inspirationBonusSkillPercent then
				-- "additive or multiplicative? or dont care cause multiple items cannot have this bonus?"
				stats.inspirationBonusSkillPercent = stats.inspirationBonusSkillPercent + itemStats.inspirationBonusSkillPercent 
			end
		end
	end

	return stats
end

function CraftSim.DATAEXPORT:GetEquippedProfessionGear()
	local professionGear = {}
	local currentProfessionSlots = CraftSim.FRAME:GetProfessionEquipSlots()
	
	for _, slotName in pairs(currentProfessionSlots) do
		--print("checking slot: " .. slotName)
		local slotID = GetInventorySlotInfo(slotName)
		local itemLink = GetInventoryItemLink("player", slotID)
		if itemLink ~= nil then
			local _, _, _, _, _, _, _, _, equipSlot = GetItemInfo(itemLink) 
			local itemStats = CraftSim.DATAEXPORT:GetProfessionGearStatsByLink(itemLink)
			--print("e ->: " .. itemLink)
			table.insert(professionGear, {
				itemID = CraftSim.UTIL:GetItemIDByLink(itemLink),
				itemLink = itemLink,
				itemStats = itemStats,
				equipSlot = equipSlot,
				isEmptySlot = false
			})
		end
	end
	return professionGear
end

function CraftSim.DATAEXPORT:GetProfessionGearFromInventory()
	local currentProfession = ProfessionsFrame.professionInfo.parentProfessionName
	local professionGear = {}

	for bag=BANK_CONTAINER, NUM_BAG_SLOTS+NUM_BANKBAGSLOTS do
		for slot=1,C_Container.GetContainerNumSlots(bag) do
			local itemLink = C_Container.GetContainerItemLink(bag, slot)
			if itemLink ~= nil then
				local _, _, _, _, _, _, itemSubType, _, equipSlot = GetItemInfo(itemLink) 
				if itemSubType == currentProfession then
					--print("i -> " .. tostring(itemLink))
					local itemStats = CraftSim.DATAEXPORT:GetProfessionGearStatsByLink(itemLink)
					table.insert(professionGear, {
						itemID = CraftSim.UTIL:GetItemIDByLink(itemLink),
						itemLink = itemLink,
						itemStats = itemStats,
						equipSlot = equipSlot,
						isEmptySlot = false
					})
				end
			end
		end
	end
	return professionGear
end

function CraftSim.DATAEXPORT:GetReagentNameFromReagentData(itemID)
	local reagentData = CraftSim.REAGENT_DATA[itemID]

	if reagentData then
		return reagentData.name
	else
		local name = GetItemInfo(itemID)

		if name then
			return name
		else
			return "Unknown"
		end
	end
end

function CraftSim.DATAEXPORT:ExportTooltipData(recipeData)
	local crafter = GetUnitName("player", showServerName)

	local tooltipData = {
		expectedQuality = recipeData.expectedQuality,
		recipeType = recipeData.recipeType,
		baseItemAmount = recipeData.baseItemAmount,
		reagents = recipeData.reagents,
		result = recipeData.result,
		crafter = crafter
	}

	-- needed data: recipetype, reagents, and results, and the source character
	return tooltipData
end

function CraftSim.DATAEXPORT:UpdateTooltipData(recipeData)
	local data = CraftSim.DATAEXPORT:ExportTooltipData(recipeData)
    if recipeData.recipeType == CraftSim.CONST.RECIPE_TYPES.GEAR or recipeData.recipeType == CraftSim.CONST.RECIPE_TYPES.SOULBOUND_GEAR then
        -- map itemlinks to data
		CraftSimTooltipData[recipeData.result.hyperlink] = data
	elseif recipeData.recipeType == CraftSim.CONST.RECIPE_TYPES.NO_QUALITY_MULTIPLE or recipeData.recipeType == CraftSim.CONST.RECIPE_TYPES.NO_QUALITY_SINGLE then
		CraftSimTooltipData[recipeData.result.itemID] = data
	elseif recipeData.recipeType ~= CraftSim.CONST.RECIPE_TYPES.GATHERING and recipeData.recipeType ~= CraftSim.CONST.RECIPE_TYPES.NO_CRAFT_OPERATION and
	 recipeData.recipeType ~= CraftSim.CONST.RECIPE_TYPES.RECRAFT and recipeData.recipeType ~= CraftSim.CONST.RECIPE_TYPES.NO_ITEM then
        -- map itemids to data
        -- the item id has a certain quality, so remember the itemid and the current crafting costs as "last crafting costs"
        CraftSimTooltipData[recipeData.result.itemIDs[recipeData.expectedQuality]] = data
    end
end

function CraftSim.DATAEXPORT:GetItemFromCacheByItemID(itemID)
	if CraftSimItemCache[itemID] then
		return CraftSimItemCache[itemID]
	else
		local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType,
		itemStackCount, itemEquipLoc, itemTexture, sellPrice, classID, subclassID, bindType,
		expacID, setID, isCraftingReagent = GetItemInfo(itemID) 

		local itemData = {
			name = itemName,
			link = itemLink,
			quality = itemQuality,
			itemLevel = itemLevel,
			itemMinLevel = itemMinLevel,
			itemType = itemType,
			itemSubType = itemSubType,
			itemStackCount = itemStackCount,
			itemEquipLoc = itemEquipLoc,
			itemTexture = itemTexture,
			sellPrice = sellPrice,
			classID = classID,
			subclassID = subclassID,
			bindType = bindType,
			expacID = expacID,
			setID = setID,
			isCraftingReagent = isCraftingReagent
		}

		if not itemName then
			itemData.name = "Fetching Item.."
			local item = Item:CreateFromItemID(itemID)

			item:ContinueOnItemLoad(function()
				local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType,
				itemStackCount, itemEquipLoc, itemTexture, sellPrice, classID, subclassID, bindType,
				expacID, setID, isCraftingReagent = GetItemInfo(itemID) 

				local itemData = {
					name = itemName,
					link = itemLink,
					quality = itemQuality,
					itemLevel = itemLevel,
					itemMinLevel = itemMinLevel,
					itemType = itemType,
					itemSubType = itemSubType,
					itemStackCount = itemStackCount,
					itemEquipLoc = itemEquipLoc,
					itemTexture = itemTexture,
					sellPrice = sellPrice,
					classID = classID,
					subclassID = subclassID,
					bindType = bindType,
					expacID = expacID,
					setID = setID,
					isCraftingReagent = isCraftingReagent
				}

				CraftSimItemCache[itemID] = itemData
			end)
		end

		return itemData
	end
end

function CraftSim.DATAEXPORT:GetRacialProfessionSkillBonus(professionID)
	local _, playerRace = UnitRace("player")
	local data = {
		Gnome = {
			professionIDs = {Enum.Profession.Engineering},
			professionBonus = 5,
		},
		Draenei = {
			professionIDs = {Enum.Profession.Jewelcrafting},
			professionBonus = 5,
		},
		Worgen = {
			professionIDs = {Enum.Profession.Skinning},
			professionBonus = 5,
		},
		LightforgedDraenei = {
			professionIDs = {Enum.Profession.Blacksmithing},
			professionBonus = 5,
		},
		DarkIronDwarf = {
			professionIDs = {Enum.Profession.Blacksmithing},
			professionBonus = 5,
		},
		KulTiran = {
			professionIDs = nil, -- everything
			professionBonus = 2,
		},
		Pandaren = {
			professionIDs = {Enum.Profession.Cooking},
			professionBonus = 5,
		},
		Tauren = {
			professionIDs = {Enum.Profession.Herbalism},
			professionBonus = 5,
		},
		BloodElf = {
			professionIDs = {Enum.Profession.Enchanting},
			professionBonus = 5,
		},
		Goblin = {
			professionIDs = {Enum.Profession.Alchemy},
			professionBonus = 5,
		},
		Nightborne = {
			professionIDs = {Enum.Profession.Inscription},
			professionBonus = 5,
		},
		HighmountainTauren = {
			professionIDs = {Enum.Profession.Mining},
			professionBonus = 5,
		}
	}

	local bonusData = data[playerRace]
	if not bonusData then
		return 0
	end

	if bonusData.professionIDs == nil or tContains(bonusData.professionIDs, professionID) then
		return bonusData.professionBonus
	else
		return 0
	end
		
end