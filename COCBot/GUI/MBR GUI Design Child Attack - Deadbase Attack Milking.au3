; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "Milking Attack" tab under the "Attack" tab under the "DeadBase" tab under the "Search & Attack" tab under the "Attack Plan" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hGUI_DEADBASE_ATTACK_MILKING = 0

; Tab A
Global $g_hCmbMilkAttackType = 0, $g_hCmbMilkLvl[13] = [-1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0] ; Elements 0 to 3 are never referenced

; Tab B
Global $g_hChkAtkElixirExtractors = 0, $g_hChkAtkGoldMines = 0, $g_hCmbAtkGoldMinesLevel = 0, $g_hChkAtkDarkDrills = 0, $g_hCmbAtkDarkDrillsLevel = 0
Global $g_hCmbRedlineResDistance = 0, $g_hChkAttackMinesIfGold = 0, $g_hTxtAttackMinesIfGold = 0, $g_hChkAttackMinesIfElixir = 0, $g_hTxtAttackMinesIfElixir = 0, _
	   $g_hChkAttackMinesIfDarkElixir = 0, $g_hTxtAttackMinesIfDarkElixir = 0

; Tab C
Global $g_hTxtLowerXWave = 0, $g_hTxtUpperXWave = 0, $g_hTxtMaxWaves = 0, $g_hTxtLowerDelayWaves = 0, $g_hTxtUpperDelayWaves = 0
Global $g_hCmbMilkingAttackDropGoblinAlgorithm = 0, $g_hCmbStructureOrder = 0
Global $g_hChkStructureDestroyedBeforeAttack = 0, $g_hChkStructureDestroyedAfterAttack = 0

; Tab D
Global $g_hChkMilkAfterAttackTHSnipe = 0, $g_hTxtMaxTilesMilk = 0, $g_hCmbMilkSnipeAlgorithm = 0, $g_hChkSnipeIfNoElixir = 0, $g_hChkMilkAfterAttackScripted = 0, _
	   $g_hCmbMilkingCSVScriptName = 0
Global $g_hGrpSnipeOutsideTHAtEnd = 0, $g_hGrpDeploy = 0, $g_hLblMilkingCSVNotesScript = 0

; Tab Advanced
Global $g_hChkMilkFarmForceTolerance = 0, $g_hTxtMilkFarmForceToleranceNormal = 0, $g_hTxtMilkFarmForceToleranceBoosted = 0, $g_hTxtMilkFarmForceToleranceDestroyed = 0
Global $g_hGrpMilkingDebug = 0, $g_hChkMilkingDebugIMG = 0, $g_hChkMilkingDebugVillage = 0, $g_hChkMilkingDebugFullSearch = 0


