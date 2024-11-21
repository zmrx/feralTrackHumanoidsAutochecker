FeralTrackHumanoidsAutochecker = {
  C_Minimap = C_Minimap,

  catFormId = 768,

  enableHumanoidsTracking = function(self)
    self.C_Minimap.SetTracking(1, true)
  end,

  isDruid = function()
    local _, class = UnitClass('player')

    return class == "DRUID"
  end,

  run = function(self)
    if not self:isDruid() then
      return;
    end

    print('feral track humanoids autochecker started')

    self:enableHumanoidsTracking();

    local frame = CreateFrame("Frame");

    frame:RegisterEvent("UNIT_AURA");
    frame:SetScript("OnEvent", function()
      local i = 1;

      local buff = C_UnitAuras.GetAuraDataByIndex("player", i);

      while buff do
        if buff.spellId == self.catFormId then
          self:enableHumanoidsTracking()
          break
        end

        i = i + 1;

        buff = C_UnitAuras.GetAuraDataByIndex("player", i);
      end
    end)
  end
}

FeralTrackHumanoidsAutochecker:run()
