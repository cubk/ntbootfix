@echo off
set path=%SystemRoot%;%SystemRoot%\system32;%SystemRoot%\System32\Wbem;"%~dp0";"%cd:"=%"
set ERRORLEVEL=
pushd "%~dp0"
set /a mode1=0&set /a gpt=0&set titlemsg=NTBOOTautofix v2.6.0 by chz_hlh and nicky&title  %titlemsg%&color 2f&set errorlevel=
set sys32=system32&path %systemroot%\system32
if exist %systemroot%\syswow64 (set sys32=sysnative&path %systemroot%\sysnative;%systemroot%\system32)
if exist %systemroot%\system32\mode.com if exist %systemroot%\system32\ureg.dll mode con cols=80 lines=25&&set /a mode1=1
set /a addnt5m=0&setlocal enabledelayedexpansion&ConsExt /crv 0
if not exist %systemroot%\system32\chcp.com ren chcp5.com chcp.com>nul 2>nul
if not exist %systemroot%\system32\attrib.exe ren attrib5.exe attrib.exe>nul 2>nul


if not exist %systemroot%\system32\filever.exe copy /y filever.exe %systemroot%\system32\filever.exe>nul 2>nul
if not exist %systemroot%\system32\label.exe ren label5.exe label.exe>nul 2>nul
if not exist %systemroot%\system32\subst.exe ren subst5.exe subst.exe>nul 2>nul
if not exist %systemroot%\system32\wbem\wmic.exe copy /y wmic5.exe %systemroot%\system32\wbem\wmic.exe>nul 2>nul
For %%a In (Z Y W V U T S R Q P O N M L K J I H) Do subst %%a: /d>nul 2>nul
For %%a In (Z Y X W V U T S R Q P O N M L K J I H G F E D C) Do call :smartlabel %%a



set msg0000=Loading , Please wait ...
chcp 936 >nul 2>nul&&set msg0000=程序加载中，请稍候 ...
chcp 950 >nul 2>nul&&set msg0000=祘Α更い, 叫祔 ...
cls&echo.&echo.&echo     %msg0000%
set tmpfile=autofixx.tmp&set /a handfix=0&set /a hfix=1&set /a hline=22
for /l %%1 in (0,1,3) do (reg unload HKLM\BCD0000000%%1 >nul 2>nul)
set alldrive=0ABCDEFGHIJKLMNOPQRSTUVWXYZ
set muimsg1=bg-BGcs-CZda-DKde-DEel-GRen-GBen-USes-ESet-EE
set muimsg2=fi-FIfr-FRhr-HRhu-HUit-ITja-JPko-KRlt-LTlv-LVnb-NOnl-NLpl-PLpt-BRpt-PTro-ROru-RUsk-SKsl-SIsv-SEtr-TRuk-UAzh-CNzh-HKzh-TWzh-MOzh-SG
set actp=?&set be_=be&set bb_=
set /a nt5fix=0&set /a nt6fix=0&set /a bcdfix=0&set ss=sksig&set /a pe=0&set /a retu=0&set /a g5=0
set rlt=reg load HKU\TEMP&set rut=reg unload HKU\TEMP&set rqt=reg query HKU\TEMP
set rdt=reg delete HKU\TEMP&set rat=reg add HKU\TEMP&set bd=bootdi
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v InstallDate 2>nul|find /i "InstallDate">%tmpfile% 2>nul&&(
	for /f "tokens=2*" %%a in (%tmpfile%) do set InstallDate=%%b
	if "!InstallDate!" equ "0x0" set /a pe=1)||(set /a pe=1)
if %pe% equ 1 (set unfixdrive=%systemroot:~0,2%&set driveall=Z: Y: X: W: V: U: T: S: R: Q: P: O: N: M: L: K: J: I: H: G: F: E: D: C:
	set /a wver=0&set actp=?
	for /f "tokens=2,3 delims=[]" %%i in ('ver^|find /i "windows"') do set wtype=Windows PE - %%i %%j
	bschk /nt60 sys /mbr|find /i "Harddisk0">nul 2>nul&&(bschk /nt60 sys|find  "\\"|find ":">%tmpfile% 2>nul&&(
		for /f "tokens=1 delims=:" %%i in (%tmpfile%) do set actp=%%i
		for /f "tokens=2 delims=?^)" %%i in (%tmpfile%) do (set volume=%%i)
		set volume=\??!volume!
		reg query HKLM\SYSTEM\MountedDevices /v !volume! 2>nul|find /i "!volume!">%tmpfile% 2>nul
		for /F "tokens=3" %%i in (%tmpfile%) do (set data1=%%i)
		if /i "!data1:~24,1!" neq "" (set actp=?&set /a retu=1&goto verend)))||(set /a retu=1&goto verend))
if %pe% equ 0 (bschk /nt60 sys>%tmpfile% 2>nul&&(find "\\" %tmpfile%|find ":">nul 2>nul||(sc&set /a wver=5))||(set /a gpt=1)
	ver|find "6.">nul&&(set /a wver=6&set driveall=Z: Y: X: W: V: U: T: S: R: Q: P: O: N: M: L: K: J: I: H: G: F: E: D: C: B: A:)
	ver|find "5.">nul&&(set /a wver=5&set driveall=Z: Y: X: W: V: U: T: S: R: Q: P: O: N: M: L: K: J: I: H: G: F: E: D: C:)
	REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName 2>nul|find /i "ProductName">%tmpfile%&&(
		for /f "tokens=2*" %%a in (%tmpfile%) do set wtype=%%b))
:verend
chcp 936>nul 2>nul||goto start00
set msg000=系统引导自动修复工具
set msg100=系统引导高级修复
set msg001=当前系统：
set msg101=活动分区 -
set msg201=自选引导分区 -
set msg301=系统盘符
set msg0021=自选引导分区盘符
set msg102=1. 选择目标系统分区在当前系统中的盘符
set msg202=选择目标分区盘符 -
set msg003=【 C: 】     【 D: 】     【 E: 】     【 F: 】     【 G: 】     【 H: 】
set msg004=【 I: 】     【 J: 】     【 K: 】     【 L: 】     【 M: 】     【 N: 】
set msg104=【 O: 】     【 P: 】     【 Q: 】     【 R: 】     【 S: 】     【 T: 】
set msg204=【 U: 】     【 V: 】     【 W: 】     【 X: 】     【 Y: 】     【 Z: 】
set msg105=区域
set msg005=键盘输入功能号或鼠标点击【 】内选择:
set msg006=     本工具修复：  NT6.x 的引导文件和引导菜单配置文件 BCD
set msg007=                   NT5.x 的引导文件和引导菜单配置文件 BOOT.INI
set msg008=                   其它修复功能参看 readme 文档
set msg009=【 1.自动修复 】  【  2.高  级  】  【  3.退  出  】  【 4.手动修复 】
set msg209=写 NT5 引导程序 - PBR - 请稍候 ...
set msg309=写 NT6 引导程序 - PBR - 请稍候 ...
set msg409=重写主引导程序 - MBR - 请稍候 ...
set msg509=当前目标分区盘符 -
set msg609=【 1.开始修复 】  【  2.高  级  】  【  3.退  出  】  【 4.手动修复 】
set msg709=【 1. 更  改 】
set msg011= 系统，修复中，请稍候...
set msg012=修复成功
set msg013=修复失败
set msg112=跳过修复
set msg113=修复失败-重启重试
set msg114=引导菜单
set msg214="早期版本Windows"
set msg314= 已添加进 BCD
set msg414=Windows 内存诊断
set msg015= 修复完成，正在建立报告，请稍候 -
set msg016=无
set msg017=修复成功
set msg018=修复失败
set msg019=原 BOOT.INI 备份为 -
set msg020=原 BCD 备份为 -
set msg021=【 1.查看 Boot.ini 】  【 2.退出 】  【   3.查看  BCD   】
set msg022=错误：代码
set msg123=【 0.取  消 】
set msg024=错误：系统 BCD 配置故障，现象 --
set msg025= 1. NT6.x系统中运行"msconfig"后"启动"或"引导"栏空白
set msg026= 2. 管理员身份运行命令提示符中后运行"bcdedit"等和 BCD 相关的操作提示出错
set msg027= 3. 系统属性的"启动和故障恢复"无法配置"默认操作系统"和"等待时间"
set msg028= 4. 其它软件无法添加/删除/修改基于 BCD 管理的引导菜单
set msg029=上述的 BCD 故障如不影响系统引导不推荐强制修复操作，如果选择强制修复，将
set msg030=可能会丢失基于 BCD 管理的非 NT6.X 系统引导菜单（如硬盘版PE/自动GHOST等）
set msg031=【 1.强制修复 】  【  2.高  级  】  【  3.退  出  】
set msg032=【 1.确  定 】          【 2.取  消 】
set msg034=写入操作成功
set msg035=写入操作失败
set msg036=目标分区不存在 NTLDR 文件，不能使用此功能
set msg137=别输入 ^= " ^ 这类字符，不输入直接回车则不修改名称
set msg037=输入该引导菜单的新名称：
set msg438=【  0.返回  】
set msg538=  【 1.在 BCD 中添加NT5.x引导菜单 】
set msg638=
set msg238=  【 2.编辑 BOOT.INI 】
set msg338=【  3.管理  】
set msg039=【 0.返回 】【 1.上移 】【 2.下移 】【3.重命名】【 4.删除 】【 5.默认 】
set msg139=【 0.返回 】
set msg040=引导程序写入
set msg041=主引导程序写入
set msg043=【 1. 自 选 引 导 分 区 盘 符 】
set msg044=【 2. 写主引导程序 / 引导程序 】
set msg045=【 3. 修复系统盘符（OSLetter）】
set msg145=【 4. 查看/管理 BCD 引导配置  】
set msg245=【 5. 更 改 BCD 默 认 区 域   】
set msg046=【 0. 返 回 】
set msg146=【 1. 强 制 】
set msg047=【  2. 写 NT5 引导程序 - PBR  】
set msg048=【  3. 写 NT6 引导程序 - PBR  】
set msg049=【  4. 重写主引导程序  - MBR  】
set msg050=【 0.取消 】【 1.删除 】
set msg051=打开 BCD 文件出错或 BCD 文件不存在
set msg052=不能删除当前系统的引导菜单
set msg152=【  D1.管理  】
set osendmsg1= 完成：操作成功
set oserrmsg1=错误：不能更改当前系统的系统盘符
set msg252=错误：D1 盘上不存在有效 windows 系统
set msg352=错误：打开 D1 盘注册表文件时出错
set oserrmsg4=错误：未知原因操作失败
set msg452=选择 D1 盘系统的系统盘符（OSLetter）
set msg552=警告：D1 盘上系统的系统盘符将被修改为 D2
set msg053=【6.删除-慎用】
set msg153=【7.删除-慎用】
set msg253=【8.查看】
set msg353=【9.查看】
set msg453=【 A.修改 】
set msg553=【  +  -  】
set msg653=【 M.修改 】
set msg753=- Metro引导开启
set msg853=- Metro引导关闭
set msg054=【 1.bg-BG 】 【 2.cs-CZ 】 【 3.da-DK 】 【 4.de-DE 】 【 5.el-GR 】
set msg154=【 6.en-GB 】 【 7.en-US 】 【 8.es-ES 】 【 9.et-EE 】 【 A.fi-FI 】
set msg254=【 B.fr-FR 】 【 C.hr-HR 】 【 D.hu-HU 】 【 E.it-IT 】 【 F.ja-JP 】
set msg354=【 G.ko-KR 】 【 H.lt-LT 】 【 I.lv-LV 】 【 J.nb-NO 】 【 K.nl-NL 】
set msg454=【 L.pl-PL 】 【 M.pt-BR 】 【 N.pt-PT 】 【 O.ro-RO 】 【 P.ru-RU 】
set msg554=【 Q.sk-SK 】 【 R.sl-SI 】 【 S.sv-SE 】 【 T.tr-TR 】 【 U.uk-UA 】
set msg654=【 V.zh-CN 】 【 W.zh-HK 】 【 X.zh-TW 】 【 Y.zh-MO 】 【 Z.zh-SG 】
set msg055=-------------- * 请别在完成报告前退出程序，否则部分修复会失效 * ------------
set msg156=【  1.修  复  】  【  2.跳  过  】
set msg256=【 3.开启 Metro 引导菜单并修复 】
set msg057=修复中，请稍候 ......
set msg058=不修复 ......
set msg059=程序准备中，请稍候 ......
set msg060=; Metro 引导菜单 - 禁用
set msg160=; Metro 引导菜单 - 启用
set msg061=----------------------------------------------------------------------------
set msg062=------------------ 说明：序号后面 * 号的为默认引导菜单 ---------------------
set mui=zh-CN
goto start2

