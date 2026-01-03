window.onload = function (e) {
    $.post(`https://${GetParentResourceName()}/loaded`, JSON.stringify({
        'notification.position': getCache('notification.position'),
        'notification.sound': getCache('notification.sound'),
        'notification.sound_volume': getCache('notification.sound_volume'),
        'notification.style': getCache('notification.style'),
        'notification.margin': getCache('notification.margin'),
        'notification.size': getCache('notification.size'),
        'textui.position': getCache('textui.position'),
        'textui.sound': getCache('textui.sound'),
        'textui.sound_volume': getCache('textui.sound_volume'),
        'textui.style': getCache('textui.style'),
        'textui.margin_horizontal': getCache('textui.margin_horizontal'),
        'textui.margin_vertical': getCache('textui.margin_vertical'),
        'textui.size': getCache('textui.size'),
    }));
}

const Settings = {
    notifications: {
        left: {
            animeIn: 110,
            animeOut: -750,
            startMargin: '0px 0px 0px -105px',
            float: 'left',
            skew: '-2deg',
        },
        right: {
            animeIn: -165,
            animeOut: 500,
            startMargin: '0px 0px 0px -25px',
            float: 'right',
            skew: '2deg',
        },
    },

    textui: {
        right: {
            animeIn: -160,
            animeOut: 500,
            startMargin: '36vh -155px 0px 0px',
            float: 'right',
        },
        left: {
            animeIn: 110,
            animeOut: -500,
            startMargin: '36vh 0px 0px -105px',
            float: 'left',
        },
        top: {
            animeIn: 40,
            animeOut: -200,
            startMargin: '0px 0px 0px 0px',
            'position': 'absolute',
            'display': 'flex',
            'justify-content': 'center',
            'float': 'inherit',
            'width': '100%',
            'top': "0",
        },
        bottom: {
            animeIn: -80,
            animeOut: 200,
            startMargin: '0px 0px 0px 0px',
            'position': 'absolute',
            'display': 'flex',
            'justify-content': 'center',
            'float': 'inherit',
            'width': '100%',
            'bottom': "0",
        },
    }
};


var currentQuestion = null

var defaultPosNotify = Config.Default.Notifications.defaultPosition;
var defaultPosTextUI = Config.Default.TextUI.defaultPosition;

const styleSheet = document.styleSheets[0]

$(document).on('keydown', 'body', function (e) {
    if (e.which == 27) {
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({ menu: currentMenu }));
    }
})

