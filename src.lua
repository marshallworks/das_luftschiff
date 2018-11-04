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
    cls(1)
    print("STARTED",84,84)
  end

end
