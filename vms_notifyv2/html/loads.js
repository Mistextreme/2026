const loadTranslation = () => {
    $('.customization-menu .title').text(translation.customization.title);
    $('.customization-menu .description').text(translation.customization.description);

    if (Config.ConifgurationMenu.Notifications?.Allow) $('.customization-menu > div > .options').append(`<div id="notification" data-href="notification">${translation.customization.types.notifications}</div>`);
    if (Config.ConifgurationMenu.TextUI?.Allow) $('.customization-menu > div > .options').append(`<div id="textui" data-href="textui">${translation.customization.types.textui}</div>`);

    styleSheet.insertRule(`
        .customization-menu>div>.settings>div>.manage>div#preview::before {
            content: "${translation.customization.notifications_settings.preview_btn}";
        }
    `, styleSheet.cssRules.length);

    styleSheet.insertRule(`
        .customization-menu>div>.settings>div>.manage>div#save::before {
            content: "${translation.customization.notifications_settings.save_btn}";
        }
    `, styleSheet.cssRules.length);
    
    styleSheet.insertRule(`
        .customization-menu>div>.settings>div>.manage>div#reset::before {
            content: "${translation.customization.notifications_settings.reset_btn}";
        }
    `, styleSheet.cssRules.length);
        
}

function formatColors(input) {
    if (!input || input == "") return input;
    
    const replacements = {
        // Visuals
        "~r~": '<span style="color: #f71134">',
        "~g~": '<span style="color: #11f747">',
        "~b~": '<span style="color: #11a7f7">',
        "~f~": '<span style="color: #0e8cd0">',
        "~y~": '<span style="color: #d9e101">',
        "~c~": '<span style="color: #686868">',
        "~t~": '<span style="color: #4f4f4f">',
        "~o~": '<span style="color: #f77511">',
        "~p~": '<span style="color: #7451ff">',
        "~q~": '<span style="color: #fa63ff">',
        "~m~": '<span style="color: #393939">',
        "~l~": '<span style="color: #0c0c0c">',
        "~d~": '<span style="color: #0043ed">',
        "~n~": '<br>',
        "~italic~": '<span style="font-style: italic;">',
        "~pulse~": '<span style="animation: pulse 1s infinite; display: inline-block;margin-inline:0.15em;">',
        "~bold~": '<span style="font-weight: 500">',
        "~extra-bold~": '<span style="font-weight: 700">',
        "~h~": '</span>',
        "~s~": '</span>',

        // Keys
        "~INPUT_ENTER_CHEAT_CODE~": '<span class="text-key">~</span>',                                        // ~
        "~INPUT_FRONTEND_PAUSE_ALTERNATE~": '<span class="text-key">ESC</span>',                              // ESC
        "~INPUT_REPLAY_TOGGLE_TIMELINE~": '<span class="text-key">ESC</span>',                                // ESC
        "~INPUT_REPLAY_START_STOP_RECORDING~": '<span class="text-key">F1</span>',                            // F1
        "~INPUT_REPLAY_START_STOP_RECORDING_SECONDARY~": '<span class="text-key">F2</span>',                  // F2
        "~INPUT_SAVE_REPLAY_CLIP~": '<span class="text-key">F3</span>',                                       // F3
        "~INPUT_SELECT_CHARACTER_MICHAEL~": '<span class="text-key">F5</span>',                               // F5
        "~INPUT_REPLAY_SAVE~": '<span class="text-key">F5</span>',                                            // F5
        "~INPUT_REPLAY_TIMELINE_SAVE~": '<span class="text-key">F5</span>',                                   // F5
        "~INPUT_SELECT_CHARACTER_FRANKLIN~": '<span class="text-key">F6</span>',                              // F6
        "~INPUT_SELECT_CHARACTER_MULTIPLAYER~": '<span class="text-key">F8</span>',                           // F8
        "~INPUT_DROP_WEAPON~": '<span class="text-key">F9</span>',                                            // F9
        "~INPUT_DROP_AMMO~": '<span class="text-key">F10</span>',                                             // F10
        "~INPUT_SWITCH_VISOR~": '<span class="text-key">F11</span>',                                          // F11
        "~INPUT_SELECT_WEAPON_UNARMED~": '<span class="text-key">1</span>',                                   // 1
        "~INPUT_SELECT_WEAPON_MELEE~": '<span class="text-key">2</span>',                                     // 2
        "~INPUT_SELECT_WEAPON_HANDGUN~": '<span class="text-key">3</span>',                                   // 3
        "~INPUT_SELECT_WEAPON_HEAVY~": '<span class="text-key">4</span>',                                     // 4
        "~INPUT_SELECT_WEAPON_SPECIAL~": '<span class="text-key">5</span>',                                   // 5
        "~INPUT_SELECT_WEAPON_HANDGUN~": '<span class="text-key">6</span>',                                   // 6
        "~INPUT_SELECT_WEAPON_SMG~": '<span class="text-key">7</span>',                                       // 7
        "~INPUT_SELECT_WEAPON_AUTO_RIFLE~": '<span class="text-key">8</span>',                                // 8
        "~INPUT_SELECT_WEAPON_SNIPER~": '<span class="text-key">9</span>',                                    // 9
        "~INPUT_VEH_PREV_RADIO_TRACK~": '<span class="text-key">-</span>',                                    // -
        "~INPUT_VEH_NEXT_RADIO_TRACK~": '<span class="text-key">=</span>',                                    // =
        "~INPUT_FRONTEND_RRIGHT~": '<span class="text-key">BACKSPACE</span>',                                 // BACKSPACE
        "~INPUT_FRONTEND_CANCEL~": '<span class="text-key">BACKSPACE</span>',                                 // BACKSPACE
        "~INPUT_CELLPHONE_CANCEL~": '<span class="text-key">BACKSPACE</span>',                                // BACKSPACE
        "~INPUT_SELECT_WEAPON~": '<span class="text-key">TAB</span>',                                         // TAB
        "~INPUT_FRONTEND_RUP~": '<span class="text-key">TAB</span>',                                          // TAB
        "~INPUT_FRONTEND_Y~": '<span class="text-key">TAB</span>',                                            // TAB
        "~INPUT_FRONTEND_LEADERBOARD~": '<span class="text-key">TAB</span>',                                  // TAB
        "~INPUT_REPLAY_SNAPMATIC_PHOTO~": '<span class="text-key">TAB</span>',                                // TAB
        "~INPUT_VEH_PUSHBIKE_SPRINT~": '<span class="text-key">CAPSLOCK</span>',                              // CAPSLOCK
        "~INPUT_SPECIAL_ABILITY_PC~": '<span class="text-key">CAPSLOCK</span>',                               // CAPSLOCK
        "~INPUT_FRONTEND_SELECT~": '<span class="text-key">CAPSLOCK</span>',                                  // CAPSLOCK
        "~INPUT_SPRINT~": '<span class="text-key">SHIFT</span>',                                              // LEFT SHIFT
        "~INPUT_VEH_MOVE_UP_ONLY~": '<span class="text-key">SHIFT</span>',                                    // LEFT SHIFT
        "~INPUT_VEH_SUB_ASCEND~": '<span class="text-key">SHIFT</span>',                                      // LEFT SHIFT
        "~INPUT_PARACHUTE_PRECISION_LANDING~": '<span class="text-key">SHIFT</span>',                         // LEFT SHIFT
        "~INPUT_FRONTEND_LS~": '<span class="text-key">SHIFT</span>',                                         // LEFT SHIFT
        "~INPUT_CREATOR_MENU_TOGGLE~": '<span class="text-key">SHIFT</span>',                                 // LEFT SHIFT
        "~INPUT_VEH_HYDRAULICS_CONTROL_UP~": '<span class="text-key">SHIFT</span>',                           // LEFT SHIFT
        "~INPUT_VEH_FLY_BOOST~": '<span class="text-key">SHIFT</span>',                                       // LEFT SHIFT
        "~INPUT_FRONTEND_RS~": '<span class="text-key">CONTROL</span>',                                       // LEFT CONTROL
        "~INPUT_CHARACTER_WHEEL~": '<span class="text-key">ALT</span>',                                       // LEFT ALT
        "~INPUT_REPLAY_PAUSE~": '<span class="text-key">SPACE</span>',                                        // SPACEBAR
        "~INPUT_REPLAY_PREVIEW~": '<span class="text-key">SPACE</span>',                                      // SPACEBAR
        "~INPUT_REPLAY_PREVIEW_AUDIO~": '<span class="text-key">SPACE</span>',                                // SPACEBAR
        "~INPUT_VEH_PARACHUTE~": '<span class="text-key">SPACE</span>',                                       // SPACEBAR
        "~INPUT_SKIP_CUTSCENE~": '<span class="text-key">SPACE</span>',                                       // SPACEBAR
        "~INPUT_JUMP~": '<span class="text-key">SPACE</span>',                                                // SPACEBAR
        "~INPUT_DIVE~": '<span class="text-key">SPACE</span>',                                                // SPACEBAR
        "~INPUT_VEH_HANDBRAKE~": '<span class="text-key">SPACE</span>',                                       // SPACEBAR
        "~INPUT_VEH_JUMP~": '<span class="text-key">SPACE</span>',                                            // SPACEBAR
        "~INPUT_MELEE_BLOCK~": '<span class="text-key">SPACE</span>',                                         // SPACEBAR
        "~INPUT_CELLPHONE_EXTRA_OPTION~": '<span class="text-key">SPACE</span>',                              // SPACEBAR
        "~INPUT_FRONTEND_RRIGHT~": '<span class="text-key">SPACE</span>',                                     // SPACEBAR
        "~INPUT_FRONTEND_X~": '<span class="text-key">SPACE</span>',                                          // SPACEBAR
        "~INPUT_FRONTEND_ENDSCREEN_EXPAND~": '<span class="text-key">SPACE</span>',                           // SPACEBAR
        "~INPUT_CREATOR_ACCEPT~": '<span class="text-key">SPACE</span>',                                      // SPACEBAR
        "~INPUT_PHONE~": '<span class="text-key"><i class="fa-solid fa-up-long"></i></span>',                 // ARROW UP
        "~INPUT_CELLPHONE_UP~": '<span class="text-key"><i class="fa-solid fa-up-long"></i></span>',          // ARROW UP
        "~INPUT_FRONTEND_UP~": '<span class="text-key"><i class="fa-solid fa-up-long"></i></span>',           // ARROW UP
        "~INPUT_REPLAY_FFWD~": '<span class="text-key"><i class="fa-solid fa-up-long"></i></span>',           // ARROW UP
        "~INPUT_CELLPHONE_LEFT~": '<span class="text-key"><i class="fa-solid fa-left-long"></i></span>',      // ARROW LEFT
        "~INPUT_FRONTEND_LEFT~": '<span class="text-key"><i class="fa-solid fa-left-long"></i></span>',       // ARROW LEFT
        "~INPUT_REPLAY_BACK~": '<span class="text-key"><i class="fa-solid fa-left-long"></i></span>',         // ARROW LEFT
        "~INPUT_CELLPHONE_RIGHT~": '<span class="text-key"><i class="fa-solid fa-right-long"></i></span>',    // ARROW RIGHT
        "~INPUT_REPLAY_ADVANCE~": '<span class="text-key"><i class="fa-solid fa-right-long"></i></span>',     // ARROW RIGHT
        "~INPUT_FRONTEND_RIGHT~": '<span class="text-key"><i class="fa-solid fa-right-long"></i></span>',     // ARROW RIGHT
        "~INPUT_CELLPHONE_DOWN~": '<span class="text-key"><i class="fa-solid fa-down-long"></i></span>',      // ARROW DOWN
        "~INPUT_FRONTEND_DOWN~": '<span class="text-key"><i class="fa-solid fa-down-long"></i></span>',       // ARROW DOWN
        "~INPUT_REPLAY_REWIND~": '<span class="text-key"><i class="fa-solid fa-down-long"></i></span>',       // ARROW DOWN
        "~INPUT_CELLPHONE_OPTION~": '<span class="text-key">DELETE</span>',                                   // DELETE
        "~INPUT_FRONTEND_DELETE~": '<span class="text-key">DELETE</span>',                                    // DELETE
        "~INPUT_CREATOR_DELETE~": '<span class="text-key">DELETE</span>',                                     // DELETE
        "~INPUT_REPLAY_MARKER_DELETE~": '<span class="text-key">DELETE</span>',                               // DELETE
        "~INPUT_REPLAY_CLIP_DELETE~": '<span class="text-key">DELETE</span>',                                 // DELETE
        "~INPUT_FRONTEND_RT~": '<span class="text-key">PG UP</span>',                                         // PAGE UP
        "~INPUT_REPLAY_CAMERAUP~": '<span class="text-key">PG UP</span>',                                     // PAGE UP
        "~INPUT_REPLAY_CAMERADOWN~": '<span class="text-key">PG DOWN</span>',                                 // PAGE DOWN
        "~INPUT_FRONTEND_LT~": '<span class="text-key">PG DOWN</span>',                                       // PAGE DOWN
        "~INPUT_FRONTEND_SOCIAL_CLUB~": '<span class="text-key">HOME</span>',                                 // HOME
        "~INPUT_FRONTEND_SOCIAL_CLUB_SECONDARY~": '<span class="text-key">HOME</span>',                       // HOME
        "~INPUT_VEH_FLY_ATTACK_CAMERA~": '<span class="text-key">INS</span>',                                 // INSERT
        "~INPUT_VEH_FLY_ROLL_LEFT_ONLY~": '<span class="text-key">NUM 4</span>',                              // NUMPAD 4
        "~INPUT_VEH_SUB_TURN_LEFT_ONLY~": '<span class="text-key">NUM 4</span>',                              // NUMPAD 4
        "~INPUT_VEH_FLY_PITCH_UD~": '<span class="text-key">NUM 5</span>',                                    // NUMPAD 5
        "~INPUT_VEH_FLY_PITCH_DOWN_ONLY~": '<span class="text-key">NUM 5</span>',                             // NUMPAD 5
        "~INPUT_VEH_SUB_PITCH_UD~": '<span class="text-key">NUM 5</span>',                                    // NUMPAD 5
        "~INPUT_VEH_SUB_PITCH_DOWN_ONLY~": '<span class="text-key">NUM 5</span>',                             // NUMPAD 5
        "~INPUT_VEH_FLY_ROLL_LR~": '<span class="text-key">NUM 6</span>',                                     // NUMPAD 6
        "~INPUT_VEH_FLY_ROLL_RIGHT_ONLY~": '<span class="text-key">NUM 6</span>',                             // NUMPAD 6
        "~INPUT_VEH_SUB_TURN_LR~": '<span class="text-key">NUM 6</span>',                                     // NUMPAD 6
        "~INPUT_VEH_SUB_TURN_RIGHT_ONLY~": '<span class="text-key">NUM 6</span>',                             // NUMPAD 6
        "~INPUT_VEH_FLY_SELECT_TARGET_LEFT~": '<span class="text-key">NUM 7</span>',                          // NUMPAD 7
        "~INPUT_VEH_FLY_PITCH_UP_ONLY~": '<span class="text-key">NUM 8</span>',                               // NUMPAD 8
        "~INPUT_VEH_SUB_PITCH_UP_ONLY~": '<span class="text-key">NUM 8</span>',                               // NUMPAD 8
        "~INPUT_VEH_FLY_SELECT_TARGET_RIGHT~": '<span class="text-key">NUM 9</span>',                         // NUMPAD 9
        "~INPUT_REPLAY_FOVINCREASE~": '<span class="text-key">NUM +</span>',                                  // NUMPAD +
        "~INPUT_REPLAY_FOVDECREASE~": '<span class="text-key">NUM -</span>',                                  // NUMPAD -
        "~INPUT_WEAPON_WHEEL_PREV~": '',                                                                  // SCROLLWHEEL UP
        "~INPUT_SELECT_PREV_WEAPON~": '',                                                                 // SCROLLWHEEL UP
        "~INPUT_VEH_CINEMATIC_UP_ONLY~": '',                                                              // SCROLLWHEEL UP
        "~INPUT_VEH_SELECT_NEXT_WEAPON~": '',                                                             // SCROLLWHEEL UP
        "~INPUT_VEH_FLY_SELECT_NEXT_WEAPON~": '',                                                         // SCROLLWHEEL UP
        "~INPUT_CELLPHONE_SCROLL_BACKWARD~": '',                                                          // SCROLLWHEEL UP
        "~INPUT_CURSOR_SCROLL_UP~": '',                                                                   // SCROLLWHEEL UP
        "~INPUT_PREV_WEAPON~": '',                                                                        // SCROLLWHEEL UP
        "~INPUT_WEAPON_WHEEL_NEXT~": '',                                                                  // SCROLLWHEEL DOWN
        "~INPUT_SELECT_NEXT_WEAPON~": '',                                                                 // SCROLLWHEEL DOWN
        "~INPUT_ACCURATE_AIM~": '',                                                                       // SCROLLWHEEL DOWN
        "~INPUT_VEH_CINEMATIC_DOWN_ONLY~": '',                                                            // SCROLLWHEEL DOWN
        "~INPUT_CELLPHONE_SCROLL_FORWARD~": '',                                                           // SCROLLWHEEL DOWN
        "~INPUT_FRONTEND_RIGHT_AXIS_Y~": '',                                                              // SCROLLWHEEL DOWN
        "~INPUT_CURSOR_SCROLL_DOWN~": '',                                                                 // SCROLLWHEEL DOWN
        "~INPUT_NEXT_WEAPON~": '',                                                                        // SCROLLWHEEL DOWN
        "~INPUT_VEH_SLOWMO_UD~": '',                                                                      // SCROLLWHEEL DOWN
        "~INPUT_VEH_SLOWMO_DOWN_ONLY~": '',                                                               // SCROLLWHEEL DOWN
        "~INPUT_ATTACK~": '',                                                                             // LEFT MOUSE BUTTON
        "~INPUT_VEH_ATTACK~": '',                                                                         // LEFT MOUSE BUTTON
        "~INPUT_VEH_PASSENGER_ATTACK~": '',                                                               // LEFT MOUSE BUTTON
        "~INPUT_VEH_MOUSE_CONTROL_OVERRIDE~": '',                                                         // LEFT MOUSE BUTTON
        "~INPUT_VEH_FLY_MOUSE_CONTROL_OVERRIDE~": '',                                                     // LEFT MOUSE BUTTON
        "~INPUT_VEH_SUB_MOUSE_CONTROL_OVERRIDE~": '',                                                     // LEFT MOUSE BUTTON
        "~INPUT_MELEE_ATTACK_ALTERNATE~": '',                                                             // LEFT MOUSE BUTTON
        "~INPUT_SCRIPT_RDOWN~": '',                                                                       // LEFT MOUSE BUTTON
        "~INPUT_SCRIPT_RT~": '',                                                                          // LEFT MOUSE BUTTON
        "~INPUT_CURSOR_ACCEPT~": '',                                                                      // LEFT MOUSE BUTTON
        "~INPUT_ATTACK2~": '',                                                                            // LEFT MOUSE BUTTON
        "~INPUT_VEH_DRIVE_LOOK~": '',                                                                     // LEFT MOUSE BUTTON
        "~INPUT_VEH_MELEE_LEFT~": '',                                                                     // LEFT MOUSE BUTTON
        "~INPUT_VEH_MELEE_RIGHT~": '',                                                                    // RIGHT MOUSE BUTTON
        "~INPUT_VEH_AIM~": '',                                                                            // RIGHT MOUSE BUTTON
        "~INPUT_VEH_ATTACK2~": '',                                                                        // RIGHT MOUSE BUTTON
        "~INPUT_VEH_PASSENGER_AIM~": '',                                                                  // RIGHT MOUSE BUTTON
        "~INPUT_VEH_FLY_ATTACK~": '',                                                                     // RIGHT MOUSE BUTTON
        "~INPUT_SCRIPT_RUP~": '',                                                                         // RIGHT MOUSE BUTTON
        "~INPUT_SCRIPT_RRIGHT~": '',                                                                      // RIGHT MOUSE BUTTON
        "~INPUT_CURSOR_CANCEL~": '',                                                                      // RIGHT MOUSE BUTTON
        "~INPUT_VEH_DRIVE_LOOK2~": '',                                                                    // RIGHT MOUSE BUTTON
        "~INPUT_VEH_FLY_ATTACK2~": '',                                                                    // RIGHT MOUSE BUTTON
        "~INPUT_VEH_MELEE_RIGHT~": '',                                                                    // RIGHT MOUSE BUTTON
        "~INPUT_COVER~": '<span class="text-key">Q</span>',                                                   // Q
        "~INPUT_CONTEXT_SECONDARY~": '<span class="text-key">Q</span>',                                       // Q
        "~INPUT_VEH_RADIO_WHEEL~": '<span class="text-key">Q</span>',                                         // Q
        "~INPUT_VEH_PUSHBIKE_FRONT_BRAKE~": '<span class="text-key">Q</span>',                                // Q
        "~INPUT_MELEE_ATTACK_HEAVY~": '<span class="text-key">Q</span>',                                      // Q
        "~INPUT_PARACHUTE_BRAKE_LEFT~": '<span class="text-key">Q</span>',                                    // Q
        "~INPUT_FRONTEND_LB~": '<span class="text-key">Q</span>',                                             // Q
        "~INPUT_MELEE_ATTACK2~": '<span class="text-key">Q</span>',                                           // Q
        "~INPUT_MOVE_UP_ONLY~": '<span class="text-key">W</span>',                                            // W
        "~INPUT_VEH_ACCELERATE~": '<span class="text-key">W</span>',                                          // W
        "~INPUT_VEH_HOTWIRE_LEFT~": '<span class="text-key">W</span>',                                        // W
        "~INPUT_VEH_FLY_THROTTLE_UP~": '<span class="text-key">W</span>',                                     // W
        "~INPUT_VEH_SUB_THROTTLE_UP~": '<span class="text-key">W</span>',                                     // W
        "~INPUT_VEH_PUSHBIKE_PEDAL~": '<span class="text-key">W</span>',                                      // W
        "~INPUT_PARACHUTE_PITCH_UP_ONLY~": '<span class="text-key">W</span>',                                 // W
        "~INPUT_SCRIPT_PAD_UP~": '<span class="text-key">W</span>',                                           // W
        "~INPUT_PICKUP~": '<span class="text-key">E</span>',                                                  // E
        "~INPUT_TALK~": '<span class="text-key">E</span>',                                                    // E
        "~INPUT_CONTEXT~": '<span class="text-key">E</span>',                                                 // E
        "~INPUT_WEAPON_SPECIAL_TWO~": '<span class="text-key">E</span>',                                      // E
        "~INPUT_VEH_HORN~": '<span class="text-key">E</span>',                                                // E
        "~INPUT_VEH_GRAPPLING_HOOK~": '<span class="text-key">E</span>',                                      // E
        "~INPUT_VEH_FLY_VERTICAL_FLIGHT_MODE~": '<span class="text-key">E</span>',                            // E
        "~INPUT_PARACHUTE_BRAKE_RIGHT~": '<span class="text-key">E</span>',                                   // E
        "~INPUT_CELLPHONE_CAMERA_SELFIE~": '<span class="text-key">E</span>',                                 // E
        "~INPUT_FRONTEND_RB~": '<span class="text-key">E</span>',                                             // E
        "~INPUT_VEH_CAR_JUMP~": '<span class="text-key">E</span>',                                            // E
        "~INPUT_VEH_ROCKET_BOOST~": '<span class="text-key">E</span>',                                        // E
        "~INPUT_VEH_FLY_BOMB_BAY~": '<span class="text-key">E</span>',                                        // E
        "~INPUT_VEH_FLY_COUNTER~": '<span class="text-key">E</span>',                                         // E
        "~INPUT_RELOAD~": '<span class="text-key">R</span>',                                                  // R
        "~INPUT_VEH_CIN_CAM~": '<span class="text-key">R</span>',                                             // R
        "~INPUT_MELEE_ATTACK_LIGHT~": '<span class="text-key">R</span>',                                      // R
        "~INPUT_CREATOR_LS~": '<span class="text-key">R</span>',                                              // R
        "~INPUT_MELEE_ATTACK1~": '<span class="text-key">R</span>',                                           // R
        "~INPUT_REPLAY_RESTART~": '<span class="text-key">R</span>',                                          // R
        "~INPUT_MP_TEXT_CHAT_ALL~": '<span class="text-key">T</span>',                                        // T
        "~INPUT_REPLAY_TOOLS~": '<span class="text-key">T</span>',                                            // T
        "~INPUT_MP_TEXT_CHAT_TEAM~": '<span class="text-key">Y</span>',                                       // Y
        "~INPUT_REPLAY_SCREENSHOT~": '<span class="text-key">U</span>',                                       // U
        "~INPUT_FRONTEND_PAUSE~": '<span class="text-key">P</span>',                                          // P
        "~INPUT_VEH_MOVE_LEFT_ONLY~": '<span class="text-key">A</span>',                                      // A
        "~INPUT_VEH_FLY_YAW_LEFT~": '<span class="text-key">A</span>',                                        // A
        "~INPUT_VEH_SUB_TURN_HARD_LEFT~": '<span class="text-key">A</span>',                                  // A
        "~INPUT_PARACHUTE_TURN_LEFT_ONLY~": '<span class="text-key">A</span>',                                // A
        "~INPUT_VEH_HYDRAULICS_CONTROL_LEFT~": '<span class="text-key">A</span>',                             // A
        "~INPUT_MOVE_LEFT_ONLY~": '<span class="text-key">A</span>',                                          // A
        "~INPUT_SCRIPT_PAD_LEFT~": '<span class="text-key">A</span>',                                         // A
        "~INPUT_SCRIPTED_FLY_UD~": '<span class="text-key">S</span>',                                         // S
        "~INPUT_MOVE_UD~": '<span class="text-key">S</span>',                                                 // S
        "~INPUT_MOVE_DOWN_ONLY~": '<span class="text-key">S</span>',                                          // S
        "~INPUT_VEH_BRAKE~": '<span class="text-key">S</span>',                                               // S
        "~INPUT_VEH_HOTWIRE_RIGHT~": '<span class="text-key">S</span>',                                       // S
        "~INPUT_VEH_FLY_THROTTLE_DOWN~": '<span class="text-key">S</span>',                                   // S
        "~INPUT_VEH_SUB_THROTTLE_DOWN~": '<span class="text-key">S</span>',                                   // S
        "~INPUT_VEH_PUSHBIKE_REAR_BRAKE~": '<span class="text-key">S</span>',                                 // S
        "~INPUT_PARACHUTE_PITCH_UD~": '<span class="text-key">S</span>',                                      // S
        "~INPUT_PARACHUTE_PITCH_DOWN_ONLY~": '<span class="text-key">S</span>',                               // S
        "~INPUT_FRONTEND_AXIS_Y~": '<span class="text-key">S</span>',                                         // S
        "~INPUT_SCRIPT_LEFT_AXIS_Y~": '<span class="text-key">S</span>',                                      // S
        "~INPUT_SCRIPT_PAD_DOWN~": '<span class="text-key">S</span>',                                         // S
        "~INPUT_MOVE_UP~": '<span class="text-key">S</span>',                                                 // S
        "~INPUT_MOVE_DOWN~": '<span class="text-key">S</span>',                                               // S
        "~INPUT_REPLAY_RECORD~": '<span class="text-key">S</span>',                                           // S
        "~INPUT_SCRIPTED_FLY_LR~": '<span class="text-key">D</span>',                                         // D
        "~INPUT_MOVE_LR~": '<span class="text-key">D</span>',                                                 // D
        "~INPUT_MOVE_RIGHT_ONLY~": '<span class="text-key">D</span>',                                         // D
        "~INPUT_VEH_MOVE_LR~": '<span class="text-key">D</span>',                                             // D
        "~INPUT_VEH_MOVE_RIGHT_ONLY~": '<span class="text-key">D</span>',                                     // D
        "~INPUT_VEH_FLY_YAW_RIGHT~": '<span class="text-key">D</span>',                                       // D
        "~INPUT_VEH_SUB_TURN_HARD_RIGHT~": '<span class="text-key">D</span>',                                 // D
        "~INPUT_PARACHUTE_TURN_LR~": '<span class="text-key">D</span>',                                       // D
        "~INPUT_PARACHUTE_TURN_RIGHT_ONLY~": '<span class="text-key">D</span>',                               // D
        "~INPUT_FRONTEND_AXIS_X~": '<span class="text-key">D</span>',                                         // D
        "~INPUT_SCRIPT_LEFT_AXIS_X~": '<span class="text-key">D</span>',                                      // D
        "~INPUT_SCRIPT_PAD_RIGHT~": '<span class="text-key">D</span>',                                        // D
        "~INPUT_MOVE_LEFT~": '<span class="text-key">D</span>',                                               // D
        "~INPUT_MOVE_RIGHT~": '<span class="text-key">D</span>',                                              // D
        "~INPUT_VEH_MOVE_LEFT~": '<span class="text-key">D</span>',                                           // D
        "~INPUT_VEH_MOVE_RIGHT~": '<span class="text-key">D</span>',                                          // D
        "~INPUT_VEH_HYDRAULICS_CONTROL_RIGHT~": '<span class="text-key">D</span>',                            // D
        "~INPUT_VEH_HYDRAULICS_CONTROL_UD~": '<span class="text-key">D</span>',                               // D
        "~INPUT_ENTER~": '<span class="text-key">F</span>',                                                   // F
        "~INPUT_ARREST~": '<span class="text-key">F</span>',                                                  // F
        "~INPUT_VEH_EXIT~": '<span class="text-key">F</span>',                                                // F
        "~INPUT_PARACHUTE_DETACH~": '<span class="text-key">F</span>',                                        // F
        "~INPUT_CELLPHONE_CAMERA_DOF~": '<span class="text-key">F</span>',                                    // F
        "~INPUT_CREATOR_RS~": '<span class="text-key">F</span>',                                              // F
        "~INPUT_PARACHUTE_DEPLOY~": '<span class="text-key">F</span>',                                        // F
        "~INPUT_DETONATE~": '<span class="text-key">G</span>',                                                // G
        "~INPUT_THROW_GRENADE~": '<span class="text-key">G</span>',                                           // G
        "~INPUT_VEH_FLY_UNDERCARRIAGE~": '<span class="text-key">G</span>',                                   // G
        "~INPUT_CELLPHONE_CAMERA_GRID~": '<span class="text-key">G</span>',                                   // G
        "~INPUT_VEH_HEADLIGHT~": '<span class="text-key">H</span>',                                           // H
        "~INPUT_VEH_ROOF~": '<span class="text-key">H</span>',                                                // H
        "~INPUT_VEH_SHUFFLE~": '<span class="text-key">H</span>',                                             // H
        "~INPUT_REPLAY_HIDEHUD~": '<span class="text-key">H</span>',                                          // H
        "~INPUT_REPLAY_SHOWHOTKEY~": '<span class="text-key">L</span>',                                       // L
        "~INPUT_CELLPHONE_CAMERA_FOCUS_LOCK~": '<span class="text-key">L</span>',                             // L
        "~INPUT_MULTIPLAYER_INFO~": '<span class="text-key">Z</span>',                                        // Z
        "~INPUT_HUD_SPECIAL~": '<span class="text-key">Z</span>',                                             // Z
        "~INPUT_VEH_DUCK~": '<span class="text-key">X</span>',                                                // X
        "~INPUT_VEH_DROP_PROJECTILE~": '<span class="text-key">X</span>',                                     // X
        "~INPUT_VEH_FLY_DUCK~": '<span class="text-key">X</span>',                                            // X
        "~INPUT_PARACHUTE_SMOKE~": '<span class="text-key">X</span>',                                         // X
        "~INPUT_CELLPHONE_CAMERA_EXPRESSION~": '<span class="text-key">X</span>',                             // X
        "~INPUT_CREATOR_LT~": '<span class="text-key">X</span>',                                              // X
        "~INPUT_REPLAY_TIMELINE_PICKUP_CLIP~": '<span class="text-key">X</span>',                             // X
        "~INPUT_VEH_HYDRAULICS_CONTROL_TOGGLE~": '<span class="text-key">X</span>',                           // X
        "~INPUT_VEH_MELEE_HOLD~": '<span class="text-key">X</span>',                                          // X
        "~INPUT_VEH_BIKE_WINGS~": '<span class="text-key">X</span>',                                          // X
        "~INPUT_VEH_TRANSFORM~": '<span class="text-key">X</span>',                                           // X
        "~INPUT_LOOK_BEHIND~": '<span class="text-key">C</span>',                                             // C
        "~INPUT_VEH_LOOK_BEHIND~": '<span class="text-key">C</span>',                                         // C
        "~INPUT_CREATOR_RT~": '<span class="text-key">C</span>',                                              // C
        "~INPUT_REPLAY_TOGGLETIME~": '<span class="text-key">C</span>',                                       // C
        "~INPUT_REPLAY_TIMELINE_DUPLICATE_CLIP~": '<span class="text-key">C</span>',                          // C
        "~INPUT_NEXT_CAMERA~": '<span class="text-key">V</span>',                                             // V
        "~INPUT_SCRIPT_SELECT~": '<span class="text-key">V</span>',                                           // V
        "~INPUT_REPLAY_TOGGLETIPS~": '<span class="text-key">V</span>',                                       // V
        "~INPUT_REPLAY_TIMELINE_PLACE_CLIP~": '<span class="text-key">V</span>',                              // V
        "~INPUT_SPECIAL_ABILITY_SECONDARY~": '<span class="text-key">B</span>',                               // B
        "~INPUT_REPLAY_STARTPOINT~": '<span class="text-key">B</span>',                                       // B
        "~INPUT_PUSH_TO_TALK~": '<span class="text-key">N</span>',                                            // N
        "~INPUT_REPLAY_ENDPOINT~": '<span class="text-key">N</span>',                                         // N
        "~INPUT_INTERACTION_MENU~": '<span class="text-key">M</span>',                                        // M
        "~INPUT_REPLAY_NEWMARKER~": '<span class="text-key">M</span>',                                        // M
        "~INPUT_VEH_PREV_RADIO~": '<span class="text-key">,</span>',                                          // ,
        "~INPUT_VEH_NEXT_RADIO~": '<span class="text-key">.</span>',                                          // .
        "~INPUT_SNIPER_ZOOM~": '<span class="text-key">[</span>',                                             // [
        "~INPUT_SNIPER_ZOOM_OUT_ONLY~": '<span class="text-key">[</span>',                                    // [
        "~INPUT_SNIPER_ZOOM_OUT_SECONDARY~": '<span class="text-key">[</span>',                               // [
        "~INPUT_VEH_SELECT_PREV_WEAPON~": '<span class="text-key">[</span>',                                  // [
        "~INPUT_VEH_FLY_SELECT_PREV_WEAPON~": '<span class="text-key">[</span>',                              // [
        "~INPUT_SNIPER_ZOOM_IN~": '<span class="text-key">[</span>',                                          // [
        "~INPUT_SNIPER_ZOOM_OUT~": '<span class="text-key">[</span>',                                         // [
        "~INPUT_SNIPER_ZOOM_IN_ALTERNATE~": '<span class="text-key">[</span>',                                // [
        "~INPUT_SNIPER_ZOOM_OUT_ALTERNATE~": '<span class="text-key">[</span>',                               // [
        "~INPUT_REPLAY_CYCLEMARKERLEFT~": '<span class="text-key">[</span>',                                  // [
        "~INPUT_SNIPER_ZOOM_IN_ONLY~": '<span class="text-key">]</span>',                                     // ]
        "~INPUT_SNIPER_ZOOM_IN_SECONDARY~": '<span class="text-key">]</span>',                                // ]
        "~INPUT_FRONTEND_RIGHT_AXIS_X~": '<span class="text-key">]</span>',                                   // ]
        "~INPUT_REPLAY_CYCLEMARKERRIGHT~": '<span class="text-key">]</span>',                                 // ]
    }

    const regex = new RegExp(Object.keys(replacements).join('|'), 'g');
    return input.replace(regex, match => replacements[match] || match);        
}