:start00
chcp 950 >nul 2>nul||goto start0
set msg000=╰参ま旧笆確ㄣ
set msg100=╰参ま旧蔼確
set msg001=讽玡╰参
set msg101=ㄏノい合盒だ澄 -
set msg201=ㄏノい合盒だ澄 -
set msg301=╰参合才
set msg0021=匡ㄏノい合盒だ澄絃才
set msg102=1. 匡拒ヘ夹╰参合盒だ澄讽玡╰参い絃才
set msg202=匡拒ヘ夹だ跋絃才 -
set msg003= C:       D:       E:       F:       G:       H: 
set msg004= I:       J:       K:       L:       M:       N: 
set msg104= O:       P:       Q:       R:       S:       T: 
set msg204= U:       V:       W:       X:       Y:       Z: 
set msg105=跋办
set msg005=龄絃块腹┪菲公翴阑 ず匡拒:
set msg006=     セㄣ確  NT6.x 秨诀郎㎝ま旧砞﹚郎 BCD
set msg007=                   NT5.x 秨诀郎㎝ま旧砞﹚郎 BOOT.INI
set msg008=                   ㄤウ確把 readme ゅ郎
set msg009= 1.笆確     2.蔼        3.癶       4.も笆確 
set msg209=糶 NT5 ま旧祘Α - PBR - 叫祔 ...
set msg309=糶 NT6 ま旧祘Α - PBR - 叫祔 ...
set msg409=糶ま旧祘Α - MBR - 叫祔 ...
set msg509=讽玡ヘ夹だ跋絃才 -
set msg609= 1.秨﹍確     2.蔼        3.癶       4.も笆確 
set msg709= 1.   э 
set msg011= ╰参確い叫祔...
set msg012=確Θ
set msg013=確ア毖
set msg112=铬筁確
set msg113=確ア毖-币刚
set msg114=ま旧
set msg214="Ν戳セWindows"
set msg314= 睰秈 BCD
set msg414=Windows 癘拘砰禘耞
set msg015= 確ЧΘタミ厨叫祔 -
set msg016=礚
set msg017=確Θ
set msg018=確ア毖
set msg019= BOOT.INI 称 -
set msg020= BCD 称 -
set msg021= 1.琩 Boot.ini    2.癶      3.琩  BCD   
set msg022=岿粇絏
set msg123= 0.   
set msg024=岿粇╰参 BCD 皌竚珿毁瞷禜 --
set msg025= 1. NT6.x╰参い笲︽"msconfig""币笆"┪"ま旧"逆フ
set msg026= 2. 恨瞶ō笲︽㏑矗ボ才い笲︽"bcdedit"单㎝ BCD 闽巨矗ボ岿
set msg027= 3. ╰参妮┦"币笆㎝珿毁確"礚猭皌竚"箇砞穨╰参"㎝"单丁"
set msg028= 4. ㄤウ硁砰礚猭睰/埃/э膀 BCD 恨瞶ま旧
set msg029=瓃 BCD 珿毁ぃ紇臫╰参ま旧ぃ崩滤眏確巨狦匡拒眏確盢
set msg030=穦メア膀 BCD 恨瞶獶 NT6.X ╰参ま旧祑盒PE/笆GHOST单
set msg031= 1.眏確     2.蔼        3.癶    
set msg032= 1.絋  ﹚            2.   
set msg034=糶巨Θ
set msg035=糶巨ア毖
set msg036=ヘ夹だ跋ぃ NTLDR 郎ぃㄏノ
set msg137=块 ^= " ^ 硂摸じぃ块钡ó玥ぃэ嘿
set msg037=块赣ま旧穝嘿
set msg438=  0.  
set msg538=   1. BCD い睰NT5.xま旧垫虫 
set msg638=
set msg238=   2.絪胯 BOOT.INI 
set msg338=  3.恨瞶  
set msg039= 0.  1.簿  2.簿 3.㏑ 4.埃  5.纐粄 
set msg139= 0. 
set msg040=ま旧祘Α糶
set msg041=ま旧祘Α糶
set msg043= 1. 匡ㄏノい合盒だ澄絃才
set msg044= 2. 糶ま旧祘Α / ま旧祘Α 
set msg045= 3. 確╰参合才 OSLetter 
set msg145= 4. 琩/恨瞶 BCD ま旧皌竚  
set msg245= 5.  э BCD 跋 办 砞 ﹚   
set msg046= 0.   
set msg146= 1. 眏  
set msg047=  2. 糶 NT5 ま旧祘Α - PBR  
set msg048=  3. 糶 NT6 ま旧祘Α - PBR  
set msg049=  4. 糶ま旧祘Α  - MBR  
set msg050= 0.  1.埃 
set msg051=ゴ秨 BCD ゅン岿┪ BCD ゅンぃ
set msg052=ぃ埃讽玡╰参ま旧
set msg152=  D1.恨瞶  
set osendmsg1= ЧΘ巨Θ
set oserrmsg1=岿粇ぃэ讽玡╰参╰参合才
set msg252=岿粇D1 絃ぃΤ windows ╰参
set msg352=岿粇ゴ秨 D1 絃爹郎岿
set oserrmsg4=岿粇ゼ巨ア毖
set msg452=2. 匡拒 D1 絃╰参╰参合才OSLetter
set msg552=牡D1 絃╰参╰参合才盢砆э D2
set msg053=6.埃-稸ノ
set msg153=7.埃-稸ノ
set msg253=8.琩
set msg353=9.琩
set msg453= A.э 
set msg553=  +  -  
set msg653= M.э 
set msg753=- Metroま旧秨币
set msg853=- Metroま旧闽超
set msg054= 1.bg-BG   2.cs-CZ   3.da-DK   4.de-DE   5.el-GR 
set msg154= 6.en-GB   7.en-US   8.es-ES   9.et-EE   A.fi-FI 
set msg254= B.fr-FR   C.hr-HR   D.hu-HU   E.it-IT   F.ja-JP 
set msg354= G.ko-KR   H.lt-LT   I.lv-LV   J.nb-NO   K.nl-NL 
set msg454= L.pl-PL   M.pt-BR   N.pt-PT   O.ro-RO   P.ru-RU 
set msg554= Q.sk-SK   R.sl-SI   S.sv-SE   T.tr-TR   U.uk-UA 
set msg654= V.zh-CN   W.zh-HK   X.zh-TW   Y.zh-MO   Z.zh-SG 
set msg055=-------------- * 叫ЧΘ厨玡癶祘Α玥场だ確穦ア * ------------
set msg156=  1.  狡      2.铬  筁  
set msg256= 3.秨币 Metro ま旧垫虫確 
set msg057=確い叫祔 ......
set msg058=ぃ確 ......
set msg059=祘Α非称い叫祔 ......
set msg060=; Metro ま旧垫虫 - 窽ノ
set msg160=; Metro ま旧垫虫 - 币ノ
set msg061=----------------------------------------------------------------------------
set msg062=------------------ 弧 : 腹 * 腹纐粄ま旧垫虫 --------------------
set mui=zh-TW
goto start2

:start0
set msg000= System Boot Fixer [Auto]
set msg100= System Boot Advanced Fix
set msg001=Current OS:
set msg101=Active Partition -
set msg201=Boot Partition -
set msg301=OSletter
set msg0021=Change or Choose active partition
set msg102=1. Choice target Partition driveletter in current system
set msg202=Choose Target Partition -
set msg003= [ C: ]       [ D: ]       [ E: ]       [ F: ]       [ G: ]       [ H: ]
set msg004= [ I: ]       [ J: ]       [ K: ]       [ L: ]       [ M: ]       [ N: ]
set msg104= [ O: ]       [ P: ]       [ Q: ]       [ R: ]       [ S: ]       [ T: ]
set msg204= [ U: ]       [ V: ]       [ W: ]       [ X: ]       [ Y: ]       [ Z: ]
set msg105=international
set msg005=Keyboard input or Click [ ] to choose:
set msg006=Tool Fix: NT6.x startup files and boot menu configuration file:BCD
set msg007=          NT5.x startup files and boot menu configuration file:Boot.ini
set msg008=          The function with Other repair see also readme text file
set msg009= [ 1.Auto Fix ]    [ 2.Advanced ]    [   3.Exit   ]    [4.Maunal_Fix]
set msg209=ReWrite NT5.x PBR - Please wait ...
set msg309=ReWrite NT6.x PBR - Please wait ...
set msg409=ReWrite MBR - Please wait ...
set msg509=Target Partition -
set msg609= [ 1.StartFix ]    [ 2.Advanced ]    [   3.Exit   ]    [4.Maunal_Fix]
set msg709= [ 1. Change ]
set msg011= system, fixing, please wait ...
set msg012=Fixed success
set msg013=Fixed failure
set msg112=not fix
set msg113=Failure,restart and try again
set msg114=Start Menu
set msg214="Earlier Version of Windows"
set msg314= has been added in BCD
set msg414=Windows Memory Diagnostic
set msg015= Process Completed, Creating Report, Please wait -
set msg016=None
set msg017=Success
set msg018=Fixed failure
set msg019=The old BOOT.INI backup to -
set msg020=The old BCD backup to -
set msg021= [ 1.View Boot.ini ]    [ 2.Exit ]    [   3.View  BCD   ]
set msg022=Error: code
set msg123= [ 0.Cancel ]
set msg024=Error: System BCD configuration failure, the error --
set msg025=1. nt6.x - Start - Run - msconfig - option "boot" is blank
set msg026=2. run bcdedit as Administrator and related to the operation of BCD error
set msg027=3. "Default operating system" and The "waiting time" can not be configured
set msg028=4. Other software can not modify the boot menu based BCD Management
set msg029=     If you choose a "ForceFix",  it will be missing some non-NT6.X
set msg030=     system  boot menu (such as the HD-based PE / auto-GHOST, etc.)
set msg031= [ 1.ForceFix ]    [ 2.Advanced ]    [   3.Exit   ]
set msg032= [1.Continue]            [ 2.Cancel ]
set msg034=successfully updated.
set msg035=Error: Write error...
set msg036=The target Partition nonexistent 'NTLDR',can't usage this function
set msg137=Do not input character : ^= " ^
set msg037=Input new description :
set msg438= [ 0.Return ]
set msg538=   [ 1.Add NT5.x Boot Menu to BCD ]
set msg638=
set msg238=   [ 2.Edit BOOT.INI ]
set msg338= [ 3.Manage ]
set msg039= [0.Return]  [  1.Up  ]  [ 2.Down ]  [3.Rename]  [4.Delete]  [5.Defaul]
set msg139= [0.Return]
set msg040=PBR Fixed
set msg041=MBR Fixed
set msg043= [  1. Choose Boot partition  ]
set msg044= [  2. Write  PBR  and  MBR   ]
set msg045= [  3. Change  OS_Letter      ]
set msg145= [  4. BCD - View and Manage  ]
set msg245= [  5. International setting  ]
set msg046= [ 0.Return ]
set msg146= [ 1. Force ]
set msg047= [    2. Write PBR - NT5.x    ]
set msg048= [    3. Write PBR - NT6.x    ]
set msg049= [    4. Write MBR - NT6.x    ]
set msg050= [0.Cancel]  [1.Delete]
set msg051=not exist file BCD or open file BCD error
set msg052=Cannot delete boot menu because it's current System
set msg152= [ D1.Manage ]
set osendmsg1= Operation success
set oserrmsg1=Error: Can't change the OSletter of current system
set msg252=Error: Drive D1 nonexistent valid windows system
set msg352=Error: Open registration error on drive D1
set oserrmsg4=Error: Procedure unknown error
set msg452=2. Choice OSletter for dirve D1
set msg552=Warning: The OSletter will be change to D2 in your drive D1 system
set msg053= [ 6. Delete ]
set msg153= [ 7. Delete ]
set msg253= [8.View]
set msg353= [9.View]
set msg453= [A.Change]
set msg553= [  +  -  ]
set msg653= [M.Change]
set msg753=- Metro Disable
set msg853=- Metro  Enable
set msg054= [ 1.bg-BG ]   [ 2.cs-CZ ]   [ 3.da-DK ]   [ 4.de-DE ]   [ 5.el-GR ]
set msg154= [ 6.en-GB ]   [ 7.en-US ]   [ 8.es-ES ]   [ 9.et-EE ]   [ A.fi-FI ]
set msg254= [ B.fr-FR ]   [ C.hr-HR ]   [ D.hu-HU ]   [ E.it-IT ]   [ F.ja-JP ]
set msg354= [ G.ko-KR ]   [ H.lt-LT ]   [ I.lv-LV ]   [ J.nb-NO ]   [ K.nl-NL ]
set msg454= [ L.pl-PL ]   [ M.pt-BR ]   [ N.pt-PT ]   [ O.ro-RO ]   [ P.ru-RU ]
set msg554= [ Q.sk-SK ]   [ R.sl-SI ]   [ S.sv-SE ]   [ T.tr-TR ]   [ U.uk-UA ]
set msg654= [ V.zh-CN ]   [ W.zh-HK ]   [ X.zh-TW ]   [ Y.zh-MO ]   [ Z.zh-SG ]
set msg055=----------------- * Do not quit before report completed * ------------------
set msg156= [  1.  Fix   ]    [  2. Skip   ]
set msg256= [ 3.Enable metro boot and Fix ]
set msg057= Fixing, please wait ......
set msg058= Unfixed .....
set msg059=Please Wait ......
set msg060=; Metro Boot - Disable
set msg160=; Metro Boot - Enable
set msg061=----------------------------------------------------------------------------
set msg062=---------------- Elucidation : "*" as Default Boot Menu --------------------
set mui=en-US
:start2
cls&echo.&echo.&echo     %msg0000%
set mui1=%mui%
:start
set msg002=%msg0021%
if %retu% equ 1 (set msg009=%msg609%&set msg000=%msg100%)
title %titlemsg% - NT%msg000%
set bcdpath=\boot\BCD
if %gpt% equ 1 set bcdpath=\EFI\Microsoft\Boot\BCD
if %pe% equ 1 (
	if %retu% equ 1 (call :menudrive&&(set /a gpt=0&set msg101=%msg201%&set actp=!actpM!)||goto end)
	set bb_= /s !actp!:
	set be_=be /store !actp!:%bcdpath%
	)
