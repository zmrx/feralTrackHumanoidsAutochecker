local function enableHumanoidsTracking()
  C_Minimap.SetTracking(1, true)

  -- for i = 1, C_Minimap.GetNumTrackingTypes() do
  --   local x, _, y = C_Minimap.GetTrackingInfo(i)

  --   if x == GetSpellInfo(19883) then
  --     print('i:' .. i);
  --     C_Minimap.SetTracking(i, true)
  --   end
  -- end
end

local function isDruid()
  local _, class = UnitClass('player')

  print('test', _, class)

  return class == "DRUID"
end

if isDruid() then
  print('feral track humanoids autochecker started')
  enableHumanoidsTracking();

  local frame = CreateFrame("Frame");

  frame:RegisterEvent("UNIT_AURA");
  frame:SetScript("OnEvent", function()
    local i = 1;

    local buff = UnitBuff("player", i);
    local catFormId = 768;

    while buff do
      if buff == GetSpellInfo(catFormId) then
        enableHumanoidsTracking()
        break
      end

      i = i + 1;

      buff = UnitBuff("player", i);
    end
  end)
end
