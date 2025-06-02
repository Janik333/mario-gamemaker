issliding = false;

if (collision_line(x-15,y+15,x-15,y+32,obj_mario,false,false) ||
    collision_line(x+15,y+15,x+15,y+32,obj_mario,false,false))
    obj_mario.mariopowerup -= 1;
else if (collision_line(x-15,y-15,x+15,y-15,obj_mario,false,false))
{
    obj_mario.vsp -= obj_mario.jumpspeed*2;
    //instance_destroy();
    isshell = true;
}  

if (x < view_xview + 544)
    startedmoving = true;
if (startedmoving)
    x -= tspeed;
if (vsp < 10) vsp += grav;

//////////Horizontal Collision
if (place_meeting(x,y,obj_brick) ||
    place_meeting(x,y,obj_goomba))
{
    gspeed = -gspeed;
}

//////////Vertical Collision
if (place_meeting(x,y+vsp,obj_brick))
{
    while (!place_meeting(x,y+sign(vsp),obj_brick))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (y >= 500)
    instance_destroy();
    