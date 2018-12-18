KG_TO_N=9.81
H_MASS_TO_VOLUME=11.988
DRAG_COEFFICENT=0.26
FRONT_DRAG_AREA=28
BOTTOM_DRAG_AREA=64
GRAVITY=9.8
SEA_LEVEL_AIR_DENSITY=1.225
HYDROGEN_DENSITY=0.08988
WING_LIFT=128

HYDROGEN_LIFT_ADJUST=5.95

SHIP_MAX_SPEED=300
SHIP_MAX_ALT=10000
SHIP_DRY_WEIGHT_KG=120000

DISPLAYS_PWR_DEMAND_KW=0.017

SPLTR_PWR_DEMAND_KW=0.05
SPLTR_MAX_H2O=2.4
SPLTR_PER_TIC_H=0.266
SPLTR_PER_TIC_O=2.128

RTR_MAX_THRUST_KN=70000
RTR_MAX_PWR_DEMAND_KW=46.4
RTR_MAX_ROTATE_SPEED_D=0.08
RTR_MAX_HYD_DEMAND_KNSM=6.4

PROP_MAX_THRUST_KN=47600
PROP_MAX_PWR_DEMAND_KW=18.5
PROP_MAX_ROTATE_SPEED_D=0.12
PROP_MAX_HYD_DEMAND_KNSM=5.2

GEN_MAX_KW=225
GEN_MAX_NM=516
TURB_MAX_NM=560
TURB_MAX_STEAM_KNSM=160
BILR_MAX_STEAM_KNSM=172
BILR_MAX_REG_STEAM_KNSM=104
BILR_H2O_KG_PER_KNSM=0.0008
BILR_CH4_KG_PER_KNSM=0.0394
BILR_O_KG_PER_KNSM=0.0152

BATTERY_MAX_CHARGE_KW=350
BATTERY_MAX_CHARGE_RATE_KW=0.022

HYD_MAX_KNSM=32
HYD_PUMP_MAX_NM=16
HYD_PUMP_NM_PER_KNSM=2

CLL_MAX_M3=12000
H_TANK_MAX_KG=220
O_TANK_MAX_KG=2800
H2O_TANK_MAX_KG=16800
CH4_TANK_MAX_KG=16800

CLL_MAX_VENT_M3F=7
CLL_MAX_M3F=12.4
H_TANK_MAX_KGF=0.3
O_TANK_MAX_KGF=2.3
H2O_TANK_MAX_KGF=2.6
CH4_TANK_MAX_KGF=8.274

H2O_ACC_PWR_DEMAND_KW=0.067
CH4_ACC_PWR_DEMAND_KW=0.117
H2O_ACC_PER_TIC=12
CH4_ACC_PER_TIC=20

str={
  t= 0,
  x= 60,
  y= 42
}

cam={
  t=0,
  x=0,
  y=0,
  cellX=0,
  cellY=0
}

p={
  s=257,
  x=492,
  y=190,
  vx=0,
  vy=0,
  flip=0,
}

s={
  speed=42,
  accl=0,
  heading=0,
  rot=0,
  vsi=0,
  set_vsi=0,
  isCrash=false,
  dis=0,
  pos={
    x=0,
    y=0,
    z=1000
  },
  con={
    alt=1000,
    vsi=0.2,
    thrt={
      props=0.3,
      rtrs=0.7
    },
    rot={
      props=0,
      rtrs=0
    }
  },
  env={
    Atmo=SEA_LEVEL_AIR_DENSITY,
    H2O=0.0,
    CH4=0.0
  }
}

gauges={
  needles={
    vsi={
      x=109,
      y=79,
      c=5
    },
    heading={
      x=175,
      y=79,
      c=5
    },
    rot={
      x=92,
      y=74,
      c=5
    },
    con_vsi={
      x=109,
      y=80,
      c=15
    },
    con_heading={
      x=176,
      y=80,
      c=15
    },
    con_rot={
      x=93,
      y=75,
      c=15
    },
    props={
      one={
        x=169,
        y=113,
        c=5
      },
      two={
        x=185,
        y=113,
        c=5
      }
    },
    rtrs={
      one={
        x=85,
        y=110,
        c=5
      },
      two={
        x=101,
        y=110,
        c=5
      },
      three={
        x=133,
        y=110,
        c=5
      },
      four={
        x=149,
        y=110,
        c=5
      }
    }
  },
  levels={
    con_alt={
      x=114,
      y=68,
      w=4,
      h=24,
      c=15
    },
    con_thrt={
      x=138,
      y=68,
      w=4,
      h=24,
      c=15
    }
  },
  bars={
    alt={
      x=114,
      y=68,
      w=4,
      h=24,
      c=5
    },
    speed={
      x=138,
      y=68,
      w=4,
      h=24,
      c=5
    },
    props={
      one={
        x=161,
        y=108,
        w=2,
        h=11,
        c=5
      },
      two={
        x=177,
        y=108,
        w=2,
        h=11,
        c=5
      }
    },
    rtrs={
      one={
        x=73,
        y=108,
        w=2,
        h=11,
        c=5
      },
      two={
        x=89,
        y=108,
        w=2,
        h=11,
        c=5
      },
      three={
        x=121,
        y=108,
        w=2,
        h=11,
        c=5
      },
      four={
        x=137,
        y=108,
        w=2,
        h=11,
        c=5
      }
    },
    clls={
      one={
        x=202,
        y=108,
        w=4,
        h=16,
        c=5
      },
      two={
        x=210,
        y=108,
        w=4,
        h=16,
        c=5
      },
      three={
        x=218,
        y=108,
        w=4,
        h=16,
        c=5
      },
      four={
        x=226,
        y=108,
        w=4,
        h=16,
        c=5
      }
    },
    tks={
      H2O={
        x=202,
        y=68,
        w=4,
        h=24,
        c=5
      },
      CH4={
        x=218,
        y=68,
        w=4,
        h=24,
        c=5
      }
    }
  }
}

drawables={
  prop={
    s=400,
    w=2,
    h=3
  },
  spltr={
    s=418,
    w=2,
    h=1
  },
  rotor_upper={
    s=420,
    w=2,
    h=1
  },
  rotor_lower={
    s=434,
    w=6,
    h=1
  },
  disp={
    s=424,
    w=4,
    h=2
  },
  CH4acc={
    s=428,
    w=2,
    h=2
  },
  H2Oacc={
    s=430,
    w=2,
    h=2
  },
  btry={
    s=448,
    w=3,
    h=2
  },
  hyd_pump={
    s=451,
    w=2,
    h=2
  },
  gen={
    s=453,
    w=4,
    h=2
  },
  turb={
    s=457,
    w=2,
    h=2
  },
  bilr={
    s=459,
    w=3,
    h=2
  },
  pto_upper={
    s=462,
    w=1,
    h=1
  },
  pto_lower={
    s=463,
    w=1,
    h=1
  },
  hyd_acc={
    s=480,
    w=2,
    h=2
  },
  Hcell={
    s=482,
    w=5,
    h=2
  },
  H2Otank={
    s=487,
    w=3,
    h=2
  },
  CH4tank={
    s=490,
    w=2,
    h=2
  },
  Otank={
    s=492,
    w=2,
    h=2
  },
  Htank={
    s=478,
    w=2,
    h=3
  }
}

strScreen=true
endScreen=false
showControls=false
showMap=false

debugType=0
controlType=0

RES_PT_COUNT=4200
MAP_DIM=500
mapVls={}
CH4pts={}
H2Opts={}

function initGame()
  -- Background color
  poke(0x03FF8, 8)
  math.randomseed(8778)

  buildMap()

  cam.x=p.x-120
  cam.y=p.y-64
  cam.cellX=cam.x / 8
  cam.cellY=cam.y / 8

  music(0)
  initShip()
end

