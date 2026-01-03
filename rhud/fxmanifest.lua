--Decrypted by FXAP-Decrypter 👿 | discord.gg/fxapdecrypter
fx_version 'cerulean'
game 'gta5'

author 'Raxdiam'
description 'Standalone roleplay HUD'
version '1.7.1'

lua54 'yes'

ui_page 'ui/index.html'

files {
  'ui/sounds/*.ogg',
  'ui/icon.png',
  'ui/index.html',
  'ui/icons/*.png',
  'locale/*.json',
  'data/*.json',
}

shared_scripts {
  'config.lua',
  'script/shared.lua',
}
client_scripts {
  'functions.lua',
  'script/client.lua',
}
server_script 'script/server.lua'

postal_file 'data/postals.json'

dependencies {
  '/assetpacks',
}