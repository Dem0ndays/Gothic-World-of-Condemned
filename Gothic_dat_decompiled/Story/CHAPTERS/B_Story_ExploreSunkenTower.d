
func void B_Story_ExploreSunkenTower()
{
	var C_Npc Bartholo;
	var C_Npc Skip;
	var C_Npc Bullit;
	var C_Npc Stone;
	var C_Npc Gomez;
	var C_Npc Scorpio;
	var C_Npc Cutter;
	var C_Npc Grd_220;
	var C_Npc Grd_221;
	var C_Npc Grd_222;
	var C_Npc Grd_223;
	var C_Npc Grd_239;
	var C_Npc Grd_245;
	var C_Npc Raven;
	var C_Npc Scar;
	var C_Npc Arto;
	var C_Npc Thorus;
	CreateInvItem(hero,ItKe_SunkenTower);
	B_LogEntry(CH5_Uriziel,"Xardas zaj�� si� przygotowaniem magicznej formu�y, kt�ra przywr�ci URIZIELOWI jego dawn� moc. W tym czasie zamierzam rozejrze� si� troch� po zatopionej wie�y Nekromanty w poszukiwaniu jakich� przydatnych artefakt�w.");
	Bartholo = Hlp_GetNpc(EBR_106_Bartholo);
	Skip = Hlp_GetNpc(Grd_211_Skip);
	Bullit = Hlp_GetNpc(GRD_203_Bullit);
	Stone = Hlp_GetNpc(GRD_219_Stone);
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	Scorpio = Hlp_GetNpc(GRD_205_Scorpio);
	Cutter = Hlp_GetNpc(GRD_208_Cutter);
	Grd_220 = Hlp_GetNpc(GRD_220_Gardist);
	Grd_221 = Hlp_GetNpc(GRD_221_Gardist);
	Grd_222 = Hlp_GetNpc(GRD_222_Gardist);
	Grd_223 = Hlp_GetNpc(GRD_223_Gardist);
	Grd_239 = Hlp_GetNpc(GRD_239_Gardist);
	Grd_245 = Hlp_GetNpc(GRD_245_Gardist);
	Raven = Hlp_GetNpc(EBR_105_Raven);
	Scar = Hlp_GetNpc(EBR_101_Scar);
	Arto = Hlp_GetNpc(EBR_102_Arto);
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Npc_ExchangeRoutine(Gomez,"OT");
	Npc_ExchangeRoutine(Bartholo,"OT");
	Npc_ExchangeRoutine(Arto,"OT");
	Npc_ExchangeRoutine(Scar,"OT");
	Npc_ExchangeRoutine(Bullit,"OT");
	Npc_ExchangeRoutine(Scorpio,"OT");
	Npc_ExchangeRoutine(Cutter,"OT");
	Npc_ExchangeRoutine(Skip,"OT");
	Npc_ExchangeRoutine(Stone,"OT");
	Npc_ExchangeRoutine(Grd_220,"OT");
	Npc_ExchangeRoutine(Grd_221,"OT");
	Npc_ExchangeRoutine(Grd_222,"OT");
	Npc_ExchangeRoutine(Grd_223,"OT");
	Npc_ExchangeRoutine(Grd_239,"OT");
	Npc_ExchangeRoutine(Grd_245,"OT");
	Stone.guild = GIL_None;
	Npc_SetTrueGuild(Stone,GIL_None);
	Bullit.guild = GIL_BAB;
	Npc_SetTrueGuild(Bullit,GIL_BAB);
	Bartholo.guild = GIL_BAB;
	Npc_SetTrueGuild(Bartholo,GIL_BAB);
	Gomez.guild = GIL_BAB;
	Npc_SetTrueGuild(Gomez,GIL_BAB);
	Npc_SetPermAttitude(Stone,ATT_NEUTRAL);
	Npc_SetTempAttitude(Stone,ATT_NEUTRAL);
	Npc_SetPermAttitude(Bullit,ATT_NEUTRAL);
	Npc_SetTempAttitude(Bullit,ATT_NEUTRAL);
	Npc_SetPermAttitude(Bartholo,ATT_NEUTRAL);
	Npc_SetTempAttitude(Bartholo,ATT_NEUTRAL);
	Npc_SetPermAttitude(Gomez,ATT_NEUTRAL);
	Npc_SetTempAttitude(Gomez,ATT_NEUTRAL);
	Thorus.flags = 0;
	Gomez.flags = 0;
	Bartholo.flags = 0;
	CreateInvItem(Gomez,DungeonKey);
	ExploreSunkenTower = TRUE;
};