function initShip()
  accH2O={
    st=1,
    id="H2Oacc",
    bb={min_x=85,min_y=23,max_x=86,max_y=24},
    drw={{s=430,w=2,h=2}}
  }
  accCH4={
    st=1,
    id="CH4acc",
    bb={min_x=83,min_y=27,max_x=84,max_y=28}
  }
  btry={
    st=1,
    level=BATTERY_MAX_CHARGE_KW,
    id="btry",
    bb={min_x=42,min_y=23,max_x=47,max_y=24}
  }
  bilr={
    st=1,
    id="bilr",
    bb={min_x=48,min_y=27,max_x=51,max_y=28}
  }
  cl1={
    st=1,
    level=CLL_MAX_M3*.7,
    vent=0.0,
    id="Hcell",
    bb={min_x=77,min_y=21,max_x=84,max_y=22}
  }
  cl2={
    st=1,
    level=CLL_MAX_M3*.7,
    vent=0.0,
    id="Hcell",
    bb={min_x=68,min_y=21,max_x=75,max_y=22}
  }
  cl3={
    st=1,
    level=CLL_MAX_M3*.7,
    vent=0.0,
    id="Hcell",
    bb={min_x=44,min_y=21,max_x=51,max_y=22}
  }
  cl4={
    st=1,
    level=CLL_MAX_M3*.7,
    vent=0.0,
    id="Hcell",
    bb={min_x=35,min_y=21,max_x=42,max_y=22}
  }
  disps={
    st=1,
    on=true,
    id="disp",
    bb={min_x=56,min_y=23,max_x=59,max_y=24}
  }
  hydPump={
    st=1,
    id="hyd_pump",
    bb={min_x=37,min_y=27,max_x=38,max_y=28}
  }
  hydRes={
    st=1,
    level=HYD_MAX_KNSM,
    id="hyd_acc",
    bb={min_x=37,min_y=23,max_x=38,max_y=24}
  }
  gen={
    st=1,
    id="gen",
    bb={min_x=40,min_y=27,max_x=43,max_y=28}
  }
  prp1={
    st=1,
    rot=0,
    thrust=0,
    id="prop",
    bb={min_x=33,min_y=22,max_x=34,max_y=24}
  }
  prp2={
    st=1,
    rot=0,
    thrust=0,
    id="prop",
    bb={min_x=33,min_y=26,max_x=34,max_y=28}
  }
  rtr1={
    st=1,
    rot=0,
    thrust=0,
    id="rotor_lower",
    bb={min_x=76,min_y=32,max_x=81,max_y=32},
    id2="rotor_upper",
    bb2={min_x=78,min_y=31,max_x=79,max_y=31}
  }
  rtr2={
    st=1,
    rot=0,
    thrust=0,
    id="rotor_lower",
    bb={min_x=66,min_y=32,max_x=71,max_y=32},
    id2="rotor_upper",
    bb2={min_x=68,min_y=31,max_x=69,max_y=31}
  }
  rtr3={
    st=1,
    rot=0,
    thrust=0,
    id="rotor_lower",
    bb={min_x=48,min_y=32,max_x=53,max_y=32},
    id2="rotor_upper",
    bb2={min_x=50,min_y=31,max_x=51,max_y=31}
  }
  rtr4={
    st=1,
    rot=0,
    thrust=0,
    id="rotor_lower",
    bb={min_x=38,min_y=32,max_x=43,max_y=32},
    id2="rotor_upper",
    bb2={min_x=40,min_y=31,max_x=41,max_y=31}
  }
  spltr={
    st=1,
    id="spltr",
    bb={min_x=62,min_y=28,max_x=63,max_y=28}
  }
  tkH={
    st=1,
    level=H_TANK_MAX_KG,
    id="Htank",
    bb={min_x=58,min_y=26,max_x=61,max_y=29
    }
  }
  tkO={
    st=1,
    level=O_TANK_MAX_KG,
    id="Otank",
    bb={min_x=58,min_y=31,max_x=61,max_y=32}
  }
  tkH2O={
    st=1,
    level=H2O_TANK_MAX_KG,
    id="H2Otank",
    bb={min_x=68,min_y=27,max_x=73,max_y=28}
  }
  tkCH4={
    st=1,
    level=CH4_TANK_MAX_KG,
    id="CH4tank",
    bb={min_x=75,min_y=27,max_x=80,max_y=28}
  }
  turb={
    st=1,
    id="turb",
    bb={min_x=46,min_y=27,max_x=47,max_y=28}
  }
end

function buildMap()
  for i=1, RES_PT_COUNT do
    CH4pts[i]={x=math.random(-MAP_DIM,MAP_DIM),y=math.random(-MAP_DIM,MAP_DIM)}
    H2Opts[i]={x=math.random(-MAP_DIM,MAP_DIM),y=math.random(-MAP_DIM,MAP_DIM)}
  end
end

