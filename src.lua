p={
  x=12,
  y=16,
  vx=0,
  vy=0
}

t=0
x=60
y=42
startScreen=true

function TIC()

  if startScreen then
    if btn(0) then y=y-1 end
    if btn(1) then y=y+1 end
    if btn(2) then x=x-1 end
    if btn(3) then x=x+1 end
    if btn(5) then startScreen=false end

    cls(0)
    sprId=0
    if (t%60)//30 == 0 then
      sprId=1
    else
      sprId=49
    end

    spr(sprId,x,y,14,2,0,0,8,3)
    print("Das Luftschiff",84,84)
    print("X Start", 84, 94)
    t=t+1
  else
    if btn(2) then
      p.vx=math.max(p.vx-0.1, -2.0)
    elseif btn(3) then
      p.vx=math.min(p.vx+0.1, 2.0)
    else
      p.vx=0
    end

    if btnp(4) then p.vy=p.vy-2.0 end

    if mget((p.x+16)//8,(p.y+16)//8)==16 then
      p.vy=math.min(0,p.vy)
    else
      p.vy=p.vy+0.1
    end

    p.x=p.x+p.vx
    p.y=p.y+p.vy

    cls(1)
    map()
    spr(257,p.x,p.y,14,1,0,0,1,2)
  end

end
