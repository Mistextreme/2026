Config = {}

Config.Language = "EN" -- 'EN' / 'DE' / 'FR' / 'ES' / 'PT' / 'PL' / 'IT' / 'CZ' / 'SV'



--  ██████╗██╗   ██╗███████╗████████╗ ██████╗ ███╗   ███╗██╗███████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
-- ██╔════╝██║   ██║██╔════╝╚══██╔══╝██╔═══██╗████╗ ████║██║╚══███╔╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║
-- ██║     ██║   ██║███████╗   ██║   ██║   ██║██╔████╔██║██║  ███╔╝ ███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
-- ██║     ██║   ██║╚════██║   ██║   ██║   ██║██║╚██╔╝██║██║ ███╔╝  ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
-- ╚██████╗╚██████╔╝███████║   ██║   ╚██████╔╝██║ ╚═╝ ██║██║███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
--  ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
Config.EnableCustomizationMenu = true
Config.CustomizationMenuCommand = 'customizenotify'
Config.CustomizationMenuKey = nil -- If you change this key, you need to clear your game cache or change in the game settings, for new players there will be this key
Config.CustomizationMenuDescription = 'Notifications Customization'

---@field PlayerSettingsPriority boolean: Do you want the player settings to take priority and overwrite the given values from the exports?
Config.PlayerSettingsPriority = false

---@class CustomizationMenuPreview # Default configuration of preview notification/textui that the player will be able to see after pressing preview button in the customization menu
Config.CustomizationMenuPreview = {
    ['notification'] = {
        title = "EXAMPLE NOTIFICATION",
        description = "I am your new notification system, buy now on www.vames-store.com!",
        time = 20000,
        colorsList = {
            "#35b83e",
            "#3577b8",
            "#b83549",
            "#6d42d4"
        },
        iconsList = {
            "fa-solid fa-star",
            "fa-solid fa-phone",
            "fa-solid fa-car",
            "fa-solid fa-briefcase",
            "fa-solid fa-shirt"
        }
    },
    ['textui'] = {
        message = "Press ~INPUT_CONTEXT~ to buy vms_notifyV2",
    },
}



