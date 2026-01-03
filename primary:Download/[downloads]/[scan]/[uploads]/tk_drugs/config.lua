Config = {} -- webhook link for logs can be placed in server/main_editable.lua

Config.Framework = 'esx' -- 'esx' | 'qb'
Config.NotificationType = 'esx' -- 'ox' | 'esx' | 'qb' | 'mythic'
Config.Locale = 'en' -- 'en' | 'fi'
Config.ImageFormat = 'nui://ox_inventory/web/images/%s.png' -- format string for images used in UI
Config.DebugMode = false

Config.Inventory = 'default' -- 'default' | 'ox' | 'qs'
Config.Target = 'none' -- 'none' | 'ox' | 'qb'
Config.UseOxLib = false -- false | true, remember to add " shared_script '@ox_lib/init.lua' " to fxmanifest.lua if set to true

Config.UISettings = { -- https://v6.mantine.dev/theming/colors/
    color = 'blue',
    shade = 6,
}

Config.Controls = {
    interact = 38, -- E
    remove = 246, -- Y
}

Config.PoliceJobs = {
    police = true,
    sheriff = true,
}

Config.Anims = {
    place = {
        dict = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@',
        name = 'plant_floor',
        duration = 1000,
    },
    remove = {
        dict = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@',
        name = 'plant_floor',
        duration = 1000,
    }
}

Config.DisabledAreas = { -- areas where you can't place anything (plants, equipment, etc.)
    --[[ {
        coords = vec3(161.88, -998.3, 29.35),
        radius = 50.0,
    }, ]]
}