window.addEventListener('message', function (event) {
    var item = event.data;
    switch (item.action) {
        case 'load':
            let lang = item.lang;
            $.ajax({
                url: '../config/translation.json',
                type: 'GET',
                dataType: 'json',
                success: function (code, statut) {
                    if (!code[lang]) {
                        translation = code["EN"];
                        console.warn(`^7Selected language ^1"${lang}"^7 not found, changed to ^2"EN"^7, configure your language in translation.json.`);
                    } else {
                        translation = code[lang];
                    }
                    loadTranslation();
                }
            });
            break;

        case 'openCustomizationMenu':
            CustomizationMenu.Open();
            break;
        case 'closeCustomizationMenu':
            CustomizationMenu.Close();
            break;

        case 'openNotification':
            if (!item.data.time) item.data.time = Config.Default.Notifications.time;
            if (!item.data.progressBar) item.data.progressBar = Config.Default.Notifications.progressBar;

            if (item?.settings?.position) {
                defaultPosNotify = item.settings.position;
            } else {
                defaultPosNotify = getCache('notification.position') || Config.Default.Notifications.defaultPosition;
            }

            $('.notify, .wrapper').css('float', Settings.notifications[defaultPosNotify].float)
            $('.notify').css('transform', `${item?.settings?.margin != undefined && `translateY(${item.settings.margin}px)` || getCache('notification.margin') && `translateY(${getCache('notification.margin')}px)` || 'translateY(0px)'}`)

            var number = item.settings && item.settings.id || Math.floor((Math.random() * 1000) + 1);

            var customCSS = {
                background: '',
                background_glow: '',
                icon: '',
                title: '',
                description: '',
            };

            if (item.data.customCSS) {
                Object.entries(item.data.customCSS).forEach(([key, value]) => {
                    if (value && typeof value === 'object') {
                        Object.entries(value).forEach(([property, propertyValue]) => {
                            customCSS[key] += `${property}: ${(() => {
                                if (typeof propertyValue === 'string') {
                                    return propertyValue.replace(/\{CURRENT_COLOR(?:\}(\d{1,3}))?\}/g, (match, opacityValue) => {
                                        const baseColor = item.data.color || 'transparent';
                                        if (opacityValue) {
                                            const opacity = parseInt(opacityValue, 10) / 100;
                                            if (baseColor.startsWith('rgb')) {
                                                return baseColor.replace(/rgb\((.*?)\)/, `rgba($1, ${opacity})`);
                                            } else if (baseColor.startsWith('#')) {
                                                const hexToRgba = (hex, opacity) => {
                                                    const bigint = parseInt(hex.slice(1), 16);
                                                    const r = (bigint >> 16) & 255;
                                                    const g = (bigint >> 8) & 255;
                                                    const b = bigint & 255;
                                                    return `rgba(${r}, ${g}, ${b}, ${opacity})`;
                                                };
                                                return hexToRgba(baseColor, opacity);
                                            } else {
                                                return `${baseColor} (opacity: ${opacity})`;
                                            }
                                        }
                                        return baseColor;
                                    });
                                } else {
                                    return propertyValue;
                                }
                            })()};`;
                        });
                    }
                });
            }
            
            $('.notify').append(`
                <div class="notification wrapper-${number}" style="
                    margin: ${Settings.notifications[defaultPosNotify].startMargin};
                    border-color: ${item.data.color || 'transparent'};
                    ${item.data.applyColorOnBackground && `background: ${item.data.color}` || ''};
                    ${customCSS.background}
                ">
                    <div class="main notification_main-${number}">
                        ${Config.Default.Notifications.progressBar ?
                            item.data.progressBar == 'rounded-icon' ? `<div class="progress-rounded-icon">
                                <div id="progressbar">
                                    ${(item.data.image || item.data.icon) && `
                                        <div class="icon-div">
                                            ${item.data.image ? `<img class="image" src="${item.data.image}" style="${customCSS.icon}">` : `<i class="${item.data.icon} icon" style="color: ${item.data.color || '#fff'};${customCSS.icon}"></i>`}
                                        </div>
                                    ` || ''}

                                </div>
                            </div>` : `
                                ${(item.data.image || item.data.icon) && `
                                    <div class="icon-div">
                                        ${item.data.image ? `<img class="image" src="${item.data.image}" style="${customCSS.icon}">` : `<i class="${item.data.icon} icon" style="color: ${item.data.color || '#fff'};${customCSS.icon}"></i>`}
                                    </div>
                                ` || ''}
                            `
                        : `
                            ${(item.data.image || item.data.icon) && `
                                <div class="icon-div">
                                    ${item.data.image ? `<img class="image" src="${item.data.image}" style="${customCSS.icon}">` : `<i class="${item.data.icon} icon" style="color: ${item.data.color || '#fff'};${customCSS.icon}"></i>`}
                                </div>
                            ` || ''}
                        `}
                        
                        <div>
                            ${item.data.title ? `<div class="title title-${number}" style="${customCSS.title}">${formatColors(item.data.title)}</div>` : ''}
                            ${item.data.description ? `<div class="description text-${number}" style="${customCSS.description}">${formatColors(item.data.description)}</div>` : ''}
                        </div>
                    </div>


                    ${Config.Default.Notifications.progressBar ?
                        item.data.progressBar == 'rounded' ? `<div class="progress-rounded">
                            <div id="progressbar"></div>
                        </div>` : ''
                    : ''}

                    ${Config.Default.Notifications.progressBar ?
                        item.data.progressBar == 'linear' ? `<div class="timebar" style="background: ${item.data.color};animation: timer ${item.data.time}ms;"></div>` : ''
                    : ''}
                </div>
            `)
            
            if (Config.Default.Notifications.progressBar && (item.data.progressBar == 'rounded-icon' || item.data.progressBar == 'rounded')) {
                Progressbar = new ProgressBar.Circle(`.wrapper-${number} #progressbar`, {
                    color: item.data.color || '#fff',
                    trailColor: "#2f2f2f",
                    strokeWidth: item.data.progressBar == 'rounded' && 17 || 10,
                    trailWidth: item.data.progressBar == 'rounded' && 16 || 9,
                    duration: item.data.time,
                    easing: "easeInOut",
                });
                Progressbar.set(1);
                Progressbar.animate(0);
            }

            if (item.data?.customCSS?.background?.scale >= 1.0) {
                const notificationOuterHeight = $(`.wrapper-${number}`).outerHeight()
                const adjustedMarginBottom = 10 + (notificationOuterHeight * (item.data.customCSS.background.scale - 1));
                $(`.wrapper-${number}`).css({
                    'margin-bottom': `${adjustedMarginBottom}px`
                });
            }

            const classNameNotification = `.wrapper-${number}::before`;
            let ruleIndexNotification = -1;
            for (let i = 0; i < styleSheet.cssRules.length; i++) {
                if (styleSheet.cssRules[i].selectorText === classNameNotification) {
                    ruleIndexNotification = i;
                    break;
                }
            }
            
            let beforeStyleNotification = `${classNameNotification} {
                content: "";
                position: absolute;
                top: 0rem;
                left: 9em;
                width: 15rem;
                height: 15rem;
                opacity: 0.2;
                z-index: 0;
                transform: translate(-120%, -60%);
                ${item.data.color ? `background: radial-gradient(${item.data.color} 10%, transparent 70%)` : ''};
                ${customCSS.background_glow};
            }`;
            if (ruleIndexNotification !== -1) {
                styleSheet.deleteRule(ruleIndexNotification);
            }
            styleSheet.insertRule(beforeStyleNotification, styleSheet.cssRules.length);

            var sound = null;
            if (!item.data.soundNative && (item.data.soundVolume || Config.Default.Notifications.soundFile)) {
                sound = new Audio(`sounds/${item.data.soundFile || Config.Default.Notifications.soundFile}`);
                sound.volume = item.data.soundVolume ? Number(item.data.soundVolume) / 1000 : (Config.Default.Notifications.soundVolume / 1000);
                sound.play();
            }

            var animation = {
                targets: `.wrapper-${number}`,
                translateX: Settings.notifications[defaultPosNotify].animeIn,
                duration: 750,
                easing: 'spring(1, 70, 100, 10)',
            }
            if (Config.UseSkew) animation.skewY = Settings.notifications[defaultPosNotify].skew;

            anime(animation)
            setTimeout(function () {
                var animationOut = {
                    targets: `.wrapper-${number}`,
                    translateX: Settings.notifications[defaultPosNotify].animeOut,
                    duration: 750,
                    easing: 'spring(1, 80, 100, 0)'
                }
                if (Config.UseSkew) animation.skewY = Settings.notifications[defaultPosNotify].skew;
                anime(animationOut)
                setTimeout(function () {
                    $(`.wrapper-${number}`).remove()
                }, 750)
                if (sound) sound.remove();
            }, item.data.time)
            break;

        case 'openTopNotification':
            if (!item.data.time) item.data.time = Config.Default.time;
            if (!item.data.progressBar) item.data.progressBar = Config.Default.progressBar;

            var number = Math.floor((Math.random() * 1000) + 1);

            $('.top-notify').append(`
                <div class="top-notification-wrapper" style="margin-top: -300px">
                    <div class="main">
                        <div class="header">
                            ${(item.data.image || item.data.icon) && `
                                ${item.data.image ? `<img class="image" src="${item.data.image}">` : `<i class="${item.data.icon} icon" style="color: ${item.data.color || '#fff'};"></i>`}
                            ` || ''}
                            ${item.data.title ? `<div class="title">${formatColors(item.data.title)}</div>` : ''}
                        </div>
                        ${Config.ShowNotificationProgressbar ?
                            item.data.progressBar == 'linear' ? `
                                <div class="timebar">
                                    <div style="background: ${item.data.color};animation: timer ${item.data.time}ms;"></div>
                                </div>
                            ` : ''
                        : ''}
                        ${item.data.description ? `<div class="description text">${formatColors(item.data.description)}</div>` : ''}
                    </div>
                </div>
            `)

            var sound = null;
            if (!item.data.soundNative && (item.data.soundVolume || Config.Default.Notifications.soundFile)) {
                sound = new Audio(`sounds/${item.data.soundFile || Config.Default.Notifications.soundFile}`);
                sound.volume = item.data.soundVolume ? Number(item.data.soundVolume) / 1000 : (Config.Default.Notifications.soundVolume / 1000);
                sound.play();
            }

            anime({
                targets: `.top-notification-wrapper`,
                translateY: 150,
                duration: 750,
                easing: 'spring(1, 70, 100, 10)',
            })
            setTimeout(function () {
                anime({
                    targets: `.top-notification-wrapper`,
                    translateY: -300,
                    duration: 750,
                    easing: 'spring(1, 80, 100, 0)'
                })
                setTimeout(function () {
                    $(`.top-notification-wrapper`).remove()
                }, 750)
                if (sound) sound.remove();
            }, item.data.time)
            break;

        case 'openQuestion':
            $('.notify, .wrapper').css('float', Settings.notifications[defaultPosNotify].float)
            $('.notify').css('transform', `${item?.settings?.margin != undefined && `translateY(${item?.settings?.margin}px)` || getCache('notification.margin') && `translateY(${getCache('notification.margin')}px)` || 'translateY(0px)'}`)
            currentQuestion = item.settings && item.settings.id || Math.floor((Math.random() * 1000) + 1);

            let questionButtons = '';
            for (const [_, element] of Object.entries(item.data.keys)) {
                questionButtons += `
                    <div>
                        <div class="button" data-keyid="${element.control}">
                            <span>${element.displayKey}</span>
                        </div>
                        ${element.description ? `<div class="button-description">${element.description}</div>` : ''}
                    </div>
                `
            }

            var customCSS = {
                background: '',
                background_glow: '',
                icon: '',
                title: '',
                description: '',
            };

            if (item.data.customCSS) {
                Object.entries(item.data.customCSS).forEach(([key, value]) => {
                    if (value && typeof value === 'object') {
                        Object.entries(value).forEach(([property, propertyValue]) => {
                            customCSS[key] += `${property}: ${(() => {
                                if (typeof propertyValue === 'string') {
                                    return propertyValue.replace(/\{CURRENT_COLOR(?:\}(\d{1,3}))?\}/g, (match, opacityValue) => {
                                        const baseColor = item.data.color || 'transparent';
                                        if (opacityValue) {
                                            const opacity = parseInt(opacityValue, 10) / 100;
                                            if (baseColor.startsWith('rgb')) {
                                                return baseColor.replace(/rgb\((.*?)\)/, `rgba($1, ${opacity})`);
                                            } else if (baseColor.startsWith('#')) {
                                                const hexToRgba = (hex, opacity) => {
                                                    const bigint = parseInt(hex.slice(1), 16);
                                                    const r = (bigint >> 16) & 255;
                                                    const g = (bigint >> 8) & 255;
                                                    const b = bigint & 255;
                                                    return `rgba(${r}, ${g}, ${b}, ${opacity})`;
                                                };
                                                return hexToRgba(baseColor, opacity);
                                            } else {
                                                return `${baseColor} (opacity: ${opacity})`;
                                            }
                                        }
                                        return baseColor;
                                    });
                                } else {
                                    return propertyValue;
                                }
                            })()};`;
                        });
                    }
                });
            }

            $('.notify').append(`
                <div class="notification wrapper-${currentQuestion}" style="
                    margin: ${Settings.notifications[defaultPosNotify].startMargin};
                    border-color: ${item.data.color || 'transparent'};
                    ${customCSS.background}
                ">
                    <div class="main notification_main-${currentQuestion}">
                        ${item.data.icon ? `
                            <div class="icon-div">
                                ${item.data.image ? `<img class="image" src="${item.data.image}" style="${customCSS.icon}">` : `<i class="${item.data.icon} icon" style="color: ${item.data.color || '#fff'};${customCSS.icon}"></i>`}
                            </div>
                        ` : ''}
                        <div>
                            ${item.data.title ? `<div class="title title-${currentQuestion}" style="${customCSS.title}">${formatColors(item.data.title)}</div>` : ''}
                            ${item.data.description ? `<div class="description text-${currentQuestion}" style="${customCSS.description}">${formatColors(item.data.description)}</div>` : ''}
                            
                            <div class="question-buttons">
                                ${questionButtons}
                            </div>
                        </div>
                    </div>
                </div>
            `);

            let beforeStyleQuestion = `.wrapper-${currentQuestion}::before {
                content: "";
                position: absolute;
                top: 0rem;
                left: 9em;
                width: 15rem;
                height: 15rem;
                opacity: 0.2;
                z-index: 0;
                transform: translate(-120%, -60%);
                ${item.data.color ? `background: radial-gradient(${item.data.color} 10%, transparent 70%);` : ''};
                ${customCSS.background_glow};
            }`;
            styleSheet.insertRule(beforeStyleQuestion, styleSheet.cssRules.length);

            var sound = null;
            if (!item.data.soundNative && (item.data.soundVolume || Config.Default.soundFile)) {
                sound = new Audio(`sounds/${item.data.soundFile || Config.Default.soundFile}`);
                sound.volume = item.data.soundVolume ?? Config.Default.soundVolume;
                sound.play();
            }

            var animation = {
                targets: `.wrapper-${currentQuestion}`,
                translateX: Settings.notifications[defaultPosNotify].animeIn,
                duration: 750,
                easing: 'spring(1, 70, 100, 10)',
            }
            if (Config.UseSkew) animation.skewY = Settings.notifications[defaultPosNotify].skew;
            anime(animation)
            break;
        case 'closeQuestion':
            if (item.button) $(`.question-buttons div[data-keyid="${item.button}"]`).addClass('pressed')
            setTimeout(function () {
                let animation = {
                    targets: `.wrapper-${currentQuestion}`,
                    translateX: Settings.notifications[defaultPosNotify].animeOut,
                    duration: 750,
                    easing: 'spring(1, 80, 100, 0)'
                }
                if (Config.UseSkew) animation.skewY = Settings.notifications[defaultPosNotify].skew;

                anime(animation)
                setTimeout(function () {
                    $(`.wrapper-${currentQuestion}`).remove()
                    $(`.question-buttons div[data-keyid]`).removeClass('pressed')
                }, 750)
            }, 450)
            break;

        case 'showTextUI':
            if (item?.settings?.position) {
                defaultPosTextUI = item.settings.position;
            } else {
                defaultPosTextUI = getCache('textui.position') || Config.Default.TextUI.defaultPosition;
            }

            $('.textui').attr('style', "")
            if (defaultPosTextUI == "bottom" || defaultPosTextUI == "top") {
                $('.textui').attr('style', `
                    ${Settings.textui[defaultPosTextUI].position ? `position: ${Settings.textui[defaultPosTextUI].position};` : ""}
                    ${Settings.textui[defaultPosTextUI].display ? `display: ${Settings.textui[defaultPosTextUI].display};` : ""}
                    ${Settings.textui[defaultPosTextUI].float ? `float: ${Settings.textui[defaultPosTextUI].float};` : ""}
                    ${Settings.textui[defaultPosTextUI].width ? `width: ${Settings.textui[defaultPosTextUI].width};` : ""}
                    ${Settings.textui[defaultPosTextUI].top ? `top: ${Settings.textui[defaultPosTextUI].top};` : ""}
                    ${Settings.textui[defaultPosTextUI].bottom ? `bottom: ${Settings.textui[defaultPosTextUI].bottom};` : ""}
                    ${Settings.textui[defaultPosTextUI]['justify-content'] ? `justify-content: ${Settings.textui[defaultPosTextUI]['justify-content']};` : ""}
                    ${Settings.textui[defaultPosTextUI].left ? `left: ${Settings.textui[defaultPosTextUI].left};` : ""}
                `)
            }

            $('.textui, .wrapper-textui').css('float', Settings.textui[defaultPosTextUI].float)

            var customCSS = {
                key: '',
                message: '',
                background: '',
                background_glow: '',
            };

            if (item.data.customCSS) {
                Object.entries(item.data.customCSS).forEach(([key, value]) => {
                    if (value && typeof value === 'object') {
                        Object.entries(value).forEach(([property, propertyValue]) => {
                            customCSS[key] += `${property}: ${(() => {
                                if (typeof propertyValue === 'string') {
                                    return propertyValue.replace(/\{CURRENT_COLOR(?:\}(\d{1,3}))?\}/g, (match, opacityValue) => {
                                        const baseColor = item.data.color || 'transparent';
                                        if (opacityValue) {
                                            const opacity = parseInt(opacityValue, 10) / 100;
                                            if (baseColor.startsWith('rgb')) {
                                                return baseColor.replace(/rgb\((.*?)\)/, `rgba($1, ${opacity})`);
                                            } else if (baseColor.startsWith('#')) {
                                                const hexToRgba = (hex, opacity) => {
                                                    const bigint = parseInt(hex.slice(1), 16);
                                                    const r = (bigint >> 16) & 255;
                                                    const g = (bigint >> 8) & 255;
                                                    const b = bigint & 255;
                                                    return `rgba(${r}, ${g}, ${b}, ${opacity})`;
                                                };
                                                return hexToRgba(baseColor, opacity);
                                            } else {
                                                return `${baseColor} (opacity: ${opacity})`;
                                            }
                                        }
                                        return baseColor;
                                    });
                                } else {
                                    return propertyValue;
                                }
                            })()};`;
                        });
                    }
                });
            }

            $('.textui').html(`
                <div id="textui" class="wrapper-textui" style="
                    margin: ${Settings.textui[defaultPosTextUI].startMargin};
                    border-color: ${item.data.color || 'transparent'};
                    ${defaultPosTextUI == "right" ? "right: 0;" : ''}
                    ${customCSS.background}
                ">
                    <div class="main">${item.data.message ? `<div class="message" style="${customCSS.message}">${formatColors(item.data.message)}</div>` : ''}</div>
                </div>
            `)

            $('#textui .text-key').attr('style', '');
            if (customCSS.key && customCSS.key != "") {
                $('#textui .text-key').attr('style', customCSS.key);
            }

            const classNameTextUI = `.wrapper-textui::before`;
            let ruleIndexTextUI = -1;
            for (let i = 0; i < styleSheet.cssRules.length; i++) {
                if (styleSheet.cssRules[i].selectorText === classNameTextUI) {
                    ruleIndexTextUI = i;
                    break;
                }
            }

            let beforeStyleTextUI = `${classNameTextUI} {
                content: "";
                position: absolute;
                top: 0rem;
                left: 9em;
                width: 15rem;
                height: 15rem;
                opacity: 0.2;
                z-index: 0;
                transform: translate(-120%, -60%);
                ${item.data.color ? `background: radial-gradient(${item.data.color} 10%, transparent 70%)` : ''};
                ${customCSS.background_glow};
            }`;
            if (ruleIndexTextUI !== -1) {
                styleSheet.deleteRule(ruleIndexTextUI);
            }
            styleSheet.insertRule(beforeStyleTextUI, styleSheet.cssRules.length);

            var sound = null;
            if (!item.data.soundNative && (item.data.soundVolume || Config.Default.TextUI.soundFile)) {
                sound = new Audio(`sounds/${item.data.soundFile || Config.Default.TextUI.soundFile}`);
                sound.volume = item.data.soundVolume ? Number(item.data.soundVolume) / 1000 : (Config.Default.TextUI.soundVolume / 1000);
                sound.play();
            }

            var animation = {
                targets: `.wrapper-textui`,
                duration: 250,
                easing: 'spring(1, 70, 100, 10)',
            }

            if (defaultPosTextUI == "bottom" || defaultPosTextUI == "top") {
                animation.translateY = Settings.textui[defaultPosTextUI].animeIn;
            } else {
                animation.translateX = Settings.textui[defaultPosTextUI].animeIn;
            }

            if (item?.settings?.marginHorizontal) {
                animation.translateX = item?.settings?.marginHorizontal;
                if (defaultPosTextUI == "bottom" || defaultPosTextUI == "top") $('.wrapper-textui').css('transform', `translateX(${item?.settings?.marginHorizontal}px)`)
            } else {
                if (getCache('textui.margin_horizontal')) animation.translateX = getCache('textui.margin_horizontal');
                if (defaultPosTextUI == "bottom" || defaultPosTextUI == "top") $('.wrapper-textui').css('transform', `translateX(${getCache('textui.margin_horizontal')}px)`)
            }
            
            if (item?.settings?.marginVertical) {
                animation.translateY = item?.settings?.marginVertical;
                if (defaultPosTextUI == "left" || defaultPosTextUI == "right") $('.wrapper-textui').css('transform', `translateY(${item?.settings?.marginVertical}px)`)
            } else {
                if (getCache('textui.margin_vertical')) animation.translateY = getCache('textui.margin_vertical');
                if (defaultPosTextUI == "left" || defaultPosTextUI == "right") $('.wrapper-textui').css('transform', `translateY(${getCache('textui.margin_vertical')}px)`)
            }
            
            anime(animation)
            break;
        case 'updateTextUI':
            if (!item.data) return;
            if (!item.data.message) return;

            $('#textui .message').html(formatColors(item.data.message))
            break;
        case 'closeTextUI':
            var animationOut = {
                targets: `.wrapper-textui`,
                duration: 250,
                easing: 'spring(1, 80, 100, 0)'
            }

            if (defaultPosTextUI == "bottom" || defaultPosTextUI == "top") {
                animationOut.translateY = Settings.textui[defaultPosTextUI].animeOut;
            } else {
                animationOut.translateX = Settings.textui[defaultPosTextUI].animeOut;
            }

            anime(animationOut)
            break;
    }
})

$(document).on('click', ".customization-menu > div > .options > div", function () {
    let newMenu = $(this).data('href');
    CustomizationMenu.UpdateSection(newMenu, this);
})

$(document).on('click', '.customization-menu > div > .settings #position > div > div', function () {
    $('.customization-menu > div > .settings #position > div > div').removeClass('selected');
    $(this).addClass('selected');

    if (CustomizationMenu.seletedOption == "textui") {
        let selectedPosition = $(this).data('position');
        if (selectedPosition == "bottom" || selectedPosition == "top") {
            $('input[data-type="textui-margin-horizontal"]').val(0)
            $('input[data-type="textui-margin-vertical"]').val(Settings.textui[selectedPosition].animeIn)
        } else {
            $('input[data-type="textui-margin-horizontal"]').val(Settings.textui[selectedPosition].animeIn)
            $('input[data-type="textui-margin-vertical"]').val(0)
        }
    }
});