function TIC()

  if strScreen then
    if btn(0) then str.y=str.y-1 end
    if btn(1) then str.y=str.y+1 end
    if btn(2) then str.x=str.x-1 end
    if btn(3) then str.x=str.x+1 end
    if btn(5) then strScreen=false end

    cls(0)
    sprId=0
    if (str.t%60)//30==0 then
      sprId=1
    else
      sprId=49
    end

    map()
    spr(sprId,str.x,str.y,0,2,0,0,8,3)
    print("Das Luftschiff",4,4)
    print("X Start",84,94)
    print("A Repair/Activate",84,106)
  elseif endScreen then
    cls()
    print("Game Over",84,70)
    if s.dis<10000 then
      print(string.format("Distance: %dm",s.dis//1),84,84)
    else
      print(string.format("Distance: %dkm",s.dis//1000),84,84)
    end
    sfx(-1,"D#1",-1,0,0,0)
  else
    music()
    --if btnp(5) then showMap=not showMap end

    if mapContains(disps.bb, {x=p.x,y=p.y}) then
      if btnp(6) then showControls=not showControls end
    end
    doRepairs()

    if not showControls and btn(6) then
      if (str.t%16)==0 then
        sfx(2,24,4,3,4,2)
      end
    end

    sfx(0,"D#1",-1,0,10,0)

    playAmbientChannel(1,{
      {c=accH2O,id=6,nt="D#3"},
      {c=turb,id=5,nt="F-2"},
      {c=prp1,id=3,nt="D-2"},
      {c=prp2,id=3,nt="D-2"},
      {c=rtr1,id=4,nt="C-1"},
      {c=rtr3,id=4,nt="C-1"},
      {c=rtr4,id=4,nt="C-1"}
    },7)

    playAmbientChannel(2,{
      {c=bilr,id=2,nt="C-1"},
      {c=gen,id=1,nt="E-3"},
      {c=accCH4,id=6,nt="F-4"},
      {c=rtr2,id=4,nt="C-1"}
    },4)

    if showControls then
      if btnp(2) then controlType=controlType-1 end
      if btnp(3) then controlType=controlType + 1 end

      if controlType < 0 then controlType=4 end
      if controlType > 4 then controlType=0 end

      if controlType==0 then
        if btn(0) then s.con.rot.rtrs=s.con.rot.rtrs + 1 end
        if btn(1) then s.con.rot.rtrs=s.con.rot.rtrs-1 end
        if s.con.rot.rtrs < 0 then s.con.rot.rtrs=0 end
        if s.con.rot.rtrs > 90 then s.con.rot.rtrs=90 end
      elseif controlType==1 then
        if btn(0) then s.con.vsi=s.con.vsi + 0.02 end
        if btn(1) then s.con.vsi=s.con.vsi-0.02 end
        if s.con.vsi < -1.2 then s.con.vsi=-1.2 end
        if s.con.vsi > 1.2 then s.con.vsi=1.2 end
      elseif controlType==2 then
        if btn(0) then s.con.alt=s.con.alt + 10 end
        if btn(1) then s.con.alt=s.con.alt-10 end
        if s.con.alt < 0 then s.con.alt=0 end
        if s.con.alt > SHIP_MAX_ALT then s.con.alt=SHIP_MAX_ALT end
      elseif controlType==3 then
        if btn(0) then s.con.thrt.props=s.con.thrt.props + 0.01 end
        if btn(1) then s.con.thrt.props=s.con.thrt.props-0.01 end
        if s.con.thrt.props < 0.0 then s.con.thrt.props=0.0 end
        if s.con.thrt.props > 1 then s.con.thrt.props=1 end
      elseif controlType==4 then
        if btn(0) then s.con.rot.props=s.con.rot.props-1 end
        if btn(1) then s.con.rot.props=s.con.rot.props + 1 end
        if s.con.rot.props < 0 then s.con.rot.props=360 end
        if s.con.rot.props > 360 then s.con.rot.props=s.con.rot.props-360 end
      end
    else
      playerMovement()
    end

    cls(0)
    simulate()

    applyWear()

    if not showMap then
      drawGame()
    end

    if showMap then
      drawMap(30,17)
    end

    drawShipStatus()
  end
  str.t=str.t+1
end

function playerMovement()
  onFloor=false
  inCeiling=false
  onLadder=false
  testX=p.x // 8
  testY=p.y // 8
  testYD=(p.y // 8) + 1
  testYU=(p.y // 8)-1
  downId=mget(testX,testYD)
  if downId==16 or downId==189 or downId==158 then onFloor=true end
  if mget(testX, testYU)==16 then inCeiling=true end
  if mget(testX, testY)==32 or mget(testX, testYD)==32 then onLadder=true end

  if btn(0) and onLadder then
    p.vy=math.max(p.vy-0.06,-.3)
  elseif btn(1) and onLadder and not onFloor then
    p.vy=math.max(p.vy+0.06, .3)
  elseif onLadder then
    p.vy=0.0
  elseif btn(0) and onFloor then
    p.vy=-1.2
  elseif p.vy==0 and onFloor then
    p.y=testY * 8 + 1
    p.vy=math.min(p.vy, 0.0)
  elseif not onFloor then
    p.vy=math.min(p.vy + 0.1, 2.0)
  else
    p.vy=0.0
  end

  if inCeiling and p.vy < 0 then
    p.vy=-p.vy
  end

  isAcc=false
  isDeAcc=false

  if btn(2) then
    p.vx=math.max(p.vx-0.06, -0.8)
    isAcc=p.vx>-.3
  elseif btn(3) then
    p.vx=math.min(p.vx + 0.06, 0.8)
    isAcc=p.vx<.3
  else
    if p.vx>0 then
      p.vx=math.max(p.vx-0.1,0)
    else
      p.vx=math.min(p.vx+0.1,0)
    end
    isDeAcc=p.vx~=0
  end

  if p.vx>0 then
    p.flip=0
  elseif p.vx<0 then
    p.flip=1
  end

  if not onLadder and not onFloor then
    p.s=261
  elseif p.vx==0 and onLadder and not onFloor then
    if p.vy==0 then
      p.s=262
    else
      if (str.t%16)//8==0 then
        p.s=262
      else
        p.s=263
      end
    end
  elseif p.vx==0 then
    p.s=256
  elseif isAcc then
    p.s=259
  elseif isDeAcc then
    p.s=260
  else
    if (str.t%12)==0 then
      sfx(2,48,3,3,4,3)
    end
    if (str.t%12)//6==0 then
      p.s=257
    else
      p.s=258
    end
  end

  p.x=p.x+p.vx
  p.y=p.y+p.vy

  cam.x=lerp(cam.x, p.x-120, 0.15)
  cam.y=lerp(cam.y, 137, 0.15) -- p.y-64
  cam.cellX=cam.x / 8
  cam.cellY=cam.y / 8

  if p.y > 234 then
    if p.x < 292 then p.x=292 end
    if p.x > 668 then p.x=668 end
  elseif p.y > 202 then
    if p.x < 268 then p.x=268 end
    if p.x > 684 then p.x=684 end
  else
    if p.x < 268 then p.x=268 end
    if p.x > 700 then p.x=700 end
  end

  if p.y > 257 then p.y=257 end
  if p.y < 176 then p.y=176 end
end

function doRepairs()
  tP={x=p.x,y=p.y}
  if btn(6) then
    maybeDoRepair(bilr,tP)
    maybeDoRepair(turb,tP)
    maybeDoRepair(hydRes,tP)
    maybeDoRepair(hydPump,tP)
    maybeDoRepair(gen,tP)
    maybeDoRepair(rtr1,tP)
    maybeDoRepair(rtr2,tP)
    maybeDoRepair(rtr3,tP)
    maybeDoRepair(rtr4,tP)
    maybeDoRepair(prp1,tP)
    maybeDoRepair(prp2,tP)
    maybeDoRepair(accH2O,tP)
    maybeDoRepair(accCH4,tP)
    maybeDoRepair(cl1,tP)
    maybeDoRepair(cl2,tP)
    maybeDoRepair(cl3,tP)
    maybeDoRepair(cl4,tP)
    maybeDoRepair(btry,tP)
    maybeDoRepair(spltr,tP)
    maybeDoRepair(tkH,tP)
    maybeDoRepair(tkO,tP)
    maybeDoRepair(tkH2O,tP)
    maybeDoRepair(tkCH4,tP)
  end
end

function applyWear()
  bilr.st=bilr.st-0.00001
  bilr.st=bilr.st-0.000001
  turb.st=turb.st-0.00001
  hydRes.st=hydRes.st-0.000001
  hydPump.st=hydPump.st-0.00001
  gen.st=gen.st-0.00001
  rtr1.st=rtr1.st-0.00001
  rtr2.st=rtr2.st-0.00001
  rtr3.st=rtr3.st-0.00001
  rtr4.st=rtr4.st-0.00001
  prp1.st=prp1.st-0.00001
  prp2.st=prp2.st-0.00001
  accH2O.st=accH2O.st-0.00001
  accCH4.st=accCH4.st-0.00001
  cl1.st=cl1.st-0.00001
  cl2.st=cl2.st-0.00001
  cl3.st=cl3.st-0.00001
  cl4.st=cl4.st-0.00001
  btry.st=btry.st-0.000001
  spltr.st=spltr.st-0.00001
  tkH.st=tkH.st-0.000001
  tkO.st=tkO.st-0.000001
  tkH2O.st=tkH2O.st-0.000001
  tkCH4.st=tkCH4.st-0.000001
end

function maybeDoRepair(c,p)
  if mapContains(c.bb,p) then c.st=math.min(c.st+0.01,1) end
end

function playAmbient(c,dis,channel,id,note)
  sfx(id,note,-1,channel,clamp01(invLerp(2000,0,dis))*12//1,0)
end

function playAmbientChannel(ch,comps,count)
  nearDis=1000000
  nearest=nil
  for i=1, count do
    item=comps[i]
    soundPos=scaleV2(bbCenter(item.c.bb),8)
    soundDis=sqrDistance({x=p.x,y=p.y},soundPos)
    if soundDis<nearDis then
      nearDis=soundDis
      nearest=item
    end
  end

  if nearest ~= nil then
    playAmbient(nearest.c,nearDis,ch,nearest.id,nearest.nt)
  end
end

function drawShipStatus()
  repair = math.max((math.min(disps.st,bilr.st,turb.st,
      hydRes.st,hydPump.st,gen.st,rtr1.st,rtr2.st,
      rtr3.st,rtr4.st,prp1.st,prp2.st,
      accH2O.st,accCH4.st,cl1.st,cl2.st,cl3.st,
      cl4.st,btry.st,spltr.st,tkH.st,tkO.st,
      tkH2O.st,tkCH4.st)*100+0.5)//1,0)
  resources=(math.min((tkH2O.level/H2O_TANK_MAX_KG)*100+0.5,
                      (tkCH4.level/CH4_TANK_MAX_KG)*100+0.5))//1
  rect(0, 0, 96, 8, 8)
  rect(127, 0, 113, 8, 8)
  print(string.format("Speed: %d", s.speed//1), 1, 1, 6, false, 1, true)
  if s.pos.z >=1000 then
    print(string.sub(string.format("Altitude: %f", s.pos.z/1000.0), 1, -6).."k", 48, 1, 6, false, 1, true)
  else
    print(string.format("Altitude: %d",s.pos.z//1),48,1,6,false,1,true)
  end
  print(string.format("Repair: %d%%", repair), 128, 1, 6, false, 1, true)
  print(string.format("Resources: %d%%", resources), 180, 1, 6, false, 1, true)

  if s.pos.z<1 and s.speed<1 and resources<1 then
    endScreen=true
  end
end

function getShipTilePos()
  return {x=s.pos.x//20000,y=s.pos.y//20000}
end

function getMapTile(pX,pY)
  if mapVls[pY]==nil then
    mapVls[pY]={}
  end

  if mapVls[pY][pX]==nil then
    CH4cnt=0
    H2Ocnt=0
    tp={x=pX,y=pY}
    for i=1, RES_PT_COUNT do
      CH4pt=CH4pts[i]
      H2Opt=H2Opts[i]
      CH4dis=64-sqrDistance(tp,CH4pt)
      H2Odis=64-sqrDistance(tp,H2Opt)
      CH4cnt=CH4cnt+math.max(0,CH4dis)
      H2Ocnt=H2Ocnt+math.max(0,H2Odis)
    end
    mapVls[pY][pX]={
      CH4=math.min(1,invLerp(0,72,CH4cnt)),
      H2O=math.min(1,invLerp(0,72,H2Ocnt))
    }
  end

  return mapVls[pY][pX]
end

function getShipTile()
  sP=getShipTilePos()
  return getMapTile(sP.x,sP.y)
end

function drawMap(xSize,ySize,xOff,yOff)
  if xOff==nil then xOff=0 end
  if yOff==nil then yOff=0 end
  sP=getShipTilePos()
  cYOffset=sP.y-ySize//2
  cXOffset=sP.x-xSize//2
  -- print(string.format("%d:%d", cXOffset, cYOffset), 2, 2, 10, false, 1, true)
  -- print(string.format("%d:%d", s.pos.x//1, s.pos.y//1), 2, 10, 10, false, 1, true)
  for cY=cYOffset, ySize+cYOffset do
    for cX=cXOffset, xSize+cXOffset do
      mapVl=getMapTile(cX,cY)
      spr(lerp(144,148,mapVl.CH4),(cX-cXOffset-1)*8+xOff,
          (cY-cYOffset-1)*8+yOff,0)
      spr(lerp(149,153,mapVl.H2O),(cX-cXOffset-1)*8+xOff,
          (cY-cYOffset-1)*8+yOff,0)
    end
  end
end

function drawGame()
  drawShip()

  if showControls then
    map(0, 125, 30, 11, 0, 48)

    print("DLS Radar", 8, 57, 15, false, 1, true)
    print("RTR", 78, 57, 6, false, 1, true)
    print("Angle", 74, 65, 6, false, 1, true)
    print("VS", 100, 57, 6, false, 1, true)
    print("Alt", 111, 57, 6, false, 1, true)
    print("Spd", 135, 57, 6, false, 1, true)
    print("Heading", 163, 57, 6, false, 1, true)
    print("H2O", 199, 57, 6, false, 1, true)
    print("CH4", 215, 57, 6, false, 1, true)

    drawNeedleLevelStatus(gauges.needles.vsi, s.vsi, -1.2, 1.2, 0, 180, 8)
    drawNeedleLevelStatus(gauges.needles.con_vsi, s.con.vsi, -1.2, 1.2, 0, 180, 10)

    drawNeedleAngeStatus(gauges.needles.heading, s.heading, { x=0, y=-8 })
    drawNeedleAngeStatus(gauges.needles.rot, s.rot, { x=0, y=15 })
    drawNeedleAngeStatus(gauges.needles.con_heading, s.con.rot.props,
                     { x=0, y=-10 })
    drawNeedleAngeStatus(gauges.needles.con_rot, s.con.rot.rtrs,
                     { x=0, y=17 })

    drawBarStatus(gauges.bars.alt, s.pos.z, SHIP_MAX_ALT)
    drawBarStatus(gauges.bars.speed, s.speed, SHIP_MAX_SPEED)

    drawBarStatus(gauges.bars.tks.H2O, tkH2O.level, H2O_TANK_MAX_KG)
    drawBarStatus(gauges.bars.tks.CH4, tkCH4.level, CH4_TANK_MAX_KG)

    altY=lerp(91, 67, invLerp(0, SHIP_MAX_ALT, s.pos.z))-2.5
    spdY=lerp(91, 67, invLerp(0, SHIP_MAX_SPEED, s.speed))-2.5
    print(string.sub(string.format("%f", s.pos.z/1000.0), 1, -6).."k", 120, altY, 5, false, 1, true)
    if s.speed < 100 then
      print(string.sub(string.format("%f", s.speed), 1, -6), 144, spdY, 5, false, 1, true)
    else
      print(string.format("%d", s.speed//1), 144, spdY, 5, false, 1, true)
    end

    drawLevelStatus(gauges.levels.con_alt, s.con.alt, SHIP_MAX_ALT)
    drawLevelStatus(gauges.levels.con_thrt, s.con.thrt.props, 1)

    print("PRP1", 159, 100, 6, false, 1, true)
    print("PRP2", 178, 100, 6, false, 1, true)

    drawPropRotationStatus(gauges.needles.props.one,
                           prp1.rot)
    drawPropRotationStatus(gauges.needles.props.two,
                           prp2.rot)

    drawPropThrustStatus(gauges.bars.props.one, prp1.thrust)
    drawPropThrustStatus(gauges.bars.props.two, prp2.thrust)

    print("RTR1", 71, 100, 6, false, 1, true)
    print("RTR2", 90, 100, 6, false, 1, true)
    print("RTR3", 119, 100, 6, false, 1, true)
    print("RTR4", 138, 100, 6, false, 1, true)

    drawRotorRotationStatus(gauges.needles.rtrs.one,
                            rtr1.rot)
    drawRotorRotationStatus(gauges.needles.rtrs.two,
                            rtr2.rot)
    drawRotorRotationStatus(gauges.needles.rtrs.three,
                            rtr3.rot)
    drawRotorRotationStatus(gauges.needles.rtrs.four,
                            rtr4.rot)

    drawRotorThrustStatus(gauges.bars.rtrs.one, rtr1.thrust)
    drawRotorThrustStatus(gauges.bars.rtrs.two, rtr2.thrust)
    drawRotorThrustStatus(gauges.bars.rtrs.three, rtr3.thrust)
    drawRotorThrustStatus(gauges.bars.rtrs.four, rtr4.thrust)

    print("Hyd Cells", 199, 100, 6, false, 1, true)

    drawBarStatus(gauges.bars.clls.one, cl1.level, CLL_MAX_M3)
    drawBarStatus(gauges.bars.clls.two, cl2.level, CLL_MAX_M3)
    drawBarStatus(gauges.bars.clls.three, cl3.level, CLL_MAX_M3)
    drawBarStatus(gauges.bars.clls.four, cl4.level, CLL_MAX_M3)

    drawMap(5,7,16,72)
    sHRot=0
    if s.heading>=45 and s.heading<135 then
      sHRot=1
    elseif s.heading>=135 and s.heading<225 then
      sHRot=2
    elseif s.heading>=225 and s.heading<315 then
      sHRot=3
    end
    spr(422,28,92,0,1,0,sHRot)

    if controlType==0 then
      rectb(71, 63, 26, 34, 7)
    elseif controlType==1 then
      rectb(95, 63, 18, 34, 7)
    elseif controlType==2 then
      rectb(111, 63, 24, 34, 7)
    elseif controlType==3 then
      rectb(135, 63, 24, 34, 7)
    elseif controlType==4 then
      rectb(159, 63, 34, 34, 7)
    end
  end
end

function drawShip()
  maxMapHeight=18
  mapYAdjust=0
  if showControls then
    maxMapHeight=6
    mapYAdjust=3
  end

  camXCellAdd=cam.x % 8==0 and -1 or 0
  camYCellAdd=cam.y % 8==0 and -1 or 0
  camXCor=-cam.x % 8-8
  camYCor=-cam.y % 8-8
  yDown=mapYAdjust*-8
  map(cam.cellX + camXCellAdd, cam.cellY + camYCellAdd + mapYAdjust, 31,
      maxMapHeight, camXCor, camYCor)

  drawCom(disps.bb, disps.id, yDown)

  drawCom(bilr.bb, bilr.id, yDown, bilr.st)
  drawCom(turb.bb, turb.id, yDown, turb.st)

  drawCom(hydRes.bb, hydRes.id, yDown, hydRes.st)
  drawCom(hydPump.bb, hydPump.id, yDown, hydPump.st)

  drawCom(gen.bb, gen.id, yDown, gen.st)

  drawCom(rtr1.bb, rtr1.id, yDown, rtr1.st)
  drawCom(rtr3.bb, rtr3.id, yDown, rtr3.st)

  drawCom(rtr1.bb2, rtr1.id2, yDown)
  drawCom(rtr3.bb2, rtr3.id2, yDown)

  drawCom(prp1.bb, prp1.id, yDown, prp1.st)
  drawCom(prp2.bb, prp2.id, yDown, prp2.st)

  drawCom(accH2O.bb, accH2O.id, yDown, accH2O.st)
  drawCom(accCH4.bb, accCH4.id, yDown, accCH4.st)

  drawCom(spltr.bb, spltr.id, yDown, spltr.st)

  drawCom(tkO.bb, tkO.id, yDown, tkO.st)
  drawCom(tkH2O.bb, tkH2O.id, yDown, tkH2O.st)

  drawCom({ min_x=39, min_y=27, max_x=39, max_y=27 }, "pto_upper", yDown)
  drawCom({ min_x=39, min_y=28, max_x=39, max_y=28 }, "pto_lower", yDown)
  drawCom({ min_x=44, min_y=27, max_x=44, max_y=27 }, "pto_upper", yDown)
  drawCom({ min_x=44, min_y=28, max_x=44, max_y=28 }, "pto_lower", yDown)
  drawCom({ min_x=45, min_y=27, max_x=45, max_y=27 }, "pto_upper", yDown)
  drawCom({ min_x=45, min_y=28, max_x=45, max_y=28 }, "pto_lower", yDown)

  spr(p.s, p.x-cam.x-4, p.y-cam.y-8 + yDown, 0, 1, p.flip, 0, 1, 2)

  drawCom(cl1.bb, cl1.id, yDown, cl1.st)
  drawCom(cl2.bb, cl2.id, yDown, cl2.st)
  drawCom(cl3.bb, cl3.id, yDown, cl3.st)
  drawCom(cl4.bb, cl4.id, yDown, cl4.st)
  drawCom(rtr2.bb, rtr2.id, yDown, rtr2.st)
  drawCom(rtr4.bb, rtr4.id, yDown, rtr4.st)
  drawCom(rtr2.bb2, rtr2.id2, yDown)
  drawCom(rtr4.bb2, rtr4.id2, yDown)
  drawCom(tkH.bb, tkH.id, yDown, tkH.st)
  drawCom(tkCH4.bb, tkCH4.id, yDown, tkCH4.st)
  drawCom(btry.bb, btry.id, yDown, btry.st)
end

function drawCom(bb, drawableId, yDown, st)
  drawable=drawables[drawableId]
  posX=(bb.min_x * 8-cam.x) // 1 + 1
  posY=(bb.min_y * 8-cam.y) // 1 + 1 + yDown

  requestedX=bb.max_x + 1-bb.min_x
  requestedY=bb.max_y + 1-bb.min_y

  if requestedY > drawable.h and drawable.h==3 and
     requestedX > drawable.w and drawable.w==2 then
    for y=1, requestedY do
      adjYPos=(y-1) * 8 + posY
      yOffset=(y-1) * 16
      if y>1 and y<requestedY then
        yOffset=16
      elseif y==requestedY then
        yOffset=32
      end
      for x=1, requestedX do
        adjXPos=(x-1) * 8 + posX
        xOffset=(x-1) % drawable.w
        spr(drawable.s + yOffset + xOffset, adjXPos, adjYPos, 0)
      end
    end
  elseif requestedX > drawable.w and drawable.w==5 then
    for y=1, requestedY do
      adjYPos=(y-1) * 8 + posY
      yOffset=(y-1) * 16
      for x=1, requestedX do
        adjXPos=(x-1) * 8 + posX
        xOffset=x-1
        if x < 3 then
          spr(drawable.s + yOffset + xOffset, adjXPos, adjYPos, 0)
        elseif x < requestedX-1 then
          spr(drawable.s + yOffset + 2, adjXPos, adjYPos, 0)
        else
          spr(drawable.s + yOffset + xOffset-3, adjXPos, adjYPos, 0)
        end
      end
    end
  elseif requestedX > drawable.w and drawable.w==3 then
    for y=1, requestedY do
      adjYPos=(y-1) * 8 + posY
      yOffset=(y-1) * 16
      for x=1, requestedX do
        adjXPos=(x-1) * 8 + posX
        xOffset=x-1
        if x==1 then
          spr(drawable.s + yOffset + xOffset, adjXPos, adjYPos, 0)
        elseif x < requestedX then
          spr(drawable.s + yOffset + 1, adjXPos, adjYPos, 0)
        else
          spr(drawable.s + yOffset + drawable.w-1, adjXPos, adjYPos, 0)
        end
      end
    end
  elseif requestedX > drawable.w and drawable.w==2 then
    for y=1, requestedY do
      adjYPos=(y-1) * 8 + posY
      yOffset=(y-1) * 16
      for x=1, requestedX do
        adjXPos=(x-1) * 8 + posX
        xOffset=(x-1) % drawable.w
        spr(drawable.s + yOffset + xOffset, adjXPos, adjYPos, 0)
      end
    end
  else
    spr(drawable.s, posX, posY, 0, 1, 0, 0, drawable.w, drawable.h)
  end

  if st~=nil then
    baseY=(bb.max_y*8-cam.y+9)
    baseX=posX+((bb.max_x-bb.min_x)/2)*8-4
    sW=(lerp(0,16,st)+0.5)//1
    rect(baseX,baseY,sW,2,6)
    rect(baseX+sW,baseY,16-sW,2,5)
  end
end

function drawNeedleAngeStatus(needle, angle, vec)
  target=rotateV2(vec, angle)
  line(needle.x, needle.y, needle.x + target.x, needle.y + target.y, needle.c)
end

function drawNeedleLevelStatus(needle, value, min_value, max_value,
                               min_angle, max_angle, length)
  vec={ x=0, y=length }
  normal=invLerp(min_value, max_value, value)
  angle=clamp(lerp(min_angle, max_angle, normal), min_angle,max_angle)
  drawNeedleAngeStatus(needle, angle, vec)
end

function drawPropRotationStatus(needle, angle)
  drawNeedleAngeStatus(needle, angle, { x=0, y=-5})
end

function drawRotorRotationStatus(needle, angle)
  drawNeedleAngeStatus(needle, angle, { x=0, y=7})
end

function drawLevelStatus(level, value, max)
  baseY=level.y + level.h
  normal=invLerp(0, max, value)
  levelHeight=(lerp(0, level.h, normal) + 1.5)//1
  levelY=baseY-levelHeight
  line(level.x, levelY, level.x + level.w-1, levelY, level.c)
end

function drawBarStatus(bar, value, max)
  baseY=bar.y + bar.h
  normal=invLerp(0, max, value)
  barHeight=(lerp(0, bar.h, normal) + 0.5)//1
  barY=baseY-barHeight
  rect(bar.x, barY, bar.w, barHeight, bar.c)
end

function drawPropThrustStatus(bar, thrust)
  drawBarStatus(bar, thrust, PROP_MAX_THRUST_KN)
end

function drawRotorThrustStatus(bar, thrust)
  drawBarStatus(bar, thrust, RTR_MAX_THRUST_KN)
end

function dmgSyst(part,vSpeed)
  if math.random()>clamp01(invLerp(-16,0,vSpeed)) then
    part.st=math.max(part.st-clamp01(invLerp(0,-8,vSpeed)),0)
  end
end

function dmgSysts(vSpeed)
  dmgSyst(bilr,vSpeed)
  dmgSyst(turb,vSpeed)
  dmgSyst(hydRes,vSpeed)
  dmgSyst(hydPump,vSpeed)
  dmgSyst(gen,vSpeed)
  dmgSyst(rtr1,vSpeed)
  dmgSyst(rtr2,vSpeed)
  dmgSyst(rtr3,vSpeed)
  dmgSyst(rtr4,vSpeed)
  dmgSyst(prp1,vSpeed)
  dmgSyst(prp2,vSpeed)
  dmgSyst(accH2O,vSpeed)
  dmgSyst(accCH4,vSpeed)
  dmgSyst(cl1,vSpeed)
  dmgSyst(cl2,vSpeed)
  dmgSyst(cl3,vSpeed)
  dmgSyst(cl4,vSpeed)
  dmgSyst(btry,vSpeed)
  dmgSyst(spltr,vSpeed)
  dmgSyst(tkH,vSpeed)
  dmgSyst(tkO,vSpeed)
  dmgSyst(tkH2O,vSpeed)
  dmgSyst(tkCH4,vSpeed)
end

function simulate()
  sim={
    demand={
      kW={
        disps=0,
        rtrs={
          one=0,
          two=0,
          three=0,
          four=0
        },
        props={
          one=0,
          two=0
        },
        spltr=0,
        H2OAcc=0,
        CH4Acc=0,
        btry=0
      },
      kNSM={
        hydRes=0,
        rtrs={
          one=0,
          two=0,
          three=0,
          four=0
        },
        props={
          one=0,
          two=0
        }
      },
      NM={
        hydPump=0,
        gen=0
      },
      H2O={
        tank=0,
        bilr=0,
        spltr=0
      },
      CH4={
        tank=0,
        bilr=0
      },
      H_M={
        tank=0
      },
      H_V={
        clls={
          one=0,
          two=0,
          three=0,
          four=0
        }
      },
      O={
        tank=0,
        bilr=0
      },
      steam=0
    },
    sply={
      kW={
        disps=0,
        rtrs={
          one=0,
          two=0,
          three=0,
          four=0
        },
        props={
          one=0,
          two=0
        },
        spltr=0,
        H2OAcc=0,
        CH4Acc=0,
        btry=0
      },
      kNSM={
        hydRes=0,
        rtrs={
          one=0,
          two=0,
          three=0,
          four=0
        },
        props={
          one=0,
          two=0
        }
      },
      NM={
        hydPump=0,
        gen=0
      },
      H2O={
        tank=0,
        bilr=0,
        spltr=0
      },
      CH4={
        tank=0,
        bilr=0
      },
      H_M={
        tank=0
      },
      H_V={
        clls={
          one=0,
          two=0,
          three=0,
          four=0
        }
      },
      O={
        tank=0,
        bilr=0
      },
      steam=0
    },
    availableForUse={
      kW=btry.level,
      kNSM=hydRes.level,
      H2O=tkH2O.level,
      CH4=tkCH4.level,
      H_M=tkH.level,
      H_V=tkH.level * H_MASS_TO_VOLUME,
      O=tkO.level
    },
    availableForStorage={
      kW=0,
      kNSM=0,
      H2O=0,
      CH4=0,
      H_M=0,
      H_V=0,
      O=0
    }
  }

  sim=controlsPowerDemand(sim)
  sim=controlsHydraulicDemand(sim)
  sim=storageTanksDemand(sim)
  sim=cellDemand(sim)
  sim=btryDemand(sim)
  sim=hydResDemand(sim)
  sim=spltrAccDemand(sim)
  sim=hydPumpDemand(sim)
  sim=genDemand(sim)
  sim=turbDemand(sim)
  sim=bilrDemand(sim)

  sim=elementSupply(sim)
  sim=steamSupply(sim)
  sim=torqueSupply(sim)
  sim=hydraulicSupply(sim)
  sim=powerSupply(sim)

  sim=distributeHydraulics(sim)
  sim=distributePower(sim)

  drainTanks(sim)
  fillTanks(sim)
  applyThrust(sim)
  applyForces(sim)

  if debugType==3 then
    drawSimDebug(sim)
  elseif debugType==4 then
    drawStorageDebug(sim)
  end
end

function controlsPowerDemand(sim)
  sim.demand.kW.disps=DISPLAYS_PWR_DEMAND_KW

  sim.demand.kW.rtrs.one=RTR_MAX_PWR_DEMAND_KW *
      rtr1.st * s.con.thrt.rtrs
  sim.demand.kW.rtrs.two=RTR_MAX_PWR_DEMAND_KW *
      rtr2.st * s.con.thrt.rtrs
  sim.demand.kW.rtrs.three=RTR_MAX_PWR_DEMAND_KW *
      rtr3.st * s.con.thrt.rtrs
  sim.demand.kW.rtrs.four=RTR_MAX_PWR_DEMAND_KW *
      rtr4.st * s.con.thrt.rtrs

  sim.demand.kW.props.one=PROP_MAX_PWR_DEMAND_KW *
      prp1.st * s.con.thrt.props
  sim.demand.kW.props.two=PROP_MAX_PWR_DEMAND_KW *
      prp2.st * s.con.thrt.props

  return sim
end

function controlsHydraulicDemand(sim)
  sim.demand.kNSM.rtrs.one=calcHydDemand(rtr1.rot,
                                             s.con.rot.rtrs,
                                             rtr1.st,
                                             RTR_MAX_ROTATE_SPEED_D,
                                             RTR_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.rtrs.two=calcHydDemand(rtr2.rot,
                                             s.con.rot.rtrs,
                                             rtr2.st,
                                             RTR_MAX_ROTATE_SPEED_D,
                                             RTR_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.rtrs.three=calcHydDemand(rtr3.rot,
                                               s.con.rot.rtrs,
                                               rtr3.st,
                                               RTR_MAX_ROTATE_SPEED_D,
                                               RTR_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.rtrs.four=calcHydDemand(rtr4.rot,
                                              s.con.rot.rtrs,
                                              rtr4.st,
                                              RTR_MAX_ROTATE_SPEED_D,
                                              RTR_MAX_HYD_DEMAND_KNSM)

  sim.demand.kNSM.props.one=calcHydDemand(prp1.rot,
                                            s.con.rot.props,
                                            prp1.st,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.props.two=calcHydDemand(prp2.rot,
                                            s.con.rot.props,
                                            prp2.st,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYD_DEMAND_KNSM)

  return sim
end

function storageTanksDemand(sim)
  sim.demand.H2O.tank=math.min(H2O_TANK_MAX_KG-tkH2O.level,
                                 H2O_TANK_MAX_KGF)
  sim.demand.CH4.tank=math.min(CH4_TANK_MAX_KG-tkCH4.level,
                                 CH4_TANK_MAX_KGF)
  sim.demand.H_M.tank=math.min(H_TANK_MAX_KG-tkH.level,
                                 H_TANK_MAX_KGF)
  sim.demand.O.tank=math.min(O_TANK_MAX_KG-tkO.level,
                               O_TANK_MAX_KGF)

  return sim
end

function cellDemand(sim)
  if cl1.vent <= 0 then
    sim.demand.H_V.clls.one=math.min(
        CLL_MAX_M3-cl1.level, -cl1.vent)
  end
  if cl2.vent <= 0 then
    sim.demand.H_V.clls.two=math.min(
        CLL_MAX_M3-cl2.level, -cl2.vent)
  end
  if cl3.vent <= 0 then
    sim.demand.H_V.clls.three=math.min(
        CLL_MAX_M3-cl3.level, -cl3.vent)
  end
  if cl4.vent <= 0 then
    sim.demand.H_V.clls.four=math.min(
        CLL_MAX_M3-cl4.level, -cl4.vent)
  end

  return sim
end

function btryDemand(sim)
  btryStateDemand=math.min(BATTERY_MAX_CHARGE_RATE_KW,
      BATTERY_MAX_CHARGE_KW * btry.st-btry.level)
  sim.demand.kW.btry=math.max(btryStateDemand, 0)

  return sim
end

function hydResDemand(sim)
  sim.demand.kNSM.hydRes=HYD_MAX_KNSM-hydRes.level

  return sim
end

function spltrAccDemand(sim)
  if sim.demand.H_M.tank > 0 or sim.demand.O.tank > 0 then
    sim.demand.kW.spltr=SPLTR_PWR_DEMAND_KW * spltr.st
    sim.demand.H2O.spltr=SPLTR_MAX_H2O * spltr.st
  end

  if sim.demand.H2O.tank > 0 then
    sim.demand.kW.H2OAcc=H2O_ACC_PWR_DEMAND_KW * accH2O.st
  end

  if sim.demand.CH4.tank > 0 then
    sim.demand.kW.CH4Acc=CH4_ACC_PWR_DEMAND_KW * accCH4.st
  end

  return sim
end

function hydPumpDemand(sim)
  sim.demand.NM.hydPump=math.min(HYD_PUMP_MAX_NM,
      sim.demand.kNSM.hydRes * HYD_PUMP_NM_PER_KNSM)

  return sim
end

function genDemand(sim)
  totalPowerDemand=math.min(GEN_MAX_KW * gen.st,
      sim.demand.kW.disps + sim.demand.kW.rtrs.one +
      sim.demand.kW.rtrs.two + sim.demand.kW.rtrs.three +
      sim.demand.kW.rtrs.four + sim.demand.kW.props.one +
      sim.demand.kW.props.two + sim.demand.kW.spltr +
      sim.demand.kW.H2OAcc + sim.demand.kW.CH4Acc + sim.demand.kW.btry)
  sim.demand.NM.gen=(totalPowerDemand / GEN_MAX_KW) * GEN_MAX_NM

  return sim
end

function turbDemand(sim)
  totalTorqueDemand=math.min(TURB_MAX_NM * turb.st,
      sim.demand.NM.gen + sim.demand.NM.hydPump)
  sim.demand.steam=(totalTorqueDemand / TURB_MAX_NM) * TURB_MAX_STEAM_KNSM

  return sim
end

function bilrDemand(sim)
  superSteamDemand=0
  if sim.demand.steam >= BILR_MAX_REG_STEAM_KNSM then
    superSteamDemand=(sim.demand.steam-BILR_MAX_REG_STEAM_KNSM)*bilr.st
  end
  steamDemand=math.min(BILR_MAX_STEAM_KNSM*bilr.st,
                       sim.demand.steam)
  sim.demand.H2O.bilr=steamDemand * BILR_H2O_KG_PER_KNSM
  sim.demand.CH4.bilr=steamDemand * BILR_CH4_KG_PER_KNSM
  sim.demand.O.bilr=superSteamDemand * BILR_O_KG_PER_KNSM

  return sim
end

function elementSupply(sim)
  sim.sply.O.bilr=math.min(sim.demand.O.bilr, sim.availableForUse.O)
  sim.sply.CH4.bilr=math.min(sim.demand.CH4.bilr,
                                   sim.availableForUse.CH4)

  totalH2ODemand=sim.demand.H2O.bilr + sim.demand.H2O.spltr
  if sim.availableForUse.H2O > totalH2ODemand then
    sim.sply.H2O.bilr=sim.demand.H2O.bilr
    sim.sply.H2O.spltr=sim.demand.H2O.spltr
  elseif sim.availableForUse.H2O > 0 then
    bilrPercent=sim.demand.H2O.bilr / totalH2ODemand
    spltrPercent=sim.demand.H2O.spltr / totalH2ODemand
    sim.sply.H2O.bilr=bilrPercent * sim.availableForUse.H2O
    sim.sply.H2O.spltr=spltrPercent * sim.availableForUse.H2O
  end

  totalH_VDemand=sim.demand.H_V.clls.one + sim.demand.H_V.clls.two +
      sim.demand.H_V.clls.three + sim.demand.H_V.clls.four
  if sim.availableForUse.H_V > totalH_VDemand then
    sim.sply.H_V.clls.one=sim.demand.H_V.clls.one
    sim.sply.H_V.clls.two=sim.demand.H_V.clls.two
    sim.sply.H_V.clls.three=sim.demand.H_V.clls.three
    sim.sply.H_V.clls.four=sim.demand.H_V.clls.four
  elseif sim.availableForUse.H_V > 0 then
    bOnePercent=sim.demand.H_V.clls.one / totalH_VDemand
    bTwoPercent=sim.demand.H_V.clls.two / totalH_VDemand
    bThreePercent=sim.demand.H_V.clls.three / totalH_VDemand
    bFourPercent=sim.demand.H_V.clls.four / totalH_VDemand
    sim.sply.H_V.clls.one=bOnePercent * sim.availableForUse.H_V
    sim.sply.H_V.clls.two=bTwoPercent * sim.availableForUse.H_V
    sim.sply.H_V.clls.three=bThreePercent * sim.availableForUse.H_V
    sim.sply.H_V.clls.four=bFourPercent * sim.availableForUse.H_V
  end

  return sim
end

function steamSupply(sim)
  suppliedH2O_KNSM=sim.sply.H2O.bilr / BILR_H2O_KG_PER_KNSM
  suppliedCH4_KNSM=sim.sply.CH4.bilr / BILR_CH4_KG_PER_KNSM
  suppliedO_KNSM=sim.sply.O.bilr / BILR_O_KG_PER_KNSM

  if suppliedH2O_KNSM < suppliedCH4_KNSM then
    suppliedCH4_KNSM=suppliedH2O_KNSM
    sim.sply.CH4.bilr=suppliedCH4_KNSM * BILR_CH4_KG_PER_KNSM
  elseif suppliedCH4_KNSM < suppliedH2O_KNSM then
    suppliedH2O_KNSM=suppliedCH4_KNSM
    sim.sply.H2O.bilr=suppliedH2O_KNSM * BILR_H2O_KG_PER_KNSM
  end

  suppliedKNSM=suppliedCH4_KNSM

  if suppliedKNSM > BILR_MAX_REG_STEAM_KNSM then
    superSteam=suppliedKNSM-BILR_MAX_REG_STEAM_KNSM
    if suppliedO_KNSM >= superSteam then
      sim.sply.O.bilr=superSteam * BILR_O_KG_PER_KNSM
    else
      missing=superSteam-suppliedO_KNSM
      suppliedKNSM=suppliedKNSM-missing
      sim.sply.CH4.bilr=suppliedKNSM * BILR_CH4_KG_PER_KNSM
      sim.sply.H2O.bilr=suppliedKNSM * BILR_H2O_KG_PER_KNSM
    end
  end

  sim.sply.steam=suppliedKNSM

  return sim
end

function torqueSupply(sim)
  torqueSupplied=TURB_MAX_NM * (sim.sply.steam / TURB_MAX_STEAM_KNSM)
  torqueDemand=sim.demand.NM.gen + sim.demand.NM.hydPump

  if torqueSupplied >= torqueDemand then
    sim.sply.NM.gen=sim.demand.NM.gen
    sim.sply.NM.hydPump=sim.demand.NM.hydPump
  else
    genPercent=sim.demand.NM.gen / torqueDemand
    pumpPercent=sim.demand.NM.hydPump / torqueDemand
    sim.sply.NM.gen=torqueSupplied * genPercent
    sim.sply.NM.hydPump=torqueSupplied * pumpPercent
  end

  return sim
end

function hydraulicSupply(sim)
  sim.sply.kNSM.hydRes=sim.sply.NM.hydPump * HYD_PUMP_NM_PER_KNSM

  totalPressureDemand=sim.demand.kNSM.rtrs.one +
      sim.demand.kNSM.rtrs.two + sim.demand.kNSM.rtrs.three +
      sim.demand.kNSM.rtrs.four + sim.demand.kNSM.props.one +
      sim.demand.kNSM.props.two

  if sim.availableForUse.kNSM >= totalPressureDemand then
    sim.sply.kNSM.rtrs.one=sim.demand.kNSM.rtrs.one
    sim.sply.kNSM.rtrs.two=sim.demand.kNSM.rtrs.two
    sim.sply.kNSM.rtrs.three=sim.demand.kNSM.rtrs.three
    sim.sply.kNSM.rtrs.four=sim.demand.kNSM.rtrs.four
    sim.sply.kNSM.props.one=sim.demand.kNSM.props.one
    sim.sply.kNSM.props.two=sim.demand.kNSM.props.two
  elseif sim.availableForUse.kNSM > 0 then
    rtrsOnePercent=sim.demand.kNSM.rtrs.one / totalPressureDemand
    rtrsTwoPercent=sim.demand.kNSM.rtrs.two / totalPressureDemand
    rtrsThreePercent=sim.demand.kNSM.rtrs.three / totalPressureDemand
    rtrsFourPercent=sim.demand.kNSM.rtrs.four / totalPressureDemand
    propsOnePercent=sim.demand.kNSM.props.one / totalPressureDemand
    propsTwoPercent=sim.demand.kNSM.props.two / totalPressureDemand

    sim.sply.kNSM.rtrs.one=rtrsOnePercent * sim.availableForUse.kNSM
    sim.sply.kNSM.rtrs.two=rtrsTwoPercent * sim.availableForUse.kNSM
    sim.sply.kNSM.rtrs.three=rtrsThreePercent * sim.availableForUse.kNSM
    sim.sply.kNSM.rtrs.four=rtrsFourPercent * sim.availableForUse.kNSM
    sim.sply.kNSM.props.one=propsOnePercent * sim.availableForUse.kNSM
    sim.sply.kNSM.props.two=propsTwoPercent * sim.availableForUse.kNSM
  end

  return sim
end

function powerSupply(sim)
  genPower=GEN_MAX_KW * (sim.sply.NM.gen / GEN_MAX_NM)
  btryPower=sim.availableForUse.kW
  totalPowerDemand=sim.demand.kW.disps + sim.demand.kW.btry +
      sim.demand.kW.rtrs.one + sim.demand.kW.rtrs.two +
      sim.demand.kW.rtrs.three + sim.demand.kW.rtrs.four +
      sim.demand.kW.props.one + sim.demand.kW.props.two +
      sim.demand.kW.spltr + sim.demand.kW.H2OAcc + sim.demand.kW.CH4Acc

  if totalPowerDemand <= genPower then
    sim.sply.kW.disps=sim.demand.kW.disps
    sim.sply.kW.rtrs.one=sim.demand.kW.rtrs.one
    sim.sply.kW.rtrs.two=sim.demand.kW.rtrs.two
    sim.sply.kW.rtrs.three=sim.demand.kW.rtrs.three
    sim.sply.kW.rtrs.four=sim.demand.kW.rtrs.four
    sim.sply.kW.props.one=sim.demand.kW.props.one
    sim.sply.kW.props.two=sim.demand.kW.props.two
    sim.sply.kW.spltr=sim.demand.kW.spltr
    sim.sply.kW.H2OAcc=sim.demand.kW.H2OAcc
    sim.sply.kW.CH4Acc=sim.demand.kW.CH4Acc
    sim.sply.kW.btry=sim.demand.kW.btry
  elseif totalPowerDemand <= (genPower + btryPower) then
    sim.sply.kW.disps= sim.demand.kW.disps
    sim.sply.kW.rtrs.one=sim.demand.kW.rtrs.one
    sim.sply.kW.rtrs.two=sim.demand.kW.rtrs.two
    sim.sply.kW.rtrs.three=sim.demand.kW.rtrs.three
    sim.sply.kW.rtrs.four=sim.demand.kW.rtrs.four
    sim.sply.kW.props.one=sim.demand.kW.props.one
    sim.sply.kW.props.two=sim.demand.kW.props.two
    sim.sply.kW.spltr=sim.demand.kW.spltr
    sim.sply.kW.H2OAcc=sim.demand.kW.H2OAcc
    sim.sply.kW.CH4Acc=sim.demand.kW.CH4Acc
    sim.sply.kW.btry=sim.demand.kW.btry

    btryUse=totalPowerDemand-genPower
    sim.availableForStorage.kW=sim.availableForStorage.kW-btryUse
  else
    dispsPercent=sim.demand.kW.disps / totalPowerDemand
    rtrsOnePercent=sim.demand.kW.rtrs.one / totalPowerDemand
    rtrsTwoPercent=sim.demand.kW.rtrs.two / totalPowerDemand
    rtrsThreePercent=sim.demand.kW.rtrs.three / totalPowerDemand
    rtrsFourPercent=sim.demand.kW.rtrs.four / totalPowerDemand
    propsOnePercent=sim.demand.kW.props.one / totalPowerDemand
    propsTwoPercent=sim.demand.kW.props.two / totalPowerDemand
    spltrPercent=sim.demand.kW.spltr / totalPowerDemand
    H2OAccPercent=sim.demand.kW.H2OAcc / totalPowerDemand
    CH4AccPercent=sim.demand.kW.CH4Acc / totalPowerDemand
    btryPercent=sim.demand.kW.btry / totalPowerDemand

    totalPowerAvailable=genPower + btryPower

    sim.sply.kW.disps=dispsPercent * totalPowerAvailable
    sim.sply.kW.rtrs.one=rtrsOnePercent * totalPowerAvailable
    sim.sply.kW.rtrs.two=rtrsTwoPercent * totalPowerAvailable
    sim.sply.kW.rtrs.three=rtrsThreePercent * totalPowerAvailable
    sim.sply.kW.rtrs.four=rtrsFourPercent * totalPowerAvailable
    sim.sply.kW.props.one=propsOnePercent * totalPowerAvailable
    sim.sply.kW.props.two=propsTwoPercent * totalPowerAvailable
    sim.sply.kW.spltr=spltrPercent * totalPowerAvailable
    sim.sply.kW.H2OAcc=H2OAccPercent * totalPowerAvailable
    sim.sply.kW.CH4Acc=CH4AccPercent * totalPowerAvailable
    sim.sply.kW.btry=btryPercent * totalPowerAvailable

    sim.availableForStorage.kW=sim.availableForStorage.kW-btryPower
  end

  return sim
end

function distributeHydraulics(sim)
  sim=rotateRotor(sim,'one',rtr1)
  sim=rotateRotor(sim,'two',rtr2)
  sim=rotateRotor(sim,'three',rtr3)
  sim=rotateRotor(sim,'four',rtr4)

  sim=rotateProp(sim,'one',prp1)
  sim=rotateProp(sim,'two',prp2)

  return sim
end

function distributePower(sim)
  altAdjustment=clamp01(5000 / (s.pos.z + 5000))
  speedAdjustment=clamp(nroot(6.6, s.speed)-1, 0.2, 1.2)
  intakeAdjustment=altAdjustment * speedAdjustment

  disps.on=(sim.sply.kW.disps>=sim.demand.kW.disps)

  if sim.sply.kW.spltr > 0 then
    powerPercent=sim.sply.kW.spltr / SPLTR_PWR_DEMAND_KW
    h2oPercent=sim.sply.H2O.spltr / SPLTR_MAX_H2O
    productionPercent=math.min(powerPercent, h2oPercent)
    if powerPercent < h2oPercent then
      sim.sply.H2O.spltr=productionPercent * sim.demand.H2O.spltr
    elseif h2oPercent < powerPercent then
      sim.sply.kW.spltr=productionPercent * sim.demand.kW.spltr
    end
    sim.sply.H_M.tank=productionPercent * SPLTR_PER_TIC_H
    sim.sply.O.tank=productionPercent * SPLTR_PER_TIC_O
  end

  if sim.sply.kW.H2OAcc > 0 then
    sim.sply.H2O.tank=(sim.sply.kW.H2OAcc / H2O_ACC_PWR_DEMAND_KW) *
        H2O_ACC_PER_TIC * s.env.H2O * intakeAdjustment
  end

  if sim.sply.kW.CH4Acc > 0 then
    sim.sply.CH4.tank=(sim.sply.kW.CH4Acc / CH4_ACC_PWR_DEMAND_KW) *
        CH4_ACC_PER_TIC * s.env.CH4 * intakeAdjustment
  end

  if sim.sply.kW.btry > 0 then
    sim.availableForStorage.kW=sim.availableForStorage.kW +
        sim.sply.kW.btry
  end

  return sim
end

function drainTanks(sim)
  cl1.level=cl1.level-math.max(
      math.max(0.01, 1-cl1.st) * CLL_MAX_VENT_M3F,
      cl1.vent)
  cl2.level=cl2.level-math.max(
      math.max(0.01, 1-cl2.st) * CLL_MAX_VENT_M3F,
      cl2.vent)
  cl3.level=cl3.level-math.max(
      math.max(0.01, 1-cl3.st) * CLL_MAX_VENT_M3F,
      cl3.vent)
  cl4.level=cl4.level-math.max(
      math.max(0.01, 1-cl4.st) * CLL_MAX_VENT_M3F,
      cl4.vent)

  tkH.level=tkH.level -
      sim.sply.H_V.clls.one / H_MASS_TO_VOLUME -
      sim.sply.H_V.clls.two / H_MASS_TO_VOLUME -
      sim.sply.H_V.clls.three / H_MASS_TO_VOLUME -
      sim.sply.H_V.clls.four / H_MASS_TO_VOLUME
  tkO.level=tkO.level-sim.sply.O.bilr
  tkH2O.level=tkH2O.level-sim.sply.H2O.bilr -
      sim.sply.H2O.spltr
  tkCH4.level=tkCH4.level-sim.sply.CH4.bilr

  hydRes.level=hydRes.level -
      sim.sply.kNSM.rtrs.one-sim.sply.kNSM.rtrs.two -
      sim.sply.kNSM.rtrs.three-sim.sply.kNSM.rtrs.four -
      sim.sply.kNSM.props.one-sim.sply.kNSM.props.two
end

function fillTanks(sim)
  cl1.level=math.min(CLL_MAX_M3,
      cl1.level + sim.sply.H_V.clls.one)
  cl2.level=math.min(CLL_MAX_M3,
      cl2.level + sim.sply.H_V.clls.two)
  cl3.level=math.min(CLL_MAX_M3,
      cl3.level + sim.sply.H_V.clls.three)
  cl4.level=math.min(CLL_MAX_M3,
      cl4.level + sim.sply.H_V.clls.four)

  tkH.level=math.min(H_TANK_MAX_KG,
      tkH.level + sim.sply.H_M.tank)
  tkO.level=math.min(O_TANK_MAX_KG,
      tkO.level + sim.sply.O.tank)
  tkH2O.level=math.min(H2O_TANK_MAX_KG,
      tkH2O.level + sim.sply.H2O.tank)
  tkCH4.level=math.min(CH4_TANK_MAX_KG,
      tkCH4.level + sim.sply.CH4.tank)

  hydRes.level=math.min(HYD_MAX_KNSM,
      hydRes.level + sim.sply.kNSM.hydRes)

  btry.level=math.min(BATTERY_MAX_CHARGE_KW,
      btry.level + sim.availableForStorage.kW)
end

function applyThrust(sim)
  rtr1.thrust=sim.sply.kW.rtrs.one /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN
  rtr2.thrust=sim.sply.kW.rtrs.two /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN
  rtr3.thrust=sim.sply.kW.rtrs.three /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN
  rtr4.thrust=sim.sply.kW.rtrs.four /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN

  prp1.thrust=sim.sply.kW.props.one /
      PROP_MAX_PWR_DEMAND_KW * PROP_MAX_THRUST_KN
  prp2.thrust=sim.sply.kW.props.two /
      PROP_MAX_PWR_DEMAND_KW * PROP_MAX_THRUST_KN
end

function applyForces(sim)
  altAdjustment=clamp01(5000 / (s.pos.z + 5000))
  thrustAdjustment=lerp(0.2, 1, altAdjustment)
  s.env.Atmo=altAdjustment * SEA_LEVEL_AIR_DENSITY

  rotor1Xcomp=math.cos(math.rad(90-rtr1.rot)) *
      thrustAdjustment
  rotor1Ycomp=math.sin(math.rad(90-rtr1.rot)) *
      thrustAdjustment
  rotor2Xcomp=math.cos(math.rad(90-rtr2.rot)) *
      thrustAdjustment
  rotor2Ycomp=math.sin(math.rad(90-rtr2.rot)) *
      thrustAdjustment
  rotor3Xcomp=math.cos(math.rad(90-rtr3.rot)) *
      thrustAdjustment
  rotor3Ycomp=math.sin(math.rad(90-rtr3.rot)) *
      thrustAdjustment
  rotor4Xcomp=math.cos(math.rad(90-rtr4.rot)) *
      thrustAdjustment
  rotor4Ycomp=math.sin(math.rad(90-rtr4.rot)) *
      thrustAdjustment

  totalHydrogenVolume=cl1.level +
      cl2.level + cl3.level +
      cl4.level
  totalHydrogenWeight=totalHydrogenVolume * HYDROGEN_DENSITY
  totalAirWeight=totalHydrogenVolume * SEA_LEVEL_AIR_DENSITY

  totalShipWeightKG=SHIP_DRY_WEIGHT_KG + totalHydrogenWeight +
      tkH.level + tkO.level +
      tkH2O.level + tkCH4.level
  totalShipWeightKN=(totalShipWeightKG * KG_TO_N) * 0.001

  s.heading=(prp1.rot + prp2.rot) / 2
  drag=DRAG_COEFFICENT * FRONT_DRAG_AREA * 0.5 * s.env.Atmo *
      (s.speed * s.speed)
  s.accl=(prp1.thrust * thrustAdjustment +
                  prp2.thrust * thrustAdjustment +
                  rtr1.thrust * rotor1Xcomp +
                  rtr2.thrust * rotor2Xcomp +
                  rtr3.thrust * rotor3Xcomp +
                  rtr4.thrust * rotor4Xcomp-drag) /
      totalShipWeightKN
  -- TODO Remove fudge? Acceleration bump, direction rotation.
  s.speed=s.speed+0.5*s.accl*10*0.00027777777
  changeX=s.speed*math.sin(math.rad(s.heading))
  changeY=-s.speed*math.cos(math.rad(s.heading))
  s.pos.x=s.pos.x+changeX
  s.pos.y=s.pos.y+changeY
  s.dis=s.dis+math.sqrt(changeX*changeX+changeY*changeY)

  totalHydrogenLiftForce=(totalAirWeight-totalHydrogenWeight)*KG_TO_N*HYDROGEN_LIFT_ADJUST
  totalWingLiftForce=s.speed*WING_LIFT*altAdjustment

  s.rot=(rtr1.rot+rtr2.rot+rtr3.rot+rtr4.rot)/4
  vertDrag=DRAG_COEFFICENT*BOTTOM_DRAG_AREA*0.5*s.env.Atmo*s.vsi*s.vsi
  vForce=((rtr1.thrust*rotor1Ycomp+
           rtr2.thrust*rotor2Ycomp+
           rtr3.thrust*rotor3Ycomp+
           rtr4.thrust*rotor4Ycomp)+
      totalHydrogenLiftForce+totalWingLiftForce)/totalShipWeightKN
  if s.vsi > 0 then
    vForce=vForce-vertDrag
  elseif s.vsi < 0 then
    vForce=vForce + vertDrag
  end

  s.vsi=s.vsi + 0.5 * ((vForce-totalShipWeightKN-vertDrag) * 0.00027777777)
  s.pos.z=s.pos.z + s.vsi

  -- Auto controls
  if s.vsi < s.set_vsi then
    s.con.thrt.rtrs=math.min(s.con.thrt.rtrs + 0.1, 1)
  elseif s.vsi > s.set_vsi then
    s.con.thrt.rtrs=math.max(s.con.thrt.rtrs-0.1, 0.0)
  end

  if s.pos.z-100 > s.con.alt and s.vsi > -0.2 then
    altDiff=math.min((s.pos.z-100-s.con.alt)/100,8)
    cl1.vent=altDiff
    cl2.vent=altDiff
    cl3.vent=altDiff
    cl4.vent=altDiff
  elseif s.pos.z + 100 < s.con.alt and s.vsi < 0.2 then
    altDiff=math.max((s.pos.z+100-s.con.alt)/100,-8)
    cl1.vent=altDiff
    cl2.vent=altDiff
    cl3.vent=altDiff
    cl4.vent=altDiff
  else
    cl1.vent=0
    cl2.vent=0
    cl3.vent=0
    cl4.vent=0
  end

  if s.pos.z + 10 < s.con.alt and s.con.vsi > 0 then
    s.set_vsi=s.con.vsi
  elseif s.pos.z-10 > s.con.alt and s.con.vsi < 0 then
    s.set_vsi=s.con.vsi
  else
    s.set_vsi=0.0
  end

  if s.pos.z <= 0 then
    s.pos.z=0
    s.speed=0
    if not s.isCrash then
      dmgSysts(s.vsi)
      s.isCrash=true
    end
  else
    if s.isCrash then s.isCrash=false end
  end

  tile=getShipTile()
  s.env.H2O=tile.H2O
  s.env.CH4=tile.CH4
end


function calcHydDemand(curAngle, dsrdAgl, st, maxSpd, maxDmnd)
  if curAngle==dsrdAgl then return 0 end
  rotorAngleChange=math.abs(dsrdAgl-curAngle)
  rotorAngleChange=math.min(rotorAngleChange, maxSpd*st)
  return (rotorAngleChange/maxSpd)*maxDmnd
end

function rotateThruster(sim,type,id,thrustr,maxDmnd,maxSpd)
  if math.abs(s.con.rot[type]-thrustr.rot)<0.0001 then
    thrustr.rot=s.con.rot[type]
  else
    -- replace sim thruster type.
    hydAvl=sim.sply.kNSM[type][id]/maxDmnd
    aglAvl=hydAvl*maxSpd
    dsrdAgl=s.con.rot[type]-thrustr.rot
    moveAngle=math.min(aglAvl,math.abs(dsrdAgl))
    if dsrdAgl<0 then
      thrustr.rot=thrustr.rot-moveAngle
    else
      thrustr.rot=thrustr.rot + moveAngle
    end
  end

  return sim
end

function rotateRotor(sim,id,rotor)
  return rotateThruster(sim,'rtrs',id,rotor,RTR_MAX_HYD_DEMAND_KNSM,RTR_MAX_ROTATE_SPEED_D)
end

function rotateProp(sim,id,prop)
  return rotateThruster(sim,'props',id,prop,PROP_MAX_HYD_DEMAND_KNSM,PROP_MAX_ROTATE_SPEED_D)
end

function safeDivide(num,den)
  return (den>0) and num/den or 0
end

function clamp(val,low,high)
  return math.min(math.max(val,low),high)
end

function clamp01(val)
  return clamp(val,0.0,1)
end

function nroot(rt,num)
  return num^(1/rt)
end

function lerp(a,b,t)
  return a+(b-a)*t
end

function invLerp(a,b,v)
  return (v-a)/(b-a)
end

function sqrDistance(ptA,ptB)
  local x=ptA.x-ptB.x
  local y=ptA.y-ptB.y
  return x*x+y*y
end

function distance(ptA,ptB)
  return math.sqrt(sqrDistance(ptA,ptB))
end

function scaleV2(vec,scalar)
  return {x=vec.x*scalar,y=vec.y*scalar}
end

function bbCenter(bb)
  return {x=(bb.max_x-bb.min_x)/2+bb.min_x,y=(bb.max_y-bb.min_y)/2+bb.min_y}
end

function rotateV2(vec, angle)
  r=math.rad(angle)
  aSin=math.sin(r)
  aCos=math.cos(r)

  return {x=vec.x*aCos-vec.y*aSin,y=vec.y*aCos+vec.x*aSin}
end

function contains(bb, pos)
  return pos.x>=bb.min_x and pos.y>=bb.min_y and pos.x<=bb.max_x and pos.y<=bb.max_y
end

function mapContains(bb, pos)
  return contains({min_x=bb.min_x*8,min_y=bb.min_y*8,max_x=bb.max_x*8+7,max_y=bb.max_y*8+7}, pos)
end

initGame()