Config.EquipmentItems = {
    meth_oven = {
        item = 'meth_oven',
        equipmentType = 'oven',
        objects = {
            {
                model = `bkr_prop_meth_chiller_01a`,
                offset = vec3(0.0, 0.0, 0.0),
            },
            {
                model = `bkr_prop_weed_table_01b`,
                offset = vec3(0.0, -1.5, 0.0),
            }
        },
        cookTime = 10000,
        substanceModel = `prop_cs_script_bottle_01`,
        hammering = true,
        recipes = {
            {
                need = {
                    {name = 'liquid_meth', amount = 3},
                },
                get = {
                    {name = 'meth', amount = 1},
                }
            },
        },
    },
    coke_oven = {
        item = 'coke_oven',
        equipmentType = 'oven',
        objects = {
            {
                model = `tr_prop_meth_chiller_01a`,
                offset = vec3(0.0, 0.0, 0.0),
            },
            {
                model = `bkr_prop_weed_table_01b`,
                offset = vec3(0.0, -1.5, 0.0),
            }
        },
        cookTime = 10000,
        substanceModel = `bkr_prop_coke_powder_02`,
        recipes = {
            {
                need = {
                    {name = 'coke_base', amount = 3},
                },
                get = {
                    {name = 'cocaine', amount = 1},
                },
            }
        }
    },
    meth_cooking = {
        item = 'meth_cooking_table',
        equipmentType = 'meth_cooking',
        objects = {
            {
                model = `bkr_prop_weed_table_01b`,
                offset = vec3(0.0, 0.0, 0.0),
            }
        },
        flaskModel = 'xm3_prop_xm3_lsd_tray_02a',
        heaterModel = 'xm3_prop_xm3_lsd_appar_03a',
        recipes = {
            {
                need = {
                    {name = 'pseudo', amount = 1, model = 'prop_cs_pills', interactType = 'move'}, -- you can also add offset for each item: offset = vec3(0.0, 0.0, 0.0)
                    {name = 'phos', amount = 1, model = 'xm3_prop_xm3_bottle_pills_01a', interactType = 'rotate'},
                    {name = 'acid', amount = 1, model = 'prop_cs_script_bottle_01', interactType = 'rotate'},
                },
                get = {
                    {name = 'liquid_meth', amount = 1}
                }
            }
        }
    },
    mixer = {
        item = 'mixer',
        equipmentType = 'mixer',
        objects = {
            {
                model = `tr_prop_meth_bigbag_03a`, -- v_res_tre_mixer is much better model but doesn't work occasionally, you can try if it works for you
                offset = vec3(0.0, 0.0, 0.82),
            },
            {
                model = `bkr_prop_weed_table_01b`,
                offset = vec3(0.0, 0.0, 0.0),
            }
        },
        recipes = {
            {
                need = {
                    {name = 'meth', amount = 1, model = `p_meth_bag_01_s`},
                    {name = 'gasoline', amount = 1, model = `m23_2_prop_m32_plasticcan_01a`},
                },
                get = {
                    {name = 'explosive_meth', amount = 1}
                }
            },
        }
    },
    bagging_table = {
        item = 'bagging_table',
        equipmentType = 'bagging',
        objects = {
            {
                model = `bkr_prop_weed_table_01b`,
                offset = vec3(0.0, 0.0, 0.0),
            }
        },
        recipes = {
            {
                need = {
                    {name = 'weed', amount = 1, model = `bkr_prop_weed_bud_01b`},
                    {name = 'baggy', amount = 1, model = `sf_prop_sf_bag_weed_open_01a`},
                },
                get = {
                    {name = 'bagged_weed', amount = 1}
                }
            },
            {
                need = {
                    {name = 'meth', amount = 1, model = `prop_cs_pebble`},
                    {name = 'baggy', amount = 1, model = `bkr_prop_meth_openbag_01a_frag_`},
                },
                get = {
                    {name = 'bagged_meth', amount = 1}
                }
            },
        }
    },
    cauldron = {
        item = 'cauldron',
        equipmentType = 'cauldron',
        objects = {
            {
                model = `prop_kitch_pot_huge`,
                offset = vec3(0.0, 0.0, 0.0),
            }
        },
        recipes = {
            {
                need = {
                    {name = 'coca_leaf', amount = 3, model = 'bkr_prop_weed_leaf_01a'},
                },
                get = {
                    {name = 'coke_base', amount = 1}
                },
            }
        }
    },
    press = {
        item = 'press',
        equipmentType = 'press',
        objects = {
            {
                model = `bkr_prop_coke_press_01aa`,
                offset = vec3(0.0, 0.0, 0.0),
            }
        },
        brickModel = `ng_proc_brick_01a`,
        brickOffset = vec3(-0.02, 0.0, 0.245),
        cokeBaseModel = `bkr_prop_coke_cut_02`,
        cokeBrickModel = `bkr_prop_coke_cutblock_01`,
        recipes = {
            {
                need = {
                    {name = 'cocaine', amount = 10},
                },
                get = {
                    {name = 'coke_brick', amount = 1}
                },
            }
        }
    },
}

-- Predefined locations for equipment
Config.EquipmentLocations = {
    oven_grove = {
        coords = vec3(6.1368, -1810.5800, 25.3458),
        rotation = vec3(0.0, 0.0, 137.2),
        configIndex = 'meth_oven',
    },
}

Config.Selling = {
    interactionDistance = 2.5, -- Distance at which player can interact with NPCs to sell drugs
    minPolice = 0, -- Minimum number of police officers required to sell drugs
    moneyType = 'money',
    props = {
        drug = 'prop_meth_bag_01',
        money = 'prop_anim_cash_note',
    },
    policeChance = {
        success = 0,
        failure = 50,
    },
    items = {
        {
            name = 'bagged_weed',
            price = {min = 50, max = 150},
            maxAmount = 15,
            baseChance = 85,
        },
        {
            name = 'bagged_meth',
            price = {min = 30, max = 200},
            maxAmount = 5,
            baseChance = 85,
        },
        {
            name = 'coke_brick',
            price = {min = 100, max = 500},
            maxAmount = 5,
            baseChance = 85,
        },
        {
            name = 'cocaine',
            price = {min = 100, max = 500},
            maxAmount = 5,
            baseChance = 85,
        },
    },
    blip = {
        color = 1, -- https://docs.fivem.net/docs/game-references/blips/ (Scroll to the bottom)
        scale = 1.0, -- This needs to be a float (eg. 1.0, 1.2, 2.0)
        sprite = 140, -- https://docs.fivem.net/docs/game-references/blips/
        playSound = true -- Should there be a sound for the police when the blip shows up (true / false)
    }
}