Func CreateAttackSearchDeadBaseMilking()
   $g_hGUI_DEADBASE_ATTACK_MILKING = _GUICreate("", $_GUI_MAIN_WIDTH - 195, $g_iSizeHGrpTab4, 150, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hGUI_DEADBASE)
   ;GUISetBkColor($COLOR_WHITE, $g_hGUI_DEADBASE_ATTACK_MILKING)
   $44 = GUICtrlCreatePic (@ScriptDir & "\COCBot\Team__AiO_&_RK__MOD++\Images2\1.jpg", 0, 35, 280, 300, $WS_CLIPCHILDREN)
   Local $sTxtDisable = GetTranslated(631,79,"DIS.")

   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ; TAB A
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Local $x = 5, $y = 0
   GUICtrlCreateTab($x, $y, 268, 306, $TCS_MULTILINE)
   GUICtrlCreateTabItem(GetTranslated(600,44,"A - Structures"))

	   Local $x = 15, $y = 45
	   GUICtrlCreateGroup(GetTranslated(631,80,"Choose Milking Search Type"), $x - 5, $y - 5, 260, 45)
	   $y += 15
	   $g_hCmbMilkAttackType = GUICtrlCreateCombo("", $x, $y, 250, 20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		   GUICtrlSetData(-1,  GetTranslated(631,59,"Slower: Check the Resources in each collector.") & "|" &  _
						       GetTranslated(631,60,"Faster: Only check the Level of each collector."), GetTranslated(631,60,-1))
	   $y += 30

	   GUICtrlCreateGroup(GetTranslated(631,2, "Elixir Collectors Min. Level to Attack"), $x - 5, $y, 210, 145)
	   $y += 20
		   GUICtrlCreateLabel(GetTranslated(631,3, "Levels 1-4"), $x,$y)
		   $g_hCmbMilkLvl[4] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%",$sTxtDisable)
		   $x+=67
		   GUICtrlCreateLabel(GetTranslated(631,4, "Level 5"), $x,$y)
		   $g_hCmbMilkLvl[5] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%",$sTxtDisable)
		   $x+=67
		   GUICtrlCreateLabel(GetTranslated(631,5, "Level 6"), $x,$y)
		   $g_hCmbMilkLvl[6] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%",$sTxtDisable)
		   $x = 15
		   $y += 40
		   GUICtrlCreateLabel(GetTranslated(631,6, "Level 7"), $x,$y)
		   $g_hCmbMilkLvl[7] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%",$sTxtDisable)
		   $x+=67
		   GUICtrlCreateLabel(GetTranslated(631,7, "Level 8"), $x,$y)
		   $g_hCmbMilkLvl[8] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%",$sTxtDisable)
		   $x+=67
		   GUICtrlCreateLabel(GetTranslated(631,8, "Level 9"), $x,$y)
		   $g_hCmbMilkLvl[9] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%",$sTxtDisable)
		   $x = 15
		   $y += 40
		   GUICtrlCreateLabel(GetTranslated(631,9, "Level 10"), $x,$y)
		   $g_hCmbMilkLvl[10] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%","5-19%")
		   $x+=67
		   GUICtrlCreateLabel(GetTranslated(631,10, "Level 11"), $x,$y)
		   $g_hCmbMilkLvl[11] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%","5-19%")
		   $x+=67
		   GUICtrlCreateLabel(GetTranslated(631,11, "Level 12"), $x,$y)
		   $g_hCmbMilkLvl[12] = GUICtrlCreateCombo("", $x, $y +16, 65,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, $sTxtDisable & "|0-4%|5-19%|20-74%|75-89%|90-100%","5-19%")
	   GUICtrlCreateGroup("", -99, -99, 1, 1)

	   Local $x = 10, $y = 240
	   GUICtrlCreateGroup(GetTranslated(631,31, "Legend"), $x, $y, 260, 65)
		   $x = 23
		   $y = 255
		   GUICtrlCreateLabel(GetTranslated(631,32, "0-4%"),$x, $y)
		   $x = 21
		   $y = 273
		   GUICtrlCreatePic(@ScriptDir & "\Images\CapacityStructure\elixir_8_0_70_A.bmp", $x , $y, 25, 25 )
		   $x = 65
		   $y = 255
		   GUICtrlCreateLabel(GetTranslated(631,33, "5-19%"),$x, $y)
		   $x = 66
		   $y = 273
		   GUICtrlCreatePic(@ScriptDir & "\Images\CapacityStructure\elixir_8_1_70_A.bmp", $x , $y, 25, 25 )
		   $x = 117
		   $y = 255
		   GUICtrlCreateLabel(GetTranslated(631,34, "20-74%"),$x, $y)
		   $x = 121
		   $y = 273
		   GUICtrlCreatePic(@ScriptDir & "\Images\CapacityStructure\elixir_8_2_70_A.bmp", $x , $y, 25, 25 )
		   $x = 173
		   $y = 255
		   GUICtrlCreateLabel(GetTranslated(631,35, "75-89%"),$x, $y)
		   $x = 176
		   $y = 273
		   GUICtrlCreatePic(@ScriptDir & "\Images\CapacityStructure\elixir_8_3_70_A.bmp", $x , $y, 25, 25 )
		   $x = 224
		   $y = 255
		   GUICtrlCreateLabel(GetTranslated(631,36, "90-100%"),$x, $y)
		   $x = 232
		   $y = 273
		   GUICtrlCreatePic(@ScriptDir & "\Images\CapacityStructure\elixir_8_4_70_A.bmp", $x , $y, 25, 25 )
	   GUICtrlCreateGroup("", -99, -99, 1, 1)

   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ; TAB B
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   GUICtrlCreateTabItem(GetTranslated(600,45,"B - Conditions"))

	   Local $x = 14, $y = 45
	   GUICtrlCreateGroup(GetTranslated(631,56, "Structures to Attack"), $x - 5, $y, 260, 100)
	   $y += 22
		   $g_hChkAtkElixirExtractors = _GUICtrlCreateCheckbox(GetTranslated(631,13, "Attack"), $x, $y - 10, -1, 18)
			   GUICtrlSetState(-1, $GUI_CHECKED)
		   GUICtrlCreateIcon($g_sLibIconPath, $eIcnCollector, $x + 60, $y - 6, 24, 24)

		   $y += 26
		   $g_hChkAtkGoldMines = _GUICtrlCreateCheckbox(GetTranslated(631,13, -1), $x, $y - 10, -1, 18)
			   GUICtrlSetState(-1, $GUI_CHECKED)
			   GUICtrlSetOnEvent(-1, "chkAtkGoldMines")
		   GUICtrlCreateIcon($g_sLibIconPath, $eIcnMine, $x + 60, $y - 6, 24, 24)
		   GUICtrlCreateLabel(GetTranslated(631,14, "Which have a Level") & " " & ChrW(8805), $x + 70, $y + 2, 115, 18, $SS_RIGHT)
		   $g_hCmbAtkGoldMinesLevel = GUICtrlCreateCombo("", $x + 200, $y - 2, 50, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1,"1-4|5|6|7|8|9|10|11","5")

		   $y += 26
		   $g_hChkAtkDarkDrills = _GUICtrlCreateCheckbox(GetTranslated(631,13, -1), $x, $y - 10, -1, 18)
			   GUICtrlSetOnEvent(-1, "chkAtkDarkDrills")
			   GUICtrlSetState(-1, $GUI_CHECKED)
		   GUICtrlCreateIcon($g_sLibIconPath, $eIcnDrill, $x + 60, $y - 6, 24, 24)
		   GUICtrlCreateLabel(GetTranslated(631,14, -1) & " " & ChrW(8805), $x + 70, $y + 2, 115, 18, $SS_RIGHT)
		   $g_hCmbAtkDarkDrillsLevel = GUICtrlCreateCombo("", $x + 200, $y - 2, 50, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1,"1|2|3|4|5|6","1")
	   GUICtrlCreateGroup("", -99, -99, 1, 1)

	   Local $x = 14, $y = 155
	   GUICtrlCreateGroup(GetTranslated(631,16, "Only Attack If"), $x - 5, $y - 5, 260, 110)
		   $y += 15
		   GUICtrlCreateLabel(GetTranslated(631,17, "Distance between red line and collectors"), $x, $y)
		   $g_hCmbRedlineResDistance = GUICtrlCreateCombo("", $x + 200, $y - 4, 50, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1, "0 tile|1 tile|2 tiles","0 tile")

		   $y += 21
		   $g_hChkAttackMinesIfGold = _GUICtrlCreateCheckbox(GetTranslated(631,18, "Attack Gold Mines If Gold Under"), $x, $y, -1, -1)
			   GUICtrlSetOnEvent(-1, "chkAttackMinesifGold")
			   GUICtrlSetState(-1, $GUI_CHECKED)
		   $g_hTxtAttackMinesIfGold = GUICtrlCreateInput("9950000", $x + 200, $y, 50, 18, $SS_CENTER)
			   GUICtrlSetState(-1,$GUI_DISABLE)

		   $y += 21
		   $g_hChkAttackMinesIfElixir = _GUICtrlCreateCheckbox(GetTranslated(631,19, "Attack Elixir Collectors If Elixir Under"), $x, $y, -1, -1)
			   GUICtrlSetOnEvent(-1, "chkAttackMinesifElixir")
			   GUICtrlSetState(-1, $GUI_CHECKED)
		   $g_hTxtAttackMinesIfElixir = GUICtrlCreateInput("9950000", $x + 200, $y, 50, 18, $SS_CENTER)
			   GUICtrlSetState(-1,$GUI_DISABLE)

		   $y += 21
		   $g_hChkAttackMinesIfDarkElixir = _GUICtrlCreateCheckbox(GetTranslated(631,20, "Attack Dark Elixir Drills If Dark Under"), $x, $y, -1, -1)
			   GUICtrlSetOnEvent(-1, "chkAttackMinesifDarkElixir")
			   GUICtrlSetState(-1, $GUI_CHECKED)
		   $g_hTxtAttackMinesIfDarkElixir = GUICtrlCreateInput("200000", $x + 200, $y, 50, 18, $SS_CENTER)
			   GUICtrlSetState(-1,$GUI_DISABLE)

   GUICtrlCreateTabItem("")

   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ; TAB C
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   GUICtrlCreateTabItem(GetTranslated(600,46,"C - Attack"))
		Local $x = 9
		Local $y = 45
		GUICtrlCreateGroup(GetTranslated(631,21, "4. Troops To Use For Each Building"), $x, $y,260,90)
		   $x = 15

		   $y +=20
		   GUICtrlCreateLabel(GetTranslated(631,22, "- Troops Per Wave:"),$x, $y)
		   $g_hTxtLowerXWave = GUICtrlCreateInput("4", 180-10, $y-7, 37,21)
		   GUICtrlCreateLabel("-", 208, $y)
		   $g_hTxtUpperXWave = GUICtrlCreateInput("6", 245-20, $y-7, 37,21)

		   $y +=20
		   GUICtrlCreateLabel(GetTranslated(631,23, "- Max Waves:"),$x, $y)
		   $g_hTxtMaxWaves = GUICtrlCreateInput("3", 180-10, $y-7, 37,21)
			   _GUICtrlSetTip(-1,  GetTranslated(631,85,"Choose the maximum number of waves of troops to drop at each collector.") & @CRLF & _
								   GetTranslated(631,86,"If the collector gets destroyed, then no more waves will be dropped at it."))

		   $y +=20
		   GUICtrlCreateLabel(GetTranslated(631,24, "- Delay Between Waves (ms):"),$x, $y)
		   $g_hTxtLowerDelayWaves = GUICtrlCreateInput("3000", 180-10, $y-7, 37,21)
		   GUICtrlCreateLabel("-", 208, $y)
		   $g_hTxtUpperDelayWaves = GUICtrlCreateInput("5000", 245-20, $y-7, 37,21)

		$x = 9
		$y +=40
		GUICtrlCreateGroup(GetTranslated(631,71, "5. Dropping options"), $x,$y, 260,80)
		   $y +=21
		   $g_hCmbMilkingAttackDropGoblinAlgorithm = GUICtrlCreateCombo("", $x+5, $y , 240,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1,  GetTranslated(631,72,"Drop each Goblin in the same place") & "|" & _
								   GetTranslated(631,73,"Drop each Goblin in a different place"), GetTranslated(631,72,-1))

		   $y +=25
		   $g_hCmbStructureOrder = GUICtrlCreateCombo("", $x+5, $y , 250,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   GUICtrlSetData(-1,  GetTranslated(631,74,"Attack Order: as found") & "|" & _
								   GetTranslated(631,75,"Attack Order: Random") & "|" & _
								   GetTranslated(631,76,"Attack Order: by side"), GetTranslated(631,76,-1))

		$x = 9
		$y +=40
		GUICtrlCreateGroup(GetTranslated(631,61, "Check Destroyed Structures"), $x,$y, 260,70)
		   $y += 20
		   $x += 5
		   $g_hChkStructureDestroyedBeforeAttack = _GUICtrlCreateCheckbox(GetTranslated(631,62, "Check Structure Destruction Before Wave"), $x, $y, -1, -1)
			_GUICtrlSetTip(-1, GetTranslated(631,63, "Before attacking a structure, check to see if it has been destroyed by another wave.") & @CRLF & _
						       GetTranslated(631,64,"You must have a high delay between waves to use this option"))

		   $y += 20
		   $g_hChkStructureDestroyedAfterAttack = _GUICtrlCreateCheckbox(GetTranslated(631,65, "Check Structure Destruction After Wave"), $x, $y, -1, -1)
			_GUICtrlSetTip(-1, GetTranslated(631,66, "After attacking a structure, check to see if it has been destroyed by another wave.") & @CRLF & _
							   GetTranslated(631,67,"You must have a high delay between waves to use this option"))
	   GUICtrlCreateTabItem("")

   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ; TAB D
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	   GUICtrlCreateTabItem(GetTranslated(600,47,"D - After Milking"))
		Local $x = 9
		Local $y = 45

		$g_hGrpSnipeOutsideTHAtEnd = GUICtrlCreateGroup(GetTranslated(631,25, "5a. Snipe Outside TH After Milking"), $x, $y-4,260,120)
		   $x =15
		   $y+=15

		   $g_hChkMilkAfterAttackTHSnipe = _GUICtrlCreateCheckbox(GetTranslated(631,82,"Enable TH Snipe"), $x, $y, -1, -1)
				   _GUICtrlSetTip(-1, GetTranslated(631,82,"Enable TH Snipe"))
				   GUICtrlSetOnEvent(-1, "chkMilkAfterAttackTHSnipe")
		   $y+=21

		   GUICtrlCreateLabel(GetTranslated(631,27, "Max Tiles From Border") & ":", $x, $y)
		   GUICtrlSetState(-1, $GUI_DISABLE)
		   $g_hTxtMaxTilesMilk = GUICtrlCreateInput("1", $x + 175,$y-7, 37,21)
		   GUICtrlSetState(-1, $GUI_DISABLE)

		   $y+=20
		   GUICtrlCreateLabel(GetTranslated(631,28, "Use Algorithm")&":", $x, $y)
		   GUICtrlSetState(-1, $GUI_DISABLE)
		   $g_hCmbMilkSnipeAlgorithm = GUICtrlCreateCombo("", 120,$y-2, 120,20,BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		   GUICtrlSetState(-1, $GUI_DISABLE)
		   PopulateCmbMilkSnipeAlgorithm()
		   _GUICtrlComboBox_SetCurSel($g_hCmbMilkSnipeAlgorithm,_GUICtrlComboBox_FindStringExact($g_hCmbMilkSnipeAlgorithm, "Queen&GobTakeTH"))

		   $y+=20
		   $g_hChkSnipeIfNoElixir = _GUICtrlCreateCheckbox(GetTranslated(631,29, "Snipe Even If No Collectors can be Milked"), $x,$y, -1, -1)
		   GUICtrlSetState(-1, $GUI_DISABLE)

		$x =9
		$y += 85
		Local $mode = $DB
		$g_hGrpDeploy = GUICtrlCreateGroup(GetTranslated(631,84,"5b. Continue With An Scripted Attack"), $x , $y - 20, 260, 70)
		   $x+=15
		   $g_hChkMilkAfterAttackScripted = _GUICtrlCreateCheckbox(GetTranslated(631,83,"Enable Scripted Attack"), $x, $y, -1, -1)
				_GUICtrlSetTip(-1, GetTranslated(631,83,"Enable Scripted Attack"))
				;GUICtrlSetOnEvent(-1, "chkMilkAfterAttackStandard")

		   $y+=21
		   $g_hCmbMilkingCSVScriptName = GUICtrlCreateCombo("", $x-10 , $y, 185, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			   _GUICtrlSetTip(-1, GetTranslated(631,30, "Use scripted attack for dead bases, this disables standard attack"))
		   PopulateComboMilkingCSVScriptsFiles()
		   _GUICtrlComboBox_SetCurSel($g_hCmbMilkingCSVScriptName,_GUICtrlComboBox_FindStringExact($g_hCmbMilkingCSVScriptName, "Barch four fingers"))

		   $y +=25
			   $g_hLblMilkingCSVNotesScript =  GUICtrlCreateLabel("", $x, $y + 5, 180, 118)

   ;~ 			$lblStandardAlgorithm = GUICtrlCreateLabel("Algorithm" & ":",$x,$y+5)
   ;~ 			$cmbStandardAlgorithm = GUICtrlCreateCombo("", $x+55, $y, 120, Default, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
   ;~ 			GUICtrlSetData(-1, "Default(All Troops)|Barb\Arch\Minion\Gob|GiBarch", "Barch")

   ;~ 			$y +=25
   ;~ 			$lblDeploy = GUICtrlCreateLabel(GetTranslated(3,3, "Attack on")&":", $x, $y + 5, -1, -1)
   ;~ 			$cmbDeploy = GUICtrlCreateCombo("", $x + 55, $y, 120, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
   ;~ 			 IF $mode = $DB Then
   ;~ 				_GUICtrlSetTip(-1, GetTranslated(3,4, "Attack on a single side, penetrates through base") & @CRLF & GetTranslated(3,5, "Attack on two sides, penetrates through base") & @CRLF & GetTranslated(3,6, "Attack on three sides, gets outer and some inside of base"), GetTranslated(3,7,"Select the No. of sides to attack on."))
   ;~ 				GUICtrlSetData(-1, GetTranslated(3,8, "one side") & "|" & GetTranslated(3,9, "two sides") & "|" & GetTranslated(3,10, "three sides") &"|" & GetTranslated(3,11,"all sides equally" ), GetTranslated(3,11, "all sides equally"))
   ;~ 			 Else
   ;~ 				_GUICtrlSetTip(-1, GetTranslated(3,4, -1) & @CRLF & GetTranslated(3,5, -1) & @CRLF & GetTranslated(3,6, -1) & @CRLF & GetTranslated(3,63, -1) & @CRLF & GetTranslated(3,64, "Attack on the single side closest to the Dark Elixir Storage") & @CRLF & GetTranslated(3,65, "Attack on the single side closest to the Townhall"), GetTranslated(3,7, -1))
   ;~ 				GUICtrlSetData(-1, GetTranslated(3,8, -1) & "|" & GetTranslated(3,9, -1) & "|" & GetTranslated(3,10, -1) & "|" & GetTranslated(3,11, -1) & "|" & GetTranslated(3,66, "DE Side Attack") & "|" & GetTranslated(3,67, "TH Side Attack"), GetTranslated(3,11, -1))
   ;~ 				;GUICtrlSetOnEvent(-1, "chkDESideEB")
   ;~ 			 EndIf

   ;~ 			$y += 25
   ;~ 			$lblUnitDelay = GUICtrlCreateLabel(GetTranslated(3,24, "Delay Unit") & ":", $x, $y + 5, -1, -1)
   ;~ 				$txtTip = GetTranslated(3,25, "This delays the deployment of troops, 1 (fast) = like a Bot, 10 (slow) = Like a Human.") & @CRLF & GetTranslated(3,26, "Random will make bot more varied and closer to a person.")
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$cmbUnitDelay = GUICtrlCreateCombo("", $x + 55, $y, 36, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 				GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
   ;~ 			$lblWaveDelay = GUICtrlCreateLabel(GetTranslated(3,27, "Wave") & ":", $x + 100, $y + 5, -1, -1)
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$cmbWaveDelay = GUICtrlCreateCombo("", $x + 140, $y, 36, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 				GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
   ;~ 			$y += 22
   ;~ 			$chkRandomSpeedAtk = GUICtrlCreateCheckbox(GetTranslated(3,28, "Randomize delay for Units & Waves"), $x, $y, -1, -1)
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 				GUICtrlSetOnEvent(-1, "chkRandomSpeedAtk")
   ;~ 		$y +=22
   ;~ 			$chkSmartAttackRedArea = GUICtrlCreateCheckbox(GetTranslated(3,29, "Use Smart Attack: Near Red Line."), $x, $y, -1, -1)
   ;~ 				$txtTip = GetTranslated(3,30, "Use Smart Attack to detect the outer 'Red Line' of the village to attack. And drop your troops close to it.")
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 				GUICtrlSetState(-1, $GUI_CHECKED)
   ;~ 				GUICtrlSetOnEvent(-1, "chkSmartAttackRedArea")
   ;~ 			$y += 22
   ;~ 			$lblSmartDeploy = GUICtrlCreateLabel(GetTranslated(3,31, "Drop Type") & ":", $x, $y + 5, -1, -1)
   ;~ 				$txtTip = GetTranslated(3,32, "Select the Deploy Mode for the waves of Troops.") & @CRLF & GetTranslated(3,33, "Type 1: Drop a single wave of troops on each side then switch troops, OR") & @CRLF & GetTranslated(3,34, "Type 2: Drop a full wave of all troops (e.g. giants, barbs and archers) on each side then switch sides.")
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$cmbSmartDeploy = GUICtrlCreateCombo("", $x + 55, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
   ;~ 				GUICtrlSetData(-1, GetTranslated(3,35, "Sides, then Troops") & "|" & GetTranslated(3,36, "Troops, then Sides") , GetTranslated(3,35, "Sides, then Troops"))
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$y += 26
   ;~ 			$chkAttackNearGoldMine = GUICtrlCreateCheckbox("", $x + 20, $y, 17, 17)
   ;~ 				$txtTip = GetTranslated(3,37, "Drop troops near Gold Mines")
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$picAttackNearGoldMine = GUICtrlCreateIcon($g_sLibIconPath, $eIcnMine, $x + 40 , $y - 3 , 24, 24)
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$x += 75
   ;~ 			$chkAttackNearElixirCollector = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
   ;~ 				$txtTip = GetTranslated(3,38, "Drop troops near Elixir Collectors")
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$picAttackNearElixirCollector = GUICtrlCreateIcon($g_sLibIconPath, $eIcnCollector, $x + 20 , $y - 3 , 24, 24)
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$x += 55
   ;~ 			$chkAttackNearDarkElixirDrill = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
   ;~ 				$txtTip = GetTranslated(3,39, "Drop troops near Dark Elixir Drills")
   ;~ 				_GUICtrlSetTip(-1, $txtTip)
   ;~ 			$picAttackNearDarkElixirDrill = GUICtrlCreateIcon($g_sLibIconPath, $eIcnDrill, $x + 20 , $y - 3, 24, 24)
   ;~ 				_GUICtrlSetTip(-1, $txtTip)

   ;~			   $y +=20
   ;~			   $lblx = GUICtrlCreateLabel("",$x,$y,-1,-1)
   ;~				   GUICtrlSetState(-1,$GUI_HIDE)
		 GUICtrlCreateGroup("", -99, -99, 1, 1)

	   GUICtrlCreateTabItem("")

   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ; TAB Advanced
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	   GUICtrlCreateTabItem(GetTranslated(600,48,"Advanced"))
		Local $x = 9
		Local $y = 45
		$y +=21
		GUICtrlCreateGroup(GetTranslated(631,68, "Tolerance Settings"), $x,$y, 260,120)
		   $x+=5
		   $y +=21
		   $g_hChkMilkFarmForceTolerance = _GUICtrlCreateCheckbox(GetTranslated(631,50, "Force Tolerance"), $x, $y, -1, -1)
		   GUICtrlSetOnEvent(-1,"chkMilkFarmForcetolerance")

		   $y +=21
		   GUICtrlCreateLabel(GetTranslated(631,51, "Tolerance Normal"), $x,$y)
		   $g_hTxtMilkFarmForceToleranceNormal = GUICtrlCreateInput("60", 235-31, $y, 60-8,21)
		   GUICtrlSetState(-1, $GUI_DISABLE)

		   $y +=21
		   GUICtrlCreateLabel(GetTranslated(631,52, "Tolerance Boosted"), $x,$y)
		   $g_hTxtMilkFarmForceToleranceBoosted = GUICtrlCreateInput("60", 235-31, $y, 60-8,21)
		   GUICtrlSetState(-1, $GUI_DISABLE)

		   $y +=21
		   GUICtrlCreateLabel(GetTranslated(631,53, "Tolerance Destroyed"), $x,$y)
		   $g_hTxtMilkFarmForceToleranceDestroyed = GUICtrlCreateInput("60", 235-31, $y, 60-8,21)
		   GUICtrlSetState(-1, $GUI_DISABLE)

		$x = 9
		$y += 50
		$g_hGrpMilkingDebug = GUICtrlCreateGroup(GetTranslated(631,37, "Debug"), $x,$y, 260,100)
		   GUICtrlSetState(-1, $GUI_HIDE)
		   $y += 20
		   $x += 5
		   $g_hChkMilkingDebugIMG = GUICtrlCreateCheckbox(GetTranslated(631,38, "Make Images of each extractor with offset"), $x, $y, -1, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)

		   $y += 20
		   $g_hChkMilkingDebugVillage = GUICtrlCreateCheckbox(GetTranslated(631,41, "Make Images of villages"), $x, $y, -1, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)

		   $y += 20
		   $g_hChkMilkingDebugFullSearch = GUICtrlCreateCheckbox(GetTranslated(631,39, "fullsearch, only for debug purpose (very slow)"), $x, $y, -1, -1)
		   _GUICtrlSetTip(-1, GetTranslated(631,81,"with this options you can detect images of undetected Elixir Extractors"))
		   GUICtrlSetState(-1, $GUI_HIDE)

	   GUICtrlCreateTabItem("")

   ;GUISetState()
EndFunc