if %pe% equ 0 (
	if %gpt% equ 0 (
		bschk /nt60 sys | find "\\" | find ":">%tmpfile% 2>nul&&(
			for /f "tokens=1 delims=:" %%i in (%tmpfile%) do set actp=%%i)||(set /a retu=1&set /a pe=1&goto start))
	if %gpt% equ 1 (call :efimount||(set /a gpt=0&set /a retu=1&set /a pe=1&goto start))

)
set actpmsg=%actp%:&set bootmgrmui=bootmgr.exe.mui&set memmui=memtest.exe.mui
if %gpt% equ 1 (set actpmsg=%actp%: - EFI&set bootmgrmui=bootmgfw.efi.mui&set memmui=memtest.efi.mui)
set actpM=%actp%
if %gpt% equ 0 (set msg138=%msg438%%msg538%) else set msg138=%msg438%%msg638%
call :actpMchk||(set /a gpt=0&set /a pe=1&set /a retu=1&set actp=?&goto start)

if exist %actp%:\boot.ini (set msg038=%msg138%%msg238%) else (set msg038=%msg138%)
set /a bk=0
:rebcdbackup
set /a bk=!bk!+1
if exist !actp!:%bcdpath%!bk! goto rebcdbackup
del bootini*.* >nul 2>nul
set /a bk1=0
:rebcdbackup1
set /a bk1=!bk1!+1
if exist !actp!:\boot!bk1!.ini goto rebcdbackup1

set unknow=6&set /a copy_=0&set bcdbk=be /export !actp!:%bcdpath%!bk!
if exist !actp!:%bcdpath% (
	if !pe! neq 1 (%bcdbk% >nul 2>nul||goto BCD_err
		attrib -r -h -s !actp!:%bcdpath%!bk!.*>nul 2>nul
		del !actp!:%bcdpath%!bk!.*>nul 2>nul) else (for /l %%1 in (0,1,3) do (reg unload HKLM\BCD0000000%%1 >nul 2>nul)
		attrib -r -h -s !actp!:%bcdpath% >nul 2>nul
		copy !actp!:%bcdpath% !actp!:%bcdpath%!bk! >nul 2>nul&&(del !actp!:%bcdpath%!bk! >nul 2>nul
			set /a copy_=1&set bcdbk=copy !actp!:%bcdpath% !actp!:%bcdpath%!bk! )||goto unknow_err))
:begin
set msg914="Earlier Version of Windows"
copy /y ntldr1 /b + ntldre /b ntldr /b >nul 2>nul
if /i "%mui1:~0,3%" equ "zh-" call :cnset
set msg002=%msg0021%
color 2f
cls
call :enter4
echo   %msg001%%wtype%  { %msg101%%actpmsg% }
echo.
echo   %msg005%            { %msg105% = %mui1% }
echo.
echo   %msg061%
echo.
echo    %msg006%
echo.
echo    %msg007%
echo.
echo    %msg008%
echo.
echo   %msg061%
echo.
echo.
echo      %msg009%

:mouse1
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 49 goto begin1
if %xy% equ 50 call :advance1&&goto begin||goto start
if %xy% equ 51 goto end
if %xy% equ 52 (set /a handfix=1&goto begin1)
if %xy% equ 27 goto end
if %xy% lss 1001 goto mouse1
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 19 goto mouse1
if %x% gtr 7 if %x% lss 20 goto begin1
if %x% gtr 25 if %x% lss 38 call :advance1&&goto begin||goto start
if %x% gtr 43 if %x% lss 56 goto end
if %x% gtr 61 if %x% lss 74 (set /a handfix=1&goto begin1)
goto mouse1

:begin1

cls&call :enter4&call :enter4&call :enter4&call :enter3&echo  %msg059%&echo.&set /a nt6=0&echo. >retmp
chzdp !actp!:&&(for /l %%1 in (0,1,7) do (set /a disk%%1=0))||(set /a dp=!errorlevel!
		if !dp! gtr 99 (set /a D=!dp:~0,-2!) else (set /a D=0)
		for /l %%1 in (0,1,7) do (
			if %%1 lss !D! set /a disk%%1=%%1+1
			if %%1 equ !D! set /a disk%%1=0
			if %%1 gtr !D! set /a disk%%1=%%1))
