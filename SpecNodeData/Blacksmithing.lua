addonName, CraftSim = ...

CraftSim.BLACKSMITHING_DATA = {}

function CraftSim.BLACKSMITHING_DATA:GetData()
    return {
        -- HAMMER CONTROL
        HAMMER_CONTROL_1 = {
            childNodeIDs = {"SAFETY_SMITHING_1", "POIGNANT_PLANS_1"},
            nodeID = 42828,
            equalsSkill = true,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        HAMMER_CONTROL_2 = {
            childNodeIDs = {"SAFETY_SMITHING_1", "POIGNANT_PLANS_1"},
            nodeID = 42828,
            threshold = 0,
            craftingspeedBonusFactor = 0.15,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        HAMMER_CONTROL_3 = {
            childNodeIDs = {"SAFETY_SMITHING_1", "POIGNANT_PLANS_1"},
            nodeID = 42828,
            threshold = 5,
            skill = 3,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        HAMMER_CONTROL_4 = {
            childNodeIDs = {"SAFETY_SMITHING_1", "POIGNANT_PLANS_1"},
            nodeID = 42828,
            threshold = 15,
            skill = 4,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        HAMMER_CONTROL_5 = {
            childNodeIDs = {"SAFETY_SMITHING_1", "POIGNANT_PLANS_1"},
            nodeID = 42828,
            threshold = 25,
            skill = 3,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        HAMMER_CONTROL_6 = {
            childNodeIDs = {"SAFETY_SMITHING_1", "POIGNANT_PLANS_1"},
            nodeID = 42828,
            threshold = 30,
            craftingspeedBonusFactor = 0.10,
            inspiration = 10,
            resourcefulness = 10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        SAFETY_SMITHING_1 = {
            nodeID = 42827,
            threshold = 0,
            resourcefulnessBonusItemsFactor = 0.05,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        SAFETY_SMITHING_2 = {
            nodeID = 42827,
            threshold = 10,
            resourcefulnessBonusItemsFactor = 0.10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        SAFETY_SMITHING_3 = {
            nodeID = 42827,
            threshold = 20,
            resourcefulnessBonusItemsFactor = 0.10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        SAFETY_SMITHING_4 = {
            nodeID = 42827,
            threshold = 30,
            resourcefulnessBonusItemsFactor = 0.25,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        SAFETY_SMITHING_5 = {
            nodeID = 42827,
            equalsResourcefulness = true,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_1 = {
            nodeID = 42826,
            equalsInspiration = true,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_2 = {
            nodeID = 42826,
            threshold = 0,
            inspirationBonusSkillFactor = 0.05,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_3 = {
            nodeID = 42826,
            threshold = 5,
            inspiration = 10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_4 = {
            nodeID = 42826,
            threshold = 10,
            inspirationBonusSkillFactor = 0.10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_5 = {
            nodeID = 42826,
            threshold = 15,
            inspiration = 10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_6 = {
            nodeID = 42826,
            threshold = 20,
            inspirationBonusSkillFactor = 0.10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_7 = {
            nodeID = 42826,
            threshold = 25,
            inspiration = 10,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        POIGNANT_PLANS_8 = {
            nodeID = 42826,
            threshold = 30,
            inspirationBonusSkillFactor = 0.25,
            categoryIDs = {},
            subtypeIDs = {} -- applies to everything
        },
        -- Speciality Smithing
        SPECIALITY_SMITHING_1 = {
            childNodeIDs = {"TOOLSMITHING_1", "STONEWORK_1", "SMELTING_1"},
            nodeID = 23765,
            equalsSkill = true,
        },
        SPECIALITY_SMITHING_2 = {
            childNodeIDs = {"TOOLSMITHING_1", "STONEWORK_1", "SMELTING_1"},
            nodeID = 23765,
            threshold = 0,
            inspiration = 5,
        },
        SPECIALITY_SMITHING_3 = {
            childNodeIDs = {"TOOLSMITHING_1", "STONEWORK_1", "SMELTING_1"},
            nodeID = 23765,
            threshold = 10,
            resourcefulness = 5,
        },
        SPECIALITY_SMITHING_4 = {
            childNodeIDs = {"TOOLSMITHING_1", "STONEWORK_1", "SMELTING_1"},
            nodeID = 23765,
            threshold = 20,
            inspiration = 5,
        },
        SPECIALITY_SMITHING_5 = {
            childNodeIDs = {"TOOLSMITHING_1", "STONEWORK_1", "SMELTING_1"},
            nodeID = 23765,
            threshold = 25,
            craftingspeedBonusFactor = 0.2,
        },
        SPECIALITY_SMITHING_6 = {
            childNodeIDs = {"TOOLSMITHING_1", "STONEWORK_1", "SMELTING_1"},
            nodeID = 23765,
            threshold = 30,
            resourcefulness = 5,
        },
        TOOLSMITHING_1 = {
            nodeID = 23764,
            equalsSkill = true,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.BLACKSMITHING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.LEATHERWORKING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SKINNING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.TAILORING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING,
            },
        },
        TOOLSMITHING_2 = {
            nodeID = 23764,
            threshold = 0,
            skill = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.BLACKSMITHING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.LEATHERWORKING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SKINNING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.TAILORING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING,
            },
        },
        TOOLSMITHING_3 = {
            nodeID = 23764,
            threshold = 5,
            inspiration = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.BLACKSMITHING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.LEATHERWORKING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SKINNING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.TAILORING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING,
            },
        },
        TOOLSMITHING_4 = {
            nodeID = 23764,
            threshold = 15,
            skill = 15,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.BLACKSMITHING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.LEATHERWORKING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SKINNING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.TAILORING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING,
            },
        },
        TOOLSMITHING_5 = {
            nodeID = 23764,
            threshold = 20,
            inspiration = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.BLACKSMITHING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.LEATHERWORKING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SKINNING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.TAILORING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING,
            },
        },
        TOOLSMITHING_6 = {
            nodeID = 23764,
            threshold = 25,
            skill = 15,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.BLACKSMITHING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.LEATHERWORKING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SKINNING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.TAILORING,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING,
            },
        },
        STONEWORK_1 = {
            nodeID = 23762,
            equalsSkill = true,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.STONEWORK},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.STONEWORK},
        },
        STONEWORK_2 = {
            nodeID = 23762,
            threshold = 0,
            multicraft = 20,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.STONEWORK},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.STONEWORK},
        },
        STONEWORK_3 = {
            nodeID = 23762,
            threshold = 5,
            inspiration = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.STONEWORK},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.STONEWORK},
        },
        STONEWORK_4 = {
            nodeID = 23762,
            threshold = 10,
            multicraft = 40,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.STONEWORK},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.STONEWORK},
        },
        STONEWORK_5 = {
            nodeID = 23762,
            threshold = 15,
            inspiration = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.STONEWORK},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.STONEWORK},
        },
        STONEWORK_6 = {
            nodeID = 23762,
            threshold = 20,
            multicraftBonusItemsFactor = 0.50,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.STONEWORK},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.STONEWORK},
        },
        SMELTING_1 = {
            nodeID = 23761,
            equalsSkill = true,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SMELTING},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.METAL_AND_STONE},
        },
        SMELTING_2 = {
            nodeID = 23761,
            threshold = 0,
            multicraft = 20,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SMELTING},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.METAL_AND_STONE},
        },
        SMELTING_3 = {
            nodeID = 23761,
            threshold = 5,
            inspiration = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SMELTING},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.METAL_AND_STONE},
        },
        SMELTING_4 = {
            nodeID = 23761,
            threshold = 10,
            multicraft = 20,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SMELTING},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.METAL_AND_STONE},
        },
        SMELTING_5 = {
            nodeID = 23761,
            threshold = 15,
            inspiration = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SMELTING},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.METAL_AND_STONE},
        },
        SMELTING_6 = {
            nodeID = 23761,
            threshold = 20,
            multicraftBonusItemsFactor = 0.50,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SMELTING},
            subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.METAL_AND_STONE},
        },
        -- Weapon Smithing
        WEAPON_SMITHING_1 = {
            childNodeIDs = {"BLADES_1"},
            nodeID = 23727,
            equalsSkill = true,
        },
        WEAPON_SMITHING_2 = {
            childNodeIDs = {"BLADES_1"},
            nodeID = 23727,
            threshold = 5,
            inspiration = 5,
        },
        WEAPON_SMITHING_3 = {
            childNodeIDs = {"BLADES_1"},
            nodeID = 23727,
            threshold = 15,
            resourcefulness = 5,
        },
        WEAPON_SMITHING_4 = {
            childNodeIDs = {"BLADES_1"},
            nodeID = 23727,
            threshold = 25,
            inspiration = 5,
        },
        WEAPON_SMITHING_5 = {
            childNodeIDs = {"BLADES_1"},
            nodeID = 23727,
            threshold = 30,
            inspiration = 15,
            resourcefulness = 15,
            craftingspeedBonusFactor = 0.15,
        },
        HAFTED_1 = {
            childNodeIDs = {"AXES_1", "MACES_1"},
            nodeID = 23723,
            equalsSkill = true,
        },
        HAFTED_2 = {
            childNodeIDs = {"AXES_1", "MACES_1"},
            nodeID = 23723,
            threshold = 5,
            inspiration = 10,
        },
        HAFTED_3 = {
            childNodeIDs = {"AXES_1", "MACES_1"},
            nodeID = 23723,
            threshold = 10,
            resourcefulness = 10,
        },
        HAFTED_4 = {
            childNodeIDs = {"AXES_1", "MACES_1"},
            nodeID = 23723,
            threshold = 25,
            inspiration = 10,
        },
        AXES_1 = {
            nodeID = 23721,
            equalsSkill = true,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.POLEARM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING, -- only picks
            }
        },
        AXES_2 = {
            nodeID = 23721,
            threshold = 5,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.POLEARM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING, -- only picks
            }
        },
        AXES_3 = {
            nodeID = 23721,
            threshold = 15,
            skill = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.POLEARM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING, -- only picks
            }
        },
        AXES_4 = {
            nodeID = 23721,
            threshold = 20,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.POLEARM,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.AXE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MINING, -- only picks
            }
        },
        MACES_1 = {
            nodeID = 23722,
            equalsSkill = true,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_1H,
            },
            exceptionRecipeIDs = {
                371372, -- epic hammer
                371412, -- blue hammer
            }
        },
        MACES_2 = {
            nodeID = 23722,
            threshold = 5,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_1H,
            },
            exceptionRecipeIDs = {
                371372, -- epic hammer
                371412, -- blue hammer
            }
        },
        MACES_3 = {
            nodeID = 23722,
            threshold = 15,
            skill = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_1H,
            },
            exceptionRecipeIDs = {
                371372, -- epic hammer
                371412, -- blue hammer
            }
        },
        MACES_4 = {
            nodeID = 23722,
            threshold = 20,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.MACE_1H,
            },
            exceptionRecipeIDs = {
                371372, -- epic hammer
                371412, -- blue hammer
            }
        },
        BLADES_1 = {
            childNodeIDs = {"SHORT_BLADES_1", "LONG_BLADES_1"},
            nodeID = 23726,
            equalsSkill = true,
        },
        BLADES_2 = {
            childNodeIDs = {"SHORT_BLADES_1", "LONG_BLADES_1"},
            nodeID = 23726,
            threshold = 5,
            inspiration = 10,
        },
        BLADES_3 = {
            childNodeIDs = {"SHORT_BLADES_1", "LONG_BLADES_1"},
            nodeID = 23726,
            threshold = 15,
            resourcefulness = 10,
        },
        BLADES_4 = {
            childNodeIDs = {"SHORT_BLADES_1", "LONG_BLADES_1"},
            nodeID = 23726,
            threshold = 25,
            inspiration = 10,
        },
        SHORT_BLADES_1 = {
            nodeID = 23725,
            equalsSkill = true,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.DAGGERS,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.FIST,
            },
            exceptionRecipeIDs = {
                371369, -- blue lw knife
                371367, -- blue sk knife
                371338, -- green lw knife
                371304, -- green sk knife
            }
        },
        SHORT_BLADES_2 = {
            nodeID = 23725,
            threshold = 10,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.DAGGERS,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.FIST,
            },
            exceptionRecipeIDs = {
                371369, -- blue lw knife
                371367, -- blue sk knife
                371338, -- green lw knife
                371304, -- green sk knife
            }
        },
        SHORT_BLADES_3 = {
            nodeID = 23725,
            threshold = 15,
            skill = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.DAGGERS,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.FIST,
            },
            exceptionRecipeIDs = {
                371369, -- blue lw knife
                371367, -- blue sk knife
                371338, -- green lw knife
                371304, -- green sk knife
            }
        },
        SHORT_BLADES_4 = {
            nodeID = 23725,
            threshold = 20,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.DAGGERS,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.FIST,
            },
            exceptionRecipeIDs = {
                371369, -- blue lw knife
                371367, -- blue sk knife
                371338, -- green lw knife
                371304, -- green sk knife
            }
        },
        LONG_BLADES_1 = {
            nodeID = 23724,
            equalsSkill = true,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.WARGLAIVES,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM, -- sickles
            }
        },
        LONG_BLADES_2 = {
            nodeID = 23724,
            threshold = 10,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.WARGLAIVES,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM, -- sickles
            }
        },
        LONG_BLADES_3 = {
            nodeID = 23724,
            threshold = 15,
            skill = 10,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.WARGLAIVES,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM, -- sickles
            }
        },
        LONG_BLADES_4 = {
            nodeID = 23724,
            threshold = 20,
            skill = 5,
            categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.WEAPONS, CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.TOOLS},
            subtypeIDs = {
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_1H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SWORDS_2H,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.WARGLAIVES,
                CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.HERBALISM, -- sickles
            },
        },
      -- Armor Smithing
      ARMOR_SMITHING_1 = {
        childNodeIDs = {"LARGE_PLATE_ARMOR_1", "SCULPTED_ARMOR_1", "FINE_ARMOR_1"},
        nodeID = 23912,
        equalsSkill = true,
      },
      ARMOR_SMITHING_2 = {
        childNodeIDs = {"LARGE_PLATE_ARMOR_1", "SCULPTED_ARMOR_1", "FINE_ARMOR_1"},
        nodeID = 23912,
        threshold = 5,
        inspiration = 5,
      },
      ARMOR_SMITHING_3 = {
        childNodeIDs = {"LARGE_PLATE_ARMOR_1", "SCULPTED_ARMOR_1", "FINE_ARMOR_1"},
        nodeID = 23912,
        threshold = 15,
        resourcefulness = 5,
      },
      ARMOR_SMITHING_4 = {
        childNodeIDs = {"LARGE_PLATE_ARMOR_1", "SCULPTED_ARMOR_1", "FINE_ARMOR_1"},
        nodeID = 23912,
        threshold = 25,
        inspiration = 5,
      },
      ARMOR_SMITHING_5 = {
        childNodeIDs = {"LARGE_PLATE_ARMOR_1", "SCULPTED_ARMOR_1", "FINE_ARMOR_1"},
        nodeID = 23912,
        threshold = 30,
        inspiration = 15,
        resourcefulness = 15,
        craftingspeedBonusFactor = 0.15,
      },
      LARGE_PLATE_ARMOR_1 = {
        childNodeIDs = {"BREASTPLATES_1", "SHIELDS_1", "GREAVES_1"},
        nodeID = 23911,
        equalsSkill = true,
      },
      LARGE_PLATE_ARMOR_2 = {
        childNodeIDs = {"BREASTPLATES_1", "SHIELDS_1", "GREAVES_1"},
        nodeID = 23911,
        threshold = 5,
        inspiration = 10,
      },
      LARGE_PLATE_ARMOR_3 = {
        childNodeIDs = {"BREASTPLATES_1", "SHIELDS_1", "GREAVES_1"},
        nodeID = 23911,
        threshold = 15,
        resourcefulness = 10,
      },
      LARGE_PLATE_ARMOR_4 = {
        childNodeIDs = {"BREASTPLATES_1", "SHIELDS_1", "GREAVES_1"},
        nodeID = 23911,
        threshold = 25,
        inspiration = 10,
      },
      BREASTPLATES_1 = {
        nodeID = 23910,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376618, -- pvp green breast
            395886, -- blue breast
            367608, -- epic breast
            367615, -- epic breast
        },
      },
      BREASTPLATES_2 = {
        nodeID = 23910,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376618, -- pvp green breast
            395886, -- blue breast
            367608, -- epic breast
            367615, -- epic breast
        },
      },
      BREASTPLATES_3 = {
        nodeID = 23910,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376618, -- pvp green breast
            395886, -- blue breast
            367608, -- epic breast
            367615, -- epic breast
        },
      },
      BREASTPLATES_4 = {
        nodeID = 23910,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376618, -- pvp green breast
            395886, -- blue breast
            367608, -- epic breast
            367615, -- epic breast
        },
      },
      BREASTPLATES_5 = {
        nodeID = 23910,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376618, -- pvp green breast
            395886, -- blue breast
            367608, -- epic breast
            367615, -- epic breast
        },
      },
      SHIELDS_1 = {
        nodeID = 23909,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SHIELDS},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SHIELDS},
      },
      SHIELDS_2 = {
        nodeID = 23909,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SHIELDS},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SHIELDS},
      },
      SHIELDS_3 = {
        nodeID = 23909,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SHIELDS},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SHIELDS},
      },
      SHIELDS_4 = {
        nodeID = 23909,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SHIELDS},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SHIELDS},
      },
      SHIELDS_5 = {
        nodeID = 23909,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.SHIELDS},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.SHIELDS},
      },
      GREAVES_1 = {
        nodeID = 23908,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376620, -- pvp green
            395881, -- blue
            367619, -- epic
            367604, -- epic
        },
      },
      GREAVES_2 = {
        nodeID = 23908,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376620, -- pvp green
            395881, -- blue
            367619, -- epic
            367604, -- epic
        },
      },
      GREAVES_3 = {
        nodeID = 23908,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376620, -- pvp green
            395881, -- blue
            367619, -- epic
            367604, -- epic
        },
      },
      GREAVES_4 = {
        nodeID = 23908,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376620, -- pvp green
            395881, -- blue
            367619, -- epic
            367604, -- epic
        },
      },
      GREAVES_5 = {
        nodeID = 23908,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376620, -- pvp green
            395881, -- blue
            367619, -- epic
            367604, -- epic
        },
      },
      SCULPTED_ARMOR_1 = {
        childNodeIDs = {"HELMS_1", "PAULDRONS_1", "SABATONS_1"},
        nodeID = 23907,
        equalsSkill = true,
      },
      SCULPTED_ARMOR_2 = {
        childNodeIDs = {"HELMS_1", "PAULDRONS_1", "SABATONS_1"},
        nodeID = 23907,
        threshold = 5,
        inspiration = 10,
      },
      SCULPTED_ARMOR_3 = {
        childNodeIDs = {"HELMS_1", "PAULDRONS_1", "SABATONS_1"},
        nodeID = 23907,
        threshold = 15,
        resourcefulness = 10,
      },
      SCULPTED_ARMOR_4 = {
        childNodeIDs = {"HELMS_1", "PAULDRONS_1", "SABATONS_1"},
        nodeID = 23907,
        threshold = 25,
        inspiration = 10,
      },
      HELMS_1 = {
        nodeID = 23906,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376621, -- pvp green
            395883, -- blue
            367617, -- epic
            367605, -- epic
        },
      },
      HELMS_2 = {
        nodeID = 23906,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376621, -- pvp green
            395883, -- blue
            367617, -- epic
            367605, -- epic
        },
      },
      HELMS_3 = {
        nodeID = 23906,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376621, -- pvp green
            395883, -- blue
            367617, -- epic
            367605, -- epic
        },
      },
      HELMS_4 = {
        nodeID = 23906,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376621, -- pvp green
            395883, -- blue
            367617, -- epic
            367605, -- epic
        },
      },
      HELMS_5 = {
        nodeID = 23906,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            376621, -- pvp green
            395883, -- blue
            367617, -- epic
            367605, -- epic
        },
      },
      PAULDRONS_1 = {
        nodeID = 23905,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395880, -- blue
            376622, -- pvp
            367603, -- epic
        },
      },
      PAULDRONS_2 = {
        nodeID = 23905,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395880, -- blue
            376622, -- pvp
            367603, -- epic
        },
      },
      PAULDRONS_3 = {
        nodeID = 23905,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395880, -- blue
            376622, -- pvp
            367603, -- epic
        },
      },
      PAULDRONS_4 = {
        nodeID = 23905,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395880, -- blue
            376622, -- pvp
            367603, -- epic
        },
      },
      PAULDRONS_5 = {
        nodeID = 23905,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395880, -- blue
            376622, -- pvp
            367603, -- epic
        },
      },
      SABATONS_1 = {
        nodeID = 23904,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367610, -- blue
            376623, -- pvp
            367616, -- epic
            367607, -- epic
        },
      },
      SABATONS_2 = {
        nodeID = 23904,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367610, -- blue
            376623, -- pvp
            367616, -- epic
            367607, -- epic
        },
      },
      SABATONS_3 = {
        nodeID = 23904,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367610, -- blue
            376623, -- pvp
            367616, -- epic
            367607, -- epic
        },
      },
      SABATONS_4 = {
        nodeID = 23904,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367610, -- blue
            376623, -- pvp
            367616, -- epic
            367607, -- epic
        },
      },
      SABATONS_5 = {
        nodeID = 23904,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367610, -- blue
            376623, -- pvp
            367616, -- epic
            367607, -- epic
        },
      },
      FINE_ARMOR_1 = {
        childNodeIDs = {"BELTS_1", "VAMBRACES_1", "GAUNTLETS_1"},
        nodeID = 23903,
        equalsSkill = true,
      },
      FINE_ARMOR_2 = {
        childNodeIDs = {"BELTS_1", "VAMBRACES_1", "GAUNTLETS_1"},
        nodeID = 23903,
        threshold = 5,
        inspiration = 10,
      },
      FINE_ARMOR_3 = {
        childNodeIDs = {"BELTS_1", "VAMBRACES_1", "GAUNTLETS_1"},
        nodeID = 23903,
        threshold = 15,
        resourcefulness = 10,
      },
      FINE_ARMOR_4 = {
        childNodeIDs = {"BELTS_1", "VAMBRACES_1", "GAUNTLETS_1"},
        nodeID = 23903,
        threshold = 25,
        inspiration = 10,
      },
      BELTS_1 = {
        nodeID = 23902,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367611, -- blue
            376624, -- pvp
            367602, -- epic
            367618, -- epic
        },
      },
      BELTS_2 = {
        nodeID = 23902,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367611, -- blue
            376624, -- pvp
            367602, -- epic
            367618, -- epic
        },
      },
      BELTS_3 = {
        nodeID = 23902,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367611, -- blue
            376624, -- pvp
            367602, -- epic
            367618, -- epic
        },
      },
      BELTS_4 = {
        nodeID = 23902,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367611, -- blue
            376624, -- pvp
            367602, -- epic
            367618, -- epic
        },
      },
      BELTS_5 = {
        nodeID = 23902,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367611, -- blue
            376624, -- pvp
            367602, -- epic
            367618, -- epic
        },
      },
      VAMBRACES_1 = {
        nodeID = 23901,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367609, -- blue
            376617, -- pvp
            367614, -- epic
            367601, -- epic
        },
      },
      VAMBRACES_2 = {
        nodeID = 23901,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367609, -- blue
            376617, -- pvp
            367614, -- epic
            367601, -- epic
        },
      },
      VAMBRACES_3 = {
        nodeID = 23901,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367609, -- blue
            376617, -- pvp
            367614, -- epic
            367601, -- epic
        },
      },
      VAMBRACES_4 = {
        nodeID = 23901,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367609, -- blue
            376617, -- pvp
            367614, -- epic
            367601, -- epic
        },
      },
      VAMBRACES_5 = {
        nodeID = 23901,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            367609, -- blue
            376617, -- pvp
            367614, -- epic
            367601, -- epic
        },
      },
      GAUNTLETS_1 = {
        nodeID = 23900,
        equalsSkill = true,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395879, -- blue
            376619, -- pvp
            367606, -- epic
        },
      },
      GAUNTLETS_2 = {
        nodeID = 23900,
        threshold = 5,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395879, -- blue
            376619, -- pvp
            367606, -- epic
        },
      },
      GAUNTLETS_3 = {
        nodeID = 23900,
        threshold = 10,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395879, -- blue
            376619, -- pvp
            367606, -- epic
        },
      },
      GAUNTLETS_4 = {
        nodeID = 23900,
        threshold = 15,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395879, -- blue
            376619, -- pvp
            367606, -- epic
        },
      },
      GAUNTLETS_5 = {
        nodeID = 23900,
        threshold = 25,
        skill = 5,
        categoryIDs = {CraftSim.CONST.RECIPE_CATEGORIES.BLACKSMITHING.ARMOR},
        subtypeIDs = {CraftSim.CONST.RECIPE_ITEM_SUBTYPES.BLACKSMITHING.PLATE},
        exceptionRecipeIDs = {
            395879, -- blue
            376619, -- pvp
            367606, -- epic
        },
      },
    }
end