#include maps\mp\_utility;
#include common_scripts\utility;
#include maps/mp/zombies/_zm_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;

init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
    for(;;)
    {
        self waittill("spawned_player");
		self iprintln("^4Useful Nuke mod ^7created by ^1techboy04gaming");
		self thread calculateNuke();
    }
}

calculateNuke()
{
    self endon("disconnect");
    level endon("game_end");
    for(;;) {
        self waittill("nuke_triggered");
        points = ((get_round_enemy_array().size + level.zombie_total) * getDvarInt("usefulnuke_points"));
        
        if (level.zombie_vars[self.team]["zombie_point_scalar"] != 1)
        {
        	points = points * 2;
        }
        
        for( i = 0; i < level.players.size; i++ )
        {
        	level.players[i].score += points;
        }
        wait 0.02;
    }
}
