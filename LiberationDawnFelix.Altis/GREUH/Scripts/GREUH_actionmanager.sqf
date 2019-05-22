_idact = -1;
while { true } do {
	waitUntil{ sleep 0.3; alive player };
	_idact = player addAction ["<t color='#FF8000'>-- 추가 설정 --</t>","GREUH\scripts\GREUH_dialog.sqf","",-999,false,true];
	waitUntil{ sleep 0.3; !alive player};
};