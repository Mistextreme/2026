Hey! Thanks for purchasing my script. Remember:
   - You are not allowed to resell or release my scripts

Requirements:
   - es_extended / qb-core / qbox
   - mysql-async / oxmysql

Installing the script:
   1. Download the file and extract "tk_drugs" into your resources folder
   2. Add "start tk_drugs" into your server.cfg file
   3. Import the SQL file(s) into your server's database
   4. Edit config.lua to your liking
   5. Restart your server

More questions?
   - Join our Discord and open a ticket: https://discord.gg/YndnF9tkqu

Items:

ox_inventory:

['weed'] = {
   label = 'Weed',
   weight = 1,
   stack = true,
},

['liquid_meth'] = {
   label = 'Liquid Meth',
   weight = 1,
   stack = true,
},

['baggy'] = {
   label = 'Baggy',
   weight = 10,
   stack = true,
},

['bagged_weed'] = {
   label = 'Weed Bag',
   weight = 20,
   stack = true,
},

['bagged_meth'] = {
   label = 'Meth Bag',
   weight = 20,
   stack = true,
},

['bagging_table'] = {
   label = 'Bagging Table',
   weight = 1000,
   stack = true,
},

['cauldron'] = {
   label = 'Cauldron',
   weight = 500,
   stack = true,
},

['coca_leaf'] = {
   label = 'Coca Leaf',
   weight = 5,
   stack = true,
},

['coke_base'] = {
   label = 'Cocaine Base',
   weight = 1,
   stack = true,
},

['meth_cooking_table'] = {
   label = 'Meth Cooking Table',
   weight = 1000,
   stack = true,
},

['phos'] = {
   label = 'phos',
   weight = 1,
   stack = true,
},

['acid'] = {
   label = 'Acid',
   weight = 1,
   stack = true,
},

['pseudo'] = {
   label = 'Pseudo',
   weight = 1,
   stack = true,
},

['explosive_meth'] = {
   label = 'Explosive Meth',
   weight = 1,
   stack = true,
},

['mixer'] = {
   label = 'Mixer',
   weight = 1,
   stack = true,
},

['gasoline'] = {
   label = 'Gasoline',
   weight = 500,
   stack = true,
},

['meth_oven'] = {
   label = 'Meth Oven',
   weight = 2500,
   stack = true,
},

['coke_oven'] = {
   label = 'Coke Oven',
   weight = 2500,
   stack = true,
},

['cocaine'] = {
   label = 'Cocaine',
   weight = 1,
   stack = true,
},

['meth'] = {
   label = 'Meth',
   weight = 1,
   stack = true,
},

['cannabis_seed'] = {
   label = 'Cannabis seed',
   weight = 1,
   stack = true,
},

['coca_seed'] = {
   label = 'Coca Seed',
   weight = 1,
   stack = true,
},

['plant_pot'] = {
   label = 'Plant Pot',
   weight = 100,
   stack = true,
},

['fertilizer'] = {
   label = 'Fertilizer',
   weight = 10,
   stack = true,
},

['water_bottle'] = {
   label = 'Water Bottle',
   weight = 100,
   stack = true,
},

['default_lamp'] = {
   label = 'Lamp',
   weight = 200,
   stack = true,
},

['press'] = {
   label = 'Press',
   weight = 2500,
   stack = true,
},

['coke_brick'] = {
   label = 'Coke Brick',
   weight = 100,
   stack = true,
},

qb-inventory:

weed = {name = 'weed', label = 'Weed', weight = 1, type = 'item', image = 'weed.png', unique = false, useable = true},
liquid_meth = {name = 'liquid_meth', label = 'Liquid Meth', weight = 1, type = 'item', image = 'liquid_meth.png', unique = false, useable = true},
baggy = {name = 'baggy', label = 'Baggy', weight = 10, type = 'item', image = 'baggy.png', unique = false, useable = true},
bagged_weed = {name = 'bagged_weed', label = 'Weed Bag', weight = 20, type = 'item', image = 'bagged_weed.png', unique = false, useable = true},
bagged_meth = {name = 'bagged_meth', label = 'Meth Bag', weight = 20, type = 'item', image = 'bagged_meth.png', unique = false, useable = true},
bagging_table = {name = 'bagging_table', label = 'Bagging Table', weight = 1000, type = 'item', image = 'bagging_table.png', unique = false, useable = true},
cauldron = {name = 'cauldron', label = 'Cauldron', weight = 500, type = 'item', image = 'cauldron.png', unique = false, useable = true},
coca_leaf = {name = 'coca_leaf', label = 'Coca Leaf', weight = 5, type = 'item', image = 'coca_leaf.png', unique = false, useable = true},
coke_base = {name = 'coke_base', label = 'Cocaine Base', weight = 1, type = 'item', image = 'coke_base.png', unique = false, useable = true},
meth_cooking_table = {name = 'meth_cooking_table', label = 'Meth Cooking Table', weight = 1000, type = 'item', image = 'meth_cooking_table.png', unique = false, useable = true},
phos = {name = 'phos', label = 'phos', weight = 1, type = 'item', image = 'phos.png', unique = false, useable = true},
acid = {name = 'acid', label = 'Acid', weight = 1, type = 'item', image = 'acid.png', unique = false, useable = true},
pseudo = {name = 'pseudo', label = 'Pseudo', weight = 1, type = 'item', image = 'pseudo.png', unique = false, useable = true},
explosive_meth = {name = 'explosive_meth', label = 'Explosive Meth', weight = 1, type = 'item', image = 'explosive_meth.png', unique = false, useable = true},
mixer = {name = 'mixer', label = 'Mixer', weight = 1, type = 'item', image = 'mixer.png', unique = false, useable = true},
gasoline = {name = 'gasoline', label = 'Gasoline', weight = 500, type = 'item', image = 'gasoline.png', unique = false, useable = true},
meth_oven = {name = 'meth_oven', label = 'Meth Oven', weight = 2500, type = 'item', image = 'meth_oven.png', unique = false, useable = true},
coke_oven = {name = 'coke_oven', label = 'Coke Oven', weight = 2500, type = 'item', image = 'coke_oven.png', unique = false, useable = true},
cocaine = {name = 'cocaine', label = 'Cocaine', weight = 1, type = 'item', image = 'cocaine.png', unique = false, useable = true},
meth = {name = 'meth', label = 'Meth', weight = 1, type = 'item', image = 'meth.png', unique = false, useable = true},
cannabis_seed = {name = 'cannabis_seed', label = 'Cannabis seed', weight = 1, type = 'item', image = 'cannabis_seed.png', unique = false, useable = true},
coca_seed = {name = 'coca_seed', label = 'Coca Seed', weight = 1, type = 'item', image = 'coca_seed.png', unique = false, useable = true},
plant_pot = {name = 'plant_pot', label = 'Plant Pot', weight = 100, type = 'item', image = 'plant_pot.png', unique = false, useable = true},
fertilizer = {name = 'fertilizer', label = 'Fertilizer', weight = 10, type = 'item', image = 'fertilizer.png', unique = false, useable = true},
water_bottle = {name = 'water_bottle', label = 'Water Bottle', weight = 100, type = 'item', image = 'water_bottle.png', unique = false, useable = true},
default_lamp = {name = 'default_lamp', label = 'Lamp', weight = 200, type = 'item', image = 'default_lamp.png', unique = false, useable = true},
press = {name = 'press', label = 'Press', weight = 2500, type = 'item', image = 'press.png', unique = false, useable = true},
coke_brick = {name = 'coke_brick', label = 'Coke Brick', weight = 100, type = 'item', image = 'coke_brick.png', unique = false, useable = true},