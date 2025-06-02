sprite_index = spr_turtleshell;

//////////Horizontal Collision
if (place_meeting(x,y,obj_brick) ||
    place_meeting(x,y,obj_goomba))
{
    tspeed = -tspeed;
}

//////////Vertical Collision

//top
if (collision_line(x-15,y-4,x+15,y-4,obj_mario,false,false) &&
    !collision_line(x-16,y,x-16,y+23,obj_mario,false,false))
{
    obj_mario.vsp -= obj_mario.jumpspeed*2;
    issliding = !issliding;
    tspeed = 5;
    startcounting = true;
    mariohurttime = 0;
}  
//sides
if (collision_line(x-15,y-4,x-15,y+23,obj_mario,false,false) ||
    collision_line(x+15,y-4,x+15,y+23,obj_mario,false,false))
{
    if (issliding && mariohurttime > 60)
        obj_mario.mariopowerup -= 1;
    else if (!issliding)
        issliding = !issliding;
        if (obj_mario.move > 0)
            tspeed = 5;
        else
            tspeed = -5;
}

if (startcounting)
    mariohurttime++;


if (place_meeting(x,y+vsp,obj_brick))
{
    while (!place_meeting(x,y+sign(vsp),obj_brick))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (!issliding && collision_rectangle(x-12,y,x+15,y+47,obj_mario,false,false))
{
    issliding = true;
    tspeed = 5;
}

if (issliding)
    x += tspeed;
    
if (y >= 500)
    instance_destroy();
    