if !bcdfix! equ 0 if exist !actp!:%bcdpath% (for /l %%1 in (0,1,3) do (reg unload HKLM\BCD0000000%%1 >nul 2>nul )&%bcdbk% >nul 2>nul)
for %%A in (%driveall%) do (if "%%A" neq "%unfixdrive%" (
	set DR=%%A&set DR=!DR:~0,1!&set vertype=0&set build=
	set /a bbok=0&set remsg=No&set mbm=
	set /a currentos=0&set OSLFIX=%msg113%&set bit=x86&dir %%A\windows\syswow64 /ad >nul 2>nul&&set bit=x64
	set reg_=REG QUERY "HKU\TEMP\Microsoft\Windows NT\CurrentVersion"&set reg2=reg&set OSL=?&set sys32=system32
	if /i "%%A\windows" equ "%systemroot%" (set /a currentos=1&set OSL=!DR!:
 		set reg_=REG QUERY "HKLM\Software\Microsoft\Windows NT\CurrentVersion"&set reg2=echo
		if exist %systemroot%\syswow64 set sys32=sysnative)
	dir %%A\windows\!sys32!\winload.exe /a >nul 2>nul&&(
		set ramdir=set wtype=Vista/2008/Win7/2008r2/Win8 !bit!&set wdir=windows&call :wtypeget&&set /a nt6=!nt6!+1
		if !hfix! equ 1 if !pe! equ 1 if !nt6! equ 1 ((copy /y chz_fix.bcd %%A\windows\!sys32!\chz_fix.dll>nul 2>nul
			bb %%A\windows %bb_%>nul 2>nul)||(
			for /l %%1 in (0,1,3) do (reg unload HKLM\BCD0000000%%1 >nul 2>nul )
			attrib -r -h -s !actp!:%bcdpath%>nul 2>nul&del !actp!:%bcdpath%>nul 2>nul
			bb %%A\windows %bb_%>nul 2>nul||(for /l %%1 in (0,1,3) do (reg unload HKLM\BCD0000000%%1 >nul 2>nul)
				attrib -r -h -s !actp!:%bcdpath%>nul 2>nul&copy /y !actp!:%bcdpath%!bk! !actp!:%bcdpath%>nul 2>nul)))
		del %%A\windows\!sys32!\chz_fix.dll>nul 2>nul

		if !hfix! equ 1 (copy /y chz_fix.bcd %%A\windows\!sys32!\chz_fix.dll>nul 2>nul
			bb %%A\windows %bb_%>nul 2>nul&&set /a bbok=1||set /a bbok=0)

		if !hfix! equ 1 if !bbok! equ 0 if exist !actp!:\bootmgr if exist !actp!:%bcdpath% (

			%be_% /enum {bootmgr} 2>nul|find /i "identifier">nul 2>nul||(
				%be_% /create {bootmgr} /d "Windows Boot Manager">nul 2>nul&&(
					%be_% /set {bootmgr} device boot>nul 2>nul
					%be_% /set {bootmgr} locale %mui1%>nul 2>nul
					%be_% /set {bootmgr} inherit {globalsettings}>nul 2>nul
					%be_% /set {bootmgr} toolsdisplayorder {memdiag}>nul 2>nul
					%be_% /set {bootmgr} timeout 6 >nul 2>nul))

			del 1.tmp>nul 2>nul&del 2.tmp>nul 2>nul
			%be_% /enum osloader 2>nul|find "identifier">%tmpfile% 2>nul&&(
				for /f "tokens=2 delims={}" %%i in (%tmpfile%) do echo {%%i}>>1.tmp)
			%be_% /enum Resume 2>nul|find "identifier">%tmpfile% 2>nul&&(
				for /f "tokens=2 delims={}" %%i in (%tmpfile%) do echo {%%i}>>2.tmp)
			%be_% /create /d "!wtype!" /application OSLOADER>%tmpfile% 2>nul&&(
				for /f "tokens=2 delims={}" %%i in (%tmpfile%) do set ramuid={%%i}
				%be_% /create /d "Windows Resume Application" /application RESUME>%tmpfile% 2>nul
				for /f "tokens=2 delims={}" %%i in (%tmpfile%) do set ramuid1={%%i}
				%be_% /set !ramuid! device partition=%%A>nul 2>nul&&(
					%be_% /set !ramuid! path \Windows\system32\winload.exe>nul 2>nul
					%be_% /set !ramuid! locale en-US>nul 2>nul
					%be_% /set !ramuid! inherit {bootloadersettings}>nul 2>nul
					%be_% /set !ramuid! osdevice partition=%%A>nul 2>nul
					%be_% /set !ramuid! systemroot \Windows>nul 2>nul
					%be_% /set !ramuid! resumeobject !ramuid1!>nul 2>nul
					%be_% /set !ramuid! nx OptIn>nul 2>nul
					%be_% /set !ramuid1! device partition=%%A>nul 2>nul
					%be_% /set !ramuid1! path \Windows\system32\winresume.exe>nul 2>nul
					%be_% /set !ramuid1! locale en-US>nul 2>nul
					%be_% /set !ramuid1! inherit {resumeloadersettings}>nul 2>nul
					%be_% /set !ramuid1! osdevice partition=%%A>nul 2>nul
					%be_% /set !ramuid1! filepath \hiberfil.sys>nul 2>nul
					%be_% /set !ramuid1! debugoptionenabled No>nul 2>nul
			if exist 1.tmp for /f %%i in (1.tmp) do (
					%be_% /enum %%i 2>nul|find /i "device                  partition=%%A">nul 2>nul&&(
					%be_% /enum %%i 2>nul|find /i "path                    \windows\system32\winload.exe">nul 2>nul&&(
					%be_% /enum %%i 2>nul|find /i "osdevice                partition=%%A">nul 2>nul&&(
					%be_% /enum %%i 2>nul|find /i "systemroot              \windows">nul 2>nul&&%be_% /delete %%i /f>nul 2>nul))))
			if exist 2.tmp for /f %%i in (2.tmp) do (
					%be_% /enum %%i 2>nul|find /i "device                  partition=%%A">nul 2>nul&&(
					%be_% /enum %%i 2>nul|find /i "path                    \Windows\system32\winresume.exe">nul 2>nul&&(
						%be_% /delete %%i /f>nul 2>nul)))
					%be_% /displayorder !ramuid! /addfirst>nul 2>nul
					%be_% /set {bootmgr} default !ramuid!>nul 2>nul
					%be_% /set {bootmgr} resumeobject !ramuid1!>nul 2>nul&set /a bbok=1
			)))

		if !hfix! equ 1 if !bbok! equ 1 (call :os1fix
			set /a nt6fix=!nt6fix!+1&set nt6fixok=%%A !nt6fixok!
			if "!vertype!" equ "6.1" if exist %%A\Windows\!sys32!\%mui1%\bootres.dll.mui (
				if exist %%A\Windows\!sys32!\%mui1%\winload.exe.mui %be_% /set {default} locale %mui1% >nul 2>nul)
			if "!vertype!" neq "6.1" if exist %%A\Windows\!sys32!\%mui1%\winload.exe.mui %be_% /set {default} locale %mui1% >nul 2>nul
			if !metroc! equ 0 if "!vertype!" equ "6.2" %be_% /set {default} bootmenupolicy Legacy>nul 2>nul&&set mbm=%msg060%
			if !metroc! equ 1 if "!vertype!" equ "6.2" %be_% /set {default} bootmenupolicy Standard>nul 2>nul&&set mbm=%msg160%
			%be_% /enum {default} 2>nul|find /i "resumeobject">%tmpfile% 2>nul&&(
				for /f "tokens=2 delims={}" %%i in (%tmpfile%) do set ramdir={%%i}
				%be_% /set !ramdir! filedevice partition=%%A>nul 2>nul
				%be_% /set !ramdir! pae Yes>nul 2>nul
				%be_% /set !ramdir! debugoptionenabled No>nul 2>nul
				if exist %%A\Windows\!sys32!\%mui1%\winresume.exe.mui %be_% /set !ramdir! locale %mui1% >nul 2>nul )
			if !gettypeerr! equ 0 %be_% /set {default} description "!wtype!">nul 2>nul
			%be_% /set {default} loadoptions DDISABLE_INTEGRITY_CHECKS>nul 2>nul
			%be_% /set {default} nointegritychecks Yes>nul 2>nul
			if exist %%A\Windows\!sys32!\virtmgmt.msc if exist %%A\Windows\!sys32!\vmconnect.exe (
				%be_% /set {default} hypervisorlaunchtype Auto>nul 2>nul)

			if /i "!DR!" equ "!actp!" (%be_% /enum {bootmgr} 2>nul|find "{">%tmpfile% 2>nul&&(
				del 1.tmp>nul 2>nul
				for /f "tokens=2 delims={}" %%i in (%tmpfile%) do echo {%%i} >>1.tmp
				for /f %%i in (1.tmp) do (
					%be_% /enum %%i 2>nul|find /i "device                  boot">nul 2>nul&&(
					%be_% /enum %%i 2>nul|find /i "path                    \windows\system32\winload.exe">nul 2>nul&&(
					%be_% /enum %%i 2>nul|find /i "osdevice                boot">nul 2>nul&&(
					%be_% /enum %%i 2>nul|find /i "systemroot              \windows">nul 2>nul&&%be_% /delete %%i /f>nul 2>nul))))
					)
				%be_% /set {default} device boot>nul 2>nul
				%be_% /set {default} osdevice boot>nul 2>nul)

			set redir=
			if /i "!DR!" equ "!actp!" (set /a p62t=1&set p62=!actp!:&set p62p2=boot) else (
				set /a p62t=2&set p62=%%A&set p62p2=%%A)
			if "!vertype!" neq "6.2" dir %%A\recovery\ /a/s/b 2>nul|find "boot.sdi" /i >%tmpfile% 2>nul&&(
				del 1.tmp>nul 2>nul&for /f "tokens=2 delims=:" %%i in (%tmpfile%) do echo %%i >>1.tmp
				for /f %%i in (1.tmp) do (set redir1=%%i&set redir1=!redir1:~0,-9!
					if exist %%A!redir1!\winre.wim if not exist %%A!redir1!\ReAgent.xml set redir=!redir1!)
				if "!redir!" neq "" (
					%be_% /create /d "Ramdisk Device Options" /device >%tmpfile% 2>nul&&(
						for /f "tokens=2 delims={}" %%i in (%tmpfile%) do (set ramuid={%%i}&echo {%%i}>>retmp)
						if !p62t! equ 1 %be_% /set !ramuid! ramdisksdidevice boot >nul 2>nul
						if !p62t! neq 1 %be_% /set !ramuid! ramdisksdidevice partition=%%A >nul 2>nul
						%be_% /set !ramuid! ramdisksdipath !redir!\boot.sdi >nul 2>nul
						%be_% /create /d "Windows Recovery Environment" /application OSLOADER >%tmpfile% 2>nul&&(
							for /f "tokens=2 delims={}" %%i in (%tmpfile%) do (set rcvuid={%%i}&echo {%%i}>>retmp)
							%be_% /set !rcvuid! device ramdisk=[!p62p2!]!redir!\winre.wim,!ramuid!>nul 2>nul
							%be_% /set !rcvuid! path \windows\system32\boot\winload.exe>nul 2>nul
							%be_% /set !rcvuid! locale en-US >nul 2>nul
							if exist %%A\Windows\!sys32!\%mui1%\winload.exe.mui %be_% /set !rcvuid! locale %mui1% >nul 2>nul
							%be_% /set !rcvuid! osdevice ramdisk=[!p62p2!]!redir!\winre.wim,!ramuid!>nul 2>nul
							%be_% /set !rcvuid! systemroot \windows>nul 2>nul
							%be_% /set !rcvuid! detecthal yes>nul 2>nul
							%be_% /set !rcvuid! nx optin>nul 2>nul
							%be_% /set !rcvuid! winpe yes>nul 2>nul
							%be_% /set {default} recoveryenabled Yes>nul 2>nul
							%be_% /set {default} recoverysequence !rcvuid!>nul 2>nul
							set remsg=Yes))))

			if "!vertype!" equ "6.2" for /l %%1 in (1,1,!p62t!) do (
				if  /i "!remsg!" neq "Yes" dir !p62!\recovery\ /a/s/b 2>nul|find "boot.sdi" /i >%tmpfile% 2>nul&&(
					del 1.tmp>nul 2>nul&for /f "tokens=2 delims=:" %%i in (%tmpfile%) do echo %%i >>1.tmp
					for /f %%i in (1.tmp) do (set redir1=%%i&set redir1=!redir1:~0,-9!
						if exist !p62!!redir1!\winre.wim if exist !p62!!redir1!\ReAgent.xml (
							find /i "!build!" !p62!!redir1!\ReAgent.xml>nul 2>nul&&set redir=!redir1!))
					if "!redir!" neq "" (%be_% /create /d "Windows Recovery" /device >%tmpfile% 2>nul&&(
						for /f "tokens=2 delims={}" %%i in (%tmpfile%) do (set ramuid={%%i}&echo {%%i}>>retmp)
						if !p62t! equ 1 %be_% /set !ramuid! ramdisksdidevice boot >nul 2>nul
						if !p62t! neq 1 %be_% /set !ramuid! ramdisksdidevice partition=%%A >nul 2>nul
						%be_% /set !ramuid! ramdisksdipath !redir!\boot.sdi >nul 2>nul
						%be_% /create /d "Windows Recovery Environment" /application OSLOADER >%tmpfile% 2>nul&&(
							for /f "tokens=2 delims={}" %%i in (%tmpfile%) do (set rcvuid={%%i}&echo {%%i}>>retmp)
							%be_% /set !rcvuid! device ramdisk=[!p62p2!]!redir!\winre.wim,!ramuid!>nul 2>nul
							%be_% /set !rcvuid! path \windows\system32\boot\winload.exe>nul 2>nul
							%be_% /set !rcvuid! locale en-US >nul 2>nul
							if exist %%A\Windows\!sys32!\%mui1%\winload.exe.mui %be_% /set !rcvuid! locale %mui1% >nul 2>nul
							%be_% /set !rcvuid! inherit {bootloadersettings}>nul 2>nul
							%be_% /set !rcvuid! displaymessage Recovery>nul 2>nul
							%be_% /set !rcvuid! displaymessageoverride Recovery>nul 2>nul
							%be_% /set !rcvuid! osdevice ramdisk=[!p62p2!]!redir!\winre.wim,!ramuid!>nul 2>nul
							%be_% /set !rcvuid! systemroot \windows>nul 2>nul
							%be_% /set !rcvuid! nx optin>nul 2>nul
							%be_% /set !rcvuid! bootmenupolicy Standard>nul 2>nul
							%be_% /set !rcvuid! winpe yes>nul 2>nul
							%be_% /set {default} recoveryenabled Yes>nul 2>nul
							%be_% /set {default} recoverysequence !rcvuid!>nul 2>nul
							if "!ramdir!" neq "" %be_% /set !ramdir! recoverysequence !rcvuid!>nul 2>nul
							if "!ramdir!" neq "" %be_% /set !ramdir! recoveryenabled Yes>nul 2>nul
							set remsg=Yes))))
				set /a p62t=1&set p62=!actp!:&set p62p2=boot)

			if  /i "!remsg!" equ "Yes" (del 1.tmp>nul 2>nul
				%be_% /enum all 2>nul|find /i "identifier" >%tmpfile% 2>nul&&(
					for /f "tokens=2" %%i in (%tmpfile%) do (find /i "%%i" retmp>nul 2>nul||echo %%i >>1.tmp)
					for /f %%i in (1.tmp) do (%be_% /enum %%i 2>nul|find /i "!redir!">nul 2>nul&&%be_% /delete %%i /f>nul 2>nul)))

			echo.&echo        %msg301% = !OSL! - !OSLFIX! ; WinRE - !remsg! !mbm!
			echo.&echo        %%A - !wtype! - %msg012%) else (echo.&echo        %%A - !wtype! - %msg013%&set nt6fixerr=%%A !nt6fixerr!)
		del %%A\windows\!sys32!\chz_fix.dll>nul 2>nul )

	set Para1=&set /a nt5system=0&set /a gg5=0
	set /a currentos=0&set OSLFIX=%msg113%
	set reg_=REG QUERY "HKU\TEMP\Microsoft\Windows NT\CurrentVersion"&set reg2=reg&set OSL=?&set sys32=system32
	dir %%A\disk2\chz\chz*.* /a >nul 2>nul||(
		dir %%A\winnt\!sys32!\winload.exe /a >nul 2>nul||(
			dir %%A\winnt\!sys32!\ntoskrnl.exe /a >nul 2>nul&&(if exist %%A\winnt\!sys32!\config\Software (
			set /a nt5system=1&set wtype=Microsoft windows 2000 !bit!
			set Parameter=/FASTDETECT&set wdir=winnt
			if /i "%%A\winnt" equ "%systemroot%" set /a currentos=1)))

		if !nt5system! equ 0 dir %%A\windows\!sys32!\winload.exe /a >nul 2>nul||(
			dir %%A\windows\!sys32!\ntoskrnl.exe /a >nul 2>nul&&(if exist %%A\windows\!sys32!\config\Software (
				set /a nt5system=1&set wtype=Microsoft Windows XP or 2003 !bit!
				set Parameter=/NOEXECUTE=OPTIN /FASTDETECT&set wdir=windows
				if /i "%%A\windows" equ "%systemroot%" set /a currentos=1))))
 	if !currentos! equ 1 (set reg_=REG QUERY "HKLM\Software\Microsoft\Windows NT\CurrentVersion"&set reg2=echo
		set OSL=!DR!:&if exist %systemroot%\syswow64 set sys32=sysnative)
	if %gpt% equ 0 if !nt5system! equ 1 (set bit=x86&dir %%A\!wdir!\syswow64 /ad>nul 2>nul&&set bit=x64
		call :wtypeget
		if !hfix! equ 1 chzdp %%A&&(echo. &echo        %%A - !wtype! - %msg013%&set nt5fixerr=%%A !nt5fixerr!)||(
		set /a dp=!errorlevel!
		set wtype5=!wtype!
		set nt5fixok=%%A !nt5fixok!
		if !currentos! equ 0 (if /i "!wdir!" equ "windows" (
			%rlt% !DR!:\!wdir!\system32\Config\system >nul 2>nul&&(
			%rqt%\setup /v SetupType 2>nul|find "1">nul&&(set Para1= /DETECTHAL&set /a g5=1&set /a gg5=1&set wtype=G !wtype!)
			%rut% >nul 2>nul)))
		call :os1fix
		if !dp! gtr 99 (set /a D=!dp:~0,-2!) else (set /a D=0)
		set /a P=!dp!-100*!D!
		for /l %%1 in (!d!,1,!d!) do (set /a r_d=!disk%%1!)
		set defau=multi^(0^)disk^(0^)rdisk^(!r_d!^)partition^(!P!^)\!wdir!
		echo !defau!="!wtype!    " !Parameter!!Para1!>>bootini1.tmp
		echo !defau!>>bootini2.tmp
		set /a nt5fix=!nt5fix!+1
		echo.&echo        %msg301% = !OSL! - !OSLFIX!
		echo.&echo        %%A - !wtype! - %msg012%
))))