-- ███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
-- ████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
-- ██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║
-- ██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
-- ██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
-- ╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
Config.NotificationsPresets = {
    ['success'] = {
        icon = "fa-solid fa-circle-check",
        color = '#11f747',
        time = 5500,
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            }
        }
    },
    ['error'] = {
        icon = "fa-solid fa-triangle-exclamation",
        color = '#f71134',
        time = 5500,
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            }
        }
    },
    ['info'] = {
        icon = "fa-solid fa-circle-info",
        color = '#00e5ff',
        time = 5500,
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            }
        }
    },

    ['ios'] = {
        customCSS = {
            icon = {
                ['background'] = '#fff',
                ['padding'] = '0.4em 0.4em',
                ['border-radius'] = '0.3em',
                ['scale'] = '1.15'
            },
            title = {
                ['color'] = 'black'
            },
            description = {
                ['color'] = 'black',
                ['font-weight'] = '600'
            },
            background = {
                ['border'] = 'none',
                ['background'] = 'rgba(202, 202, 202, 0.8)',
                ['border-radius'] = '0.9em',
                ['width'] = '350px',
                ['margin-left'] = '-100px'
            }
        }
    },

    ['classic'] = {
        customCSS = {
            icon = {
                ['color'] = 'white',
                ['scale'] = '1.15'
            },
            title = {},
            description = {
                ['font-weight'] = '500'
            },
            background = {
                ['background'] = "{CURRENT_COLOR}",
                ['border'] = 'none'
            }
        }
    },

    ['classic-with-border'] = {
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            },
            title = {
                ['color'] = 'black'
            },
            description = {
                ['color'] = 'black',
                ['font-weight'] = '500'
            },
            background = {
                ['border'] = '2px solid {CURRENT_COLOR}50',
                ['background'] = 'white',
                ['width'] = '350px',
                ['margin-left'] = '-100px'
            },
            background_glow = {
                ['width'] = '120rem',
                ['height'] = '65rem',
                ['transform'] = 'translate(-50%, -50%)',
                ['scale'] = '1.0',
                ['opacity'] = '0.15'
            }
        }
    },

    ['glow'] = {
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            },
            description = {
                ['font-weight'] = '500'
            },
            background_glow = {
                ['width'] = '15rem',
                ['height'] = '15rem',
                ['transform'] = 'translate(-100%, -30%)',
                ['opacity'] = '0.3'
            }
        }
    },

    ['more-glow'] = {
        customCSS = {
            background = {
                ['border'] = 'none'
            },
            background_glow = {
                ['width'] = '20em',
                ['height'] = '20em',
                ['transform'] = 'translate(-50%, -20%)',
                ['opacity'] = '1.0',
                ['background'] = 'linear-gradient(90deg, {CURRENT_COLOR}100 20%, {CURRENT_COLOR}20 120%)'
            }
        }
    },

    ['minimalist'] = {
        color = '{CURRENT_COLOR}',
        customCSS = {
            icon = {
                ['position'] = 'absolute',
                ['scale'] = '1.15',
                ['left'] = '0.2em',
                ['top'] = '0.3em',
                ['background'] = '{CURRENT_COLOR}',
                ['color'] = '#0e0d12',
                ['padding'] = '0.35em',
                ['border-radius'] = '0.5em'
            },
            title = {
                ['padding-top'] = '0.3em',
                ['padding-left'] = '2.5em',
                ['font-size'] = '0.9em'
            },
            description = {
                ['margin-top'] = '0.1em',
                ['padding-bottom'] = '0.3em',
                ['padding-left'] = '2.8em',
                ['font-weight'] = '400',
                ['opacity'] = '0.8'
            },
            background = {
                ['padding-block'] = '0.6em',
                ['padding-inline'] = '0.5em',
                ['border'] = 'none',
                ['border-radius'] = '1em',
                ['background'] = 'rgba(14, 13, 18, 0.95)',
                ['width'] = '300px',
                ['margin-left'] = '-55px'
            },
            background_glow = {
                ['display'] = 'none'
            }
        }
    },

    ['rounded-minimalist'] = {
        customCSS = {
            icon = {
                ['display'] = 'flex',
                ['align-items'] = 'center',
                ['justify-content'] = 'center',
                ['border-radius'] = '50.3em',
                ['scale'] = 1.02,
                ['background'] = '{CURRENT_COLOR}20',
                ['width'] = "2em",
                ['height'] = "2em"
            },
            title = {
                ['font-family'] = "'Titillium Web', sans-serif",
                ['font-weight'] = 700,
                ['font-size'] = "15px"
            },
            description = {
                ['font-family'] = "'Titillium Web', sans-serif",
                ['font-weight'] = 600,
                ['font-size'] = "13px",
                ['opacity'] = 0.8
            },
            background = {
                ['border'] = 'none'
            }
        }
    },

    ['gradient'] = {
        progressBar = "rounded",
        customCSS = {
            icon = {
                ['color'] = 'white'
            },
            background = {
                ['border'] = 'none',
                ['background'] = 'white'
            },
            background_glow = {
                ['width'] = '20em',
                ['height'] = '20em',
                ['transform'] = 'translate(-50%, -20%)',
                ['opacity'] = '1.0',
                ['background'] = 'linear-gradient(90deg, {CURRENT_COLOR} 40%, {CURRENT_COLOR}90 110%)'
            }
        }
    },

    ['neon'] = {
        progressBar = "rounded",
        customCSS = {
            icon = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}'
            },
            title = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}',
                ['color'] = '{CURRENT_COLOR}'
            },
            description = {
                ['text-shadow'] = '0px 0px 5px rgba(255, 255, 255, 0.8)'
            },
            background = {
                ['border'] = '2px solid {CURRENT_COLOR}50',
                ['box-shadow'] = '0px 0px 10px {CURRENT_COLOR}50'
            }
        }
    },

    ['transparent'] = {
        progressBar = "rounded-icon",
        customCSS = {
            icon = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}'
            },
            title = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}, 1px 2px 5px rgba(0, 0, 0, 0.8), -1px -2px 5px rgba(0, 0, 0, 0.7)',
                ['color'] = '{CURRENT_COLOR}'
            },
            description = {
                ['text-shadow'] = '0px 0px 5px rgba(255, 255, 255, 0.8), 1px 2px 5px rgba(0, 0, 0, 0.8), -1px -2px 5px rgba(0, 0, 0, 0.7)'
            },
            background = {
                ['border'] = "none",
                ['background'] = "transparent",
            },
            background_glow = {
                ['display'] = "none",
            }
        }
    },

}



