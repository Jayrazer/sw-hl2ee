AddCSLuaFile()

SWEP.Base = "simple_base"

SWEP.PrintName = "Pulse Shotgun"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.CSMuzzleFlashes = false

SWEP.Slot = 2

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/weapons/c_shotgun.mdl")
SWEP.WorldModel = Model("models/weapons/w_shotgun.mdl")

SWEP.HoldType = "smg"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = -1

SWEP.Primary = {
	Ammo = "Buckshot",

	ClipSize = 8,
	DefaultClip = 16,
	
	PumpAction = true,
	PumpSound = "Weapon_Shotgun.Special1",

	Damage = 20,
	Count = 5,
	
	Delay = 60 / 90,

	Range = 400,
	Accuracy = 24,

	RangeModifier = 0.87,

	Recoil = {
		MinAng = Angle(0.5, -0.3, 0),
		MaxAng = Angle(0.7, 0.3, 0),
		Punch = 0.5,
		Ratio = 0.6
	},
	
	Reload = {
		Amount = 1,
		Shotgun = true,
		Sound = "Weapon_Shotgun.Reload",
	},

	Sound = "Weapon_IRifle.Single",
	TracerName = "AR2Tracer"
}

SWEP.NPCData = {
	Burst = {3, 6},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay * 2, SWEP.Primary.Delay * 3}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_pulseshotgun", title = "Simple Weapons: " .. SWEP.PrintName})