if %nt5fix% equ 1 set msg914="%wtype5%"
set msg014=%msg114%%msg914%%msg314%&set pbrfix=None&set mbrfix=No

set /a bk2=0
:rebackup2
set /a bk2=%bk2%+1
dir !actp!:\ntldr.%bk2% /a>nul 2>nul&&goto rebackup2
if !nt5fix! neq 0 (
	set /a bootaa=0
	for /f "delims=" %%1 in (bootini1.tmp) do (set /a bootaa=!bootaa+1&set bootbb!bootaa!=%%1)
	del bootini1.tmp>nul 2>nul
	for /l %%1 in (!bootaa!,-1,1) do (echo !bootbb%%1!>>bootini1.tmp)
	set /a bootaa=0
	for /f "delims=" %%1 in (bootini2.tmp) do (set /a bootaa=!bootaa+1&set bootbb!bootaa!=%%1)
	del bootini2.tmp>nul 2>nul
	for /l %%1 in (!bootaa!,-1,1) do (echo !bootbb%%1!>>bootini2.tmp)
	attrib -r -h -s !actp!:\ntldr >nul 2>nul&ren !actp!:\ntldr ntldr.!bk2! >nul 2>nul
	attrib -r -h -s !actp!:\ntdetect.com >nul 2>nul
	attrib -r -h -s !actp!:\bootfont.bin >nul 2>nul
	copy /y ntldr !actp!:\ >nul 2>nul
	copy /y ntdetect.com !actp!:\ >nul 2>nul
	copy /y bootfont.bin !actp!:\ >nul 2>nul
	attrib +r +h +s !actp!:\ntldr >nul 2>nul
	attrib +r +h +s !actp!:\ntdetect.com >nul 2>nul
	attrib +r +h +s !actp!:\bootfont.bin >nul 2>nul
	echo [boot loader]>bootini.tmp&echo default=!defau!>>bootini.tmp
	echo timeout=^6>>bootini.tmp&echo [operating systems]>>bootini.tmp
	for /f "delims=" %%1 in (bootini1.tmp) do (echo %%1>>bootini.tmp)
	if exist !actp!:\boot.ini (
		attrib -r -h -s !actp!:\boot.ini>nul 2>nul
		copy /y !actp!:\boot.ini !actp!:\boot!bk1!.ini>nul 2>nul
		copy /y !actp!:\boot.ini bootini.1.tmp>nul 2>nul
		for /f "delims=" %%1 in (bootini2.tmp) do (
			set /a bbb=!bbb!+1&set /a cc=!bbb!+1 &find /v /i "%%1" bootini.!bbb!.tmp >bootini.!cc!.tmp 2>nul )
		for /f "delims=" %%1 in (bootini.!cc!.tmp) do echo %%1 |find /i "multi">nul 2>nul&&echo %%1>>bootini3.tmp
		if exist bootini3.tmp (for /f "delims=" %%1 in (bootini3.tmp) do (echo %%1 | find /i "default">nul 2>nul||echo %%1>>bootini4.tmp))
		for /f "delims=" %%1 in (bootini.!cc!.tmp) do echo %%1 | find /i "C:">nul 2>nul&&echo %%1>>bootini4.tmp
		if exist bootini4.tmp (for /f "delims=" %%1 in (bootini4.tmp) do echo %%1>> bootini.tmp)
		del !actp!:\boot.ini>nul )
	copy /y bootini.tmp !actp!:\boot.ini>nul 2>nul
	attrib +h +s !actp!:\boot.ini>nul 2>nul

	if %nt6fix% neq 0 (call :addnt5
		if !pe! equ 1 (bs /nt60 !actp!: /mbr>nul 2>nul &set pbrfix=NT6 &set mbrfix=Yes)
		if !wver! equ 5 (bs /nt60 !actp!:>nul 2>nul &set pbrfix=NT6 ))
	if %nt6fix% equ 0 (
		if %handfix% equ 1 if exist %actp%:%bcdpath% call :addnt5
		if %pe% equ 1 bs /nt52 %actp%: /mbr>nul 2>nul &set pbrfix=NT5 &set mbrfix=Yes)
	)

if %nt5fix% equ 0 (
	if %nt6fix% neq 0  (
		if !pe! equ 1 (bs /nt60 !actp!: /mbr>nul 2>nul&set pbrfix=NT6 &set mbrfix=Yes)
		if !wver! equ 5 (bs /nt60 !actp!:>nul 2>nul&set pbrfix=NT6
			if !pe! equ 0 call :addnt5))
	if %nt6fix% equ 0  (
		if exist %actp%:%bcdpath%%bk% if not exist %actp%:%bcdpath% ren %actp%:%bcdpath%%bk% BCD>nul 2>nul
		if exist %actp%:%bcdpath%%bk% if exist %actp%:%bcdpath% del %actp%:%bcdpath%%bk% >nul 2>nul)
	)

if exist %actp%:%bcdpath% (
	if exist !actp!:%bcdpath:~0,-3%%mui1%\%bootmgrmui% %be_% /set {bootmgr} locale %mui1%>nul 2>nul
	if exist !actp!:%bcdpath:~0,-3%%mui1%\%memmui% (
		%be_% /set {memdiag} locale %mui1%>nul 2>nul
		if /i "%mui1:~0,3%" equ "zh-" %be_% /set {memdiag} description "%msg414%">nul 2>nul)
	%be_% /deletevalue {bootmgr} path>nul 2>nul
	%be_% /set {memdiag} device boot>nul 2>nul
	%be_% /timeout 6 >nul 2>nul )

if %pe% equ 1 if exist %actp%:%bcdpath%%bk% if not exist %actp%:%bcdpath% ren %actp%:%bcdpath%%bk% BCD>nul 2>nul

attrib -r -h -s %actp%:%bcdpath%%bk%.log*>nul 2>nul
del %actp%:%bcdpath%%bk%.log*>nul 2>nul

del *.tmp>nul 2>nul&echo.&echo.&echo.
if %mode1% equ 1 (for /l %%1 in (1,1,99) do (consext /pos 0 22&echo %msg015%  %%1 %%%&ConsExt /sleep 15))
if %mode1% equ 0 (echo %msg015%&ConsExt /sleep 2000)

if "%nt5fixerr%" equ "" set nt5fixerr=%msg016%
if "%nt6fixerr%" equ "" set nt6fixerr=%msg016%
if %nt5fix% equ 0 set nt5fixok=%msg016%
if %nt6fix% equ 0 set nt6fixok=%msg016%
if exist %actp%:\boot%bk1%.ini set msg019=%msg019% %actp%:\BOOT%bk1%.INI
if exist %actp%:%bcdpath%%bk% set msg020=%msg020% %actp%:%bcdpath%%bk%
cls
call :enter3
echo.
echo         NT5.x %msg018% - !nt5fixerr! ;    %msg017% - !nt5fixok!
echo.
echo               %msg019%
echo.
echo         NT6.x %msg018% - !nt6fixerr! ;    %msg017% - !nt6fixok!
echo.
echo               %msg020%
echo.
echo         %msg040% - !pbrfix! ;    %msg041% - !mbrfix!

echo.&if %addnt5m% equ 1 (echo         %msg014%) else echo.

echo.
echo    ---------------------------------------------------------------------------
echo.
echo.
echo            %msg021%
:mousef
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 goto end
if %xy% equ 49 if exist !actp!:\boot.ini (start notepad !actp!:\boot.ini >nul 2>nul &ConsExt /sleep 150)
if %xy% equ 50 goto end
if %xy% equ 51 goto mousef3

if %xy% lss 1001 goto mousef
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 19 goto mousef
if %x% gtr 36 if %x% lss 45 goto end
if %x% gtr 13 if %x% lss 31 if exist !actp!:\boot.ini (start notepad !actp!:\boot.ini >nul 2>nul &ConsExt /sleep 150)
if %x% gtr 50 if %x% lss 68 goto mousef3
goto mousef

:mousef3
if exist !actp!:%bcdpath% %be_% /enum all >%tmpfile% 2>nul&&(
	start notepad %tmpfile% >nul 2>nul &ConsExt /sleep 100 )
goto mousef

:unknow_err
cls&call :enter5&call :enter4
echo             %msg022% %unknow%
echo.
echo.
echo            -----------------------------------------------------------
echo.
echo.
echo                                 %msg046%
:mouse2
ConsExt /event
set /a xy=%errorlevel%
if %xy% equ 27 goto end
if %xy% equ 96 goto end
if %xy% equ 48 goto end
if %xy% lss 1001 goto mouse2
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 15 goto mouse2
if %x% gtr 34 if %x% lss 45 goto end
goto mouse2

:end
if "%efivol%" neq "" mv %efivol%: /d>nul 2>nul
echo rd NTaufix /s/q^>nul 2^>nul>..\NTaufix.cmd
cd..
NTaufix.cmd
exit /b

:enter5
echo.
:enter4
echo.
:enter3
echo.
echo.
echo.
exit /b 0

:BCD_err
set msg914="Earlier Version of Windows"
if /i "%mui1:~0,3%" equ "zh-" call :cnset
set msg002=%msg0021%
color 2f
cls
echo.
echo.
echo    %msg001%%wtype%  { %msg101%%actp%: }
echo.
echo    %msg024%
echo.
echo    %msg025%
echo.
echo    %msg026%
echo.
echo    %msg027%
echo.
echo    %msg028%
echo.
echo   %msg061%
echo.
echo     %msg029%
echo.
echo     %msg030%
echo.
echo   %msg061%
echo.
echo              %msg031%
:mouse3
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 49 goto bcderrfix
if %xy% equ 50 call :advance1&&goto BCD_err||goto start
if %xy% equ 51 goto end
if %xy% equ 27 goto end
if %xy% lss 1001 goto mouse3
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 22 goto mouse3
if %x% gtr 15 if %x% lss 28 goto bcderrfix
if %x% gtr 33 if %x% lss 46 call :advance1&&goto BCD_err||goto start
if %x% gtr 51 if %x% lss 64 goto end
goto mouse3

:bcderrfix
for /l %%1 in (0,1,3) do (reg unload HKLM\BCD0000000%%1 >nul 2>nul )
attrib -r -h -s !actp!:%bcdpath% >nul 2>nul
copy /y !actp!:%bcdpath% !actp!:%bcdpath%!bk! >nul 2>nul&&(
	be /import !actp!:%bcdpath%!bk! >nul 2>nul&&set /a bcdfix=1||(call :fix1&&set /a bcdfix=1||set unknow=3))||set unknow=3
if %bcdfix% equ 0 (goto unknow_err) else goto begin1

:fix1
if exist %tmpfile% del %tmpfile%>nul 2>nul
be /createstore %tmpfile%>nul 2>nul
be /import %tmpfile%>nul 2>nul&&exit /b 0||exit /b 1

:addnt5
if %addnt5m% equ 1 exit /b 0
%be_% /create {ntldr} /d !msg914!>nul 2>nul
%be_% /set {ntldr} device boot>nul 2>nul&&set /a addnt5m=1||exit /b 0
%be_% /set {ntldr} path \ntldr>nul 2>nul
%be_% /set {ntldr} description !msg914!>nul 2>nul
%be_% /displayorder {ntldr} /addlast>nul 2>nul
exit /b 0

