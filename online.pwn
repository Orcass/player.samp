stock number_format(number)
{
	new i, string[15];
	FIXES_valstr(string, number);
	if(strfind(string, "-") != -1) i = strlen(string) - 4;
	else i = strlen(string) - 3;
	while (i >= 1)
 	{
		if(strfind(string, "-") != -1) strins(string, ",", i + 1);
		else strins(string, ",", i);
		i -= 3;
	}
	return string;
}

DCMD:players(user, channel, params[])
{
    new count = 0;
	new name[24];
	new strl[124];
 	format(strl, sizeof(strl), "**__Online Players__** (%s)", number_format(Iter_Count(Player)));
 	DCC_SendChannelMessage(channel,strl);

	for(new i=0; i < MAX_PLAYERS; i++)
	{
    	GetPlayerName(i, name, MAX_PLAYER_NAME);
    	if(!IsPlayerConnected(i)) continue;
    	format(strl, sizeof(strl), "```%s(%d)```", name, i);
    	DCC_SendChannelMessage(channel,strl);
	}
	return 1;
}