-- RunningSpeedIncrease: Increases running speed.
-- InfiniteStamina: Grants infinite stamina.
-- HealthRegen: Gradually regenerates health.
-- ArmorBoost: Provides additional armor.
-- DrunkEffect: Simulates drunken behavior.
-- BlurredVision: Blurs the player's vision.
-- SuperJump: Allows the player to jump higher.
-- FocusEffect: Enhances focus with visual effects.
-- FogEffect: Adds a foggy visual effect.
-- ConfusionEffect: Causes disorientation.
-- CameraShake: Shakes the camera for a dramatic effect.
-- WhiteoutEffect: Simulates a whiteout visual effect.
-- IntenseEffect: Adds intense visual effects.
-- ExplosiveEffect: Creates an explosion at the player's location.

-- animation: 'pill' | 'blunt' | 'sniff'
Config.Drugs = {
    bagged_meth = {
        animation = 'pill',
        effects = {'RunningSpeedIncrease', 'InfiniteStamina', 'HealthRegen', 'ArmorBoost', 'CameraShake'}
    },
    explosive_meth = {
        animation = 'pill',
        effects = {'ExplosiveEffect'}
    },
    bagged_weed = {
        animation = 'blunt',
        effects = {'DrunkEffect', 'BlurredVision', 'FogEffect', 'WhiteoutEffect'}
    },
    cocaine = {
        animation = 'sniff',
        effects = {'FocusEffect', 'ConfusionEffect', 'IntenseEffect'}
    },
}

Config.EffectDurations = {
    RunningSpeedIncrease = 60000, -- 1 minute
    InfiniteStamina = 60000,
    HealthRegen = 60000,
    ArmorBoost = 60000,
    DrunkEffect = 60000,
    BlurredVision = 60000,
    SuperJump = 60000,
    FocusEffect = 60000,
    FogEffect = 60000,
    ConfusionEffect = 60000,
    CameraShake = 60000,
    WhiteoutEffect = 60000,
    IntenseEffect = 60000
}

Config.EffectAmounts = {
    RunningSpeedIncrease = 1.4, -- multiplier for running speed
    HealthRegen = 5, -- how much to heal per tick (tick is 2 seconds)
    ArmorBoost = 25, -- how much armor to add
}

Config.Shops = {
    {
        name = 'Chemical Store',
        coords = vec4(483.1584, -202.0399, 53.7879, 242.8231),
        ped = 's_m_y_robber_01',
        moneyType = 'money',
        items = {
            {
                name = 'gasoline',
                price = 100,
                amount = 1,
            },
            {
                name = 'cannabis_seed',
                price = 100,
                amount = 1,
            },
            {
                name = 'coca_seed',
                price = 200,
                amount = 1,
            },
            {
                name = 'plant_pot',
                price = 10,
                amount = 1,
            },
            {
                name = 'fertilizer',
                price = 10,
                amount = 1,
            },
            {
                name = 'water_bottle',
                price = 10,
                amount = 1,
            },
        }
    },
    {
        name = 'Equipment Store',
        coords = vec4(-2019.6021, -357.7971, 48.1063, 57.4592),
        ped = 's_m_y_robber_01',
        moneyType = 'money',
        items = {
            {
                name = 'meth_oven',
                price = 1000,
                amount = 1,
            },
            {
                name = 'meth_cooking_table',
                price = 1000,
                amount = 1,
            },
            {
                name = 'coke_oven',
                price = 1000,
                amount = 1,
            },
            {
                name = 'mixer',
                price = 1000,
                amount = 1,
            },
            {
                name = 'bagging_table',
                price = 1000,
                amount = 1,
            },
            {
                name = 'cauldron',
                price = 1000,
                amount = 1,
            },
            {
                name = 'press',
                price = 1000,
                amount = 1,
            },
            {
                name = 'pseudo',
                price = 10,
                amount = 1,
            },
            {
                name = 'acid',
                price = 10,
                amount = 1,
            },
            {
                name = 'phos',
                price = 10,
                amount = 1,
            },
            {
                name = 'default_lamp',
                price = 100,
                amount = 1,
            }
        }
    },
}

