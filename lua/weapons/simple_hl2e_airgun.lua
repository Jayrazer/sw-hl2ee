AddCSLuaFile()

SWEP.Base = "simple_base"

SWEP.PrintName = "Airgun"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.CSMuzzleFlashes = false

SWEP.Slot = 2

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/tnb/weapons/c_airgun.mdl")
SWEP.WorldModel = Model("models/tnb/weapons/w_airgun.mdl")

SWEP.HoldType = "smg"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = -1

SWEP.Primary = {
	Ammo = "SMG1",

	ClipSize = 100,
	DefaultClip = 200,

	Damage = 100 / 12,
	Delay = 60 / 1200,

	Range = 600,
	Accuracy = 12,

	RangeModifier = 0.87,

	Recoil = {
		MinAng = Angle(0.5, -0.3, 0),
		MaxAng = Angle(0.7, 0.3, 0),
		Punch = 0.5,
		Ratio = 0.6
	},

	Sound = "weapons/overdose_shoot.wav",
	TracerName = "Tracer"
}

SWEP.NPCData = {
	Burst = {3, 6},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay * 2, SWEP.Primary.Delay * 3}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_airgun", title = "Simple Weapons: " .. SWEP.PrintName})