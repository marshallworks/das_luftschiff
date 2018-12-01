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
  },
  com={
    disps={
      st=1,
      active=true,
      id="disp",
      bb={
        min_x=56,
        min_y=23,
        max_x=59,
        max_y=24
      }
    },
    eng={
      bilr={
        st=1,
        id="bilr",
        bb={
          min_x=48,
          min_y=27,
          max_x=51,
          max_y=28
        }
      },
      turb={
        st=1,
        id="turb",
        bb={
          min_x=46,
          min_y=27,
          max_x=47,
          max_y=28
        }
      },
    },
    hyd={
      res={
        st=1,
        level=HYD_MAX_KNSM,
        id="hyd_acc",
        bb={
          min_x=37,
          min_y=23,
          max_x=38,
          max_y=24
        }
      },
      pump={
        st=1,
        id="hyd_pump",
        bb={
          min_x=37,
          min_y=27,
          max_x=38,
          max_y=28
        }
      }
    },
    gen={
      st=1,
      id="gen",
      bb={
        min_x=40,
        min_y=27,
        max_x=43,
        max_y=28
      }
    },
    rtrs={
      one={
        st=1,
        rot=0,
        thrust=0,
        id="rotor_lower",
        bb={
          min_x=76,
          min_y=32,
          max_x=81,
          max_y=32
        },
        id2="rotor_upper",
        bb2={
          min_x=78,
          min_y=31,
          max_x=79,
          max_y=31
        }
      },
      two={
        st=1,
        rot=0,
        thrust=0,
        id="rotor_lower",
        bb={
          min_x=66,
          min_y=32,
          max_x=71,
          max_y=32
        },
        id2="rotor_upper",
        bb2={
          min_x=68,
          min_y=31,
          max_x=69,
          max_y=31
        }
      },
      three={
        st=1,
        rot=0,
        thrust=0,
        id="rotor_lower",
        bb={
          min_x=48,
          min_y=32,
          max_x=53,
          max_y=32
        },
        id2="rotor_upper",
        bb2={
          min_x=50,
          min_y=31,
          max_x=51,
          max_y=31
        }
      },
      four={
        st=1,
        rot=0,
        thrust=0,
        id="rotor_lower",
        bb={
          min_x=38,
          min_y=32,
          max_x=43,
          max_y=32
        },
        id2="rotor_upper",
        bb2={
          min_x=40,
          min_y=31,
          max_x=41,
          max_y=31
        }
      }
    },
    props={
      one={
        st=1,
        rot=0,
        thrust=0,
        id="prop",
        bb={
          min_x=33,
          min_y=22,
          max_x=34,
          max_y=24
        }
      },
      two={
        st=1,
        rot=0,
        thrust=0,
        id="prop",
        bb={
          min_x=33,
          min_y=26,
          max_x=34,
          max_y=28
        }
      }
    },
    acc={
      H2O={
        st=1,
        id="H2Oacc",
        bb={
          min_x=85,
          min_y=23,
          max_x=86,
          max_y=24
        }
      },
      CH4={
        st=1,
        id="CH4acc",
        bb={
          min_x=83,
          min_y=27,
          max_x=84,
          max_y=28
        }
      },
    },
    clls={
      one={
        st=1,
        level=CLL_MAX_M3*.7,
        vent=0.0,
        id="Hcell",
        bb={
          min_x=77,
          min_y=21,
          max_x=84,
          max_y=22
        }
      },
      two={
        st=1,
        level=CLL_MAX_M3*.7,
        vent=0.0,
        id="Hcell",
        bb={
          min_x=68,
          min_y=21,
          max_x=75,
          max_y=22
        }
      },
      three={
        st=1,
        level=CLL_MAX_M3*.7,
        vent=0.0,
        id="Hcell",
        bb={
          min_x=44,
          min_y=21,
          max_x=51,
          max_y=22
        }
      },
      four={
        st=1,
        level=CLL_MAX_M3*.7,
        vent=0.0,
        id="Hcell",
        bb={
          min_x=35,
          min_y=21,
          max_x=42,
          max_y=22
        }
      }
    },
    btry={
      st=1,
      level=BATTERY_MAX_CHARGE_KW,
      id="btry",
      bb={
        min_x=42,
        min_y=23,
        max_x=47,
        max_y=24
      }
    },
    spltr={
      st=1,
      id="spltr",
      bb={
        min_x=62,
        min_y=28,
        max_x=63,
        max_y=28
      }
    },
    tks={
      H={
        st=1,
        level=H_TANK_MAX_KG,
        id="Htank",
        bb={
          min_x=58,
          min_y=26,
          max_x=61,
          max_y=29
        }
      },
      O={
        st=1,
        level=O_TANK_MAX_KG,
        id="Otank",
        bb={
          min_x=58,
          min_y=31,
          max_x=61,
          max_y=32
        }
      },
      H2O={
        st=1,
        level=H2O_TANK_MAX_KG,
        id="H2Otank",
        bb={
          min_x=68,
          min_y=27,
          max_x=73,
          max_y=28
        }
      },
      CH4={
        st=1,
        level=CH4_TANK_MAX_KG,
        id="CH4tank",
        bb={
          min_x=75,
          min_y=27,
          max_x=80,
          max_y=28
        }
      }
    },
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

function init()
  -- Background color
  poke(0x03FF8, 8)
  math.randomseed(8778)

  buildMap()

  cam.x=p.x-120
  cam.y=p.y-64
  cam.cellX=cam.x / 8
  cam.cellY=cam.y / 8
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

    --if btnp(5) then showMap=not showMap end

    testPos={x=p.x,y=p.y}
    if mapContains(s.com.disps.bb, testPos) then
      if btnp(6) then showControls=not showControls end
    elseif mapContains(s.com.eng.bilr.bb, testPos) then
      if btn(6) then s.com.eng.bilr.st=math.min(s.com.eng.bilr.st+0.01,1) end
    elseif mapContains(s.com.eng.turb.bb, testPos) then
      if btn(6) then s.com.eng.turb.st=math.min(s.com.eng.turb.st+0.01,1) end
    elseif mapContains(s.com.hyd.res.bb, testPos) then
      if btn(6) then s.com.hyd.res.st=math.min(s.com.hyd.res.st+0.01,1) end
    elseif mapContains(s.com.hyd.pump.bb, testPos) then
      if btn(6) then s.com.hyd.pump.st=math.min(s.com.hyd.pump.st+0.01,1) end
    elseif mapContains(s.com.gen.bb, testPos) then
      if btn(6) then s.com.gen.st=math.min(s.com.gen.st+0.01,1) end
    elseif mapContains(s.com.rtrs.one.bb, testPos) then
      if btn(6) then s.com.rtrs.one.st=math.min(s.com.rtrs.one.st+0.01,1) end
    elseif mapContains(s.com.rtrs.two.bb, testPos) then
      if btn(6) then s.com.rtrs.two.st=math.min(s.com.rtrs.two.st+0.01,1) end
    elseif mapContains(s.com.rtrs.three.bb, testPos) then
      if btn(6) then s.com.rtrs.three.st=math.min(s.com.rtrs.three.st+0.01,1) end
    elseif mapContains(s.com.rtrs.four.bb, testPos) then
      if btn(6) then s.com.rtrs.four.st=math.min(s.com.rtrs.four.st+0.01,1) end
    elseif mapContains(s.com.props.one.bb, testPos) then
      if btn(6) then s.com.props.one.st=math.min(s.com.props.one.st+0.01,1) end
    elseif mapContains(s.com.props.two.bb, testPos) then
      if btn(6) then s.com.props.two.st=math.min(s.com.props.two.st+0.01,1) end
    elseif mapContains(s.com.acc.H2O.bb, testPos) then
      if btn(6) then s.com.acc.H2O.st=math.min(s.com.acc.H2O.st+0.01,1) end
    elseif mapContains(s.com.acc.CH4.bb, testPos) then
      if btn(6) then s.com.acc.CH4.st=math.min(s.com.acc.CH4.st+0.01,1) end
    elseif mapContains(s.com.clls.one.bb, testPos) then
      if btn(6) then s.com.clls.one.st=math.min(s.com.clls.one.st+0.01,1) end
    elseif mapContains(s.com.clls.two.bb, testPos) then
      if btn(6) then s.com.clls.two.st=math.min(s.com.clls.two.st+0.01,1) end
    elseif mapContains(s.com.clls.three.bb, testPos) then
      if btn(6) then s.com.clls.three.st=math.min(s.com.clls.three.st+0.01,1) end
    elseif mapContains(s.com.clls.four.bb, testPos) then
      if btn(6) then s.com.clls.four.st=math.min(s.com.clls.four.st+0.01,1) end
    elseif mapContains(s.com.btry.bb, testPos) then
      if btn(6) then s.com.btry.st=math.min(s.com.btry.st+0.01,1) end
    elseif mapContains(s.com.spltr.bb, testPos) then
      if btn(6) then s.com.spltr.st=math.min(s.com.spltr.st+0.01,1) end
    elseif mapContains(s.com.tks.H.bb, testPos) then
      if btn(6) then s.com.tks.H.st=math.min(s.com.tks.H.st+0.01,1) end
    elseif mapContains(s.com.tks.O.bb, testPos) then
      if btn(6) then s.com.tks.O.st=math.min(s.com.tks.O.st+0.01,1) end
    elseif mapContains(s.com.tks.H2O.bb, testPos) then
      if btn(6) then s.com.tks.H2O.st=math.min(s.com.tks.H2O.st+0.01,1) end
    elseif mapContains(s.com.tks.CH4.bb, testPos) then
      if btn(6) then s.com.tks.CH4.st=math.min(s.com.tks.CH4.st+0.01,1) end
    end

    if not showControls and btn(6) then
      if (str.t%16)==0 then
        sfx(2,24,4,3,4,2)
      end
    end

    sfx(0,"D#1",-1,0,10,0)

    playAmbientChannel(1,{
      {c=s.com.acc.H2O,id=6,nt="D#3"},
      {c=s.com.eng.turb,id=5,nt="F-2"},
      {c=s.com.props.one,id=3,nt="D-2"},
      {c=s.com.props.two,id=3,nt="D-2"},
      {c=s.com.rtrs.one,id=4,nt="C-1"},
      {c=s.com.rtrs.three,id=4,nt="C-1"},
      {c=s.com.rtrs.four,id=4,nt="C-1"}
    },7)

    playAmbientChannel(2,{
      {c=s.com.eng.bilr,id=2,nt="C-1"},
      {c=s.com.gen,id=1,nt="E-3"},
      {c=s.com.acc.CH4,id=6,nt="F-4"},
      {c=s.com.rtrs.two,id=4,nt="C-1"}
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

    cls(0)
    simulate()

    s.com.eng.bilr.st=s.com.eng.bilr.st-0.00001
    s.com.eng.bilr.st=s.com.eng.bilr.st-0.000001
    s.com.eng.turb.st=s.com.eng.turb.st-0.00001
    s.com.hyd.res.st=s.com.hyd.res.st-0.000001
    s.com.hyd.pump.st=s.com.hyd.pump.st-0.00001
    s.com.gen.st=s.com.gen.st-0.00001
    s.com.rtrs.one.st=s.com.rtrs.one.st-0.00001
    s.com.rtrs.two.st=s.com.rtrs.two.st-0.00001
    s.com.rtrs.three.st=s.com.rtrs.three.st-0.00001
    s.com.rtrs.four.st=s.com.rtrs.four.st-0.00001
    s.com.props.one.st=s.com.props.one.st-0.00001
    s.com.props.two.st=s.com.props.two.st-0.00001
    s.com.acc.H2O.st=s.com.acc.H2O.st-0.00001
    s.com.acc.CH4.st=s.com.acc.CH4.st-0.00001
    s.com.clls.one.st=s.com.clls.one.st-0.00001
    s.com.clls.two.st=s.com.clls.two.st-0.00001
    s.com.clls.three.st=s.com.clls.three.st-0.00001
    s.com.clls.four.st=s.com.clls.four.st-0.00001
    s.com.btry.st=s.com.btry.st-0.000001
    s.com.spltr.st=s.com.spltr.st-0.00001
    s.com.tks.H.st=s.com.tks.H.st-0.000001
    s.com.tks.O.st=s.com.tks.O.st-0.000001
    s.com.tks.H2O.st=s.com.tks.H2O.st-0.000001
    s.com.tks.CH4.st=s.com.tks.CH4.st-0.000001

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
  c=s.com
  repair = math.max((math.min(c.disps.st,c.eng.bilr.st,c.eng.turb.st,
      c.hyd.res.st, c.hyd.pump.st,c.gen.st,c.rtrs.one.st,c.rtrs.two.st,
      c.rtrs.three.st,c.rtrs.four.st,c.props.one.st,c.props.two.st,
      c.acc.H2O.st,c.acc.CH4.st,c.clls.one.st,c.clls.two.st,c.clls.three.st,
      c.clls.four.st,c.btry.st,c.spltr.st,c.tks.H.st,c.tks.O.st,
      c.tks.H2O.st,c.tks.CH4.st)*100+0.5)//1,0)
  resources=(math.min((c.tks.H2O.level/H2O_TANK_MAX_KG)*100+0.5,
                      (c.tks.CH4.level/CH4_TANK_MAX_KG)*100+0.5))//1
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

    drawBarStatus(gauges.bars.tks.H2O, s.com.tks.H2O.level, H2O_TANK_MAX_KG)
    drawBarStatus(gauges.bars.tks.CH4, s.com.tks.CH4.level, CH4_TANK_MAX_KG)

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
                           s.com.props.one.rot)
    drawPropRotationStatus(gauges.needles.props.two,
                           s.com.props.two.rot)

    drawPropThrustStatus(gauges.bars.props.one, s.com.props.one.thrust)
    drawPropThrustStatus(gauges.bars.props.two, s.com.props.two.thrust)

    print("RTR1", 71, 100, 6, false, 1, true)
    print("RTR2", 90, 100, 6, false, 1, true)
    print("RTR3", 119, 100, 6, false, 1, true)
    print("RTR4", 138, 100, 6, false, 1, true)

    drawRotorRotationStatus(gauges.needles.rtrs.one,
                            s.com.rtrs.one.rot)
    drawRotorRotationStatus(gauges.needles.rtrs.two,
                            s.com.rtrs.two.rot)
    drawRotorRotationStatus(gauges.needles.rtrs.three,
                            s.com.rtrs.three.rot)
    drawRotorRotationStatus(gauges.needles.rtrs.four,
                            s.com.rtrs.four.rot)

    drawRotorThrustStatus(gauges.bars.rtrs.one, s.com.rtrs.one.thrust)
    drawRotorThrustStatus(gauges.bars.rtrs.two, s.com.rtrs.two.thrust)
    drawRotorThrustStatus(gauges.bars.rtrs.three, s.com.rtrs.three.thrust)
    drawRotorThrustStatus(gauges.bars.rtrs.four, s.com.rtrs.four.thrust)

    print("Hyd Cells", 199, 100, 6, false, 1, true)

    drawBarStatus(gauges.bars.clls.one, s.com.clls.one.level, CLL_MAX_M3)
    drawBarStatus(gauges.bars.clls.two, s.com.clls.two.level, CLL_MAX_M3)
    drawBarStatus(gauges.bars.clls.three, s.com.clls.three.level, CLL_MAX_M3)
    drawBarStatus(gauges.bars.clls.four, s.com.clls.four.level, CLL_MAX_M3)

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

  drawCom(s.com.disps.bb, s.com.disps.id, yDown)

  drawCom(s.com.eng.bilr.bb, s.com.eng.bilr.id, yDown, s.com.eng.bilr.st)
  drawCom(s.com.eng.turb.bb, s.com.eng.turb.id, yDown, s.com.eng.turb.st)

  drawCom(s.com.hyd.res.bb, s.com.hyd.res.id, yDown, s.com.hyd.res.st)
  drawCom(s.com.hyd.pump.bb, s.com.hyd.pump.id, yDown, s.com.hyd.pump.st)

  drawCom(s.com.gen.bb, s.com.gen.id, yDown, s.com.gen.st)

  drawCom(s.com.rtrs.one.bb, s.com.rtrs.one.id, yDown, s.com.rtrs.one.st)
  drawCom(s.com.rtrs.three.bb, s.com.rtrs.three.id, yDown, s.com.rtrs.three.st)

  drawCom(s.com.rtrs.one.bb2, s.com.rtrs.one.id2, yDown)
  drawCom(s.com.rtrs.three.bb2, s.com.rtrs.three.id2, yDown)

  drawCom(s.com.props.one.bb, s.com.props.one.id, yDown, s.com.props.one.st)
  drawCom(s.com.props.two.bb, s.com.props.two.id, yDown, s.com.props.two.st)

  drawCom(s.com.acc.H2O.bb, s.com.acc.H2O.id, yDown, s.com.acc.H2O.st)
  drawCom(s.com.acc.CH4.bb, s.com.acc.CH4.id, yDown, s.com.acc.CH4.st)

  drawCom(s.com.spltr.bb, s.com.spltr.id, yDown, s.com.spltr.st)

  drawCom(s.com.tks.O.bb, s.com.tks.O.id, yDown, s.com.tks.O.st)
  drawCom(s.com.tks.H2O.bb, s.com.tks.H2O.id, yDown, s.com.tks.H2O.st)

  drawCom({ min_x=39, min_y=27, max_x=39, max_y=27 }, "pto_upper", yDown)
  drawCom({ min_x=39, min_y=28, max_x=39, max_y=28 }, "pto_lower", yDown)
  drawCom({ min_x=44, min_y=27, max_x=44, max_y=27 }, "pto_upper", yDown)
  drawCom({ min_x=44, min_y=28, max_x=44, max_y=28 }, "pto_lower", yDown)
  drawCom({ min_x=45, min_y=27, max_x=45, max_y=27 }, "pto_upper", yDown)
  drawCom({ min_x=45, min_y=28, max_x=45, max_y=28 }, "pto_lower", yDown)

  spr(p.s, p.x-cam.x-4, p.y-cam.y-8 + yDown, 0, 1, p.flip, 0, 1, 2)

  drawCom(s.com.clls.one.bb, s.com.clls.one.id, yDown, s.com.clls.one.st)
  drawCom(s.com.clls.two.bb, s.com.clls.two.id, yDown, s.com.clls.two.st)
  drawCom(s.com.clls.three.bb, s.com.clls.three.id, yDown, s.com.clls.three.st)
  drawCom(s.com.clls.four.bb, s.com.clls.four.id, yDown, s.com.clls.four.st)
  drawCom(s.com.rtrs.two.bb, s.com.rtrs.two.id, yDown, s.com.rtrs.two.st)
  drawCom(s.com.rtrs.four.bb, s.com.rtrs.four.id, yDown, s.com.rtrs.four.st)
  drawCom(s.com.rtrs.two.bb2, s.com.rtrs.two.id2, yDown)
  drawCom(s.com.rtrs.four.bb2, s.com.rtrs.four.id2, yDown)
  drawCom(s.com.tks.H.bb, s.com.tks.H.id, yDown, s.com.tks.H.st)
  drawCom(s.com.tks.CH4.bb, s.com.tks.CH4.id, yDown, s.com.tks.CH4.st)
  drawCom(s.com.btry.bb, s.com.btry.id, yDown, s.com.btry.st)
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
  dmgSyst(s.com.eng.bilr,vSpeed)
  dmgSyst(s.com.eng.turb,vSpeed)
  dmgSyst(s.com.hyd.res,vSpeed)
  dmgSyst(s.com.hyd.pump,vSpeed)
  dmgSyst(s.com.gen,vSpeed)
  dmgSyst(s.com.rtrs.one,vSpeed)
  dmgSyst(s.com.rtrs.two,vSpeed)
  dmgSyst(s.com.rtrs.three,vSpeed)
  dmgSyst(s.com.rtrs.four,vSpeed)
  dmgSyst(s.com.props.one,vSpeed)
  dmgSyst(s.com.props.two,vSpeed)
  dmgSyst(s.com.acc.H2O,vSpeed)
  dmgSyst(s.com.acc.CH4,vSpeed)
  dmgSyst(s.com.clls.one,vSpeed)
  dmgSyst(s.com.clls.two,vSpeed)
  dmgSyst(s.com.clls.three,vSpeed)
  dmgSyst(s.com.clls.four,vSpeed)
  dmgSyst(s.com.btry,vSpeed)
  dmgSyst(s.com.spltr,vSpeed)
  dmgSyst(s.com.tks.H,vSpeed)
  dmgSyst(s.com.tks.O,vSpeed)
  dmgSyst(s.com.tks.H2O,vSpeed)
  dmgSyst(s.com.tks.CH4,vSpeed)
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
      kW=s.com.btry.level,
      kNSM=s.com.hyd.res.level,
      H2O=s.com.tks.H2O.level,
      CH4=s.com.tks.CH4.level,
      H_M=s.com.tks.H.level,
      H_V=s.com.tks.H.level * H_MASS_TO_VOLUME,
      O=s.com.tks.O.level
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
      s.com.rtrs.one.st * s.con.thrt.rtrs
  sim.demand.kW.rtrs.two=RTR_MAX_PWR_DEMAND_KW *
      s.com.rtrs.two.st * s.con.thrt.rtrs
  sim.demand.kW.rtrs.three=RTR_MAX_PWR_DEMAND_KW *
      s.com.rtrs.three.st * s.con.thrt.rtrs
  sim.demand.kW.rtrs.four=RTR_MAX_PWR_DEMAND_KW *
      s.com.rtrs.four.st * s.con.thrt.rtrs

  sim.demand.kW.props.one=PROP_MAX_PWR_DEMAND_KW *
      s.com.props.one.st * s.con.thrt.props
  sim.demand.kW.props.two=PROP_MAX_PWR_DEMAND_KW *
      s.com.props.two.st * s.con.thrt.props

  return sim
end

function controlsHydraulicDemand(sim)
  sim.demand.kNSM.rtrs.one=calcHydDemand(s.com.rtrs.one.rot,
                                             s.con.rot.rtrs,
                                             s.com.rtrs.one.st,
                                             RTR_MAX_ROTATE_SPEED_D,
                                             RTR_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.rtrs.two=calcHydDemand(s.com.rtrs.two.rot,
                                             s.con.rot.rtrs,
                                             s.com.rtrs.two.st,
                                             RTR_MAX_ROTATE_SPEED_D,
                                             RTR_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.rtrs.three=calcHydDemand(s.com.rtrs.three.rot,
                                               s.con.rot.rtrs,
                                               s.com.rtrs.three.st,
                                               RTR_MAX_ROTATE_SPEED_D,
                                               RTR_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.rtrs.four=calcHydDemand(s.com.rtrs.four.rot,
                                              s.con.rot.rtrs,
                                              s.com.rtrs.four.st,
                                              RTR_MAX_ROTATE_SPEED_D,
                                              RTR_MAX_HYD_DEMAND_KNSM)

  sim.demand.kNSM.props.one=calcHydDemand(s.com.props.one.rot,
                                            s.con.rot.props,
                                            s.com.props.one.st,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYD_DEMAND_KNSM)
  sim.demand.kNSM.props.two=calcHydDemand(s.com.props.two.rot,
                                            s.con.rot.props,
                                            s.com.props.two.st,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYD_DEMAND_KNSM)

  return sim
end

function storageTanksDemand(sim)
  sim.demand.H2O.tank=math.min(H2O_TANK_MAX_KG-s.com.tks.H2O.level,
                                 H2O_TANK_MAX_KGF)
  sim.demand.CH4.tank=math.min(CH4_TANK_MAX_KG-s.com.tks.CH4.level,
                                 CH4_TANK_MAX_KGF)
  sim.demand.H_M.tank=math.min(H_TANK_MAX_KG-s.com.tks.H.level,
                                 H_TANK_MAX_KGF)
  sim.demand.O.tank=math.min(O_TANK_MAX_KG-s.com.tks.O.level,
                               O_TANK_MAX_KGF)

  return sim
end

function cellDemand(sim)
  if s.com.clls.one.vent <= 0 then
    sim.demand.H_V.clls.one=math.min(
        CLL_MAX_M3-s.com.clls.one.level, -s.com.clls.one.vent)
  end
  if s.com.clls.two.vent <= 0 then
    sim.demand.H_V.clls.two=math.min(
        CLL_MAX_M3-s.com.clls.two.level, -s.com.clls.two.vent)
  end
  if s.com.clls.three.vent <= 0 then
    sim.demand.H_V.clls.three=math.min(
        CLL_MAX_M3-s.com.clls.three.level, -s.com.clls.three.vent)
  end
  if s.com.clls.four.vent <= 0 then
    sim.demand.H_V.clls.four=math.min(
        CLL_MAX_M3-s.com.clls.four.level, -s.com.clls.four.vent)
  end

  return sim
end

function btryDemand(sim)
  btryStateDemand=math.min(BATTERY_MAX_CHARGE_RATE_KW,
      BATTERY_MAX_CHARGE_KW * s.com.btry.st-s.com.btry.level)
  sim.demand.kW.btry=math.max(btryStateDemand, 0)

  return sim
end

function hydResDemand(sim)
  sim.demand.kNSM.hydRes=HYD_MAX_KNSM-s.com.hyd.res.level

  return sim
end

function spltrAccDemand(sim)
  if sim.demand.H_M.tank > 0 or sim.demand.O.tank > 0 then
    sim.demand.kW.spltr=SPLTR_PWR_DEMAND_KW * s.com.spltr.st
    sim.demand.H2O.spltr=SPLTR_MAX_H2O * s.com.spltr.st
  end

  if sim.demand.H2O.tank > 0 then
    sim.demand.kW.H2OAcc=H2O_ACC_PWR_DEMAND_KW * s.com.acc.H2O.st
  end

  if sim.demand.CH4.tank > 0 then
    sim.demand.kW.CH4Acc=CH4_ACC_PWR_DEMAND_KW * s.com.acc.CH4.st
  end

  return sim
end

function hydPumpDemand(sim)
  sim.demand.NM.hydPump=math.min(HYD_PUMP_MAX_NM,
      sim.demand.kNSM.hydRes * HYD_PUMP_NM_PER_KNSM)

  return sim
end

function genDemand(sim)
  totalPowerDemand=math.min(GEN_MAX_KW * s.com.gen.st,
      sim.demand.kW.disps + sim.demand.kW.rtrs.one +
      sim.demand.kW.rtrs.two + sim.demand.kW.rtrs.three +
      sim.demand.kW.rtrs.four + sim.demand.kW.props.one +
      sim.demand.kW.props.two + sim.demand.kW.spltr +
      sim.demand.kW.H2OAcc + sim.demand.kW.CH4Acc + sim.demand.kW.btry)
  sim.demand.NM.gen=(totalPowerDemand / GEN_MAX_KW) * GEN_MAX_NM

  return sim
end

function turbDemand(sim)
  totalTorqueDemand=math.min(TURB_MAX_NM * s.com.eng.turb.st,
      sim.demand.NM.gen + sim.demand.NM.hydPump)
  sim.demand.steam=(totalTorqueDemand / TURB_MAX_NM) * TURB_MAX_STEAM_KNSM

  return sim
end

function bilrDemand(sim)
  superSteamDemand=0
  if sim.demand.steam >= BILR_MAX_REG_STEAM_KNSM then
    superSteamDemand=(sim.demand.steam-BILR_MAX_REG_STEAM_KNSM)*s.com.eng.bilr.st
  end
  steamDemand=math.min(BILR_MAX_STEAM_KNSM*s.com.eng.bilr.st,
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
  sim=rotateRotor(sim, 'one')
  sim=rotateRotor(sim, 'two')
  sim=rotateRotor(sim, 'three')
  sim=rotateRotor(sim, 'four')

  sim=rotateProp(sim, 'one')
  sim=rotateProp(sim, 'two')

  return sim
end

function distributePower(sim)
  altAdjustment=clamp01(5000 / (s.pos.z + 5000))
  speedAdjustment=clamp(nroot(6.6, s.speed)-1, 0.2, 1.2)
  intakeAdjustment=altAdjustment * speedAdjustment

  s.com.disps.active=(sim.sply.kW.disps >= sim.demand.kW.disps)

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
  s.com.clls.one.level=s.com.clls.one.level-math.max(
      math.max(0.01, 1-s.com.clls.one.st) * CLL_MAX_VENT_M3F,
      s.com.clls.one.vent)
  s.com.clls.two.level=s.com.clls.two.level-math.max(
      math.max(0.01, 1-s.com.clls.two.st) * CLL_MAX_VENT_M3F,
      s.com.clls.two.vent)
  s.com.clls.three.level=s.com.clls.three.level-math.max(
      math.max(0.01, 1-s.com.clls.three.st) * CLL_MAX_VENT_M3F,
      s.com.clls.three.vent)
  s.com.clls.four.level=s.com.clls.four.level-math.max(
      math.max(0.01, 1-s.com.clls.four.st) * CLL_MAX_VENT_M3F,
      s.com.clls.four.vent)

  s.com.tks.H.level=s.com.tks.H.level -
      sim.sply.H_V.clls.one / H_MASS_TO_VOLUME -
      sim.sply.H_V.clls.two / H_MASS_TO_VOLUME -
      sim.sply.H_V.clls.three / H_MASS_TO_VOLUME -
      sim.sply.H_V.clls.four / H_MASS_TO_VOLUME
  s.com.tks.O.level=s.com.tks.O.level-sim.sply.O.bilr
  s.com.tks.H2O.level=s.com.tks.H2O.level-sim.sply.H2O.bilr -
      sim.sply.H2O.spltr
  s.com.tks.CH4.level=s.com.tks.CH4.level-sim.sply.CH4.bilr

  s.com.hyd.res.level=s.com.hyd.res.level -
      sim.sply.kNSM.rtrs.one-sim.sply.kNSM.rtrs.two -
      sim.sply.kNSM.rtrs.three-sim.sply.kNSM.rtrs.four -
      sim.sply.kNSM.props.one-sim.sply.kNSM.props.two
end

function fillTanks(sim)
  s.com.clls.one.level=math.min(CLL_MAX_M3,
      s.com.clls.one.level + sim.sply.H_V.clls.one)
  s.com.clls.two.level=math.min(CLL_MAX_M3,
      s.com.clls.two.level + sim.sply.H_V.clls.two)
  s.com.clls.three.level=math.min(CLL_MAX_M3,
      s.com.clls.three.level + sim.sply.H_V.clls.three)
  s.com.clls.four.level=math.min(CLL_MAX_M3,
      s.com.clls.four.level + sim.sply.H_V.clls.four)

  s.com.tks.H.level=math.min(H_TANK_MAX_KG,
      s.com.tks.H.level + sim.sply.H_M.tank)
  s.com.tks.O.level=math.min(O_TANK_MAX_KG,
      s.com.tks.O.level + sim.sply.O.tank)
  s.com.tks.H2O.level=math.min(H2O_TANK_MAX_KG,
      s.com.tks.H2O.level + sim.sply.H2O.tank)
  s.com.tks.CH4.level=math.min(CH4_TANK_MAX_KG,
      s.com.tks.CH4.level + sim.sply.CH4.tank)

  s.com.hyd.res.level=math.min(HYD_MAX_KNSM,
      s.com.hyd.res.level + sim.sply.kNSM.hydRes)

  s.com.btry.level=math.min(BATTERY_MAX_CHARGE_KW,
      s.com.btry.level + sim.availableForStorage.kW)
end

function applyThrust(sim)
  s.com.rtrs.one.thrust=sim.sply.kW.rtrs.one /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN
  s.com.rtrs.two.thrust=sim.sply.kW.rtrs.two /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN
  s.com.rtrs.three.thrust=sim.sply.kW.rtrs.three /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN
  s.com.rtrs.four.thrust=sim.sply.kW.rtrs.four /
      RTR_MAX_PWR_DEMAND_KW * RTR_MAX_THRUST_KN

  s.com.props.one.thrust=sim.sply.kW.props.one /
      PROP_MAX_PWR_DEMAND_KW * PROP_MAX_THRUST_KN
  s.com.props.two.thrust=sim.sply.kW.props.two /
      PROP_MAX_PWR_DEMAND_KW * PROP_MAX_THRUST_KN
end

function applyForces(sim)
  altAdjustment=clamp01(5000 / (s.pos.z + 5000))
  thrustAdjustment=lerp(0.2, 1, altAdjustment)
  s.env.Atmo=altAdjustment * SEA_LEVEL_AIR_DENSITY

  rotor1Xcomp=math.cos(math.rad(90-s.com.rtrs.one.rot)) *
      thrustAdjustment
  rotor1Ycomp=math.sin(math.rad(90-s.com.rtrs.one.rot)) *
      thrustAdjustment
  rotor2Xcomp=math.cos(math.rad(90-s.com.rtrs.two.rot)) *
      thrustAdjustment
  rotor2Ycomp=math.sin(math.rad(90-s.com.rtrs.two.rot)) *
      thrustAdjustment
  rotor3Xcomp=math.cos(math.rad(90-s.com.rtrs.three.rot)) *
      thrustAdjustment
  rotor3Ycomp=math.sin(math.rad(90-s.com.rtrs.three.rot)) *
      thrustAdjustment
  rotor4Xcomp=math.cos(math.rad(90-s.com.rtrs.four.rot)) *
      thrustAdjustment
  rotor4Ycomp=math.sin(math.rad(90-s.com.rtrs.four.rot)) *
      thrustAdjustment

  totalHydrogenVolume=s.com.clls.one.level +
      s.com.clls.two.level + s.com.clls.three.level +
      s.com.clls.four.level
  totalHydrogenWeight=totalHydrogenVolume * HYDROGEN_DENSITY
  totalAirWeight=totalHydrogenVolume * SEA_LEVEL_AIR_DENSITY

  totalShipWeightKG=SHIP_DRY_WEIGHT_KG + totalHydrogenWeight +
      s.com.tks.H.level + s.com.tks.O.level +
      s.com.tks.H2O.level + s.com.tks.CH4.level
  totalShipWeightKN=(totalShipWeightKG * KG_TO_N) * 0.001

  s.heading=(s.com.props.one.rot + s.com.props.two.rot) / 2
  drag=DRAG_COEFFICENT * FRONT_DRAG_AREA * 0.5 * s.env.Atmo *
      (s.speed * s.speed)
  s.accl=(s.com.props.one.thrust * thrustAdjustment +
                  s.com.props.two.thrust * thrustAdjustment +
                  s.com.rtrs.one.thrust * rotor1Xcomp +
                  s.com.rtrs.two.thrust * rotor2Xcomp +
                  s.com.rtrs.three.thrust * rotor3Xcomp +
                  s.com.rtrs.four.thrust * rotor4Xcomp-drag) /
      totalShipWeightKN
  -- TODO Remove fudge? Acceleration bump, direction rotation.
  s.speed=s.speed + 0.5 * (s.accl * 10 * 0.00027777777)
  changeX=s.speed * math.sin(math.rad(s.heading))
  changeY=-s.speed * math.cos(math.rad(s.heading))
  s.pos.x=s.pos.x + changeX
  s.pos.y=s.pos.y + changeY
  s.dis=s.dis+math.sqrt(changeX*changeX+changeY*changeY)

  totalHydrogenLiftForce=(totalAirWeight-totalHydrogenWeight) * KG_TO_N *
      HYDROGEN_LIFT_ADJUST
  totalWingLiftForce=(s.speed * WING_LIFT) * altAdjustment

  s.rot=(s.com.rtrs.one.rot + s.com.rtrs.two.rot +
                   s.com.rtrs.three.rot +
                   s.com.rtrs.four.rot) / 4
  vertDrag=DRAG_COEFFICENT * BOTTOM_DRAG_AREA * 0.5 * s.env.Atmo *
      (s.vsi * s.vsi)
  vForce=((s.com.rtrs.one.thrust * rotor1Ycomp +
             s.com.rtrs.two.thrust * rotor2Ycomp +
             s.com.rtrs.three.thrust * rotor3Ycomp +
             s.com.rtrs.four.thrust * rotor4Ycomp) +
      totalHydrogenLiftForce + totalWingLiftForce) / totalShipWeightKN
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
    s.com.clls.one.vent=altDiff
    s.com.clls.two.vent=altDiff
    s.com.clls.three.vent=altDiff
    s.com.clls.four.vent=altDiff
  elseif s.pos.z + 100 < s.con.alt and s.vsi < 0.2 then
    altDiff=math.max((s.pos.z+100-s.con.alt)/100,-8)
    s.com.clls.one.vent=altDiff
    s.com.clls.two.vent=altDiff
    s.com.clls.three.vent=altDiff
    s.com.clls.four.vent=altDiff
  else
    s.com.clls.one.vent=0
    s.com.clls.two.vent=0
    s.com.clls.three.vent=0
    s.com.clls.four.vent=0
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


function calcHydDemand(currentAngle, desiredAngle, st, maxSpeed, maxDemand)
  if currentAngle==desiredAngle then return 0 end
  rotorAngleChange=math.abs(desiredAngle-currentAngle)
  rotorAngleChange=math.min(rotorAngleChange, maxSpeed * st)
  return (rotorAngleChange / maxSpeed) * maxDemand
end

function rotateThruster(sim, type, thruster, maxDemand, maxSpeed)
  if math.abs(s.con.rot[type]-s.com[type][thruster].rot) < 0.0001 then
    s.com[type][thruster].rot=s.con.rot[type]
  else
    hydAvailable=sim.sply.kNSM[type][thruster] / maxDemand
    availableAngle=hydAvailable * maxSpeed
    desiredAngle=s.con.rot[type]-s.com[type][thruster].rot
    moveAngle=math.min(availableAngle, math.abs(desiredAngle))
    if desiredAngle < 0 then
      s.com[type][thruster].rot=s.com[type][thruster].rot-moveAngle
    else
      s.com[type][thruster].rot=s.com[type][thruster].rot + moveAngle
    end
  end

  return sim
end

function rotateRotor(sim, rotor)
  return rotateThruster(sim, 'rtrs', rotor, RTR_MAX_HYD_DEMAND_KNSM,
                        RTR_MAX_ROTATE_SPEED_D)
end

function rotateProp(sim, prop)
  return rotateThruster(sim, 'props', prop, PROP_MAX_HYD_DEMAND_KNSM,
                        PROP_MAX_ROTATE_SPEED_D)
end

function safeDivide(num, den)
  return (den > 0) and num / den or 0
end

function clamp(val, low, high)
  return math.min(math.max(val, low), high)
end

function clamp01(val)
  return clamp(val, 0.0, 1)
end

function nroot(root, num)
  return num^(1 / root)
end

function lerp(a, b, t)
  return a + (b-a) * t
end

function invLerp(a, b, v)
  return (v-a) / (b-a)
end

function sqrDistance(ptA, ptB)
  x=ptA.x-ptB.x
  y=ptA.y-ptB.y
  return x*x+y*y
end

function distance(ptA, ptB)
  return math.sqrt(sqrDistance(ptA,ptB))
end

function scaleV2(vec,scalar)
  return {
    x=vec.x*scalar,
    y=vec.y*scalar
  }
end

function bbCenter(bb)
  return {
    x=(bb.max_x-bb.min_x)/2+bb.min_x,
    y=(bb.max_y-bb.min_y)/2+bb.min_y
  }
end

function rotateV2(vec, angle)
  r=math.rad(angle)
  aSin=math.sin(r)
  aCos=math.cos(r)

  return {
    x=vec.x * aCos-vec.y * aSin,
    y=vec.y * aCos + vec.x * aSin
  }
end

function contains(bb, pos)
  return pos.x >= bb.min_x and pos.y >= bb.min_y and pos.x <= bb.max_x and pos.y <= bb.max_y
end

function mapContains(bb, pos)
  return contains({
        min_x=bb.min_x * 8,
        min_y=bb.min_y * 8,
        max_x=bb.max_x * 8 + 7,
        max_y=bb.max_y * 8 + 7
      }, pos)
end

init()
