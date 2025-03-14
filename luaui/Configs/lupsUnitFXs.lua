-- note that the order of the MergeTable args matters for nested tables (such as colormaps)!

local presets = {
}

effectUnitDefs = {
  --// FUSIONS //--------------------------
  -- length tag does nothing
  --// PLANES //----------------------------
  ['f-81'] = {
    {class='Ribbon', options={width=0.2, size=12, piece="trail1"}},
    {class='Ribbon', options={width=0.2, size=12, piece="trail2"}},
	--{class='AirJet', options={color={0.8,0.2,0.2}, width=0.2, length=5, piece="engine"}},
   },
  gyrfalcon = {
    {class='Ribbon', options={width=0.2, size=12, piece="wingtip1"}},
    {class='Ribbon', options={width=0.2, size=12, piece="wingtip2"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust1"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust2"}},
  },   
  hawk = {
    {class='Ribbon', options={width=0.2, size=12, piece="wingtip1"}},
    {class='Ribbon', options={width=0.2, size=12, piece="wingtip2"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.2, length=2, piece="engine1", onActive=true,}},
  },
  hawkp = {
    --{class='Ribbon', options={width=0.4, size=12, piece="engine1"}},
    --{class='AirJet', options={color={0.1,0.4,0.6}, width=0.2, length=2, piece="engine1"}}, 
  },  
  wasp = {
    --{class='Ribbon', options={width=0.4, size=12, piece="engine"}},
    --{class='AirJet', options={color={0.8,0.2,0.2}, width=0.2, length=2, piece="engine", onActive=true,}},
  },
  python = {
    {class='Ribbon', options={width=0.2, size=12, piece="gen1"}},
    {class='Ribbon', options={width=0.2, size=12, piece="gen2"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.2, length=2, piece="gen1"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.2, length=2, piece="gen2"}},
  },
  destiny = {
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust1"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust2"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust3"}},
	--{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust4"}},
	{class='StaticParticles', options=MergeTable(blinkyLightRed, {piece="wingtip1"}) },
	{class='StaticParticles', options=MergeTable(blinkyLightGreen, {piece="wingtip2"}) },
  },
  destinye = {
	{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust1", onActive=true,}},
	{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust2", onActive=true,}},
	{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust3", onActive=true,}},
	{class='AirJet', options={color={0.1,0.4,0.6}, width=0.4, length=5, piece="thrust4", onActive=true,}},
	{class='StaticParticles', options=MergeTable(blinkyLightRed, {piece="wingtip1"}) },
	{class='StaticParticles', options=MergeTable(blinkyLightGreen, {piece="wingtip2"}) },
  },
  aurora = {
	{class='AirJet', options={color={0.8,0.2,0.2}, width=0.4, length=6, piece="exhaustl1", onActive=true,}},
	{class='AirJet', options={color={0.8,0.2,0.2}, width=0.4, length=6, piece="exhaustl2", onActive=true,}},
	{class='AirJet', options={color={0.8,0.2,0.2}, width=0.4, length=6, piece="exhaustr1", onActive=true,}},
	{class='AirJet', options={color={0.8,0.2,0.2}, width=0.4, length=6, piece="exhaustr2", onActive=true,}},
	{class='StaticParticles', options=MergeTable(blinkyLightRed, {piece="wingtip1"}) },
	{class='StaticParticles', options=MergeTable(blinkyLightGreen, {piece="wingtip2"}) },
  },
  
}
effectUnitDefs.aurorab = effectUnitDefs.aurora

-- load presets from unitdefs
for i=1,#UnitDefs do
	local unitDef = UnitDefs[i]

	if unitDef.customParams then
		local fxTableStr = unitDef.customParams.lups_unit_fxs
		if fxTableStr then
			local fxTableFunc = loadstring("return "..fxTableStr)
			local fxTable = fxTableFunc()
			effectUnitDefs[unitDef.name] = effectUnitDefs[unitDef.name] or {}
			for i=1,#fxTable do	-- for each item in preset table
				local toAdd = presets[fxTable[i]]
				for i=1,#toAdd do
					table.insert(effectUnitDefs[unitDef.name],toAdd[i])	-- append to unit's lupsFX table
				end
			end
		end
	end
end