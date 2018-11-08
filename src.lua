p={
  x=52,
  y=16,
  vx=0,
  vy=0
}

s={
  z=100,
  vz=0,
  el={
    H=100,
    C=100,
    O=100,
    Fe=100,
    Cu=100,
    Sn=100
  },
  com={
    acc={
      health=100,
      cap=100,
      res={
        elec=-0.5
      }
    },
    roto=100,
    prop=100,
    eng=100,
    gear=100,
    cool=100,
    gen=100,
    hyd=100,
    sonar=100,
    tankH=100,
    tankH20=100,
    tankCH4=100,
    battery=100
  },
  sto={
    H=100,
    H20=100,
    CH4=100
  }
}

start={
  t=0,
  x=60,
  y=42
}

-- simplified
-- inputs
-- throttle position
-- helm position
-- output
-- velocity
-- direction
-- altitude

-- generator
-- rpm to electricity

-- batteries
-- electricity storage

-- water tank
-- water storage

-- thruster & lifter
-- electricity to rpm
-- rpm to thrust
-- hydraulic pressure to control through actuators

-- turbine
-- steam to rpm
-- grease

-- boiler
-- water and methane to steam
-- grease

-- hydraulic pump
-- rpm to hydraulic pressure

-- bladder
-- hydrogen volume to buoyancy

-- accumulator
-- speed and electricity to:
-- Hydrogen
-- Carbon
-- Oxygen

-- radar
-- electricity to view

-- lighting?

-- hydrogen tank
-- hydrogen storage

-- methane tank
-- methane storage

-- helm
-- hydraulic pressure to control inputs

-- throttle to methane output to boiler

infoW=40
cStart=0
waterLevel=0
boilerLevel=9
startScreen=true

function init()
  poke(0x03FF8, 3)
end

init()

function TIC()

  if startScreen then
    if btn(0) then y=y-1 end
    if btn(1) then y=y+1 end
    if btn(2) then x=x-1 end
    if btn(3) then x=x+1 end
    if btn(5) then startScreen=false end

    cls(0)
    sprId=0
    if (start.t%60)//30 == 0 then
      sprId=1
    else
      sprId=49
    end

    spr(sprId,start.x,start.y,14,2,0,0,8,3)
    print("Das Luftschiff",84,84)
    print("X Start", 84, 94)
    start.t=start.t+1
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
      tId = mget((p.x+4 - infoW)//8 + cStart,(p.y+8)//8)
      if tId==41 or tId==42 or tId==57 or tId==58 then
        boilerLevel=boilerLevel+0.1
        if boilerLevel > 9 then boilerLevel = 9 end
      elseif tId==75 or tId==76 or tId==91 or tId==92 then
        waterLevel=waterLevel-0.1
        if waterLevel < 0 then waterLevel = 0 end
      end
    end

    s.vz = (4 / (s.z + 4)) - 0.04
    if waterLevel > 5 then s.vz = s.vz - 0.03 end
    if boilerLevel < 1 then s.vz = s.vz - 0.08 end

    s.z = s.z + s.vz

    if mget((p.x+4 - infoW)//8 + cStart,(p.y+16)//8) == 16 then
      p.vy=math.min(0,p.vy)
    else
      p.vy=p.vy+0.1
    end

    p.x=p.x+p.vx
    p.y=p.y+p.vy

    if p.x > 240 then
      cStart=24
      p.x = infoW + 4
    elseif p.x < infoW - 4 then
      cStart=0
      p.x=239
    end

    cls(0)
    map(cStart,0,25,17,infoW,0)
    if cStart==0 then
      rect(92,89-boilerLevel,8,boilerLevel,2)
      rect(117,89-waterLevel,6,waterLevel,2)
    end
    spr(257,p.x,p.y,0,1,0,0,1,2)
    drawStatus()
  end

end


function drawStatus()
  rect(0, 0, infoW, 136, 0)
  print("Luftschiff", 1, 1, 15, false, 1, true)
  print(string.format("Alt %d", s.z//1), 1, 10, 14, false, 1, true)
  print(string.sub(string.format("DV %f", s.vz), 1, -5), 1, 20, 14, false, 1, true)
end