:menudrive
cls
call :enter5
echo    %msg002%
echo.
echo    ---------------------------------------------------------------------------
echo.
echo     %msg003%
echo.
echo     %msg004%
echo.
echo     %msg104%
echo.
echo     %msg204%
echo.&echo.
echo                                                                %msg123%

set actpM=
:mouse0
ConsExt /event
set /a xy=%errorlevel%
if %xy% equ 27 exit /b 1
if %xy% equ 96 exit /b 1
if %xy% equ 48 exit /b 1
:mdr
if %xy% gtr 64 if %xy% lss 91 (set /a xy=!xy!-64&for /l %%1 in (!xy!,1,!xy!) do set actpM=!alldrive:~%%1,1!&exit /b 0)
if %xy% lss 1000 goto mouse0
set /a x=!xy:~0,-3!
set /a y=%xy%-1000*%x%
if %y% equ 18 if %x% gtr 65 if %x% lss 76 exit /b 1
set /a xyx=0&set /a xyy=0
if %x% gtr  6 if %x% lss 11 set /a xyx=1
if %x% gtr 19 if %x% lss 24 set /a xyx=2
if %x% gtr 32 if %x% lss 37 set /a xyx=3
if %x% gtr 45 if %x% lss 50 set /a xyx=4
if %x% gtr 58 if %x% lss 63 set /a xyx=5
if %x% gtr 71 if %x% lss 76 set /a xyx=6
if %xyx% equ 0 goto mouse0
if %y% equ  9 set /a xyy=1
if %y% equ 11 set /a xyy=2
if %y% equ 13 set /a xyy=3
if %y% equ 15 set /a xyy=4
if %xyy% equ 0 goto mouse0
set /a xy=%xyy%*6+%xyx%+60&goto mdr

:os1fix
if %currentos% equ 1 (set rlt1=echo&set rqt1=reg query HKLM\system&set rat1=reg add HKLM\system) else (
	set rlt1=%rlt%&set rqt1=%rqt%&set rat1=%rat%)
if exist %tmpfile% attrib -r -h -s %tmpfile% >nul 2>nul &del %tmpfile% /q >nul 2>nul
set volume=&set data1=
%rlt1% %DR%:\%wdir%\system32\Config\SYSTEM>nul 2>nul||goto os1end
if "%vertype:~0,1%" equ "6" (
	%rqt1%\select /v default>%tmpfile%.2 2>nul&&(
		for /F "tokens=3" %%i in (%tmpfile%.2) do (set data1=%%i)
		set data1=ControlSet00!data1:~2,1!\services
		%rqt1%\!data1!\msahci /v Type>nul 2>nul&&(
			%rat1%\!data1!\amdsata /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\amdsbs /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\amdxata /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\iaStorV /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\msahci /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\nvraid /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\nvstor /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\atapi /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\aliide /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\amdide /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\cmdide /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\intelide /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\pciide /v Start /t REG_DWORD /d 0x0 /f>nul 2>nul)
		%rqt1%\!data1!\storahci /v Type>nul 2>nul&&(
			%rat1%\!data1!\amdsata\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\amdsbs\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\amdxata\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\iaStorV\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\storahci\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\nvraid\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\nvstor\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\atapi\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\intelide\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul
			%rat1%\!data1!\pciide\StartOverride /v 0 /t REG_DWORD /d 0x0 /f>nul 2>nul)))
set data1=
if %currentos% equ 1 (set OSLFIX=%msg112%&exit /b 0)
if "%OSL%" equ "?" goto os1end
set volume=\DosDevices\%DR%:
if %gpt% equ 1 goto oslbegin
%rdt%\setup /v %bd%%ss% /f >nul 2>nul
bschk /nt60 %DR%: 2>nul|find "\\?" >%tmpfile% 2>nul||goto os1end
for /f "tokens=2 delims=?^)" %%i in (%tmpfile%) do (set volume=%%i)
set volume=\??!volume!
:oslbegin
reg query HKLM\SYSTEM\MountedDevices /v !volume! 2>nul|find /i "!volume!">%tmpfile% 2>nul||goto os1end
for /F "tokens=3" %%i in (%tmpfile%) do (set data1=%%i)
set data2=%data1:~0,8%
%rat%\MountedDevices /f >nul
%rqt%\MountedDevices 2>nul|find /i "!data1!" |find /i "\DosDevices\" >%tmpfile% 2>nul&&(
	for /f "tokens=1" %%i in (%tmpfile%) do (%rdt%\MountedDevices /v %%i /f >nul 2>nul))
%rat%\MountedDevices /v \DosDevices\%OSL% /t REG_BINARY /d !data1! /f >nul 2>nul
%rqt%\MountedDevices 2>nul| find /i "\DosDevices\%OSL%" | find /i "!data1!" >nul 2>nul||goto os1end
set OSLFIX=%msg012%&set volume=&set data1=
if %gg5% equ 0 goto os1end
set /a dok=0
for %%B in (C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
if !dok! equ 0 (if /i "%%B" neq "%actp%:" (if /i "%%B" neq "%systemroot:~0,2%" (dir %%B\windows /ad>nul 2>nul||(
md %%B\1234abcd.tmp>nul 2>nul&&(rd %%B\1234abcd.tmp>nul 2>nul
bschk /nt60 %%B 2>nul|find "\\?">%tmpfile% 2>nul&&(
	for /f "tokens=2 delims=?^)" %%i in (%tmpfile%) do (set volume=%%i)
	set volume=\??!volume!
	reg query HKLM\SYSTEM\MountedDevices /v !volume! 2>nul|find /i "!data2!">%tmpfile% 2>nul&&(
		for /F "tokens=3" %%i in (%tmpfile%) do (set data1=%%i)
		%rdt%\MountedDevices /v \DosDevices\D: /f >nul 2>nul
		%rat%\MountedDevices /v \DosDevices\D: /t REG_BINARY /d !data1! /f >nul 2>nul
		set /a dok=1))))))))
:os1end
%rut%>nul 2>nul&del %tmpfile% >nul 2>nul&exit /b 0

:wtypeget
set /a gettypeerr=0&set /a hfix=1&set msg056=%msg156%&set /a metroc=0
%reg2% load HKU\TEMP %DR%:\%wdir%\system32\Config\software>nul 2>nul||set /a gettypeerr=1
%reg_% /v CurrentVersion 2>nul|find /i "CurrentVersion">%tmpfile% 2>nul&&(for /f "tokens=2*" %%a in (%tmpfile%) do set vertype=%%b)
if "!vertype!" equ "6.2" (
	%reg_% /v BuildLabEx 2>nul|find /i "BuildLabEx">%tmpfile% 2>nul&&(for /f "tokens=3 delims=." %%a in (%tmpfile%) do set build=%%a)
	set msg056=%msg156%%msg256%
	if %handfix% equ 1 set /a metroc=1)
%reg_% /v ProductName 2>nul|find /i "ProductName">%tmpfile% 2>nul&&(for /f "tokens=2*" %%a in (%tmpfile%) do set wtype=%%b %bit%)||set /a gettypeerr=1
if %currentos% equ 0 (%reg_% /v PathName 2>nul|find /i "PathName">%tmpfile% 2>nul&&(for /f "delims=:" %%a in (%tmpfile%) do set OSL=%%a
	set OSL=!OSL:~-1,1!:)||set /a gettypeerr=1)
%reg2% unload HKU\TEMP >nul 2>nul
if %handfix% equ 0 echo.&echo  %DR%: - %wtype%%msg011%
if %handfix% equ 0 exit /b 0
echo.&echo   %msg055%
echo.&echo    %DR%: - %wtype%
echo.&echo        %msg056%
echo.
:mousehand
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 goto hand2
if %xy% equ 49 goto hand1
if %xy% equ 50 goto hand2
if %metroc% equ 1 if %xy% equ 51 goto hand3
if %xy% lss 1001 goto mousehand
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
set /a hline1=%hline%-1
if %y% equ %hline% goto handin
if %y% equ %hline1% goto handin
goto mousehand
:handin
if %x% gtr 9 if %x% lss 22 goto hand1
if %x% gtr 27 if %x% lss 40 goto hand2
if %metroc% equ 1 if %x% gtr 45 if %x% lss 75 goto hand3
goto mousehand
:hand1
set /a metroc=0
if %mode1% equ 0 set /a hline=!hline!+12
set /a hfix=1&echo        %DR%: - %msg057%&exit /b 0
:hand2
if %mode1% equ 0 set /a hline=!hline!+8
set /a hfix=0&echo        %DR%: - %msg058%&exit /b 1
:hand3
if %mode1% equ 0 set /a hline=!hline!+12
set /a hfix=1&echo        %DR%: - %msg057%&exit /b 0

:advance1
cls
echo.
echo.
echo         %msg005%
echo.
echo                     ----------------------------------------
echo.
echo                         %msg043%
echo.
echo.
echo                         %msg044%
echo.
echo.
echo                         %msg045%
echo.
echo.
echo                         %msg145%
echo.
echo.
echo                         %msg245%
echo.
echo                     ----------------------------------------
echo.
echo                                             %msg046%
:mouseadv
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 exit /b 0
if %xy% equ 48 exit /b 0
if %xy% equ 49 goto changeact
if %xy% equ 50 call :rewritemp&goto :advance1
if %xy% equ 51 call :changeosl&goto :advance1
if %xy% equ 52 call :bcdmanager&goto :advance1
if %xy% equ 53 call :changeinter&&exit /b 0||goto :advance1
if %xy% lss 1001 goto mouseadv
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% equ  6 if %x% gtr 26 if %x% lss 55 goto changeact
if %y% equ  9 if %x% gtr 26 if %x% lss 55 call :rewritemp&goto :advance1
if %y% equ 12 if %x% gtr 26 if %x% lss 55 call :changeosl&goto :advance1
if %y% equ 15 if %x% gtr 26 if %x% lss 55 call :bcdmanager&goto :advance1
if %y% equ 18 if %x% gtr 26 if %x% lss 55 call :changeinter&&exit /b 0||goto :advance1
if %y% equ 22 if %x% gtr 46 if %x% lss 57 exit /b 0
goto mouseadv

:changeact
call :menudrive||exit /b 0
call :actpMchk||goto changeact
set msg009=%msg609%&set msg000=%msg100%&set msg101=%msg201%
set actp=%actpM%&set /a pe=1&set /a retu=0&exit /b 1

:changeosl
set msg002=%msg102%

call :menudrive||exit /b 0
set drive1=%actpM%
set oserrmsg2=!msg252:D1=%drive1%!
set oserrmsg3=!msg352:D1=%drive1%!
set osendmsg=%osendmsg1%
set /a currentos=0
if /i "%drive1%:\windows" equ "%systemroot%" set /a currentos=1
if %currentos% equ 1 (set osendmsg=%oserrmsg1%&goto osend)

dir %drive1%:\windows\system32\config\system /a >nul 2>nul&&goto os11
set osendmsg=%oserrmsg2%&goto osend

:os11
color 1f&set osendmsg=%osendmsg1%
set msg002=!msg452:D1=%drive1%!
call :menudrive||(color 2f&exit /b 0)
set drive2=%actpM%

color 2f
cls
call :enter4
call :enter4
set msg952=!msg552:D1=%drive1%!
set msg952=!msg952:D2=%drive2%!
echo        %msg952%
call :enter4
echo    ---------------------------------------------------------------------------
call :enter3
echo                       %msg032%
:mousea
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 exit /b 0
if %xy% equ 49 goto os0
if %xy% equ 50 exit /b 0
if %xy% lss 1001 goto mouse3
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 17 goto mousea
if %x% gtr 24 if %x% lss 35 goto os0
if %x% gtr 48 if %x% lss 59 exit /b 0
goto mousea

:os0
if exist %tmpfile% attrib -r -h -s %tmpfile% >nul 2>nul &del %tmpfile% /q >nul 2>nul
set volume=&set data1=
if %currentos% equ 1 goto osf
if %gpt% equ 0 bschk /nt60 %drive1%: 2>nul|find "\\?" >%tmpfile% 2>nul&&(
	for /f "tokens=2 delims=?^)" %%i in (%tmpfile%) do (set volume=%%i)
	set volume=\??!volume!)||(set osendmsg=%oserrmsg4%&goto osend)

if %gpt% equ 1 set volume=\DosDevices\%drive1%:

