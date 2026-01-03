-- 有关文本格式，请参阅：https://docs.fivem.net/docs/game-references/text-formatting/
-- 有关按键绑定，请参阅：https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
-- 有关控制代码，请参阅：https://docs.fivem.net/docs/game-references/controls/

config = {
  version = 8, -- 配置版本。请勿更改。
  general = {
    tick_delay = 500, -- 更新间隔时间（毫秒）（默认：500，不影响其他 tick_delay 选项）
    chat_messages = false, -- 使用聊天消息而不是小地图上方的通知（默认：false）
    chat_prefix = "[^1r^0HUD]", -- 聊天消息前缀（默认："[^1r^0HUD]"）
    locale = 'en-US' -- 游戏内所有文本的语言（默认：'en-US'，已改为中文）
  },
  modules = { -- HUD 模块
    config_panel = { -- 配置面板 HUD 模块
      enabled = true, -- 启用配置面板（默认：true）
      -- 强制可以用于在玩家加入服务器时应用特定样式或布局。
      -- 启用后，相关选项无法在配置面板中更改，包括拥有 "config" 权限的人。
      -- 只有拥有 "export" 权限的人可以将配置面板中的选项导出为强制选项。
      enforce_layout = false, -- 强制导出的布局选项（默认：false）
      enforce_colors = false -- 强制导出的颜色选项（默认：false）
    },
    minimap = { -- 小地图 HUD 模块
      enabled = true, -- 启用自定义矩形小地图形状（默认：true）
      border = true, -- 显示小地图边框（默认：true）
      vehicle_only = false -- 仅在载具中显示小地图（默认：false）
    },
    land = { -- 陆地载具 HUD 模块
      enabled = true, -- 启用陆地载具 HUD 模块（默认：true）
      tick_delay = 50, -- 模块更新间隔时间（毫秒）（默认：50）
      use_kmph = false, -- 使用公里/小时而不是英里/小时（默认：false）
      passenger = { -- 乘客选项（注意：这些选项不会让乘客使用安全带）
        show = true, -- 向乘客显示陆地载具 HUD 模块（默认：false）
        seatbelt_only = false -- 当 `show` 为 true 时，仅向乘客显示安全带指示器（默认：false）
      },
      seatbelt = { -- 陆地载具内置安全带脚本
        enabled = true, -- 启用内置安全带脚本（默认：true）
        flythrough_speed = 30, -- 以配置单位飞出挡风玻璃的最低速度（默认：30）
        flythrough_modifier = 5.0, -- （默认：5.0）
        alarm_sfx = false, -- 未系安全带时启用警报音效（默认：true）
        alarm_speed = 5, -- 触发警报的车辆速度（默认：5）
        alarm_delay = 5, -- 触发速度后延迟警报的时间（秒）（默认：5）
        buckle_sfx = true, -- 启用系和解安全带音效（默认：true）
        keybind = 'B' -- 默认安全带按键（默认：'K'）
      },
      fuel = { -- 陆地载具内置油量脚本的专用选项
        electric_gauge = true, -- 显示电动车油量表（默认：false）
        refuel_enabled = true, -- 允许使用内置油量脚本选项中的控制进行加油（默认：true）
        warn_at = 30 -- 剩余油量百分比达到此值时显示警告（默认：30）
      }
    },
    air = { -- 航空器 HUD 模块
      enabled = true, -- 启用航空器 HUD 模块（默认：true）
      tick_delay = 5, -- 模块更新间隔时间（毫秒）（默认：5）
      show_passenger = true, -- 向乘客显示航空器 HUD 模块（默认：false）
      altimeter = { -- 高度计选项
        unit = "ft", -- 测量单位（默认："ft"，可选："ft"、"m"、"custom"）
        unit_custom = 3.281, -- 当 `unit` 设置为 "custom" 时，用于将米转换为自定义单位的倍数（默认：3.281）
      },
      fuel = { -- 航空器内置油量脚本的专用选项
        airplane_gauge = true, -- 显示飞机油量表，油量不受内置油量脚本影响（默认：false）
        refuel_enabled = true, -- 允许使用内置油量脚本选项中的控制进行加油（默认：true）
        warn_at = 20 -- 剩余油量百分比达到此值时显示警告（默认：20）
      }
    },
    water = { -- 水上载具 HUD 模块
      enabled = true, -- 启用水上载具 HUD 模块（默认：true）
      tick_delay = 50, -- 模块更新间隔时间（毫秒）（默认：50）
      show_passenger = true, -- 向乘客显示水上载具 HUD 模块（默认：false）
      anchor = { -- 水上载具内置锚脚本
        enabled = true, -- 启用内置锚脚本（默认：true）
        use_combo = true, -- 使用组合键切换锚（默认：true）
        combo = {
          keybind = 133, -- 按下的键（默认：133，A）
          keybind_alt = 36 -- 按住的键（默认：36，左 CTRL）
        },
        -- 仅当 `use_combo` 为 false 时可使用 keybind
        keybind = 'PAGEDOWN', -- 默认锚按键（默认：'PAGEDOWN'）
        slack = 0.5, -- 锚链松弛度（默认：0.5）
        driving_resistance = 0.97, -- 行驶时船只减速程度（越高阻力越小，默认：0.97）
        drift_resistance = 0.90, -- 漂移时船只减速程度（越高阻力越小，默认：0.90）
        distance_factor = 0.05, -- 距离影响阻力的程度（越高影响越大，默认：0.05）
        pull_strength = 0.01, -- 拉回锚点的力（默认：0.01）
        correction_strength = 0.03, -- 修正明显漂移的力（默认：0.03）
        min_pull_strength = 0.01, -- 静止时的最小拉力（默认：0.01）
      },
      fuel = { -- 水上载具内置油量脚本的专用选项
        gauge = true, -- 显示油量表，油量不受内置油量脚本影响（默认：false）
      }
    },
    info = { -- 角色扮演信息 HUD 模块
      enabled = true, -- 启用信息 HUD 模块（默认：true）
      postal = { -- 邮政子模块
        enabled = true, -- 启用邮政子模块（默认：true）
        tick_delay = 100, -- 子模块更新间隔时间（毫秒）（默认：100）
        route_remove_range = 100.0, -- 距离目的地范围内移除路线点（默认：100.0）
        messages = {
          route_deleted = "已删除邮政编码 ~y~{code}~s~ 的路线", -- {code} = 相关邮政编码
          route_not_found = "未找到邮政编码 ~y~{code}~s~", -- {code} = 相关邮政编码
          route_created = "已创建邮政编码 ~y~{code}~s~ 的路线" -- {code} = 相关邮政编码
        }
      },
      location = { -- 位置子模块
        enabled = true, -- 启用位置子模块（默认：true）
        tick_delay = 500, -- 子模块更新间隔时间（毫秒）（默认：500）
        vehicle_only = false, -- 仅在玩家在载具中时生效（默认：true）
        show_passenger = true, -- 当 `vehicle_only` 为 true 时向乘客显示位置信息（默认：false）
      },
      aop = { -- AOP 子模块
        enabled = true, -- 启用 AOP 子模块（默认：true）
        default_text = "无", -- 默认 AOP 文本（默认："None"）
        notify_all = true, -- 设置 AOP 状态时通知所有玩家（默认：true）
        messages = {
          no_permission = "~r~你没有权限设置 AOP",
          status = "AOP 已设置为 ~b~{text}~s~" -- {text} = AOP 状态文本
        }
      },
      peacetime = { -- 和平时间子模块
        enabled = false, -- 启用和平时间子模块（默认：true）
        disable_weapons = false, -- 和平时间内禁用武器射击（默认：true）
        default_speed_limit = 60, -- 速度限制（英里/小时）（默认：60）
        messages = {
          no_permission = "~r~你没有权限设置和平时间。",
          violence = "~r~和平时间内禁止暴力行为。",
          speeding = "~r~你在和平时间内超速，请减速。"
        }
      },
      priority = { -- 优先呼叫子模块
        enabled = false, -- 启用优先呼叫子模块（默认：true）
        cooldown = 20, -- 优先呼叫冷却时间（分钟）（默认：20）
        hide_username = false, -- 优先状态下隐藏用户名（默认：false）
        messages = {
          in_progress = "~r~优先呼叫进行中。 ~s~所有其他呼叫暂停，直到结束。",
          cooldown = "~r~优先呼叫已结束。 ~s~平民需等待 ~r~{time}~s~ 分钟后才能进行下一次呼叫。", -- {time} = 冷却时间（分钟）
          onhold = "~r~优先呼叫已暂停。 ~s~在解除限制前禁止新的优先呼叫。",
          cooldown_in_progress = "~r~优先呼叫冷却中。 ~s~请等待 ~r~{time}~s~ 分钟后再进行呼叫。", -- {time} = 剩余冷却时间（分钟）
          priority_no_permission = "~r~你没有权限进行优先呼叫。",
          cooldown_no_permission = "~r~你没有权限结束优先呼叫。",
          onhold_no_permission = "~r~你没有权限暂停优先呼叫。",
          reset_no_permission = "~r~你没有权限重置优先呼叫。"
        }
      }
    },
    player = { -- 玩家 HUD 模块
      enabled = true, -- 启用玩家 HUD 模块（默认：true）
      tick_delay = 100, -- 模块更新间隔时间（毫秒）（默认：100）
      weapon_icon = true, -- 显示武器图标（默认：true）
      oxygen = true, -- 在水下游泳时显示氧气值（默认：true）
      messages = {
        healed_self = "生命值已恢复。",
        healed_by = "由 ~b~{player}~s~ 恢复生命值。", -- {player} = 玩家名称
        healed_other = "已恢复 ~b~{player}~s~ 的生命值。", -- {player} = 玩家名称
        heal_other_denied = "~r~你没有权限治疗其他玩家。",
        heal_self_denied = "~r~你没有权限治疗自己。",
        heal_not_found = "~r~治疗失败。 ~s~ID 为 ~r~{pid}~s~ 的玩家不存在。" -- {pid} = 玩家 ID
      }
    },
    speed_limit = { -- 限速 HUD 模块
      enabled = true, -- 启用限速 HUD 模块（默认：true）
      show_passenger = false -- 向乘客显示限速信息（默认：false）
    }
  },
  permissions = {
    aop = {
      enabled = true, -- 启用 AOP 权限（默认：true）
      set_aop = "rhud.aop" -- 权限名称（默认："rhud.aop"）
    },
    peacetime = {
      enabled = true, -- 启用和平时间权限（默认：true）
      set_peacetime = "rhud.peacetime" -- 权限名称（默认："rhud.peacetime"）
    },
    priority = {
      enabled = false, -- 启用优先呼叫权限（默认：false）
      priority = "rhud.priority.active", -- 使用 "/priority" 命令的权限名称（默认："rhud.priority.active"）
      cooldown = "rhud.priority.cooldown", -- 使用 "/priority cooldown" 命令的权限名称（默认："rhud.priority.cooldown"）
      onhold = "rhud.priority.onhold", -- 使用 "/priority onhold" 命令的权限名称（默认："rhud.priority.onhold"）
      reset = "rhud.priority.reset" -- 使用 "/priority reset" 命令的权限名称（默认："rhud.priority.reset"）
    },
    player = {
      enabled = true, -- 启用玩家权限（默认：true）
      heal_self = "rhud.player.heal_self", -- 使用 "/heal" 命令治疗自己的权限名称（默认："rhud.player.heal_self"）
      heal_other = "rhud.player.heal_other" -- 使用 "/heal" 命令治疗其他玩家的权限名称（默认："rhud.player.heal_other"）
    },
    config_panel = {
      config = "rhud.config.open", -- 打开配置面板的权限名称（默认："rhud.config.open"）
      export = "rhud.config.export", -- 从配置面板导出的权限名称（默认："rhud.config.export"，注意：导出的选项用于 "modules > config_panel > enforce_layout 和 enforce_colors"）
      layout = "rhud.config.layout", -- 允许配置面板布局选项的权限名称（默认："rhud.config.layout"）
      color = "rhud.config.color" -- 允许配置面板颜色选项的权限名称（默认："rhud.config.color"）
    }
  },
  fuel = { -- 内置油量脚本选项
    enabled = true, -- 启用内置油量脚本（默认：true）
    create_blips = true, -- 为加油站创建标记（默认：true）
    refuel_rate = 1.0, -- 加油速率修正（默认：1.0）
    drain_rate = 1.0, -- 消耗速率修正（默认：1.0）
    acceleration_offset = 0.0002, -- 加速度修正（默认：0.0002）
    traction_offset = 0.0001, -- 牵引力修正（默认：0.0001）
    rpm_offset = 0.0005, -- 转速修正（默认：0.0005）
    market_visible_range = 250.0, -- 加油站标记可见范围（默认：250.0）
    controls = {
      engine_toggle = 86, -- 默认：86，E
      refuel = 22 -- 默认：22，空格键
    }
  },
  control = { -- 内置载具控制脚本
    enabled = false, -- 启用内置载具控制脚本（默认：true）
    hazard = 'BACK', -- 默认双闪灯按键（默认："BACK"）
    left_signal = 'MINUS', -- 默认左转灯按键（默认："MINUS"）
    right_signal = 'EQUALS', -- 默认右转灯按键（默认："EQUALS"）
    engine = 'U' -- 默认发动机切换按键（默认："U"）
  }
}