Config.Plants = {
    cannabis_seed = {
        item = 'cannabis_seed',
        neededItems = {
            {name = 'plant_pot', amount = 1, remove = true},
        },
        budModel = 'bkr_prop_weed_bud_01b',
        stages = {
            {model = `bkr_prop_weed_01_small_01c`, time = 60 * 60, offset = vec3(0.0, 0.0, 1.0)},
            {model = `bkr_prop_weed_01_small_01a`, time = 60 * 60, offset = vec3(0.0, 0.0, 1.0)},
            {model = `bkr_prop_weed_med_01b`, time = 60 * 60, offset = vec3(0.0, 0.0, -1.5)},
            {model = `bkr_prop_weed_lrg_01b`, time = 60 * 500, offset = vec3(0.0, 0.0, -1.5)}, -- time for last stage will determine how long for plant to die 
        },
        yield = {-- chance is rolled for each item individually (so you can get multiple items)
            {item = 'weed', amount = {min = 3, max = 8}, chance = 100},
            {item = 'cannabis_seed', amount = {min = 0, max = 1}, chance = 50},
        },
    },
    coca_seed = {
        item = 'coca_seed',
        neededItems = {
            {name = 'plant_pot', amount = 1, remove = true},
        },
        budModel = 'bkr_prop_weed_bud_01b',
        stages = {
            {model = `bkr_prop_weed_01_small_01c`, time = 60 * 60, offset = vec3(0.0, 0.0, 1.0)},
            {model = `bkr_prop_weed_01_small_01a`, time = 60 * 60, offset = vec3(0.0, 0.0, 1.0)},
            {model = `bkr_prop_weed_med_01b`, time = 60 * 60, offset = vec3(0.0, 0.0, -1.5)},
            {model = `bkr_prop_weed_lrg_01b`, time = 60 * 500, offset = vec3(0.0, 0.0, -1.5)},
        },
        yield = {-- chance is rolled for each item individually (so you can get multiple items)
            {item = 'coca_leaf', amount = {min = 3, max = 10}, chance = 100},
            {item = 'coca_seed', amount = {min = 0, max = 2}, chance = 50},
        }
    },
}

-- Plant management settings
Config.PlantSettings = {
    waterDecayRate = 0.2,    -- How much water decreases per minute (0-100 scale)
    fertilizerDecayRate = 0.1,  -- How much fertilizer decreases per minute (0-100 scale)
    updateInterval = 60000,   -- How often (in ms) to check and update plant resources
    water = {
        item = 'water_bottle',
        amount = 1,
        model = `prop_ld_flow_bottle`,
        fxOffset = vec3(0.0, 0.0, 0.1),
        rotateOffset = vec3(10.0, 0.0, 0.0),
    },
    fertilizer = {
        item = 'fertilizer',
        amount = 1,
        model = `prop_cs_sack_01`,
        fxOffset = vec3(0.0, 0.0, 0.1),
        rotateOffset = vec3(10.0, 0.0, 0.0),
    },
    removeLamps = false, -- if set to true, attached lamps will be removed when plant is removed
}

Config.Lamps = {
    default_lamp = {
        item = 'default_lamp',
        model = `xm_prop_base_tripod_lampb`,
        growthMultiplier = 1.5, -- multiplier for growth speed
        offset = vec3(0.0, 0.0, 1.0), -- offset for lamp position
    },
}
Config.PlaceLampsAnywhere = false -- false | true, if set to true you can place lamps anywhere (not just on near plants)