-- ████████╗███████╗██╗  ██╗████████╗██╗   ██╗██╗
-- ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝██║   ██║██║
--    ██║   █████╗   ╚███╔╝    ██║   ██║   ██║██║
--    ██║   ██╔══╝   ██╔██╗    ██║   ██║   ██║██║
--    ██║   ███████╗██╔╝ ██╗   ██║   ╚██████╔╝██║
--    ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝
Config.TextUIPresets = {
    ['rounded-key'] = {
        customCSS = {
            key = {
                ['border-radius'] = '100px',
                ['scale'] = 1.02,
            },
        }
    },

    ['transparent'] = {
        customCSS = {
            background = {
                ['border'] = "none",
                ['background'] = "transparent",
            },
            background_glow = {
                ['display'] = "none",
            }
        }
    },

}


--  ██████╗ ██╗   ██╗███████╗███████╗████████╗██╗ ██████╗ ███╗   ██╗
-- ██╔═══██╗██║   ██║██╔════╝██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
-- ██║   ██║██║   ██║█████╗  ███████╗   ██║   ██║██║   ██║██╔██╗ ██║
-- ██║▄▄ ██║██║   ██║██╔══╝  ╚════██║   ██║   ██║██║   ██║██║╚██╗██║
-- ╚██████╔╝╚██████╔╝███████╗███████║   ██║   ██║╚██████╔╝██║ ╚████║
--  ╚══▀▀═╝  ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
Config.QuestionsPresets = {
    ['success'] = {
        icon = "fa-solid fa-circle-check",
        color = '#11f747',
        time = 5500,
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            }
        }
    },
    ['error'] = {
        icon = "fa-solid fa-triangle-exclamation",
        color = '#f71134',
        time = 5500,
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            }
        }
    },
    ['info'] = {
        icon = "fa-solid fa-circle-info",
        color = '#11a7f7',
        time = 5500,
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            }
        }
    },

    ['ios'] = {
        customCSS = {
            icon = {
                ['background'] = '#fff',
                ['padding'] = '0.4em 0.4em',
                ['border-radius'] = '0.3em',
                ['scale'] = '1.15'
            },
            title = {
                ['color'] = 'black'
            },
            description = {
                ['color'] = 'black',
                ['font-weight'] = '600'
            },
            background = {
                ['border'] = 'none',
                ['background'] = 'rgba(202, 202, 202, 0.8)',
                ['border-radius'] = '0.9em',
                ['width'] = '350px',
                ['margin-left'] = '-100px'
            }
        }
    },

    ['classic'] = {
        customCSS = {
            icon = {
                ['color'] = 'white',
                ['scale'] = '1.15'
            },
            title = {},
            description = {
                ['font-weight'] = '500'
            },
            background = {
                ['background'] = "{CURRENT_COLOR}",
                ['border'] = 'none'
            }
        }
    },

    ['classic-with-border'] = {
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            },
            title = {
                ['color'] = 'black'
            },
            description = {
                ['color'] = 'black',
                ['font-weight'] = '500'
            },
            background = {
                ['border'] = '2px solid {CURRENT_COLOR}50',
                ['background'] = 'white',
                ['width'] = '350px',
                ['margin-left'] = '-100px'
            },
            background_glow = {
                ['width'] = '120rem',
                ['height'] = '65rem',
                ['transform'] = 'translate(-50%, -50%)',
                ['scale'] = '1.0',
                ['opacity'] = '0.15'
            }
        }
    },

    ['glow'] = {
        customCSS = {
            icon = {
                ['scale'] = '1.15'
            },
            description = {
                ['font-weight'] = '500'
            },
            background_glow = {
                ['width'] = '15rem',
                ['height'] = '15rem',
                ['transform'] = 'translate(-100%, -30%)',
                ['opacity'] = '0.3'
            }
        }
    },

    ['more-glow'] = {
        customCSS = {
            background = {
                ['border'] = 'none'
            },
            background_glow = {
                ['width'] = '20em',
                ['height'] = '20em',
                ['transform'] = 'translate(-50%, -20%)',
                ['opacity'] = '1.0',
                ['background'] = 'linear-gradient(90deg, {CURRENT_COLOR}100 20%, {CURRENT_COLOR}20 120%)'
            }
        }
    },

    ['minimalist'] = {
        color = '#dad2f7',
        customCSS = {
            icon = {
                ['position'] = 'absolute',
                ['scale'] = '1.15',
                ['left'] = '0.2em',
                ['top'] = '0.3em',
                ['background'] = '#dad2f7',
                ['color'] = '#0e0d12',
                ['padding'] = '0.35em',
                ['border-radius'] = '0.5em'
            },
            title = {
                ['padding-top'] = '0.3em',
                ['padding-left'] = '1.75em',
                ['font-size'] = '0.9em'

            },
            description = {
                ['margin-top'] = '0.1em',
                ['padding-bottom'] = '0.3em',
                ['padding-left'] = '2.5em',
                ['font-weight'] = '400',
                ['opacity'] = '0.8'
            },
            background = {
                ['padding-block'] = '0.6em',
                ['padding-inline'] = '0.5em',
                ['border'] = 'none',
                ['border-radius'] = '1em',
                ['background'] = 'rgba(14, 13, 18, 0.95)',
                ['width'] = '300px',
                ['margin-left'] = '-55px'
            },
            background_glow = {
                ['display'] = 'none'
            }
        }
    },

    ['rounded-minimalist'] = {
        customCSS = {
            icon = {
                ['display'] = 'flex',
                ['align-items'] = 'center',
                ['justify-content'] = 'center',
                ['margin-left'] = '-7px',
                ['border-radius'] = '50.3em',
                ['scale'] = 1.02,
                ['background'] = '{CURRENT_COLOR}20',
                ['width'] = "2em",
                ['height'] = "2em"
            },
            title = {
                ['font-family'] = "'Titillium Web', sans-serif",
                ['font-weight'] = 700,
                ['font-size'] = "15px"
            },
            description = {
                ['font-family'] = "'Titillium Web', sans-serif",
                ['font-weight'] = 600,
                ['font-size'] = "13px",
                ['opacity'] = 0.8
            },
            background = {
                ['border'] = 'none'
            }
        }
    },

    ['gradient'] = {
        progressBar = "rounded",
        customCSS = {
            icon = {
                ['color'] = 'white'
            },
            background = {
                ['border'] = 'none',
                ['background'] = 'white'
            },
            background_glow = {
                ['width'] = '20em',
                ['height'] = '20em',
                ['transform'] = 'translate(-50%, -20%)',
                ['opacity'] = '1.0',
                ['background'] = 'linear-gradient(90deg, {CURRENT_COLOR} 40%, {CURRENT_COLOR}90 110%)'
            }
        }
    },

    ['neon'] = {
        progressBar = "rounded",
        customCSS = {
            icon = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}'
            },
            title = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}',
                ['color'] = '{CURRENT_COLOR}'
            },
            description = {
                ['text-shadow'] = '0px 0px 5px rgba(255, 255, 255, 0.8)'
            },
            background = {
                ['border'] = '2px solid {CURRENT_COLOR}50',
                ['box-shadow'] = '0px 0px 10px {CURRENT_COLOR}50'
            }
        }
    },

    ['transparent'] = {
        progressBar = "rounded-icon",
        customCSS = {
            icon = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}'
            },
            title = {
                ['text-shadow'] = '0px 0px 10px {CURRENT_COLOR}',
                ['color'] = '{CURRENT_COLOR}'
            },
            description = {
                ['text-shadow'] = '0px 0px 5px rgba(255, 255, 255, 0.8)'
            },
            background = {
                ['border'] = "none",
                ['background'] = "transparent",
            },
            background_glow = {
                ['display'] = "none",
            }
        }
    },

}

