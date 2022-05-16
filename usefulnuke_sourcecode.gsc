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
		calculateNuke();
    }
}

calculateNuke()
{
	self endon("disconnect");
    level endon("game_end");
    for(;;) {
    	self waittill("nuke_triggered");
    	maps/mp/zombies/_zm_score::player_add_points( "nuke_powerup", (get_round_enemy_array().size + level.zombie_total) * 60 );
        wait 0.02;
	}
}
