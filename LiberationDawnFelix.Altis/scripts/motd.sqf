sleep 0.5;//서버 시작후 몇초뒤에 실행될지 결정
_motd = parseText 
	"
	<t align='center' size='1.2'><a color='#58FAD0'>오늘도 저희 서버에 와주셔서 감사합니다</a></t>
	<br/><t align='center' size='1.2'><a color='#58FAD0'>저희 서버에서 즐겁게 게임하시는 것을</a></t>
	<br/><t align='center' size='1.2'><a color='#58FAD0'>정말 보람차게 느끼는 Dalix서버의 서버장 Dawn과 Felix입니다 :) </a></t>
	<br/><t align='center'>저희 서버는</t>
	<br/><t align='center'>뉴비를 절대 배척하지 않고 배려한다.</t>
	<br/><t align='center'>운영진은 유저만을 위해 일한다.</t>
	<br/><t align='center'>권력을 절대 남용하지 않는다.</t>
	<br/><t align='center'>등등 여러가지 모토를 가지고 유저분들을 위한 서버를 만들어가려 노력중입니다!</t>
	<br/><t align='center'>처음 오신분들은 꼭 디스코드 참여하셔서 룰을 확인해주시기 바랍니다!</t>
	<br/><t align='center'><a color='#FF0000'>(신고 및 건의 , 피드백 환영!)</a></t>
	<br/><t align='center'><t size='1'>디스코드 클릭 >> <a color='#01A9DB' href='https://discord.gg/fmBJPEA'>Dalix 디스코드</a>
	<br/><t align='center'><a color='#FF0000' size = '1.1'>U</a> 버튼을 사용해서 분대 참여가 가능합니다 !</t>
	<br/><t align='center'><a color='#FF0000' size = '1.1'>마우스 휠을 아래로</a> 굴리면 여러 메뉴들을 사용하실 수 있습니다 :)</t>
	<br/><t align='center' size='1.2'><a color='#FF00FF'>게임이 처음이시라구요 ?</a></t>
	<br/><t align='center'>걱정 마세요 ! 서버장과 관리자와 모든 유저가 도와줄겁니다 !</t>
	<br/><t align='center'size='1.2'><a color='#58FAD0'>유저분들을 위해 열심히 일하겠습니다 :) 감사합니다 !</a></t>
	<br/><t align='center'size='1.3'><a color='#81F781'>- Dalix 서버 관리자 일동 -</a></t>
	<br/><t align='center'><a color='#DF013A'>★ ESC 버튼으로 끌 수 있습니다 ★</a></t>
	";
"Dalix Vanllia Sever MOTD" hintC [
    _motd
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];