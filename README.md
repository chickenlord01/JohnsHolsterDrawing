# Johns Holster Script

Script made by JohnL#6869 (Discord)
Inspired by guy293's holster script (Link: https://github.com/Guy293/esx_guy293_HolsterWeapon)

**Description**
This script is to allow different animations when drawing a weapon. You can select the drawables that the person will be drawing from holster. You can also select which weapons that will be allowed to draw from holster/gangsterdraw. See the config.lua file to change the various settings that are offered.

**Config**
Config = {}

Config.HolsterDraw = true --Allow drawing from holster?
Config.GangsterDraw = true --Draw from back of pants if no holster is being worn?
Config.Cooldown = 400 --Changes the Holster Drawing Speed (400 Is pretty realistic)

Config.HolsterWeapons = { --Weapons that draw from holster
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_REVOLVER"
}

Config.HolsterModels = { --Holster Models (Drawable, Scarf (MP Ped Customization VMENU))
	1,   --Unknown
	2,   --Unknown
	3,   --Unknown
	5,   --Unknown
	6,   --Unknown
	8,   --Unknown
	42,  --Unknown
	43,  --Unknown
	110, --Unknown
	111  --Unknown
}

**Support**
If any questions arrise feel free to add me on discord or create a post on github!