reg query HKLM\SYSTEM\MountedDevices /v !volume! 2>nul|find /i "!volume!">%tmpfile% 2>nul||(set osendmsg=%oserrmsg4%&goto osend )
for /F "tokens=3" %%i in (%tmpfile%) do (set data1=%%i)
%rlt% %drive1%:\windows\system32\Config\SYSTEM  >nul 2>nul||(set osendmsg=%oserrmsg3%&goto osend )
%rat%\MountedDevices /f >nul
%rqt%\MountedDevices 2>nul|find /i "!data1!" |find /i "\DosDevices\" >%tmpfile% 2>nul&&(
	for /f "tokens=1" %%i in (%tmpfile%) do %rdt%\MountedDevices /v %%i /f >nul 2>nul)
%rat%\MountedDevices /v \DosDevices\%drive2%: /t REG_BINARY /d !data1! /f >nul 2>nul
%rqt%\MountedDevices 2>nul|find /i "\DosDevices\%drive2%:"|find /i "!data1!" >nul 2>nul||(set osendmsg=%oserrmsg4%&goto osend )
goto osend

:osf
set /a currentos=0

if %gpt% equ 0 bschk /nt60 %drive1%: 2>nul|find "\\?" >%tmpfile% 2>nul&&(
	for /f "tokens=2 delims=?^)" %%i in (%tmpfile%) do (set volume=%%i)
	set volume=\??!volume!)||(set osendmsg=%oserrmsg4%&goto osend)

if %gpt% equ 1 set volume=\DosDevices\%drive1%:

reg query HKLM\SYSTEM\MountedDevices /v !volume! 2>nul|find /i "!volume!">%tmpfile% 2>nul||(set osendmsg=%oserrmsg4%&goto osend )
for /F "tokens=3" %%i in (%tmpfile%) do (set data1=%%i)
reg query HKLM\SYSTEM\MountedDevices 2>nul|find /i "!data1!"|find /i "\DosDevices\" >%tmpfile% 2>nul&&(
	for /f "tokens=1" %%i in (%tmpfile%) do reg delete HKLM\SYSTEM\MountedDevices /v %%i /f >nul 2>nul)
reg add HKLM\SYSTEM\MountedDevices /v \DosDevices\%drive2%: /t REG_BINARY /d !data1! /f >nul 2>nul
reg query HKLM\SYSTEM\MountedDevices 2>nul|find /i "\DosDevices\%drive2%:"|find /i "!data1!" >nul 2>nul||(set osendmsg=%oserrmsg4%&goto osend)

:osend
%rut%>nul 2>nul
del %tmpfile%>nul 2>nul
cls
call :enter4
call :enter5
echo             %osendmsg%
echo.
echo.
echo            -----------------------------------------------------------
call :enter4
if %currentos% equ 0 (
echo                                    %msg046%
) else (
echo                                    %msg046%     %msg146%
)
:mouseb
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 exit /b 0
if %xy% equ 48 exit /b 0
if %currentos% equ 1 if %xy% equ 49 goto os11
if %xy% lss 1001 goto mouseb
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 17 goto mouseb
if %x% gtr 37 if %x% lss 48 exit /b 0
if %currentos% equ 1 if %x% gtr 56 if %x% lss 67 goto os11
goto mouseb

:rewritemp
if "%mpp%" equ "" set mpp=%actp%
set msgbs=%msg035%
:rewritemp1
cls
echo.
echo.
echo   %msg005%
call :enter4
echo                      %msg509%%mpp% - %msg709%
echo.
echo                     ----------------------------------------
echo.
echo                         %msg047%
echo.
echo.
echo                         %msg048%
echo.
echo.
echo                         %msg049%
echo.
echo                     ----------------------------------------
echo.
echo                                             %msg046%
:mousermp
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 exit /b 0
if %xy% equ 48 exit /b 0
if %xy% equ 49 goto bsmpp
if %xy% equ 50 goto bsnt52
if %xy% equ 51 goto bsnt60
if %xy% equ 52 goto bsmbr
if %xy% lss 1001 goto mousermp
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% equ  7 if %x% gtr 46 if %x% lss 58 goto bsmpp
if %y% equ 11 if %x% gtr 26 if %x% lss 55 goto bsnt52
if %y% equ 14 if %x% gtr 26 if %x% lss 55 goto bsnt60
if %y% equ 17 if %x% gtr 26 if %x% lss 55 goto bsmbr
if %y% equ 21 if %x% gtr 46 if %x% lss 57 exit /b 0
goto mousermp

:bsmpp
set msg002=%msg202%
call :menudrive||goto rewritemp1
set mpp=%actpM%&goto rewritemp1

:bsnt52
set msgbs1=%msg209%
call :bsendf
if exist %mpp%:\ntldr (bs /nt52 %mpp%: >nul 2>nul&&set msgbs=%msg034%) else (set msgbs=%msg036%)
goto bsend

:bsnt60
set msgbs1=%msg309%
call :bsendf
bs /nt60 %mpp%: >nul 2>nul&&set msgbs=%msg034%
goto bsend

:bsmbr
set msgbs1=%msg409%
call :bsendf
bsmbr /nt60 %mpp%: /mbr >nul 2>nul&&set msgbs=%msg034%

:bsend
echo            %msgbs%
call :enter3
echo       ---------------------------------------------------------------------
echo.
echo.
echo                                 %msg046%
:mousebs
ConsExt /event
set /a xy=%errorlevel%
if %xy% equ 27 exit /b 0
if %xy% equ 96 exit /b 0
if %xy% equ 48 exit /b 0
if %xy% lss 1001 goto mousebs
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 16 goto mousebs
if %x% gtr 34 if %x% lss 45 exit /b 0
goto mousebs

:bsendf
cls&call :enter3&call :enter4
echo       %mpp%: - %msgbs1%
echo.
exit /b 0


:actpMchk
set /a bkpmc=0
:repmc
set /a bkpmc=%bkpmc%+1
dir %actpM%:\NTBOOTautofix%bkpmc%.tmp /a >nul 2>nul&&goto repmc
md %actpM%:\NTBOOTautofix%bkpmc%.tmp>nul 2>nul||exit /b 1
rd %actpM%:\NTBOOTautofix%bkpmc%.tmp>nul 2>nul&exit /b 0


:bcdmanager
del %tmpfile%>nul 2>nul&del %tmpfile%.a>nul 2>nul&del %tmpfile%.b>nul 2>nul&del %tmpfile%.c>nul 2>nul&cls&set /a num=0&set deftmp=
set sid0={bootmgr}&set des0=Windows Boot Manager
%be_% /enum {bootmgr}>%tmpfile% 2>nul&&(
	find /i "displayorder            {" %tmpfile% 2>nul|find /i "}">%tmpfile%.a&&(
		for /f "tokens=2" %%i in (%tmpfile%.a) do echo .%%i>%tmpfile%.b
		find /i "                        {" %tmpfile%|find /i "}">>%tmpfile%.b
		for /f "tokens=2 delims={}" %%i in (%tmpfile%.b) do (
			set /a num=!num!+1
			set sid!num!={%%i}
			set des!num!=
			%be_% /enum {%%i} 2>nul|find /i "description">%tmpfile%.c 2>nul&&(
				%be_% /enum {bootmgr} 2>nul|find /i "default  ">%tmpfile%.b 2>nul&&(
					for /f "tokens=2 delims={}" %%i in (%tmpfile%.b) do set deftmp={%%i})
				for /f "delims=" %%i in (%tmpfile%.c) do (
					set des=%%i&set des!num!=!des:~24,50!
					if "!des:~74,1!" neq "" set des!num!=!des:~24,47!...))
			)))

if not exist %tmpfile%.c (set msgbmm=%msg051%&call :bmretn&exit /b 0)
:bm1
cls
if %mode1% equ 1 (mode con cols=80 lines=25&set /a bmlines=%num%*2+11&if !bmlines! gtr 25 mode con cols=80 lines=!bmlines!)
echo.&echo.&echo     %msg038%
echo.&echo     %msg338% 00 # "%des0%"
echo.&echo   ----------------------------------------------------------------------------
for /l %%1 in (1,1,!num!) do (
	set num1=!alldrive:~%%1,1!
	set c=_
	if "%deftmp%" equ "!sid%%1!" set c=*
	set bmmsg=%msg152:D1=!num1!%
	set /a xh=100+%%1&set xh=!xh:~1,2!
	echo.&echo     !bmmsg! !xh! !c! "!des%%1!")
echo.&echo   %msg062%
:bm1k
:mousebm
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 goto bmend
if %xy% equ 48 goto bmend
if %xy% equ 49 if %gpt% equ 0 goto addn5
if %xy% equ 50 goto editbootini
if %xy% equ 51 (set /a choobm=0&goto bm)
if %xy% gtr 64 if %xy% lss 91 (set /a choobm=%xy%-64
	if !choobm! gtr %num% goto mousebm
	goto bm)
if %xy% lss 1000 goto mousebm
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% equ 2 (
	if %x% gtr  6 if %x% lss 17 goto bmend
	if %gpt% equ 0 if %x% gtr 22 if %x% lss 53 goto addn5
	if %x% gtr 58 if %x% lss 76 goto editbootini
	goto mousebm)
if %y% equ 4 if %x% gtr  6 if %x% lss 17 (set /a choobm=0&goto bm)
set /a choobm=0
if %x% gtr  6 if %x% lss 17 (
	for /l %%1 in (1,1,%num%) do (
		set /a choobm1=%%1*2+6
		if !choobm1! equ %y% set /a choobm=%%1))
if %choobm% equ 0 (goto mousebm) else goto bm

:editbootini
dir %actp%:\boot.ini /a>nul 2>nul||goto bm1k
attrib -r -h -s %actp%:\boot.ini>nul 2>nul
attrib +h +s %actp%:\boot.ini>nul 2>nul
start notepad %actp%:\boot.ini
ConsExt /sleep 150
goto bm1k

:addn5
%be_% /create {ntldr} /d %msg914%>nul 2>nul
%be_% /set {ntldr} device boot>nul 2>nul
%be_% /set {ntldr} path \ntldr>nul 2>nul
%be_% /set {ntldr} description !msg914!>nul 2>nul
%be_% /displayorder {ntldr} /addlast>nul 2>nul
%be_% /timeout 6 >nul 2>nul
goto bcdmanager

:bmend
if %mode1% equ 1 mode con cols=80 lines=25
cls&exit /b 0

:bm
cls
set /a bmsub0=4&set /a bmsub6=200&set /a bmsub7=200&set /a bmsub8=200&set /a bmsub9=200&set /a bmsubm=200&set /a bmsuba=200&set /a bmsubt=200
set /a time1=0&set /a bmsubm1=200
for /l %%1 in (%choobm%,1,%choobm%) do (set sidtmp=!sid%%1!&set destmp=!des%%1!
	%be_% /enum !sid%%1! >%tmpfile%.c 2>nul&&(
		if %mode1% equ 1 (mode con cols=80 lines=25&set /a aaa=1
			for /f "delims=" %%i in (%tmpfile%.c) do set /a aaa=!aaa!+1
			set /a aaa=!aaa!+6
			if !aaa! gtr 25 mode con cols=80 lines=!aaa!)
		echo.&echo      %%1 _ "!des%%1!"&echo.
		if %choobm% neq 0 echo     %msg039%
		if %choobm% equ 0 echo     %msg139%
		echo.
		for /f "delims=" %%i in (%tmpfile%.c) do (
			set /a bmsub0=!bmsub0!+1&set bmlist=%%i
			if "!bmlist:~70,1!" neq "" set bmlist=!bmlist:~0,67!...
			if /i "%%i" equ "loadoptions             DDISABLE_INTEGRITY_CHECKS" (set /a bmsub6=!bmsub0!&set bmlist=%%i %msg053%)
			if /i "%%i" equ "nointegritychecks       Yes" (set /a bmsub7=!bmsub0!&set bmlist=%%i %msg153%)
			if /i "!bmlist:~0,25!" equ "recoverysequence        {" (set /a bmsub8=!bmsub0!&set bmlist=%%i %msg253%
				set bmsubsid8=!bmlist:~24,38!)
			if /i "!bmlist:~0,25!" equ "resumeobject            {" (set /a bmsub9=!bmsub0!&set bmlist=%%i %msg353%
				set bmsubsid9=!bmlist:~24,38!)
			if /i "!bmlist:~0,7!" equ "locale " (set /a bmsuba=!bmsub0!&set bmlist=!bmlist!          &set bmlist=!bmlist:~0,35! %msg453%)
			if /i "!bmlist:~0,8!" equ "timeout " (set /a bmsubt=!bmsub0!&set /a time1=!bmlist:~24,3!
				set bmlist=!bmlist!                &set bmlistt=!bmlist:~0,24!&set bmlist=!bmlist:~0,35! %msg553%)
			if /i "%%i" equ "bootmenupolicy          Legacy" (set /a bmsubm1=!bmsub0!&set /a bmsubm=1&set bmlist=%%i %msg853%  %msg653%)
			if /i "%%i" equ "bootmenupolicy          Standard" (set /a bmsubm1=!bmsub0!&set /a bmsubm=0&set bmlist=%%i %msg753%%msg653%)
			echo      !bmlist!)
	)||goto bm1)
