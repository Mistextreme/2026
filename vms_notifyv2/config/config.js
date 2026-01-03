const Config = {}

Config.Default = {}

Config.UseSkew = false   // Do you want the elements to be skewed?

// Default.Notifications: Default notification configuration that will be seen by any player who does not have the style modified through the Customization Menu
Config.Default.Notifications = {
    defaultPosition: 'left', // 'left' / 'right'
    progressBar: 'linear', // null / 'linear' / 'rounded' / 'rounded-icon'
    time: 5000, // You can set default time if you do not define a time parameter for the notification
    soundFile: 'notification-4.mp3', // You can set is as null if you want no sound effect by default
    soundVolume: 40, // You can set default sound effect volume
}

// Default.TextUI: Default TextUI configuration that will be seen by any player who does not have the style modified through the Customization Menu
Config.Default.TextUI = {
    defaultPosition: 'right', // 'left' / 'right' / 'top' / 'bottom'
    time: 5000, // You can set default time if you do not define a time parameter for the notification
    soundFile: 'notification-4.mp3', // You can set is as null if you want no sound effect by default
    soundVolume: 40, // You can set default sound effect volume
}

Config.ConifgurationMenu = {
    Notifications: {
        Allow: true,

        AllowChangePosition: true,
        AllowChangeSound: true,
        AllowChangeSoundVolume: true,
        AllowChangeStyle: true,
        AllowChangeMargin: true,
        AllowChangeSize: true,

        AvailableSounds: [
            {label: "Default", name: null},
            {label: "Sound 1", name: "notification-1.mp3"},
            {label: "Sound 2", name: "notification-2.mp3"},
            {label: "Sound 3", name: "notification-3.mp3"},
            {label: "Sound 4", name: "notification-4.mp3"},
            {label: "Sound 5", name: "notification-5.mp3"},
            {label: "Sound 6", name: "notification-6.mp3"},
            {label: "Sound 7", name: "notification-7.mp3"},
            {label: "Sound 8", name: "notification-8.mp3"},
        ],
        AvailableStyles: [ // Label: Displayed name | name: name: name in square brackets of the name from Config.NotificationsPresets
            {label: "Default", name: null},
            {label: "iOS", name: "ios"},
            {label: "Classic", name: "classic"},
            {label: "Classic with border", name: "classic-with-border"},
            {label: "Minimalist", name: "minimalist"},
            {label: "Rounded Minimalist", name: "rounded-minimalist"},
            {label: "Gradient", name: "gradient"},
            {label: "Glow", name: "glow"},
            {label: "Glow+", name: "more-glow"},
            {label: "Neon", name: "neon"},
            {label: "Transparent", name: "transparent"},
        ],
    },

    TextUI: {
        Allow: true,
        AllowChangePosition: true,
        AllowChangeSound: true,
        AllowChangeSoundVolume: true,
        AllowChangeStyle: true,
        AllowChangeMarginHorizontal: true,
        AllowChangeMarginVertical: true,
        AllowChangeSize: true,

        AvailableSounds: [
            {label: "Default", name: null},
            {label: "Sound 1", name: "notification-1.mp3"},
            {label: "Sound 2", name: "notification-2.mp3"},
            {label: "Sound 3", name: "notification-3.mp3"},
            {label: "Sound 4", name: "notification-4.mp3"},
            {label: "Sound 5", name: "notification-5.mp3"},
            {label: "Sound 6", name: "notification-6.mp3"},
            {label: "Sound 7", name: "notification-7.mp3"},
            {label: "Sound 8", name: "notification-8.mp3"},
        ],
        AvailableStyles: [ // Label: Displayed name | name: name: name in square brackets of the name from Config.TextUIPresets
            {label: "Default", name: null},
            {label: "Rounded Key", name: "rounded-key"},
            {label: "Transparent", name: "transparent"},
        ],
    },

}