const getCache = function(name) {
    return localStorage.getItem(name)
}

const saveCache = function(name, value) {
    if (value == "EMPTY_VALUE") return localStorage.removeItem(name);
    localStorage.setItem(name, value);
}


const CustomizationMenu = {
    canUseAgain: true,
    seletedOption: null,

    notificationId: null,
    
    Open: function() {
        currentMenu = 'customization';
        this.canUseAgain = true;
        $('.customization-menu').css('display', 'flex');
        $('.customization-menu > div').fadeIn(120);

        if (!this.seletedOption) {
            if (Config.ConifgurationMenu.Notifications.Allow) {
                this.UpdateSection('notification', `.customization-menu > div > .options > div#notification`)
            } else if (Config.ConifgurationMenu.TextUI.Allow) {
                this.UpdateSection('textui', `.customization-menu > div > .options > div#textui`)
            }
        }
        
    },

    Close: function() {
        $('.customization-menu, .customization-menu > div').fadeOut(120);
    },

    UpdateSection: function(name, _this) {
        if (!this.canUseAgain) return;

        if (name == this.seletedOption) return;
        if (this.seletedOption) $('.customization-menu > div > .options > div').removeClass("selected");

        this.canUseAgain = false;

        $(_this).addClass("selected");
        this.seletedOption = name
        this.UpdateSettings();
    },

    UpdateSettings: function() {
        $('.customization-menu > div > .settings').addClass('hideSection');
        setTimeout(() => {
            $('.customization-menu > div > .settings').fadeOut(50);
            
            setTimeout(() => {
                $('.customization-menu > div > .settings').removeClass('hideSection');

                const soundsList = [];
                const stylesList = [];
                
                let sectionData = `<div data-type="${this.seletedOption}">`
                if (this.seletedOption == 'notification') {
                    for (const [id, style] of Object.entries(Config.ConifgurationMenu.Notifications.AvailableSounds)) {
                        soundsList.push(
                            {
                                "id": id,
                                "text": style.label,
                                "name": style.name,
                                "selected": getCache('notification.sound') == style.name,
                            }
                        )
                    }

                    for (const [id, style] of Object.entries(Config.ConifgurationMenu.Notifications.AvailableStyles)) {
                        stylesList.push(
                            {
                                "id": id,
                                "text": style.label,
                                "name": style.name,
                                "selected": getCache('notification.style') == style.name,
                            }
                        )
                    }

                    $('.customization-menu > div > .settings #position > div > div').removeClass('selected');
                    
                    sectionData += `
                        <div class="data">
                            ${Config.ConifgurationMenu.Notifications?.AllowChangePosition ? `
                                <div id="position">
                                    <p class="label"><i class="fa-solid fa-left-right" style="font-size: 1em;"></i> ${translation.customization.notifications_settings.position_label}</p>
                                    <p class="description">${translation.customization.notifications_settings.position_description}</p>
                                    <div>
                                        <div data-position="left" ${getCache('notification.position') && (getCache('notification.position') == 'left' && 'class="selected"') || !getCache('notification.position') && (Config.Default.TextUI.defaultPosition == 'left' && 'class="selected"') || ''}>${translation.customization.notifications_settings.positions.left}</div>
                                        <div data-position="right" ${getCache('notification.position') && (getCache('notification.position') == 'right' && 'class="selected"') || !getCache('notification.position') && (Config.Default.TextUI.defaultPosition == 'right' && 'class="selected"') || ''}>${translation.customization.notifications_settings.positions.right}</div>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.Notifications?.AllowChangeSound ? `
                                <div id="sound">
                                    <p class="label"><i class="fa-solid fa-music" style="font-size: 0.8em;"></i> ${translation.customization.notifications_settings.sounds_label}</p>
                                    <p class="description">${translation.customization.notifications_settings.sounds_description}</p>
                                    <div>
                                        <select></select>
                                    </div>
                                </div>
                                ${!Config.ConifgurationMenu.Notifications?.AllowChangeSoundVolume ? `<hr>` : ''}
                            ` : ''}
                            ${Config.ConifgurationMenu.Notifications?.AllowChangeSoundVolume ? `
                                <div id="sound-volume">
                                    <p class="label"><i class="fa-solid fa-volume-low" style="font-size: 1em;"></i> ${translation.customization.notifications_settings.sounds_volume_label}</p>
                                    <p class="description">${translation.customization.notifications_settings.sounds_volume_description}</p>
                                    <div class="slider">
                                        <p>0%</p>
                                        <input data-type="notification-sound-volume" type="range" min="0" max="100" value="${getCache('notification.sound_volume') || Config.Default.Notifications.soundVolume}">
                                        <p>100%</p>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.Notifications?.AllowChangeStyle ? `
                                <div id="style">
                                    <p class="label"><i class="fa-solid fa-layer-group" style="font-size: 0.85em;"></i> ${translation.customization.notifications_settings.styles_label}</p>
                                    <p class="description">${translation.customization.notifications_settings.styles_description}</p>
                                    <div>
                                        <select></select>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.Notifications?.AllowChangeMargin ? `
                                <div id="margin">
                                    <p class="label"><i class="fa-solid fa-up-down" style="font-size: 0.85em;"></i> ${translation.customization.notifications_settings.margin_label}</p>
                                    <p class="description">${translation.customization.notifications_settings.margin_description}</p>
                                    <div class="slider">
                                        <p>-200px</p>
                                        <input data-type="notification-margin" type="range" min="-200" max="1000" value="${getCache('notification.margin') || 0}">
                                        <p>1000px</p>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.Notifications?.AllowChangeSize ? `
                                <div id="size">
                                    <p class="label"><i class="fa-solid fa-maximize" style="font-size: 0.85em;"></i> ${translation.customization.notifications_settings.size_label}</p>
                                    <p class="description">${translation.customization.notifications_settings.size_description}</p>
                                    <div class="slider">
                                        <p>1.0</p>
                                        <input data-type="notification-size" type="range" min="10" max="20" value="${getCache('notification.size') && (getCache('notification.size') * 10) || 10}">
                                        <p>2.0</p>
                                    </div>
                                </div>
                            ` : ''}
                            <div style="height: 6em"></div>
                        </div>
                    `

                } else if (this.seletedOption == 'textui') {
                    let screenHeight = window.screen.availHeight
                    let screenWidth = window.screen.availWidth

                    for (const [id, style] of Object.entries(Config.ConifgurationMenu.TextUI.AvailableSounds)) {
                        soundsList.push(
                            {
                                "id": id,
                                "text": style.label,
                                "name": style.name,
                                "selected": getCache('textui.sound') == style.name,
                            }
                        )
                    }
                    
                    for (const [id, style] of Object.entries(Config.ConifgurationMenu.TextUI.AvailableStyles)) {
                        stylesList.push(
                            {
                                "id": id,
                                "text": style.label,
                                "name": style.name,
                                "selected": getCache('textui.style') == style.name,
                            }
                        )
                    }
                    
                    $('.customization-menu > div > .settings #position > div > div').removeClass('selected');

                    sectionData += `
                        <div class="data">
                            ${Config.ConifgurationMenu.TextUI?.AllowChangePosition ? `
                                <div id="position">
                                    <p class="label"><i class="fa-solid fa-left-right" style="font-size: 1em;"></i> ${translation.customization.textui_settings.position_label}</p>
                                    <p class="description">${translation.customization.textui_settings.position_description}</p>
                                    <div>
                                        <div data-position="left" ${getCache('textui.position') && (getCache('textui.position') == 'left' && 'class="selected"') || !getCache('textui.position') && (Config.Default.TextUI.defaultPosition == 'left' && 'class="selected"') || ''}>${translation.customization.textui_settings.positions.left}</div>
                                        <div data-position="right" ${getCache('textui.position') && (getCache('textui.position') == 'right' && 'class="selected"') || !getCache('textui.position') && (Config.Default.TextUI.defaultPosition == 'right' && 'class="selected"') || ''}>${translation.customization.textui_settings.positions.right}</div>
                                        <div data-position="top" ${getCache('textui.position') && (getCache('textui.position') == 'top' && 'class="selected"') || !getCache('textui.position') && (Config.Default.TextUI.defaultPosition == 'top' && 'class="selected"') || ''}>${translation.customization.textui_settings.positions.top}</div>
                                        <div data-position="bottom" ${getCache('textui.position') && (getCache('textui.position') == 'bottom' && 'class="selected"') || !getCache('textui.position') && (Config.Default.TextUI.defaultPosition == 'bottom' && 'class="selected"') || ''}>${translation.customization.textui_settings.positions.bottom}</div>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.TextUI?.AllowChangeSound ? `
                                <div id="sound">
                                    <p class="label"><i class="fa-solid fa-music" style="font-size: 0.8em;"></i> ${translation.customization.textui_settings.sounds_label}</p>
                                    <p class="description">${translation.customization.textui_settings.sounds_description}</p>
                                    <div>
                                        <select></select>
                                    </div>
                                </div>
                                ${!Config.ConifgurationMenu.TextUI?.AllowChangeSoundVolume ? `<hr>` : ''}
                            ` : ''}
                            ${Config.ConifgurationMenu.TextUI?.AllowChangeSoundVolume ? `
                                <div id="sound-volume">
                                    <p class="label"><i class="fa-solid fa-volume-low" style="font-size: 1em;"></i> ${translation.customization.textui_settings.sounds_volume_label}</p>
                                    <p class="description">${translation.customization.textui_settings.sounds_volume_description}</p>
                                    <div class="slider">
                                        <p>0%</p>
                                        <input data-type="textui-sound-volume" type="range" min="0" max="100" value="${getCache('textui.sound_volume') || Config.Default.TextUI.soundVolume}">
                                        <p>100%</p>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.TextUI?.AllowChangeStyle ? `
                                <div id="style">
                                    <p class="label"><i class="fa-solid fa-layer-group" style="font-size: 0.85em;"></i> ${translation.customization.textui_settings.styles_label}</p>
                                    <p class="description">${translation.customization.textui_settings.styles_description}</p>
                                    <div>
                                        <select></select>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.TextUI?.AllowChangeMarginHorizontal ? `
                                <div id="margin-horizontal">
                                    <p class="label"><i class="fa-solid fa-left-right" style="font-size: 1em;"></i> ${translation.customization.textui_settings.margin_horizontal_label}</p>
                                    <p class="description">${translation.customization.textui_settings.margin_horizontal_description}</p>
                                    <div class="slider">
                                        <p>-${screenWidth/2}px</p>
                                        <input data-type="textui-margin-horizontal" type="range" min="-${screenWidth/2}" max="${screenWidth/2}" value="${getCache('textui.margin_horizontal') || ((defaultPosTextUI == "left" || defaultPosTextUI == "right") && Settings.textui[defaultPosTextUI].animeIn || 0)}">
                                        <p>${screenWidth/2}px</p>
                                    </div>
                                </div>
                                ${!Config.ConifgurationMenu.TextUI?.AllowChangeMarginVertical ? `<hr>` : ''}
                            ` : ''}
                            ${Config.ConifgurationMenu.TextUI?.AllowChangeMarginVertical ? `
                                <div id="margin-vertical">
                                    <p class="label"><i class="fa-solid fa-up-down" style="font-size: 0.85em;"></i> ${translation.customization.textui_settings.margin_vertical_label}</p>
                                    <p class="description">${translation.customization.textui_settings.margin_vertical_description}</p>
                                    <div class="slider">
                                        <p>-${screenHeight/2}px</p>
                                        <input data-type="textui-margin-vertical" type="range" min="-${screenHeight/2}" max="${screenHeight/2}" value="${getCache('textui.margin_vertical') || ((defaultPosTextUI == "bottom" || defaultPosTextUI == "top") && Settings.textui[defaultPosTextUI].animeIn || 0)}">
                                        <p>${screenHeight/2}px</p>
                                    </div>
                                </div>
                                <hr>
                            ` : ''}
                            ${Config.ConifgurationMenu.TextUI?.AllowChangeSize ? `
                                <div id="size">
                                    <p class="label"><i class="fa-solid fa-maximize" style="font-size: 0.85em;"></i> ${translation.customization.textui_settings.size_label}</p>
                                    <p class="description">${translation.customization.textui_settings.size_description}</p>
                                    <div class="slider">
                                        <p>1.0</p>
                                        <input data-type="textui-size" type="range" min="10" max="20" value="${getCache('textui.size') && (getCache('textui.size') * 10) || 10}">
                                        <p>2.0</p>
                                    </div>
                                </div>
                            ` : ''}
                            <div style="height: 6em"></div>
                        </div>
                    `
                }

                sectionData += `
                        <div class="manage">
                            <div id="preview" onclick="CustomizationMenu.Preview('${this.seletedOption}')">
                                <i class="fa-solid fa-eye"></i>
                            </div>
                            <div id="save" onclick="CustomizationMenu.Save('${this.seletedOption}')">
                                <i class="fa-solid fa-floppy-disk"></i>
                            </div>
                            <div id="reset" onclick="CustomizationMenu.Reset('${this.seletedOption}')">
                                <i class="fa-solid fa-trash-can"></i>
                            </div>
                        </div>
                    </div>
                `

                $('.customization-menu > div > .settings').html(sectionData).addClass('showSection');
                
                setTimeout(() => {
                    $('.customization-menu > div > .settings').show();
                    
                    $(`.customization-menu > div > .settings > div > .data > #sound select`).select2({
                        minimumResultsForSearch: Infinity,
                        allowClear: false,
                        data: soundsList
                    });
                    
                    $(`.customization-menu > div > .settings > div > .data > #style select`).select2({
                        minimumResultsForSearch: Infinity,
                        allowClear: false,
                        data: stylesList
                    });
                }, 20)
                setTimeout(() => {
                    $('.customization-menu > div > .settings').removeClass('showSection');
                    this.canUseAgain = true;
                }, 300)
            }, 150);
        }, 200);
    },

    Preview: function(type) {
        if (type == "notification") {
            if (this.notificationId) $(`.notification.wrapper-${this.notificationId}`).remove();
            this.notificationId = Math.floor((Math.random() * 1000) + 1);
    
            let sound = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#sound select').select2('data')[0];
            let soundVolume = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#sound-volume input').val();
            let style = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#style select').select2('data')[0];
            let margin = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#margin input').val();
            let size = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#size input').val() / 10;
            let position = $('.customization-menu > div > .settings #position > div > .selected')?.data('position');
            
            $.post(`https://${GetParentResourceName()}/previewNotification`, JSON.stringify({
                id: this.notificationId,
                position: position,
                sound: sound && sound.name || null,
                soundVolume: soundVolume,
                style: style && style.name || null,
                margin: margin,
                size: size,
            }));
        }

        if (type == "textui") {
            $(`.textui > #textui`).remove();
            
            let sound = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#sound select').select2('data')[0];
            let soundVolume = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#sound-volume input').val();
            let style = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#style select').select2('data')[0];
            let marginHorizontal = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#margin-horizontal input').val();
            let marginVertical = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#margin-vertical input').val();
            let size = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#size input').val() / 10;
            let position = $('.customization-menu > div > .settings #position > div > .selected')?.data('position');
            
            $.post(`https://${GetParentResourceName()}/previewTextUI`, JSON.stringify({
                position: position,
                sound: sound && sound.name || null,
                soundVolume: soundVolume,
                style: style && style.name || null,
                marginHorizontal: marginHorizontal,
                marginVertical: marginVertical,
                size: size,
            }));
        }

    },
    
    Reset: function(type) {
        if (type == "notification") {
            saveCache('notification.position', "EMPTY_VALUE");
            saveCache('notification.sound', "EMPTY_VALUE");
            saveCache('notification.sound_volume', "EMPTY_VALUE");
            saveCache('notification.style', "EMPTY_VALUE");
            saveCache('notification.margin', "EMPTY_VALUE");
            saveCache('notification.size', "EMPTY_VALUE");

            $.post(`https://${GetParentResourceName()}/updatedCache`, JSON.stringify({
                'notification.position': getCache('notification.position') || "EMPTY_VALUE",
                'notification.sound': getCache('notification.sound') || "EMPTY_VALUE",
                'notification.sound_volume': getCache('notification.sound_volume') || "EMPTY_VALUE",
                'notification.style': getCache('notification.style') || "EMPTY_VALUE",
                'notification.margin': getCache('notification.margin') || "EMPTY_VALUE",
                'notification.size': getCache('notification.size') || "EMPTY_VALUE",
            }));
        }

        if (type == "textui") {
            saveCache('textui.position', "EMPTY_VALUE");
            saveCache('textui.sound', "EMPTY_VALUE");
            saveCache('textui.sound_volume', "EMPTY_VALUE");
            saveCache('textui.style', "EMPTY_VALUE");
            saveCache('textui.margin_horizontal', "EMPTY_VALUE");
            saveCache('textui.margin_vertical', "EMPTY_VALUE");
            saveCache('textui.size', "EMPTY_VALUE");

            $.post(`https://${GetParentResourceName()}/updatedCache`, JSON.stringify({
                'textui.position': getCache('textui.position') || "EMPTY_VALUE",
                'textui.sound': getCache('textui.sound') || "EMPTY_VALUE",
                'textui.sound_volume': getCache('textui.sound_volume') || "EMPTY_VALUE",
                'textui.style': getCache('textui.style') || "EMPTY_VALUE",
                'textui.margin_horizontal': getCache('textui.margin_horizontal') || "EMPTY_VALUE",
                'textui.margin_vertical': getCache('textui.margin_vertical') || "EMPTY_VALUE",
                'textui.size': getCache('textui.size') || "EMPTY_VALUE",
            }));
        }
        
        this.UpdateSettings();
    },

    Save: function(type) {
        if (type == "notification") {
            let position = $('.customization-menu > div > .settings #position > div > .selected')?.data('position');
            let sound = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#sound select').select2('data')[0];
            let soundVolume = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#sound-volume input').val();
            let style = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#style select').select2('data')[0];
            let margin = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#margin input').val();
            let size = $('.customization-menu>div>.settings>div[data-type="notification"]>.data>#size input').val() / 10;

            saveCache('notification.position', position);
            saveCache('notification.sound', sound.name);
            saveCache('notification.sound_volume', soundVolume);
            saveCache('notification.style', style.name);
            saveCache('notification.margin', margin);
            saveCache('notification.size', size);

            $.post(`https://${GetParentResourceName()}/updatedCache`, JSON.stringify({
                'notification.position': getCache('notification.position') || "EMPTY_VALUE",
                'notification.sound': getCache('notification.sound') || "EMPTY_VALUE",
                'notification.sound_volume': getCache('notification.sound_volume') || "EMPTY_VALUE",
                'notification.style': getCache('notification.style') || "EMPTY_VALUE",
                'notification.margin': getCache('notification.margin') || "EMPTY_VALUE",
                'notification.size': getCache('notification.size') || "EMPTY_VALUE",
            }));
        }

        if (type == "textui") {
            let position = $('.customization-menu > div > .settings #position > div > .selected')?.data('position');
            let sound = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#sound select').select2('data')[0];
            let soundVolume = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#sound-volume input').val();
            let style = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#style select').select2('data')[0];
            let marginHorizontal = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#margin-horizontal input').val();
            let marginVertical = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#margin-vertical input').val();
            let size = $('.customization-menu>div>.settings>div[data-type="textui"]>.data>#size input').val() / 10;
            
            saveCache('textui.position', position);
            saveCache('textui.sound', sound.name);
            saveCache('textui.sound_volume', soundVolume);
            saveCache('textui.style', style.name);
            saveCache('textui.margin_horizontal', marginHorizontal);
            saveCache('textui.margin_vertical', marginVertical);
            saveCache('textui.size', size);

            $.post(`https://${GetParentResourceName()}/updatedCache`, JSON.stringify({
                'textui.position': getCache('textui.position') || "EMPTY_VALUE",
                'textui.sound': getCache('textui.sound') || "EMPTY_VALUE",
                'textui.sound_volume': getCache('textui.sound_volume') || "EMPTY_VALUE",
                'textui.style': getCache('textui.style') || "EMPTY_VALUE",
                'textui.margin_horizontal': getCache('textui.margin_horizontal') || "EMPTY_VALUE",
                'textui.margin_vertical': getCache('textui.margin_vertical') || "EMPTY_VALUE",
                'textui.size': getCache('textui.size') || "EMPTY_VALUE",
            }));
        }

    },

}