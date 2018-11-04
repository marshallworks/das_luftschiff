p={
  x=12,
  y=16,
  vx=0,
  vy=0
}

t=0
x=60
y=42
cStart=0
waterLevel=0
boilerLevel=9
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
    boilerLevel=boilerLevel-0.004
    waterLevel=waterLevel+0.004

    if boilerLevel < 0 then boilerLevel = 0 end
    if waterLevel > 11 then waterLevel = 11 end

    if btn(2) then
      p.vx=math.max(p.vx-0.1, -2.0)
    elseif btn(3) then
      p.vx=math.min(p.vx+0.1, 2.0)
    else
      p.vx=0
    end

    if btnp(4) then p.vy=p.vy-2.4 end

    if btn(5) then
      tId = mget((p.x+4)//8,(p.y+8)//8)
      if tId==9 or tId==10 or tId==25 or tId==26 then
        boilerLevel=boilerLevel+0.1
        if boilerLevel > 9 then boilerLevel = 9 end
      elseif tId==41 or tId==42 or tId==57 or tId==58 then
        waterLevel=waterLevel-0.1
        if waterLevel < 0 then waterLevel = 0 end
      end
    end

    if mget((p.x+4)//8,(p.y+16)//8)==16 then
      p.vy=math.min(0,p.vy)
    else
      p.vy=p.vy+0.1
    end

    p.x=p.x+p.vx
    p.y=p.y+p.vy

    if p.x > 240 then
      cStart=29
      p.x=0
    elseif p.x<-8 then
      cStart=0
      p.x=239
    end

    cls(1)
    map(cStart,0)
    if cStart==0 then
      rect(20,89-boilerLevel,8,boilerLevel,2)
      rect(172,89-waterLevel,6,waterLevel,2)
    end
    spr(257,p.x,p.y,14,1,0,0,1,2)
  end

end