Config.DefaultQuestionKeys = {
    {
        displayKey = "Y",
        description = "Accept",
        control = 246
    },
    {
        displayKey = "N",
        description = "Reject",
        control = 306
    }
}



Config.TestNotifyCommand = false
if Config.TestNotifyCommand then
    RegisterCommand('notify', function(source, args, raw)
        exports["vms_notifyv2"]:Notification({
            title = "Title",
            description = "Description",
            color = "#FFFF00",
            time = 7500,
            icon = "fa-solid fa-crown",
        })
        Citizen.Wait(300)
        exports["vms_notifyv2"]:Notification({
            title = "Only title",
            color = "#FFFF00",
            time = 7500,
            icon = "fa-solid fa-crown",
        })
        Citizen.Wait(300)
        exports["vms_notifyv2"]:Notification({
            description = "Only description",
            color = "#FFFF00",
            time = 7500,
            icon = "fa-solid fa-crown",
        })
        Citizen.Wait(300)
        exports["vms_notifyv2"]:Notification({
            title = "Title",
            description = "Use custom images by URL",
            color = "#FFFF00",
            time = 7500,
            image = "https://dunb17ur4ymx4.cloudfront.net/webstore/logos/3e47607098ced1a73d0a8832cdc58809a546a1bb.png",
        })
        Citizen.Wait(300)
        exports["vms_notifyv2"]:Notification({
            title = "Title",
            description = "Description",
            color = "#FFFF00",
            time = 7500,
        })
        Citizen.Wait(300)
        exports["vms_notifyv2"]:Notification({
            title = "Title",
            description = "Rounded progress-bar around the icon",
            color = "#FFFF00",
            time = 7500,
            icon = "fa-solid fa-crown",
            progressBar = "rounded-icon",
        })
        Citizen.Wait(300)
        exports["vms_notifyv2"]:Notification({
            title = "Title",
            description = "Rounded progress-bar on the top right",
            color = "#FFFF00",
            time = 7500,
            icon = "fa-solid fa-crown",
            progressBar = "rounded",
        })
        Citizen.Wait(300)
        exports["vms_notifyv2"]:Notification({
            title = "Title",
            description = "Ability to ~bold~~pulse~~italic~format~s~~s~~s~ messages, ~r~col~s~~g~or~s~~b~ize~s~ and insert button prompts - ~INPUT_NEXT_CAMERA~ ~INPUT_INTERACTION_MENU~ ~INPUT_SCRIPTED_FLY_UD~",
            color = "#FFFF00",
            time = 7500,
            icon = "fa-solid fa-crown",
            progressBar = "rounded",
        })
        
    end, false)
