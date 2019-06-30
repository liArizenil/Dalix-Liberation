choiceslist = [];
fullmap = 0;
_old_fullmap = 0;
_standard_map_pos = [];
_frame_pos = [];

GRLIB_force_redeploy = false;

waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "save_is_loaded" };

_spawn_str = "";

waitUntil { !isNil "introDone" };
waitUntil { introDone };
waitUntil { !isNil "cinematic_camera_stop" };
waitUntil { cinematic_camera_stop };


if(side player == GRLIB_side_friendly) then {
	_basenamestr = "";
	if ( GRLIB_isAtlasPresent ) then {
		_basenamestr = "BLUFOR LHD";
	} else {
		_basenamestr = "BASE CHIMERA";
	};
	while { true } do {
		waitUntil {
			sleep 0.1;
			( GRLIB_force_redeploy || (player distance (getmarkerpos GRLIB_respawn_marker) < 50) ) && vehicle player == player && alive player && !dialog && howtoplay == 0
		};

		fullmap = 0;
		_old_fullmap = 0;

		GRLIB_force_redeploy = false;

		if ( !GRLIB_fatigue ) then {
			player enableStamina false;
		};
		player setCustomAimCoef 0.35;
		player setUnitRecoilCoefficient 0.6;

		_dialog = createDialog "liberation_deploy";
		deploy = 0;
		_oldsel = -999;

		showCinemaBorder false;
		camUseNVG false;
		respawn_camera = "camera" camCreate (getposASLW lhd);
		respawn_object = "Sign_Arrow_Blue_F" createVehicleLocal (getposASLW lhd);
		respawn_object hideObject true;
		respawn_camera camSetTarget respawn_object;
		respawn_camera cameraEffect ["internal","back"];
		respawn_camera camcommit 0;

		waitUntil { dialog };

		((findDisplay 5201) displayCtrl 201) ctrlAddEventHandler [ "mouseButtonDblClick" , { deploy = 1; } ];

		_standard_map_pos = ctrlPosition ((findDisplay 5201) displayCtrl 251);
		_frame_pos = ctrlPosition ((findDisplay 5201) displayCtrl 198);

		_saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
		_loadouts_data = [];
		_counter = 0;
		if ( !isNil "_saved_loadouts" ) then {
			{
				if ( _counter % 2 == 0 ) then {
					_loadouts_data pushback _x;
				};
				_counter = _counter + 1;
			} foreach _saved_loadouts;
		};

		lbAdd [ 203, "--"] ;
		{ lbAdd [ 203, _x ]; } foreach _loadouts_data;
		lbSetCurSel [ 203, 0 ];

		while { dialog && alive player && deploy == 0} do {
			choiceslist = [ [ _basenamestr, getpos lhd ] ];

			for [{_idx=0},{_idx < count GRLIB_all_fobs},{_idx=_idx+1}] do {
				choiceslist = choiceslist + [[format [ "FOB %1 - %2", (military_alphabet select _idx),mapGridPosition (GRLIB_all_fobs select _idx) ],GRLIB_all_fobs select _idx]];
			};

			_respawn_trucks = call F_getMobileRespawns;

			for [ {_idx=0},{_idx < count _respawn_trucks},{_idx=_idx+1} ] do {
				choiceslist = choiceslist + [[format [ "%1 - %2", localize "STR_RESPAWN_TRUCK",mapGridPosition (getpos (_respawn_trucks select _idx)) ],getpos (_respawn_trucks select _idx),(_respawn_trucks select _idx)]];
			};

			lbClear 201;
			{
				lbAdd [201, (_x select 0)];
			} foreach choiceslist;

			if ( lbCurSel 201 == -1 ) then {
				lbSetCurSel [201,0];
			};

			if ( lbCurSel 201 != _oldsel ) then {
				_oldsel = lbCurSel 201;
				_objectpos = [0,0,0];
				if ( dialog ) then {
					_objectpos = ((choiceslist select _oldsel) select 1);
				};
				if ( surfaceIsWater _objectpos) then {
					respawn_object setposasl [_objectpos select 0, _objectpos select 1, 15];
				} else {
					respawn_object setpos ((choiceslist select _oldsel) select 1);
				};
				_startdist = 120;
				_enddist = 120;
				_alti = 35;
				if ( dialog ) then {
					if (((choiceslist select (lbCurSel 201)) select 0) == "BLUFOR LHD") then {
						_startdist = 200;
						_enddist = 300;
						_alti = 30;
					};
				};

				"spawn_marker" setMarkerPosLocal (getpos respawn_object);
				ctrlMapAnimClear ((findDisplay 5201) displayCtrl 251);
				private _transition_map_pos = getpos respawn_object;
				private _fullscreen_map_offset = 4000;
				if(fullmap % 2 == 1) then {
					_transition_map_pos = [(_transition_map_pos select 0) - _fullscreen_map_offset,  (_transition_map_pos select 1) + (_fullscreen_map_offset * 0.75), 0];
				};
				((findDisplay 5201) displayCtrl 251) ctrlMapAnimAdd [0, 0.3,_transition_map_pos];
				ctrlMapAnimCommit ((findDisplay 5201) displayCtrl 251);

				respawn_camera camSetPos [(getpos respawn_object select 0) - 70, (getpos respawn_object select 1) + _startdist, (getpos respawn_object select 2) + _alti];
				respawn_camera camcommit 0;
				respawn_camera camSetPos [(getpos respawn_object select 0) - 70, (getpos respawn_object select 1) - _enddist, (getpos respawn_object select 2) + _alti];
				respawn_camera camcommit 90;
			};

			if ( _old_fullmap != fullmap ) then {
				_old_fullmap = fullmap;
				if ( fullmap % 2 == 1 ) then {
					((findDisplay 5201) displayCtrl 251) ctrlSetPosition [ (_frame_pos select 0) + (_frame_pos select 2), (_frame_pos select 1), (0.6 * safezoneW), (_frame_pos select 3)];
				} else {
					((findDisplay 5201) displayCtrl 251) ctrlSetPosition _standard_map_pos;
				};
				((findDisplay 5201) displayCtrl 251) ctrlCommit 0.2;
				_oldsel = -1;
			};

			uiSleep 0.1;
		};

		if (dialog && deploy == 1) then {
			_idxchoice = lbCurSel 201;
			_spawn_str = (choiceslist select _idxchoice) select 0;

			if (((choiceslist select _idxchoice) select 0) == _basenamestr) then {
				call respawn_lhd;
			} else {
				if (count (choiceslist select _idxchoice) == 3) then {
					_truck = (choiceslist select _idxchoice) select 2;
					player setpos ([_truck, 5 + (random 3), random 360] call BIS_fnc_relPos)
				} else {
					_destpos = ((choiceslist select _idxchoice) select 1);
					player setpos [((_destpos select 0) + 5) - (random 10),((_destpos select 1) + 5) - (random 10),0];
				};
			};

			if ( (lbCurSel 203) > 0 ) then {
				[ player, [ profileNamespace, _loadouts_data select ((lbCurSel 203) - 1) ] ] call bis_fnc_loadInventory;
				if(backpack player in bannedbackpack) then {
					removeBackpack player;
				};
			};
		};

		respawn_camera cameraEffect ["Terminate","back"];
		camDestroy respawn_camera;
		deleteVehicle respawn_object;
		camUseNVG false;
		"spawn_marker" setMarkerPosLocal markers_reset;

		if (dialog) then {
			closeDialog 0;
		};

		if (alive player && deploy == 1) then {
			[_spawn_str] spawn spawn_camera;
		};
	};
};
if(side player == GRLIB_side_enemy) then {
	[missionNamespace, "arsenalClosed", {
		GRLIB_respawn_loadout = [ player, ["repetitive"] ] call F_getLoadout;
	}] call BIS_fnc_addScriptedEventHandler;
	player addEventHandler ["Respawn",{
		if(!isNil "GRLIB_respawn_loadout") then {
			[ player, GRLIB_respawn_loadout ] call F_setLoadout;
		};
	}];
	player setVariable["deploy_timer",210,false];
	[] spawn {
		while { true } do {
			if(player getVariable "deploy_timer" > 0) then {
				player setVariable["deploy_timer", ((player getVariable "deploy_timer") - 1), false];
				sleep 1;
			};
		};
	};
	[] spawn {
		format ["%1 : %2 joined OPFOR", getPlayerUID player, name player] remoteExec ["diag_log"];
		format [ "%1님이 대항군에 참여하셨습니다.", name player] remoteExec ["systemChat"];
		sleep 5400;
		format [ "%1님의 대항군 플레이 시간이 만료 되었습니다.", name player] remoteExec ["systemChat"];
		["Timeout", false, false,false,false] call BIS_fnc_endMission;
	};

	if(typeOf player == "O_Pilot_F") then { //---------------------------------- this is pilot -------------------------------------
		if(count(blufor_sectors) < 15) then {
			["LackPlayer", false, false,false,false] call BIS_fnc_endMission;
		};
		player addEventHandler ["Killed",{ player setVariable["deploy_timer",GRLIB_Opfor_Air_respawn_timer,false];}];
		while { true } do {		
			waitUntil {
				sleep 0.1;
				isNull (uiNamespace getVariable ["RscDisplayArsenal", displayNull]) && ((player distance (getmarkerpos GRLIB_OPFOR_respawn_marker) < 30) ) && vehicle player == player && alive player && !dialog && howtoplay == 0
			};
			if({side _x == GRLIB_side_friendly} count (allPlayers) < 20) then {
				["LackPlayer", false, false,false,false] call BIS_fnc_endMission;
			};
			if(!(primaryWeapon player in OPFOR_Weapons) && primaryWeapon player != "") then {
				player removeWeapon (primaryWeapon player);
				hint parseText format ["<t color='#ff0000'>선택하신 주무장은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(secondaryWeapon player != "") then {
				player removeWeapon (secondaryWeapon player);
				hint parseText format ["<t color='#ff0000'>선택하신 보조무장은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(vest player in OPFOR_Vest) && vest player != "") then {
				removeVest player;
				hint parseText format ["<t color='#ff0000'>선택하신 조끼는 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(uniform player in OPFOR_Uniform) && uniform player != "") then {
				removeUniform player;
				hint parseText format ["<t color='#ff0000'>선택하신 복장은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(headgear player in OPFOR_Helmet) && headgear player != "") then {
				removeHeadgear player;
				hint parseText format ["<t color='#ff0000'>선택하신 헬맷은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(backpack player in OPFOR_Backpacks && backpack player != "")) then {
				removeBackpack player;
				hint parseText format ["<t color='#ff0000'>선택하신 가방은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
            		_mags = magazines player;
			if (!isNil "_mags") then {
                		{
                    			if(_x in bannedmines) then {
                        			player removeMagazines _x;
						hint parseText format ["<t color='#ff0000'>대인지뢰류는 사용 불가능합니다.</t>"];
                    			};
                		}foreach(_mags);
            		};
					_hmd = hmd player;
                    			if(_hmd in bannedgoggles) then {
                        			player unassignItem _hmd;
									player removeItem _hmd;
						hint parseText format ["<t color='#ff0000'>대항군은 열상 탐지 장비 사용이 불가능합니다.</t>"];
                    			};
			if(((primaryWeaponItems player) select 0) != "") then {
				player removePrimaryWeaponItem ((primaryWeaponItems player) select 0);
			};
			if(!(((primaryWeaponItems player) select 2) in OPFOR_Sight) && ((primaryWeaponItems player) select 2) != "") then {
				player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
				hint parseText format ["<t color='#ff0000'>선택하신 조준경은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if ( !GRLIB_fatigue ) then {
				player enableStamina false;
			};
			player setCustomAimCoef 0.35;
			player setUnitRecoilCoefficient 0.6;
			
			_dialog = createDialog "liberation_deploy_opfor";

			_oldPlayerSel = -1;
			_oldSectorSel = -1;
			deploy = 0;
			loadout = 0;
			spawntype = 0;
			spawn_position = getpos player;

			waitUntil { dialog };

			//-------------------------dialog init-----------------------
			lbClear 1500;
			_opforplayer = [];
			{
				if(side _x == GRLIB_side_enemy && _x != player) then {
					lbAdd [ 1500 , name _x];
					_opforplayer pushback _x;
				};
			} forEach allPlayers;
			lbClear 1501;
			{
				lbAdd [ 1501 , markerText _x];
			} forEach active_sectors;
			
			ctrlEnable [ 1600 , false ];
			ctrlSetText[ 1600 , format["%1",[player getVariable "deploy_timer"] call F_secondsToTimer]];
			//---------------- Dialog init END -------------------

			while { dialog && alive player && deploy == 0 && loadout == 0 } do {
				ctrlSetText[1600, format["%1",[player getVariable "deploy_timer"] call F_secondsToTimer]];
				if(player getVariable "deploy_timer" < 1) then {
					ctrlSetText[1600, "Deploy"];
					ctrlEnable [1600, true];
				};

				if(_oldPlayerSel != lbCurSel 1500) then {
					lbClear 1501;
					lbSetCurSel[1501,-1];
					_oldSectorSel = -1;
				};
				if(_oldSectorSel != lbCurSel 1501) then {
					lbClear 1500;
					lbSetCurSel[1500,-1];
					_oldPlayerSel = -1;
				};
				ctrlSetText [1003, format["BLUFOR : %1",{side _x == GRLIB_side_friendly} count (allPlayers)]];


				_opforplayer = [];
				lbClear 1500;
				{
					if(side _x == GRLIB_side_enemy && _x != player) then {
						lbAdd [ 1500 , name _x];
						_opforplayer pushback _x;
					};
				} forEach allPlayers;

				lbClear 1501;
				{
					lbAdd [ 1501 , markerText _x];
				} forEach active_sectors;

				uiSleep 0.1;
			};

			if(dialog && loadout == 1) then {
				[ "Open", false ] spawn BIS_fnc_arsenal;
			};

			if (dialog && deploy == 1) then {
				_spawn_point = markerPos(sectors_airspawn call BIS_fnc_selectRandom);
				_spawn_point = [(((_spawn_point select 0) + 500) - random 1000),(((_spawn_point select 1) + 500) - random 1000),0];
				_aircraft = createVehicle ["O_Plane_Fighter_02_F", _spawn_point, [], 0, "FLY"];
				_aircraft setPylonLoadOut["pylons3",""];
				_aircraft setPylonLoadOut["pylons4",""];
				_aircraft setPylonLoadOut["pylons5",""];
				_aircraft setPylonLoadOut["pylons6",""];
				_aircraft setPylonLoadOut["pylonBayRight1",""];
				_aircraft setPylonLoadOut["pylonBayLeft1",""];
				_aircraft setPylonLoadOut["pylonBayRight2",""];
				_aircraft setPylonLoadOut["pylonBayLeft2",""];
				_aircraft setPylonLoadOut["pylonBayCenter2",""];
				_aircraft setPylonLoadOut["pylonBayCenter3",""];
				_aircraft flyInHeight (120 + (random 180));
				player moveindriver _aircraft;
			};

			if (dialog) then {
				closeDialog 0;
			};
		};
	}
	else{ //----------------------------------- not the pilot -------------------------------------
		player addEventHandler ["Killed",{ player setVariable["deploy_timer",GRLIB_Opfor_respawn_timer,false];}];
		while { true } do {
			waitUntil {
				sleep 0.1;
				isNull (uiNamespace getVariable ["RscDisplayArsenal", displayNull]) && ((player distance (getmarkerpos GRLIB_OPFOR_respawn_marker) < 30) ) && vehicle player == player && alive player && !dialog && howtoplay == 0
			};
			if(!(primaryWeapon player in OPFOR_Weapons) && primaryWeapon player != "") then {
				player removeWeapon (primaryWeapon player);
				hint parseText format ["<t color='#ff0000'>선택하신 주무장은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(secondaryWeapon player in OPFOR_Weapons) && secondaryWeapon player != "") then {
				player removeWeapon (secondaryWeapon player);
				hint parseText format ["<t color='#ff0000'>선택하신 보조무장은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(vest player in OPFOR_Vest) && vest player != "") then {
				removeVest player;
				hint parseText format ["<t color='#ff0000'>선택하신 조끼는 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(uniform player in OPFOR_Uniform) && uniform player != "") then {
				removeUniform player;
				hint parseText format ["<t color='#ff0000'>선택하신 복장은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(headgear player in OPFOR_Helmet) && headgear player != "") then {
				removeHeadgear player;
				hint parseText format ["<t color='#ff0000'>선택하신 헬맷은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if(!(backpack player in OPFOR_Backpacks && backpack player != "")) then {
				removeBackpack player;
				hint parseText format ["<t color='#ff0000'>선택하신 가방은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
            		_mags = magazines player;
			if (!isNil "_mags") then {
                		{
                    			if(_x in bannedmines) then {
                        			player removeMagazines _x;
						hint parseText format ["<t color='#ff0000'>대인지뢰류는 사용 불가능합니다.</t>"];
                    			};
                		}foreach(_mags);
            		};
					_hmd = hmd player;
                    			if(_hmd in bannedgoggles) then {
                        			player unassignItem _hmd;
									player removeItem _hmd;
						hint parseText format ["<t color='#ff0000'>대항군은 열상 탐지 장비 사용이 불가능합니다.</t>"];
                    			};
			if(((primaryWeaponItems player) select 0) != "") then {
				player removePrimaryWeaponItem ((primaryWeaponItems player) select 0);
			};
			if(!(((primaryWeaponItems player) select 2) in OPFOR_Sight) && ((primaryWeaponItems player) select 2) != "") then {
				player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
				hint parseText format ["<t color='#ff0000'>선택하신 조준경은 사용 불가능한 장비입니다.</t><br/> 사용 가능 장비 안내판을 참조해주세요."];
			};
			if ( !GRLIB_fatigue ) then {
				player enableStamina false;
			};
			player setCustomAimCoef 0.35;
			player setUnitRecoilCoefficient 0.6;
			
			_dialog = createDialog "liberation_deploy_opfor";

			_oldplayerobject = player;
			_oldsectorobject = player;
			deploy = 0;
			loadout = 0;
			spawntype = 0;
			spawn_position = getpos player;

			[ "spawn_halo_map_event", "onMapSingleClick", { spawn_position = _pos; spawntype = 1; } ] call BIS_fnc_addStackedEventHandler;

			waitUntil { dialog };

			//-------------------------dialog init-----------------------
			lbClear 1500;
			_opforplayer = [];
			{
				if(side _x == GRLIB_side_enemy && _x != player) then {
					lbAdd [ 1500 , name _x];
					_opforplayer pushback _x;
				};
			} forEach allPlayers;
			lbClear 1501;
			{
				lbAdd [ 1501 , markerText _x];
			} forEach active_sectors;
			
			ctrlEnable [ 1600 , false ];
			ctrlSetText[ 1600 , format["%1",[player getVariable "deploy_timer"] call F_secondsToTimer]];
			//---------------- Dialog init END -------------------

			while { dialog && alive player && deploy == 0 && loadout == 0 } do {
				ctrlSetText[1600, format["%1",[player getVariable "deploy_timer"] call F_secondsToTimer]];
				if(player getVariable "deploy_timer" < 1) then {
					ctrlSetText[1600, "Deploy"];
					if(spawntype > 0) then {
						if(spawntype == 1) then {
							if((lhd distance2D spawn_position) > 2500) then {
								if(count([] call F_getNearestFob)>0) then {
									if((([] call F_getNearestFob) distance2D spawn_position) < 2500) then {
										ctrlEnable [1600, false];
									}
									else{
										ctrlEnable [1600, true];
									};
								}
								else{
									ctrlEnable [1600, true];
								};
							}
							else{
								ctrlEnable [1600, false];
							};				
						}
						else{
							if(spawntype == 2 && vehicle _oldplayerobject != _oldplayerobject) then {
								ctrlEnable [1600, false];
							}
							else{
								ctrlEnable [1600, true];
							};
						};
					};
				};
				if(lbCurSel 1500 > -1) then {
					if( isNil{ _opforplayer select (lbcursel 1500) } ) then {
						lbClear 1500;
						lbSetCurSel[1500,-1];
						spawn_position = getMarkerPos "spawn_marker";
						spawntype = 1;
					}
					else{
						if(!(_oldplayerobject isEqualTo(_opforplayer select (lbcursel 1500)))) then {
							spawntype = 2;
							_oldplayerobject = _opforplayer select (lbcursel 1500);
							lbClear 1501;
							lbSetCurSel[1501,-1];
							spawn_position = [(position _oldplayerobject) select 0,(position _oldplayerobject) select 1,0];
						};
					};
				};
				if(lbCurSel 1501 > -1) then {
					if( isNil{ active_sectors select (lbcursel 1501) } ) then {
						lbClear 1501;
						lbSetCurSel[1501,-1];
						spawn_position = getMarkerPos "spawn_marker";
						spawntype = 1;
					}
					else{
						if(!(_oldsectorobject isEqualTo(active_sectors select (lbcursel 1501)))) then {
							spawntype = 3;
							_oldsectorobject = active_sectors select (lbcursel 1501);
							lbClear 1500;
							lbSetCurSel[1500,-1];
							spawn_position = getMarkerPos (_oldsectorobject);
						};
					};
				};
				if(spawntype == 1) then {
					lbClear 1501;
					lbSetCurSel[1501,-1];
					_oldsectorobject = player;
					lbClear 1500;
					lbSetCurSel[1500,-1];
					_oldplayerobject = player;
				};
				if(spawntype == 2) then {
					spawn_position = [(position _oldplayerobject) select 0,(position _oldplayerobject) select 1,0];
				};
				ctrlSetText [1003, format["BLUFOR : %1",{side _x == GRLIB_side_friendly} count (allPlayers)]];

				"spawn_marker" setMarkerPosLocal spawn_position;
				
				lbClear 1500;
				_opforplayer = [];
				{
					if(side _x == GRLIB_side_enemy && _x != player) then {
						lbAdd [ 1500 , name _x];
						_opforplayer pushback _x;
					};
				} forEach allPlayers;
				lbClear 1501;
				{
					lbAdd [ 1501 , markerText _x];
				} forEach active_sectors;
				uiSleep 0.1;
			};

			"spawn_marker" setMarkerPosLocal markers_reset;
			if(dialog && loadout == 1) then {
				[ "Open", false ] spawn BIS_fnc_arsenal;
				closeDialog 0;
			};
			

			if (dialog && deploy == 1) then {
				[ "spawn_halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;
				closeDialog 0;
				if(spawntype == 1) then { //halo drop
					private ["_backpack", "_backpackcontents" ];
					spawn_position = [ spawn_position, random 250, random 360 ] call BIS_fnc_relPos;
					spawn_position = [ spawn_position select 0, spawn_position select 1, 2800 + (random 200) ];
					halojumping = true;
					sleep 0.1;
					[ [ name player, spawn_position ], "remote_call_opfordeployed" ] call bis_fnc_mp;
					cutRsc ["fasttravel", "PLAIN", 1];
					playSound "parasound";
					sleep 2;
					_backpack = backpack player;
					if ( _backpack != "" && _backpack != "B_Parachute" ) then {
						_backpackcontents = backpackItems player;
						removeBackpack player;
						sleep 0.1;
					};
					player addBackpack "B_Parachute";

					player setpos spawn_position;

					sleep 4;
					halojumping = false;
					waitUntil { !alive player || ((getPosATL player) select 2) < 150 };
					player setVelocity [0,0,0];
					player action ["openParachute"];
					
					waitUntil { !alive player || isTouchingGround player };
					if ( _backpack != "" && _backpack != "B_Parachute" ) then {
						sleep 2;
						player addBackpack _backpack;
						clearAllItemsFromBackpack player;
						{ player addItemToBackpack _x } foreach _backpackcontents;
					};
				};
				if(spawntype == 2) then { //spawn on player
					_spawnpos = [(spawn_position select 0) - 5 + random 10, (spawn_position select 1) - 5 + random 10,0];
					player setpos _spawnpos;
				};
				if(spawntype == 3) then { //spawn in sector
					_sectorpos = [ getMarkerPos (active_sectors select (lbCurSel 1501)), random 100, random 360 ] call BIS_fnc_relPos;
					_near_AIs = [ _sectorpos nearEntities [["Man"], 800], { !(isPlayer _x) && (side _x == side player) && (vehicle _x == _x) } ] call BIS_fnc_conditionalSelect;
					_spawnpos = zeropos;
					if(count _near_AIs > 0) then {
						_spawnpos = getPos (_near_AIs call BIS_fnc_selectRandom);
					}
					else{
						while { _spawnpos distance zeropos < 1000 } do {
							_spawnpos = ( [ _sectorpos, random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [5, 100, "B_Quadbike_01_F"];
							if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
						};
					};
					player setpos _spawnpos;
				};
			};
		};
	};
};
