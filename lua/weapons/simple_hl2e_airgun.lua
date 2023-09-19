AddCSLuaFile()

SWEP.Base = "simple_base"

SWEP.PrintName = "Pneumatic SMG"
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

	ClipSize = 75,
	DefaultClip = 150,

	Damage = 100 / 15,
	Delay = 60 / 1200,

	Range = 500,
	Accuracy = 24,

	RangeModifier = 0.87,

	Recoil = {
		MinAng = Angle(0.5, -0.3, 0),
		MaxAng = Angle(0.7, 0.3, 0),
		Punch = 0.5,
		Ratio = 0.6
	},

	Sound = "airgun.Single",
	TracerName = "Tracer"
}

SWEP.NPCData = {
	Burst = {3, 6},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay * 2, SWEP.Primary.Delay * 3}
}

SWEP.ViewOffset = Vector(-1, -1, -0.5)

list.Add("NPCUsableWeapons", {class = "simple_hl2e_airgun", title = "Simple Weapons: " .. SWEP.PrintName})