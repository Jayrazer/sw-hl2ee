AddCSLuaFile()

SWEP.Base = "simple_base"

SWEP.PrintName = "MGL1"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.CSMuzzleFlashes = false

SWEP.Slot = 2

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/weapons/hl2e/c_combinegl.mdl")
SWEP.WorldModel = Model("models/weapons/w_shotgun.mdl")

SWEP.HoldType = "smg"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = 0

SWEP.Primary = {
	Ammo = "SMG1_Grenade",

	ClipSize = 4,
	DefaultClip = 8,
	
	PumpAction = true,
	PumpSound = "Weapon_Shotgun.Special1",

	Damage = 75,
	
	Delay = 60 / 75,

	Recoil = {
		MinAng = Angle(3, -0.3, 0),
		MaxAng = Angle(5, 0.3, 0),
		Punch = 0.3,
		Ratio = 0.4
	},
	
	Reload = {
		Amount = 1,
		Shotgun = true,
		Sound = "Weapon_Shotgun.Reload",
	},

	Sound = "Weapon_SMG1.Double",
}

SWEP.ViewOffset = Vector(4, 1, 0)

function SWEP:FireWeapon()
	local ply = self:GetOwner()

	self:EmitFireSound()

	self:SendTranslatedWeaponAnim(ACT_VM_PRIMARYATTACK)

	ply:SetAnimation(PLAYER_ATTACK1)

	if SERVER then
		local ent = ents.Create("simple_ent_hl2_40mm")

		local ang = self:GetShootDir():Angle() - Angle(2, 0, 0)
		local dir = ang:Forward()

		ent:SetPos(ply:GetShootPos())
		ent:SetAngles(ang)

		ent:SetOwner(ply)

		ent:SetVelocity(dir * 900)

		ent:Spawn()
		ent:Activate()

	end
end