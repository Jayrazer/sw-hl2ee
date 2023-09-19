AddCSLuaFile()

DEFINE_BASECLASS("simple_base")

SWEP.Base = "simple_base"

SWEP.PrintName = "Pulse Shotgun"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 3

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/weapons/hl2e/c_pulseshotgun.mdl")
SWEP.WorldModel = Model("models/weapons/w_shotgun.mdl")

SWEP.HoldType = "shotgun"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = 0

SWEP.Primary = {
	Ammo = "Buckshot",

	ClipSize = 9,
	DefaultClip = 18,

	PumpAction = true,
	PumpSound = "Weapon_Shotgun.Special1",

	Damage = 15,
	Count = 5,

	Delay = -1,

	Range = 375,
	Accuracy = 24,

	RangeModifier = 0.7,

	Recoil = {
		MinAng = Angle(2, -0.7, 0),
		MaxAng = Angle(3, 0.7, 0),
		Punch = 0.5,
		Ratio = 0
	},

	Reload = {
		Amount = 1,
		Shotgun = true,
		Sound = "Weapon_Shotgun.Reload",
	},

	Sound = "weapons/hl2ee/pulseshotgun_fire.wav",
	TracerName = "AR2Tracer"
}

SWEP.Secondary = {
	Count = 12,

	Recoil = {
		MinAng = Angle(7, -3, 0),
		MaxAng = Angle(7, 3, 0),
		Punch = 0.5
	},
	
	Sound = "weapons/hl2ee/pulseshotgun_fire_double.wav",
}

SWEP.NPCData = {
	Burst = {1, 2},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay * 2, SWEP.Primary.Delay * 3}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2_shotgun", title = "Simple Weapons: " .. SWEP.PrintName})

function SWEP:CanAltFire()
	if self:GetNextFire() > CurTime() then
		return
	end

	return BaseClass.CanPrimaryFire(self)
end

function SWEP:AltFire()
	self.Primary.Automatic = false

	if self:Clip1() <= 2 then
		self:ConsumeAmmo()
		self:FireWeapon()

		local delay = self:GetDelay()

		self:ApplyRecoil()

		if self:ShouldPump() then
			self:SetNeedPump(true)
		end

		self:SetNextIdle(CurTime() + self:SequenceDuration())
		self:SetNextFire(CurTime() + delay)

		return
	end

	self:TakePrimaryAmmo(3)
	self:FireWeaponDouble()

	self:ApplyRecoil(self.Secondary.Recoil)
	self:SetNeedPump(true)

	local time = CurTime() + self:SequenceDuration()

	self:SetNextIdle(time)
	self:SetNextFire(time)
end

function SWEP:FireWeaponDouble()
	local ply = self:GetOwner()
	local primary = self.Primary
	local secondary = self.Secondary

	self:EmitSound(self.Secondary.Sound)

	self:SendTranslatedWeaponAnim(ACT_VM_SECONDARYATTACK)

	ply:SetAnimation(PLAYER_ATTACK1)

	local damage = self:GetDamage()

	local bullet = {
		Num = secondary.Count,
		Src = ply:GetShootPos(),
		Dir = self:GetShootDir(),
		Spread = self:GetSpread(),
		TracerName = primary.TracerName,
		Tracer = primary.TracerName == "" and 0 or primary.TracerFrequency,
		Force = damage * 0.25,
		Damage = damage,
		Callback = function(attacker, tr, dmginfo)
			dmginfo:ScaleDamage(self:GetDamageFalloff(tr.StartPos:Distance(tr.HitPos)))
		end
	}

	self:ModifyBulletTable(bullet)

	ply:FireBullets(bullet)
end