end

Config.TestAnnouncementCommand = false
if Config.TestAnnouncementCommand then
    RegisterCommand('topnotify', function(source, args, raw)
        exports['vms_notifyv2']:TopNotification({
            title = "ANNOUNCEMENT",
            description = "This is top-notify, you can use it for, for example, announcements.",
            time = 4000,
            color = "#ffa530",
            icon = "fa-solid fa-bullhorn",
            soundNative = {-1, 'Enter_1st', 'GTAO_FM_Events_Soundset', 0},
        })
        Citizen.Wait(5000)
        exports['vms_notifyv2']:TopNotification({
            title = "SERVER RESTART",
            description = "Server restart will be in <span style='color:#ff5269'>~extra-bold~~pulse~10 minutes~s~~s~</span>, please leave the server!",
            time = 4500,
            color = "#ff304c",
            icon = "fa-solid fa-power-off",
            soundNative = {-1, 'Checkpoint_Hit', 'GTAO_FM_Events_Soundset', 0},
        })
    end, false)
end

Config.TestQuestionCommand = false
if Config.TestQuestionCommand then
    RegisterCommand('question', function(source, args, raw)
        local question = exports['vms_notifyv2']:Question({
            title = "Question Title",
            description = "You can also use Questions Menu, it allows you to enter multiple numbers of answers with the keys you register.",
            color = "#673feb",
            icon = "fa-solid fa-circle-question",
        }, {
            {
                displayKey = "Y",
                description = "Accept",
                control = 246
            },
            {
                displayKey = "N",
                description = "Reject",
                control = 306
            },
            {
                displayKey = "X",
                description = "I don't know",
                control = 73
            }
        })
        Citizen.Await(question)
        if question == "246" then -- export returns clicked control as string!
            print('ACCEPTED')
        else
            print('NOT ACCEPTED')
        end
    end, false)
end