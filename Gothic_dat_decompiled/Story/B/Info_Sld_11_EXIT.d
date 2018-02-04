
instance Info_Sld_11_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Sld_11_EXIT_Condition;
	information = Info_Sld_11_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Sld_11_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Sld_11_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will ein Söldner der Magier werden.";
};


func int Info_Sld_11_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Sld_11_EinerVonEuchWerden_Info()
{
	var C_Npc gorn;
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00");	//Ich will ein Söldner der Magier werden.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01");	//Das ist nicht schwer. Wenn du für unsere Sache kämpfen willst, wird Lee dich nehmen.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02");	//Aber er nimmt nur Leute, die gut mit dem Schwert umgehen können. Wie sieht's damit bei dir aus?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03");	//Nun ...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04");	//Dachte ich mir. Wenn es dir wirklich ernst ist, rede mit Gorn. Er hat schon mal einen Frischling ausgebildet.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05");	//Vielleicht hast du ja Glück und er macht sich auch bei dir die Mühe.
	gorn = Hlp_GetNpc(PC_Fighter);
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_11_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Sld_11_WichtigePersonen_Condition;
	information = Info_Sld_11_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_11_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01");	//Wir tun was die Magier sagen. Aber meistens sagen sie gar nichts. Sie hängen beim Erzhaufen und brüten über ihren Büchern.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02");	//Im Grunde regelt Lee alles. Er ist unser Anführer.
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_11_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Sld_11_DasLager_Condition;
	information = Info_Sld_11_DasLager_Info;
	permanent = 1;
	description = "Gibt es Probleme hier im Lager?";
};


func int Info_Sld_11_DasLager_Condition()
{
	return 1;
};

func void Info_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00");	//Gibt es Probleme hier im Lager?
	if(Kapitel <= 4)
	{
		AI_Output(self,other,"Info_Sld_11_DasLager_11_01");	//Junge, hier gibt es immer Probleme. Die Banditen machen, was sie wollen und wir Söldner sind damit beschäftigt, die Magier zu decken und die Verteidigung des Lagers aufrecht zu erhalten.
	}
	else if(Kapitel >= 5)
	{
		AI_Output(self,other,"Info_Sld_11_DasLager_11_02");	//Junge, hast du es noch nicht gehört? Gomez' Leute haben unsere Mine überfallen. DAS ist wirklich ein Problem.
	};
};


instance Info_Sld_11_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Sld_11_DieLage_Condition;
	information = Info_Sld_11_DieLage_Info;
	permanent = 1;
	description = "Alles klar bei dir?";
};


func int Info_Sld_11_DieLage_Condition()
{
	return 1;
};

func void Info_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00");	//Alles klar bei dir?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Sld_11_DieLage_15_05");	//Was willst du von mir Mann?
		AI_Output(self,other,"Info_Sld_11_DieLage_15_06");	//Solltest du jetzt nicht an irgendeinem Überfall beteiligt sein?
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Sld_11_DieLage_15_07");	//Man lass mich in Ruhe.
		AI_Output(self,other,"Info_Sld_11_DieLage_15_08");	//Ich red' nicht mit Gomez' Leuten. Also geh' mir aus den Augen.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Sld_11_DieLage_15_09");	//Ah, jemand aus dem Sumpflager.
		AI_Output(self,other,"Info_Sld_11_DieLage_15_11");	//Wenn du was zu rauchen hast, nur her damit. Ich geb dir einen Tipp hier drinnen.
		AI_Output(self,other,"Info_Sld_11_DieLage_15_12");	//Lass dich nicht von den Banditen verarschen.
		AI_Output(self,other,"Info_Sld_11_DieLage_15_13");	//Die Mistkerle werden versuchen dich auf's Kreuz zu legen.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Sld_11_DieLage_08_14");	//Du bist noch nicht so lang bei uns was?
		AI_Output(self,other,"Info_Sld_11_DieLage_08_15");	//Ich sag' dir jetzt mal eins. Sei vorsichtig wenn du dich auf der Höhlenseite der Banditen rumtreibst.
		AI_Output(self,other,"Info_Sld_11_DieLage_08_16");	//Den Mistkerlen ist nicht zu trauen. Aber mach dir keine Sorgen, du wirst es nicht bereuen dich uns angeschlossen zu haben.
	}
	else
	{
		AI_Output(self,other,"Info_Sld_11_DieLage_11_01");	//Noch ist alles ruhig ...
		AI_Output(other,self,"Info_Sld_11_DieLage_15_02");	//Noch?
		AI_Output(self,other,"Info_Sld_11_DieLage_11_03");	//Wenn die Banditen weiter Gomez' Konvois überfallen, steht er irgendwann mit seiner Armee hier vor dem Tor.
		AI_Output(self,other,"Info_Sld_11_DieLage_11_04");	//Und das wird bestimmt kein Spaß.
	};
};


instance Info_Sld_11_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Sld_11_Krautprobe_Condition;
	information = Info_Sld_11_Krautprobe_Info;
	permanent = 1;
	description = "Willst du etwas Sumpfkraut?";
};


func int Info_Sld_11_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_11_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00");	//Willst du etwas Sumpfkraut?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01");	//Gib her. Hier - 10 Erz.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02");	//Wenn du wieder mal was hast - du weißt Bescheid..
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_11_Krautprobe_No_Joint_11_00");	//Besorg mir was, dann reden wir weiter.
	};
};

func void B_AssignAmbientInfos_Sld_11(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