:mousebm2
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 goto bm1
if %xy% equ 48 goto bm1
if %choobm% neq 0 (
if %xy% equ 49 goto bmup
if %xy% equ 50 goto bmdown
if %xy% equ 51 goto bmrename
if %xy% equ 52 goto bmdelete
if %xy% equ 53 goto bmdefaul)
if %xy% equ 54 goto bmdel6
if %xy% equ 55 goto bmdel7
if %xy% equ 56 goto bmview8
if %xy% equ 57 goto bmview9
if %xy% equ 65 goto bmchangea
if %xy% equ 77 goto bmkeym
if %xy% equ 107 goto bmtimeinc
if %xy% equ 109 goto bmtimedec
if %xy% lss 1000 goto mousebm2
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% equ 3 if %x% gtr  6 if %x% lss 15 goto bm1
if %y% equ 3 if %choobm% neq 0 (
	if %x% gtr 18 if %x% lss 27 goto bmup
	if %x% gtr 30 if %x% lss 39 goto bmdown
	if %x% gtr 42 if %x% lss 51 goto bmrename
	if %x% gtr 54 if %x% lss 63 goto bmdelete
	if %x% gtr 66 if %x% lss 75 goto bmdefaul
)
if %y% equ %bmsub6% if %x% gtr 57 if %x% lss 69 goto bmdel6
if %y% equ %bmsub7% if %x% gtr 35 if %x% lss 47 goto bmdel7
if %y% equ %bmsub8% if %x% gtr 70 if %x% lss 77 goto bmview8
if %y% equ %bmsub9% if %x% gtr 70 if %x% lss 77 goto bmview9
if %y% equ %bmsuba% if %x% gtr 43 if %x% lss 52 goto bmchangea
if %y% equ %bmsubm1% if %x% gtr 57 if %x% lss 66 goto bmkeym
if %y% equ %bmsubt% if %x% equ 46 goto bmtimeinc
if %y% equ %bmsubt% if %x% equ 49 goto bmtimedec
goto mousebm2

:bmup
if %choobm% equ 1 goto mousebm2
set /a choobm1=%choobm%-1
for /l %%1 in (%choobm1%,1,%choobm1%) do (set sid%choobm%=!sid%%1!&set sid%%1=%sidtmp%)
for /l %%1 in (1,1,%num%) do (%be_% /displayorder !sid%%1! /addlast>nul 2>nul)
goto bcdmanager
:bmdown
if %choobm% equ %num% goto mousebm2
set /a choobm1=%choobm%+1
for /l %%1 in (%choobm1%,1,%choobm1%) do (set sid%choobm%=!sid%%1!&set sid%%1=!sidtmp!)
for /l %%1 in (1,1,%num%) do (%be_% /displayorder !sid%%1! /addlast>nul 2>nul)
goto bcdmanager
:bmrename
cls&call :enter5&call :enter4
echo       %choobm% _ "%destmp%"
echo.
echo       %msg137%
echo.
ConsExt /crv 1
set /p destmp=.     %msg037%
ConsExt /crv 0
%be_% /set %sidtmp% description "%destmp%">nul 2>nul
goto bcdmanager
:bmdelete
cls&echo.
if /i "%sidtmp%" equ "{current}" (set msgbmm=%msg052%&call :bmretn&goto bm1)
if %wver% equ 5 if %pe% neq 1 if /i "!sidtmp!" equ "{ntldr}" (set msgbmm=%msg052%&call :bmretn&goto bm1)
for /l %%1 in (%choobm%,1,%choobm%) do (
	echo      %%1 _ "!des%%1!"&echo.
	echo     %msg050%&echo.
	%be_% /enum !sid%%1! >%tmpfile%.c 2>nul&&(for /f "delims=" %%i in (%tmpfile%.c) do echo      %%i))
:mousebmd
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 goto bm1
if %xy% equ 48 goto bm1
if %xy% equ 49 goto bmdd
if %xy% lss 1000 goto mousebmd
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 3 goto mousebmd
if %x% gtr  6 if %x% lss 15 goto bm1
if %x% gtr 18 if %x% lss 27 goto bmdd
:bmdd
for /l %%1 in (%choobm%,1,%choobm%) do (%be_% /displayorder !sid%%1! /remove>nul 2>nul&%be_% /delete !sid%%1! /f>nul 2>nul)
goto bcdmanager
:bmdefaul
for /l %%1 in (%choobm%,1,%choobm%) do (%be_% /default !sid%%1!>nul 2>nul)
goto bcdmanager

:bmdel6
if %bmsub6% equ 200 goto mousebm2
for /l %%1 in (%choobm%,1,%choobm%) do %be_% /deletevalue !sid%%1! loadoptions>nul 2>nul
goto bm
:bmdel7
if %bmsub7% equ 200 goto mousebm2
for /l %%1 in (%choobm%,1,%choobm%) do %be_% /deletevalue !sid%%1! nointegritychecks>nul 2>nul
goto bm

:bmview8
if %bmsub8% equ 200 goto mousebm2
set bmsubsid=%bmsubsid8%
goto bmview89

:bmview9
if %bmsub9% equ 200 goto mousebm2
set bmsubsid=%bmsubsid9%
:bmview89
cls&echo.&echo.&echo     %msg046%&echo.
%be_% /enum %bmsubsid%>%tmpfile%.c 2>nul&&(for /f "delims=" %%i in (%tmpfile%.c) do echo      %%i)
:mousebm89
ConsExt /event
set /a xy=%errorlevel%
if %xy% equ 27 goto bm
if %xy% equ 48 goto bm
if %xy% equ 96 goto bm
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% equ 2 if %x% gtr  6 if %x% lss 17 goto bm
goto mousebm89

:bmchangea
if %bmsuba% equ 200 goto mousebm2
call :changeinter||goto bm
for /l %%1 in (%choobm%,1,%choobm%) do %be_% /set !sid%%1! locale %mui1%>nul 2>nul
goto bm

:bmtimeinc
if %bmsubt% equ 200 goto mousebm2
if %time1% gtr 998 goto mousebm2
set /a time1=%time1%+1
goto bmtimeincdec

:bmtimedec
if %bmsubt% equ 200 goto mousebm2
if %time1% equ 0 goto mousebm2
set /a time1=%time1%-1
:bmtimeincdec
for /l %%1 in (%choobm%,1,%choobm%) do (%be_% /set !sid%%1! timeout %time1% >nul 2>nul&&(
	set bmlist=!bmlistt!%time1%
	set bmlist=!bmlist:~0,35! %msg553%
	consext /pos 0 %bmsubt%&echo      !bmlist!))
goto mousebm2

:bmkeym
if %bmsubm% equ 200 goto mousebm2
for /l %%1 in (%choobm%,1,%choobm%) do (
	if %bmsubm% equ 1 (%be_% /set !sid%%1! bootmenupolicy Standard>nul 2>nul&%be_% /set {emssettings} bootems No>nul 2>nul)
	if %bmsubm% equ 0 %be_% /set !sid%%1! bootmenupolicy Legacy>nul 2>nul)
goto bm

:bmretn
cls&call :enter5&call :enter4
echo             %msgbmm%
echo.
echo.
echo            -----------------------------------------------------------
echo.
echo.
echo                                 %msg046%
:mousebmr
ConsExt /event
set /a xy=%errorlevel%
if %xy% equ 27 exit /b 0
if %xy% equ 96 exit /b 0
if %xy% equ 48 exit /b 0
if %xy% lss 1000 goto mousebmr
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% neq 15 goto mousebmr
if %x% gtr 34 if %x% lss 45 exit /b 0
goto mousebmr

:changeinter
cls&echo.&echo.&echo.&echo.
echo      %msg054%
echo.
echo      %msg154%
echo.
echo      %msg254%
echo.
echo      %msg354%
echo.
echo      %msg454%
echo.
echo      %msg554%
echo.
echo      %msg654%
echo.
echo     ------------------------------------------------------------------------
echo.
echo                                                              %msg046%
:mouseinter
ConsExt /event
set /a xy=%errorlevel%
if %xy% gtr 95 if %xy% lss 107 set /a xy=%xy%-48
if %xy% equ 27 exit /b 1
if %xy% equ 48 exit /b 1
:mir
if %xy% gtr 48 if %xy% lss 58 (set /a mui2=5*%xy%-5*49&for /l %%1 in (!mui2!,1,!mui2!) do set mui1=!muimsg1:~%%1,5!&exit /b 0)
if %xy% gtr 64 if %xy% lss 91 (set /a mui2=5*%xy%-5*65&for /l %%1 in (!mui2!,1,!mui2!) do set mui1=!muimsg2:~%%1,5!&exit /b 0)
if %xy% lss 1000 goto mouseinter
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% equ 20 if %x% gtr 63 if %x% lss 74 exit /b 1
set /a xyx=0&set /a xyy=0
if %x% gtr  7 if %x% lss 17 set /a xyx=1
if %x% gtr 21 if %x% lss 31 set /a xyx=2
if %x% gtr 35 if %x% lss 45 set /a xyx=3
if %x% gtr 49 if %x% lss 59 set /a xyx=4
if %x% gtr 63 if %x% lss 73 set /a xyx=5
if %xyx% equ 0 goto mouseinter
if %y% equ  4 set /a xyy=1
if %y% equ  6 set /a xyy=2
if %y% equ  8 set /a xyy=3
if %y% equ 10 set /a xyy=4
if %y% equ 12 set /a xyy=5
if %y% equ 14 set /a xyy=6
if %y% equ 16 set /a xyy=7
if %xyy% equ 0 goto mouseinter
set /a xy=%xyy%*5+%xyx%
if %xy% lss 15 (set /a xy=%xy%+43&goto mir)
set /a xy=%xy%+50&goto mir

:cnset
set msg914=%msg214%
copy /y ntldr1 /b + ntldrc /b ntldr /b >nul 2>nul
exit /b 0

:efimount
set /a gpt=0&set efivol=
for %%A in (V W X Y Z) do (if !gpt! equ 0 (mv %%A: /s>nul 2>nul&&(set actp=%%A&set /a gpt=1&set efivol=%%A)))
if %gpt% equ 1 exit /b 0
exit /b 1






:smartlabel
if not exist %~1:\windows\system32\winlogon.exe goto :EOF
set b=
for /f "tokens=1,2" %%a in ('filever /v "%~1:\windows\system32\winlogon.exe" ^| find "ProductVersion"') do set b=%%b
if "%b%"=="" (
pushd "%systemroot%\system32\wbem\"
wmic datafile where Name='%~1:\\windows\\system32\\winlogon.exe' get Version | find "." >%temp%\sysver.txt
set b=
for /f %%i in (%temp%\sysver.txt) do set b=%%i
del %temp%\sysver.txt
rem pause
popd
)
if "%b%"=="" goto :EOF
rem echo %b%

set s=0
set r=0
set f=0
set g=0
for /f "tokens=1,2,3,4 delims=. " %%a in ("%b%") do (set s=%%a&set r=%%b&set f=%%c&set g=%%d)
rem echo %s%.%r%.%f%.%g%

set t=WinXP
if %s% geq 6 if %r% geq 1 if %f% geq 7600 if %g% geq 16385 set t=Win7
if %s% geq 6 if %r% geq 2 if %f% geq 9200 if %g% geq 16384 set t=Win8
rem echo %t%

set bit=32
if exist %~1:\windows\SysWOW64\ set bit=64

label %~1:%bit%%t% >nul
rem echo %~1:%bit%%t%&pause

goto :EOF




