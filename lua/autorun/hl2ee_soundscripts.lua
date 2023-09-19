
//Airgun Shoot
local fastbl = {}
fastbl["channel"] = "CHAN_WEAPON"
fastbl["level"] = "100"
fastbl["volume"] = "1.0"
fastbl["CompatibilityAttenuation"] = "0.27"
fastbl["pitch"] = "90,105"
fastbl["sound"] = {"^weapons/hl2ee/airgun_shoot.wav"}
fastbl["name"] = "airgun.Single"

sound.Add(fastbl)


//Airgun Clipout
local fastbl = {}
fastbl["channel"] = "CHAN_WEAPON"
fastbl["level"] = "70"
fastbl["volume"] = "1.0"
fastbl["CompatibilityAttenuation"] = "0.27"
fastbl["pitch"] = "100"
fastbl["sound"] = {"^weapons/hl2ee/airgun_clipout.wav"}
fastbl["name"] = "airgun.Clipout"

sound.Add(fastbl)



//Airgun Clipin
local fastbl = {}
fastbl["channel"] = "CHAN_WEAPON"
fastbl["level"] = "70"
fastbl["volume"] = "1.0"
fastbl["CompatibilityAttenuation"] = "0.27"
fastbl["pitch"] = "100"
fastbl["sound"] = {"^weapons/hl2ee/airgun_clipin.wav"}
fastbl["name"] = "airgun.Clipin"

sound.Add(fastbl)