-- Game Configuration
-- Constants
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

-- Balance
-- All units are in per frame 1/60th of a second.
-- Units
--   M3: m^3 (volume)
--   M3F: m^3 per frame (fill rate)
--   KG: kilo gram (weight)
--   KGF: kilo gram per frame (fill rate)
--   KW: kilo watt (work)
--   KN: kilo newton (force)
--   NM: newton per meter (torque)
--   KNSM: kilo newton per square meter (pressure)
SHIP_MAX_SPEED=300
SHIP_MAX_ALT=10000
SHIP_DRY_WEIGHT_KG=120000

DISPLAYS_POWER_DEMAND_KW=0.017

SPLITTER_POWER_DEMAND_KW=0.05
SPLITTER_MAX_H2O=2.4
SPLITTER_PER_TIC_H=0.266
SPLITTER_PER_TIC_O=2.128

ROTOR_MAX_THRUST_KN=70000
ROTOR_MAX_POWER_DEMAND_KW=46.4
ROTOR_MAX_ROTATE_SPEED_D=0.08
ROTOR_MAX_HYDRAULIC_DEMAND_KNSM=6.4

PROP_MAX_THRUST_KN=47600
PROP_MAX_POWER_DEMAND_KW=18.5
PROP_MAX_ROTATE_SPEED_D=0.12
PROP_MAX_HYDRAULIC_DEMAND_KNSM=5.2

GEN_MAX_KW=225
GEN_MAX_NM=516
TURBINE_MAX_NM=560
TURBINE_MAX_STEAM_KNSM=160
BOILER_MAX_STEAM_KNSM=172
BOILER_MAX_REG_STEAM_KNSM=104
BOILER_H2O_KG_PER_KNSM=0.0008
BOILER_CH4_KG_PER_KNSM=0.0394
BOILER_O_KG_PER_KNSM=0.0152

BATTERY_MAX_CHARGE_KW=350
BATTERY_MAX_CHARGE_RATE_KW=0.022

HYDRAULIC_MAX_KNSM=32
HYDRAULIC_PUMP_MAX_NM=16
HYDRAULIC_PUMP_NM_PER_KNSM=2

BLADDER_MAX_M3=12000
H_TANK_MAX_KG=220
O_TANK_MAX_KG=2800
H2O_TANK_MAX_KG=16800
CH4_TANK_MAX_KG=16800

BLADDER_MAX_VENT_M3F=7
BLADDER_MAX_M3F=12.4
H_TANK_MAX_KGF=0.3
O_TANK_MAX_KGF=2.3
H2O_TANK_MAX_KGF=2.6
CH4_TANK_MAX_KGF=8.274

H2O_ACC_POWER_DEMAND_KW=0.067
CH4_ACC_POWER_DEMAND_KW=0.117
H2O_ACC_PER_TIC=12
CH4_ACC_PER_TIC=20

-- Game State
start={
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
  vy=0
}

s={
  speed=20,
  accl=0,
  heading=0,
  rot=0,
  vsi=0,
  set_vsi=0,
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
      rotors=0.7
    },
    rot={
      props=0,
      rotors=0
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
    engine={
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
        level=HYDRAULIC_MAX_KNSM,
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
    rotors={
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
        level=BLADDER_MAX_M3*.8,
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
        level=BLADDER_MAX_M3*.8,
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
        level=BLADDER_MAX_M3*.8,
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
        level=BLADDER_MAX_M3*.8,
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
    splitter={
      st=1,
      id="splitter",
      bb={
        min_x=64,
        min_y=28,
        max_x=65,
        max_y=28
      }
    },
    tanks={
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
    rotors={
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
    rotors={
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
    tanks={
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
  splitter={
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

startScreen=true
showControls=false
showMap=false

debugType=0
controlType=0

RES_PT_COUNT=6000
MAP_DIM=500
mapVls={}
CH4pts={}
H2Opts={}

function init()
  -- Background color
  poke(0x03FF8, 3)
  math.randomseed(8778)

  buildMap()

  cam.x=p.x - 120
  cam.y=p.y - 64
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

  if startScreen then
    if btn(0) then y=y-1 end
    if btn(1) then y=y+1 end
    if btn(2) then x=x-1 end
    if btn(3) then x=x+1 end
    if btn(5) then startScreen=false end

    cls(0)
    sprId=0
    if (start.t%60)//30==0 then
      sprId=1
    else
      sprId=49
    end

    spr(sprId,start.x,start.y,14,2,0,0,8,3)
    print("Das Luftschiff",84,84)
    print("X Start", 84, 94)
    start.t=start.t+1
  else

    if btnp(5) then showMap=not showMap end

    testPos={x=p.x,y=p.y}
    if mapContains(s.com.disps.bb, testPos) then
      if btnp(6) then showControls=not showControls end
    elseif mapContains(s.com.engine.bilr.bb, testPos) then
      if btn(6) then s.com.engine.bilr.st=math.min(s.com.engine.bilr.st+0.01,1) end
    elseif mapContains(s.com.engine.turb.bb, testPos) then
      if btn(6) then s.com.engine.turb.st=math.min(s.com.engine.turb.st+0.01,1) end
    elseif mapContains(s.com.hyd.res.bb, testPos) then
      if btn(6) then s.com.hyd.res.st=math.min(s.com.hyd.res.st+0.01,1) end
    elseif mapContains(s.com.hyd.pump.bb, testPos) then
      if btn(6) then s.com.hyd.pump.st=math.min(s.com.hyd.pump.st+0.01,1) end
    elseif mapContains(s.com.gen.bb, testPos) then
      if btn(6) then s.com.gen.st=math.min(s.com.gen.st+0.01,1) end
    elseif mapContains(s.com.rotors.one.bb, testPos) then
      if btn(6) then s.com.rotors.one.st=math.min(s.com.rotors.one.st+0.01,1) end
    elseif mapContains(s.com.rotors.two.bb, testPos) then
      if btn(6) then s.com.rotors.two.st=math.min(s.com.rotors.two.st+0.01,1) end
    elseif mapContains(s.com.rotors.three.bb, testPos) then
      if btn(6) then s.com.rotors.three.st=math.min(s.com.rotors.three.st+0.01,1) end
    elseif mapContains(s.com.rotors.four.bb, testPos) then
      if btn(6) then s.com.rotors.four.st=math.min(s.com.rotors.four.st+0.01,1) end
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
    elseif mapContains(s.com.splitter.bb, testPos) then
      if btn(6) then s.com.splitter.st=math.min(s.com.splitter.st+0.01,1) end
    elseif mapContains(s.com.tanks.H.bb, testPos) then
      if btn(6) then s.com.tanks.H.st=math.min(s.com.tanks.H.st+0.01,1) end
    elseif mapContains(s.com.tanks.O.bb, testPos) then
      if btn(6) then s.com.tanks.O.st=math.min(s.com.tanks.O.st+0.01,1) end
    elseif mapContains(s.com.tanks.H2O.bb, testPos) then
      if btn(6) then s.com.tanks.H2O.st=math.min(s.com.tanks.H2O.st+0.01,1) end
    elseif mapContains(s.com.tanks.CH4.bb, testPos) then
      if btn(6) then s.com.tanks.CH4.st=math.min(s.com.tanks.CH4.st+0.01,1) end
    end

    if showControls then
      if btnp(2) then controlType=controlType - 1 end
      if btnp(3) then controlType=controlType + 1 end

      if controlType < 0 then controlType=4 end
      if controlType > 4 then controlType=0 end

      if controlType==0 then
        if btn(0) then s.con.rot.rotors=s.con.rot.rotors + 1 end
        if btn(1) then s.con.rot.rotors=s.con.rot.rotors - 1 end
        if s.con.rot.rotors < 0 then s.con.rot.rotors=0 end
        if s.con.rot.rotors > 90 then s.con.rot.rotors=90 end
      elseif controlType==1 then
        if btn(0) then s.con.vsi=s.con.vsi + 0.02 end
        if btn(1) then s.con.vsi=s.con.vsi - 0.02 end
        if s.con.vsi < -1.2 then s.con.vsi=-1.2 end
        if s.con.vsi > 1.2 then s.con.vsi=1.2 end
      elseif controlType==2 then
        if btn(0) then s.con.alt=s.con.alt + 10 end
        if btn(1) then s.con.alt=s.con.alt - 10 end
        if s.con.alt < 0 then s.con.alt=0 end
        if s.con.alt > SHIP_MAX_ALT then s.con.alt=SHIP_MAX_ALT end
      elseif controlType==3 then
        if btn(0) then s.con.thrt.props=s.con.thrt.props + 0.01 end
        if btn(1) then s.con.thrt.props=s.con.thrt.props - 0.01 end
        if s.con.thrt.props < 0.0 then s.con.thrt.props=0.0 end
        if s.con.thrt.props > 1 then s.con.thrt.props=1 end
      elseif controlType==4 then
        if btn(0) then s.con.rot.props=s.con.rot.props - 1 end
        if btn(1) then s.con.rot.props=s.con.rot.props + 1 end
        if s.con.rot.props < 0 then s.con.rot.props=360 end
        if s.con.rot.props > 360 then s.con.rot.props=s.con.rot.props - 360 end
      end
    else
      onFloor=false
      inCeiling=false
      onLadder=false
      testX=p.x // 8
      testY=p.y // 8
      testYD=(p.y // 8) + 1
      testYU=(p.y // 8) - 1
      if mget(testX, testYD)==16 then onFloor=true end
      if mget(testX, testYU)==16 then inCeiling=true end
      if mget(testX, testY)==32 or mget(testX, testYD)==32 then onLadder=true end

      if btn(0) and onLadder then
        p.vy=math.max(p.vy - 0.1, -1.5)
      elseif btn(1) and onLadder and not onFloor then
        p.vy=math.max(p.vy + 0.1, 1.5)
      elseif onLadder then
        p.vy=0.0
      elseif btn(0) and onFloor then
        p.vy=-1.5
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

      if btn(2) then
        p.vx=math.max(p.vx - 0.1, -2.0)
      elseif btn(3) then
        p.vx=math.min(p.vx + 0.1, 2.0)
      else
        p.vx= 0.0
      end

      p.x=p.x+p.vx
      p.y=p.y+p.vy

      cam.x=lerp(cam.x, p.x - 120, 0.15)
      cam.y=lerp(cam.y, 137, 0.15) -- p.y - 64
      cam.cellX=cam.x / 8
      cam.cellY=cam.y / 8

      if p.y > 234 then
        if p.x < 294 then p.x=294 end
        if p.x > 652 then p.x=652 end
      elseif p.y > 202 then
        if p.x < 270 then p.x=270 end
        if p.x > 676 then p.x=676 end
      else
        if p.x < 270 then p.x=270 end
        if p.x > 692 then p.x=692 end
      end

      if p.y > 257 then p.y=257 end
      if p.y < 170 then p.y=170 end
    end

    if btnp(7) then
      debugType=(debugType > 3) and 0 or debugType + 1
    end

    cls(0)
    simulate()

    s.com.engine.bilr.st=s.com.engine.bilr.st-0.00001
    s.com.engine.bilr.st=s.com.engine.bilr.st-0.000001
    s.com.engine.turb.st=s.com.engine.turb.st-0.00001
    s.com.hyd.res.st=s.com.hyd.res.st-0.000001
    s.com.hyd.pump.st=s.com.hyd.pump.st-0.00001
    s.com.gen.st=s.com.gen.st-0.00001
    s.com.rotors.one.st=s.com.rotors.one.st-0.00001
    s.com.rotors.two.st=s.com.rotors.two.st-0.00001
    s.com.rotors.three.st=s.com.rotors.three.st-0.00001
    s.com.rotors.four.st=s.com.rotors.four.st-0.00001
    s.com.props.one.st=s.com.props.one.st-0.00001
    s.com.props.two.st=s.com.props.two.st-0.00001
    s.com.acc.H2O.st=s.com.acc.H2O.st-0.00001
    s.com.acc.CH4.st=s.com.acc.CH4.st-0.00001
    s.com.clls.one.st=s.com.clls.one.st-0.00001
    s.com.clls.two.st=s.com.clls.two.st-0.00001
    s.com.clls.three.st=s.com.clls.three.st-0.00001
    s.com.clls.four.st=s.com.clls.four.st-0.00001
    s.com.btry.st=s.com.btry.st-0.000001
    s.com.splitter.st=s.com.splitter.st-0.00001
    s.com.tanks.H.st=s.com.tanks.H.st-0.000001
    s.com.tanks.O.st=s.com.tanks.O.st-0.000001
    s.com.tanks.H2O.st=s.com.tanks.H2O.st-0.000001
    s.com.tanks.CH4.st=s.com.tanks.CH4.st-0.000001

    if debugType==0 and not showMap then
      drawGame()
    elseif debugType==1 then
      drawShipDebugOne(s)
    elseif debugType==2 then
      drawShipDebugTwo(s)
    end

    if showMap then
      drawMap(30,17)
    end

    drawShipStatus()
  end

end

function drawShipStatus()
  c=s.com
  repair = (math.min(c.disps.st,c.engine.bilr.st,c.engine.turb.st,c.hyd.res.st,
      c.hyd.pump.st,c.gen.st,c.rotors.one.st,c.rotors.two.st,
      c.rotors.three.st,c.rotors.four.st,c.props.one.st,
      c.props.two.st,c.acc.H2O.st,c.acc.CH4.st,c.clls.one.st,
      c.clls.two.st,c.clls.three.st,c.clls.four.st,c.btry.st,
      c.splitter.st,c.tanks.H.st,c.tanks.O.st,c.tanks.H2O.st,
      c.tanks.CH4.st) * 100)//1
  rect(0, 0, 92, 8, 8)
  rect(127, 0, 113, 8, 8)
  print(string.format("Speed: %d", s.speed//1), 1, 1, 6, false, 1, true)
  print(string.format("Altitude: %dk", s.pos.z//1000), 48, 1, 6, false, 1, true)
  print(string.format("Repair: %d%%", repair), 128, 1, 6, false, 1, true)
  print(string.format("Resources: %d%%", 100), 180, 1, 6, false, 1, true)
end

function getShipTilePos()
  return {x=s.pos.x//10000,y=s.pos.y//10000}
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
      CH4=math.min(1,inverseLerp(0,72,CH4cnt)),
      H2O=math.min(1,inverseLerp(0,72,H2Ocnt))
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
  maxMapHeight=18
  mapYAdjust=0
  if showControls then
    maxMapHeight=6
    mapYAdjust=3
  end

  camXCellAdd=cam.x % 8==0 and -1 or 0
  camYCellAdd=cam.y % 8==0 and -1 or 0
  camXCor=-cam.x % 8 - 8
  camYCor=-cam.y % 8 - 8
  map(cam.cellX + camXCellAdd, cam.cellY + camYCellAdd + mapYAdjust, 31,
      maxMapHeight, camXCor, camYCor)
  spr(p.s, p.x - cam.x - 4, p.y - cam.y - 8, 0, 1, 0, 0, 1, 2)

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
    drawNeedleAngeStatus(gauges.needles.con_rot, s.con.rot.rotors,
                     { x=0, y=17 })

    drawBarStatus(gauges.bars.alt, s.pos.z, SHIP_MAX_ALT)
    drawBarStatus(gauges.bars.speed, s.speed, SHIP_MAX_SPEED)

    drawBarStatus(gauges.bars.tanks.H2O, s.com.tanks.H2O.level, H2O_TANK_MAX_KG)
    drawBarStatus(gauges.bars.tanks.CH4, s.com.tanks.CH4.level, CH4_TANK_MAX_KG)

    altY=lerp(91, 67, inverseLerp(0, SHIP_MAX_ALT, s.pos.z)) - 2.5
    spdY=lerp(91, 67, inverseLerp(0, SHIP_MAX_SPEED, s.speed)) - 2.5
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

    drawRotorRotationStatus(gauges.needles.rotors.one,
                            s.com.rotors.one.rot)
    drawRotorRotationStatus(gauges.needles.rotors.two,
                            s.com.rotors.two.rot)
    drawRotorRotationStatus(gauges.needles.rotors.three,
                            s.com.rotors.three.rot)
    drawRotorRotationStatus(gauges.needles.rotors.four,
                            s.com.rotors.four.rot)

    drawRotorThrustStatus(gauges.bars.rotors.one, s.com.rotors.one.thrust)
    drawRotorThrustStatus(gauges.bars.rotors.two, s.com.rotors.two.thrust)
    drawRotorThrustStatus(gauges.bars.rotors.three, s.com.rotors.three.thrust)
    drawRotorThrustStatus(gauges.bars.rotors.four, s.com.rotors.four.thrust)

    print("Hyd Cells", 199, 100, 6, false, 1, true)

    drawBarStatus(gauges.bars.clls.one, s.com.clls.one.level, BLADDER_MAX_M3)
    drawBarStatus(gauges.bars.clls.two, s.com.clls.two.level, BLADDER_MAX_M3)
    drawBarStatus(gauges.bars.clls.three, s.com.clls.three.level, BLADDER_MAX_M3)
    drawBarStatus(gauges.bars.clls.four, s.com.clls.four.level, BLADDER_MAX_M3)

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
  else
    drawCom(s.com.disps.bb, s.com.disps.id)

    drawCom(s.com.engine.bilr.bb, s.com.engine.bilr.id, s.com.engine.bilr.st)
    drawCom(s.com.engine.turb.bb, s.com.engine.turb.id, s.com.engine.turb.st)

    drawCom(s.com.hyd.res.bb, s.com.hyd.res.id, s.com.hyd.res.st)
    drawCom(s.com.hyd.pump.bb, s.com.hyd.pump.id, s.com.hyd.pump.st)

    drawCom(s.com.gen.bb, s.com.gen.id, s.com.gen.st)

    drawCom(s.com.rotors.one.bb, s.com.rotors.one.id, s.com.rotors.one.st)
    drawCom(s.com.rotors.two.bb, s.com.rotors.two.id, s.com.rotors.two.st)
    drawCom(s.com.rotors.three.bb, s.com.rotors.three.id, s.com.rotors.three.st)
    drawCom(s.com.rotors.four.bb, s.com.rotors.four.id, s.com.rotors.four.st)

    drawCom(s.com.props.one.bb, s.com.props.one.id, s.com.props.one.st)
    drawCom(s.com.props.two.bb, s.com.props.two.id, s.com.props.two.st)

    drawCom(s.com.acc.H2O.bb, s.com.acc.H2O.id, s.com.acc.H2O.st)
    drawCom(s.com.acc.CH4.bb, s.com.acc.CH4.id, s.com.acc.CH4.st)

    drawCom(s.com.clls.one.bb, s.com.clls.one.id, s.com.clls.one.st)
    drawCom(s.com.clls.two.bb, s.com.clls.two.id, s.com.clls.two.st)
    drawCom(s.com.clls.three.bb, s.com.clls.three.id, s.com.clls.three.st)
    drawCom(s.com.clls.four.bb, s.com.clls.four.id, s.com.clls.four.st)

    drawCom(s.com.btry.bb, s.com.btry.id, s.com.btry.st)
    drawCom(s.com.splitter.bb, s.com.splitter.id, s.com.splitter.st)

    drawCom(s.com.tanks.H.bb, s.com.tanks.H.id, s.com.tanks.H.st)
    drawCom(s.com.tanks.O.bb, s.com.tanks.O.id, s.com.tanks.O.st)
    drawCom(s.com.tanks.H2O.bb, s.com.tanks.H2O.id, s.com.tanks.H2O.st)
    drawCom(s.com.tanks.CH4.bb, s.com.tanks.CH4.id, s.com.tanks.CH4.st)

    drawCom({ min_x=39, min_y=27, max_x=39, max_y=27 }, "pto_upper")
    drawCom({ min_x=39, min_y=28, max_x=39, max_y=28 }, "pto_lower")
    drawCom({ min_x=44, min_y=27, max_x=44, max_y=27 }, "pto_upper")
    drawCom({ min_x=44, min_y=28, max_x=44, max_y=28 }, "pto_lower")
    drawCom({ min_x=45, min_y=27, max_x=45, max_y=27 }, "pto_upper")
    drawCom({ min_x=45, min_y=28, max_x=45, max_y=28 }, "pto_lower")
  end
end

function drawCom(bb, drawableId, st)
  drawable=drawables[drawableId]
  posX=(bb.min_x * 8 - cam.x) // 1 + 1
  posY=(bb.min_y * 8 - cam.y) // 1 + 1

  requestedX=bb.max_x + 1 - bb.min_x
  requestedY=bb.max_y + 1 - bb.min_y

  if requestedX > drawable.w and drawable.w==5 then
    for y=1, requestedY do
      adjYPos=(y - 1) * 8 + posY
      yOffset=(y - 1) * 16
      for x=1, requestedX do
        adjXPos=(x - 1) * 8 + posX
        xOffset=x - 1
        if x < 3 then
          spr(drawable.s + yOffset + xOffset, adjXPos, adjYPos, 0)
        elseif x < requestedX - 1 then
          spr(drawable.s + yOffset + 2, adjXPos, adjYPos, 0)
        else
          spr(drawable.s + yOffset + xOffset - 3, adjXPos, adjYPos, 0)
        end
      end
    end
  elseif requestedX > drawable.w and drawable.w==3 then
    for y=1, requestedY do
      adjYPos=(y - 1) * 8 + posY
      yOffset=(y - 1) * 16
      for x=1, requestedX do
        adjXPos=(x - 1) * 8 + posX
        xOffset=x - 1
        if x==1 then
          spr(drawable.s + yOffset + xOffset, adjXPos, adjYPos, 0)
        elseif x < requestedX then
          spr(drawable.s + yOffset + 1, adjXPos, adjYPos, 0)
        else
          spr(drawable.s + yOffset + drawable.w - 1, adjXPos, adjYPos, 0)
        end
      end
    end
  elseif requestedX > drawable.w and drawable.w==2 then
    for y=1, requestedY do
      adjYPos=(y - 1) * 8 + posY
      yOffset=(y - 1) * 16
      for x=1, requestedX do
        adjXPos=(x - 1) * 8 + posX
        xOffset=(x - 1) % drawable.w
        spr(drawable.s + yOffset + xOffset, adjXPos, adjYPos, 0)
      end
    end
  else
    spr(drawable.s, posX, posY, 0, 1, 0, 0, drawable.w, drawable.h)
  end

  if st~=nil then
    baseY=posY + 16
    sH=(lerp(0,16,st)+0.5)//1
    rect(posX,baseY-sH,2,sH,6)
  end
end

function drawNeedleAngeStatus(needle, angle, vec)
  target=rotateV2(vec, angle)
  line(needle.x, needle.y, needle.x + target.x, needle.y + target.y, needle.c)
end

function drawNeedleLevelStatus(needle, value, min_value, max_value,
                               min_angle, max_angle, length)
  vec={ x=0, y=length }
  normal=inverseLerp(min_value, max_value, value)
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
  normal=inverseLerp(0, max, value)
  levelHeight=(lerp(0, level.h, normal) + 1.5)//1
  levelY=baseY - levelHeight
  line(level.x, levelY, level.x + level.w - 1, levelY, level.c)
end

function drawBarStatus(bar, value, max)
  baseY=bar.y + bar.h
  normal=inverseLerp(0, max, value)
  barHeight=(lerp(0, bar.h, normal) + 0.5)//1
  barY=baseY - barHeight
  rect(bar.x, barY, bar.w, barHeight, bar.c)
end

function drawPropThrustStatus(bar, thrust)
  drawBarStatus(bar, thrust, PROP_MAX_THRUST_KN)
end

function drawRotorThrustStatus(bar, thrust)
  drawBarStatus(bar, thrust, ROTOR_MAX_THRUST_KN)
end

function simulate()
  sim={
    demand={
      kW={
        disps=0,
        rotors={
          one=0,
          two=0,
          three=0,
          four=0
        },
        props={
          one=0,
          two=0
        },
        splitter=0,
        H2OAcc=0,
        CH4Acc=0,
        btry=0
      },
      kNSM={
        hydRes=0,
        rotors={
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
        splitter=0
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
    supply={
      kW={
        disps=0,
        rotors={
          one=0,
          two=0,
          three=0,
          four=0
        },
        props={
          one=0,
          two=0
        },
        splitter=0,
        H2OAcc=0,
        CH4Acc=0,
        btry=0
      },
      kNSM={
        hydRes=0,
        rotors={
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
        splitter=0
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
      H2O=s.com.tanks.H2O.level,
      CH4=s.com.tanks.CH4.level,
      H_M=s.com.tanks.H.level,
      H_V=s.com.tanks.H.level * H_MASS_TO_VOLUME,
      O=s.com.tanks.O.level
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
  sim=splitterAccDemand(sim)
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
  sim.demand.kW.disps=DISPLAYS_POWER_DEMAND_KW

  sim.demand.kW.rotors.one=ROTOR_MAX_POWER_DEMAND_KW *
      s.com.rotors.one.st * s.con.thrt.rotors
  sim.demand.kW.rotors.two=ROTOR_MAX_POWER_DEMAND_KW *
      s.com.rotors.two.st * s.con.thrt.rotors
  sim.demand.kW.rotors.three=ROTOR_MAX_POWER_DEMAND_KW *
      s.com.rotors.three.st * s.con.thrt.rotors
  sim.demand.kW.rotors.four=ROTOR_MAX_POWER_DEMAND_KW *
      s.com.rotors.four.st * s.con.thrt.rotors

  sim.demand.kW.props.one=PROP_MAX_POWER_DEMAND_KW *
      s.com.props.one.st * s.con.thrt.props
  sim.demand.kW.props.two=PROP_MAX_POWER_DEMAND_KW *
      s.com.props.two.st * s.con.thrt.props

  return sim
end

function controlsHydraulicDemand(sim)
  sim.demand.kNSM.rotors.one=calcHydDemand(s.com.rotors.one.rot,
                                             s.con.rot.rotors,
                                             s.com.rotors.one.st,
                                             ROTOR_MAX_ROTATE_SPEED_D,
                                             ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.rotors.two=calcHydDemand(s.com.rotors.two.rot,
                                             s.con.rot.rotors,
                                             s.com.rotors.two.st,
                                             ROTOR_MAX_ROTATE_SPEED_D,
                                             ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.rotors.three=calcHydDemand(s.com.rotors.three.rot,
                                               s.con.rot.rotors,
                                               s.com.rotors.three.st,
                                               ROTOR_MAX_ROTATE_SPEED_D,
                                               ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.rotors.four=calcHydDemand(s.com.rotors.four.rot,
                                              s.con.rot.rotors,
                                              s.com.rotors.four.st,
                                              ROTOR_MAX_ROTATE_SPEED_D,
                                              ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)

  sim.demand.kNSM.props.one=calcHydDemand(s.com.props.one.rot,
                                            s.con.rot.props,
                                            s.com.props.one.st,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.props.two=calcHydDemand(s.com.props.two.rot,
                                            s.con.rot.props,
                                            s.com.props.two.st,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYDRAULIC_DEMAND_KNSM)

  return sim
end

function storageTanksDemand(sim)
  sim.demand.H2O.tank=math.min(H2O_TANK_MAX_KG - s.com.tanks.H2O.level,
                                 H2O_TANK_MAX_KGF)
  sim.demand.CH4.tank=math.min(CH4_TANK_MAX_KG - s.com.tanks.CH4.level,
                                 CH4_TANK_MAX_KGF)
  sim.demand.H_M.tank=math.min(H_TANK_MAX_KG - s.com.tanks.H.level,
                                 H_TANK_MAX_KGF)
  sim.demand.O.tank=math.min(O_TANK_MAX_KG - s.com.tanks.O.level,
                               O_TANK_MAX_KGF)

  return sim
end

function cellDemand(sim)
  if s.com.clls.one.vent <= 0 then
    sim.demand.H_V.clls.one=math.min(
        BLADDER_MAX_M3 - s.com.clls.one.level, BLADDER_MAX_M3F)
  end
  if s.com.clls.two.vent <= 0 then
    sim.demand.H_V.clls.two=math.min(
        BLADDER_MAX_M3 - s.com.clls.two.level, BLADDER_MAX_M3F)
  end
  if s.com.clls.three.vent <= 0 then
    sim.demand.H_V.clls.three=math.min(
        BLADDER_MAX_M3 - s.com.clls.three.level, BLADDER_MAX_M3F)
  end
  if s.com.clls.four.vent <= 0 then
    sim.demand.H_V.clls.four=math.min(
        BLADDER_MAX_M3 - s.com.clls.four.level, BLADDER_MAX_M3F)
  end

  return sim
end

function btryDemand(sim)
  btryStateDemand=math.min(BATTERY_MAX_CHARGE_RATE_KW,
      BATTERY_MAX_CHARGE_KW * s.com.btry.st - s.com.btry.level)
  sim.demand.kW.btry=math.max(btryStateDemand, 0)

  return sim
end

function hydResDemand(sim)
  sim.demand.kNSM.hydRes=HYDRAULIC_MAX_KNSM - s.com.hyd.res.level

  return sim
end

function splitterAccDemand(sim)
  if sim.demand.H_M.tank > 0 or sim.demand.O.tank > 0 then
    sim.demand.kW.splitter=SPLITTER_POWER_DEMAND_KW * s.com.splitter.st
    sim.demand.H2O.splitter=SPLITTER_MAX_H2O * s.com.splitter.st
  end

  if sim.demand.H2O.tank > 0 then
    sim.demand.kW.H2OAcc=H2O_ACC_POWER_DEMAND_KW * s.com.acc.H2O.st
  end

  if sim.demand.CH4.tank > 0 then
    sim.demand.kW.CH4Acc=CH4_ACC_POWER_DEMAND_KW * s.com.acc.CH4.st
  end

  return sim
end

function hydPumpDemand(sim)
  sim.demand.NM.hydPump=math.min(HYDRAULIC_PUMP_MAX_NM,
      sim.demand.kNSM.hydRes * HYDRAULIC_PUMP_NM_PER_KNSM)

  return sim
end

function genDemand(sim)
  totalPowerDemand=math.min(GEN_MAX_KW * s.com.gen.st,
      sim.demand.kW.disps + sim.demand.kW.rotors.one +
      sim.demand.kW.rotors.two + sim.demand.kW.rotors.three +
      sim.demand.kW.rotors.four + sim.demand.kW.props.one +
      sim.demand.kW.props.two + sim.demand.kW.splitter +
      sim.demand.kW.H2OAcc + sim.demand.kW.CH4Acc + sim.demand.kW.btry)
  sim.demand.NM.gen=(totalPowerDemand / GEN_MAX_KW) * GEN_MAX_NM

  return sim
end

function turbDemand(sim)
  totalTorqueDemand=math.min(TURBINE_MAX_NM * s.com.engine.turb.st,
      sim.demand.NM.gen + sim.demand.NM.hydPump)
  sim.demand.steam=(totalTorqueDemand / TURBINE_MAX_NM) * TURBINE_MAX_STEAM_KNSM

  return sim
end

function bilrDemand(sim)
  superSteamDemand=0
  if sim.demand.steam >= BOILER_MAX_REG_STEAM_KNSM then
    superSteamDemand=(sim.demand.steam-BOILER_MAX_REG_STEAM_KNSM)*s.com.engine.bilr.st
  end
  steamDemand=math.min(BOILER_MAX_STEAM_KNSM*s.com.engine.bilr.st,
                       sim.demand.steam)
  sim.demand.H2O.bilr=steamDemand * BOILER_H2O_KG_PER_KNSM
  sim.demand.CH4.bilr=steamDemand * BOILER_CH4_KG_PER_KNSM
  sim.demand.O.bilr=superSteamDemand * BOILER_O_KG_PER_KNSM

  return sim
end

function elementSupply(sim)
  sim.supply.O.bilr=math.min(sim.demand.O.bilr, sim.availableForUse.O)
  sim.supply.CH4.bilr=math.min(sim.demand.CH4.bilr,
                                   sim.availableForUse.CH4)

  totalH2ODemand=sim.demand.H2O.bilr + sim.demand.H2O.splitter
  if sim.availableForUse.H2O > totalH2ODemand then
    sim.supply.H2O.bilr=sim.demand.H2O.bilr
    sim.supply.H2O.splitter=sim.demand.H2O.splitter
  elseif sim.availableForUse.H2O > 0 then
    bilrPercent=sim.demand.H2O.bilr / totalH2ODemand
    splitterPercent=sim.demand.H2O.splitter / totalH2ODemand
    sim.supply.H2O.bilr=bilrPercent * sim.availableForUse.H2O
    sim.supply.H2O.splitter=splitterPercent * sim.availableForUse.H2O
  end

  totalH_VDemand=sim.demand.H_V.clls.one + sim.demand.H_V.clls.two +
      sim.demand.H_V.clls.three + sim.demand.H_V.clls.four
  if sim.availableForUse.H_V > totalH_VDemand then
    sim.supply.H_V.clls.one=sim.demand.H_V.clls.one
    sim.supply.H_V.clls.two=sim.demand.H_V.clls.two
    sim.supply.H_V.clls.three=sim.demand.H_V.clls.three
    sim.supply.H_V.clls.four=sim.demand.H_V.clls.four
  elseif sim.availableForUse.H_V > 0 then
    bOnePercent=sim.demand.H_V.clls.one / totalH_VDemand
    bTwoPercent=sim.demand.H_V.clls.two / totalH_VDemand
    bThreePercent=sim.demand.H_V.clls.three / totalH_VDemand
    bFourPercent=sim.demand.H_V.clls.four / totalH_VDemand
    sim.supply.H_V.clls.one=bOnePercent * sim.availableForUse.H_V
    sim.supply.H_V.clls.two=bTwoPercent * sim.availableForUse.H_V
    sim.supply.H_V.clls.three=bThreePercent * sim.availableForUse.H_V
    sim.supply.H_V.clls.four=bFourPercent * sim.availableForUse.H_V
  end

  return sim
end

function steamSupply(sim)
  suppliedH2O_KNSM=sim.supply.H2O.bilr / BOILER_H2O_KG_PER_KNSM
  suppliedCH4_KNSM=sim.supply.CH4.bilr / BOILER_CH4_KG_PER_KNSM
  suppliedO_KNSM=sim.supply.O.bilr / BOILER_O_KG_PER_KNSM

  if suppliedH2O_KNSM < suppliedCH4_KNSM then
    suppliedCH4_KNSM=suppliedH2O_KNSM
    sim.supply.CH4.bilr=suppliedCH4_KNSM * BOILER_CH4_KG_PER_KNSM
  elseif suppliedCH4_KNSM < suppliedH2O_KNSM then
    suppliedH2O_KNSM=suppliedCH4_KNSM
    sim.supply.H2O.bilr=suppliedH2O_KNSM * BOILER_H2O_KG_PER_KNSM
  end

  suppliedKNSM=suppliedCH4_KNSM

  if suppliedKNSM > BOILER_MAX_REG_STEAM_KNSM then
    superSteam=suppliedKNSM - BOILER_MAX_REG_STEAM_KNSM
    if suppliedO_KNSM >= superSteam then
      sim.supply.O.bilr=superSteam * BOILER_O_KG_PER_KNSM
    else
      missing=superSteam - suppliedO_KNSM
      suppliedKNSM=suppliedKNSM - missing
      sim.supply.CH4.bilr=suppliedKNSM * BOILER_CH4_KG_PER_KNSM
      sim.supply.H2O.bilr=suppliedKNSM * BOILER_H2O_KG_PER_KNSM
    end
  end

  sim.supply.steam=suppliedKNSM

  return sim
end

function torqueSupply(sim)
  torqueSupplied=TURBINE_MAX_NM * (sim.supply.steam / TURBINE_MAX_STEAM_KNSM)
  torqueDemand=sim.demand.NM.gen + sim.demand.NM.hydPump

  if torqueSupplied >= torqueDemand then
    sim.supply.NM.gen=sim.demand.NM.gen
    sim.supply.NM.hydPump=sim.demand.NM.hydPump
  else
    genPercent=sim.demand.NM.gen / torqueDemand
    pumpPercent=sim.demand.NM.hydPump / torqueDemand
    sim.supply.NM.gen=torqueSupplied * genPercent
    sim.supply.NM.hydPump=torqueSupplied * pumpPercent
  end

  return sim
end

function hydraulicSupply(sim)
  sim.supply.kNSM.hydRes=sim.supply.NM.hydPump * HYDRAULIC_PUMP_NM_PER_KNSM

  totalPressureDemand=sim.demand.kNSM.rotors.one +
      sim.demand.kNSM.rotors.two + sim.demand.kNSM.rotors.three +
      sim.demand.kNSM.rotors.four + sim.demand.kNSM.props.one +
      sim.demand.kNSM.props.two

  if sim.availableForUse.kNSM >= totalPressureDemand then
    sim.supply.kNSM.rotors.one=sim.demand.kNSM.rotors.one
    sim.supply.kNSM.rotors.two=sim.demand.kNSM.rotors.two
    sim.supply.kNSM.rotors.three=sim.demand.kNSM.rotors.three
    sim.supply.kNSM.rotors.four=sim.demand.kNSM.rotors.four
    sim.supply.kNSM.props.one=sim.demand.kNSM.props.one
    sim.supply.kNSM.props.two=sim.demand.kNSM.props.two
  elseif sim.availableForUse.kNSM > 0 then
    rotorsOnePercent=sim.demand.kNSM.rotors.one / totalPressureDemand
    rotorsTwoPercent=sim.demand.kNSM.rotors.two / totalPressureDemand
    rotorsThreePercent=sim.demand.kNSM.rotors.three / totalPressureDemand
    rotorsFourPercent=sim.demand.kNSM.rotors.four / totalPressureDemand
    propsOnePercent=sim.demand.kNSM.props.one / totalPressureDemand
    propsTwoPercent=sim.demand.kNSM.props.two / totalPressureDemand

    sim.supply.kNSM.rotors.one=rotorsOnePercent * sim.availableForUse.kNSM
    sim.supply.kNSM.rotors.two=rotorsTwoPercent * sim.availableForUse.kNSM
    sim.supply.kNSM.rotors.three=rotorsThreePercent * sim.availableForUse.kNSM
    sim.supply.kNSM.rotors.four=rotorsFourPercent * sim.availableForUse.kNSM
    sim.supply.kNSM.props.one=propsOnePercent * sim.availableForUse.kNSM
    sim.supply.kNSM.props.two=propsTwoPercent * sim.availableForUse.kNSM
  end

  return sim
end

function powerSupply(sim)
  genPower=GEN_MAX_KW * (sim.supply.NM.gen / GEN_MAX_NM)
  btryPower=sim.availableForUse.kW
  totalPowerDemand=sim.demand.kW.disps + sim.demand.kW.btry +
      sim.demand.kW.rotors.one + sim.demand.kW.rotors.two +
      sim.demand.kW.rotors.three + sim.demand.kW.rotors.four +
      sim.demand.kW.props.one + sim.demand.kW.props.two +
      sim.demand.kW.splitter + sim.demand.kW.H2OAcc + sim.demand.kW.CH4Acc

  if totalPowerDemand <= genPower then
    sim.supply.kW.disps=sim.demand.kW.disps
    sim.supply.kW.rotors.one=sim.demand.kW.rotors.one
    sim.supply.kW.rotors.two=sim.demand.kW.rotors.two
    sim.supply.kW.rotors.three=sim.demand.kW.rotors.three
    sim.supply.kW.rotors.four=sim.demand.kW.rotors.four
    sim.supply.kW.props.one=sim.demand.kW.props.one
    sim.supply.kW.props.two=sim.demand.kW.props.two
    sim.supply.kW.splitter=sim.demand.kW.splitter
    sim.supply.kW.H2OAcc=sim.demand.kW.H2OAcc
    sim.supply.kW.CH4Acc=sim.demand.kW.CH4Acc
    sim.supply.kW.btry=sim.demand.kW.btry
  elseif totalPowerDemand <= (genPower + btryPower) then
    sim.supply.kW.disps= sim.demand.kW.disps
    sim.supply.kW.rotors.one=sim.demand.kW.rotors.one
    sim.supply.kW.rotors.two=sim.demand.kW.rotors.two
    sim.supply.kW.rotors.three=sim.demand.kW.rotors.three
    sim.supply.kW.rotors.four=sim.demand.kW.rotors.four
    sim.supply.kW.props.one=sim.demand.kW.props.one
    sim.supply.kW.props.two=sim.demand.kW.props.two
    sim.supply.kW.splitter=sim.demand.kW.splitter
    sim.supply.kW.H2OAcc=sim.demand.kW.H2OAcc
    sim.supply.kW.CH4Acc=sim.demand.kW.CH4Acc
    sim.supply.kW.btry=sim.demand.kW.btry

    btryUse=totalPowerDemand - genPower
    sim.availableForStorage.kW=sim.availableForStorage.kW - btryUse
  else
    dispsPercent=sim.demand.kW.disps / totalPowerDemand
    rotorsOnePercent=sim.demand.kW.rotors.one / totalPowerDemand
    rotorsTwoPercent=sim.demand.kW.rotors.two / totalPowerDemand
    rotorsThreePercent=sim.demand.kW.rotors.three / totalPowerDemand
    rotorsFourPercent=sim.demand.kW.rotors.four / totalPowerDemand
    propsOnePercent=sim.demand.kW.props.one / totalPowerDemand
    propsTwoPercent=sim.demand.kW.props.two / totalPowerDemand
    splitterPercent=sim.demand.kW.splitter / totalPowerDemand
    H2OAccPercent=sim.demand.kW.H2OAcc / totalPowerDemand
    CH4AccPercent=sim.demand.kW.CH4Acc / totalPowerDemand
    btryPercent=sim.demand.kW.btry / totalPowerDemand

    totalPowerAvailable=genPower + btryPower

    sim.supply.kW.disps=dispsPercent * totalPowerAvailable
    sim.supply.kW.rotors.one=rotorsOnePercent * totalPowerAvailable
    sim.supply.kW.rotors.two=rotorsTwoPercent * totalPowerAvailable
    sim.supply.kW.rotors.three=rotorsThreePercent * totalPowerAvailable
    sim.supply.kW.rotors.four=rotorsFourPercent * totalPowerAvailable
    sim.supply.kW.props.one=propsOnePercent * totalPowerAvailable
    sim.supply.kW.props.two=propsTwoPercent * totalPowerAvailable
    sim.supply.kW.splitter=splitterPercent * totalPowerAvailable
    sim.supply.kW.H2OAcc=H2OAccPercent * totalPowerAvailable
    sim.supply.kW.CH4Acc=CH4AccPercent * totalPowerAvailable
    sim.supply.kW.btry=btryPercent * totalPowerAvailable

    sim.availableForStorage.kW=sim.availableForStorage.kW - btryPower
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
  speedAdjustment=clamp(nroot(6.6, s.speed) - 1, 0.2, 1.2)
  intakeAdjustment=altAdjustment * speedAdjustment

  s.com.disps.active=(sim.supply.kW.disps >= sim.demand.kW.disps)

  if sim.supply.kW.splitter > 0 then
    powerPercent=sim.supply.kW.splitter / SPLITTER_POWER_DEMAND_KW
    h2oPercent=sim.supply.H2O.splitter / SPLITTER_MAX_H2O
    productionPercent=math.min(powerPercent, h2oPercent)
    if powerPercent < h2oPercent then
      sim.supply.H2O.splitter=productionPercent * sim.demand.H2O.splitter
    elseif h2oPercent < powerPercent then
      sim.supply.kW.splitter=productionPercent * sim.demand.kW.splitter
    end
    sim.supply.H_M.tank=productionPercent * SPLITTER_PER_TIC_H
    sim.supply.O.tank=productionPercent * SPLITTER_PER_TIC_O
  end

  if sim.supply.kW.H2OAcc > 0 then
    sim.supply.H2O.tank=(sim.supply.kW.H2OAcc / H2O_ACC_POWER_DEMAND_KW) *
        H2O_ACC_PER_TIC * s.env.H2O * intakeAdjustment
  end

  if sim.supply.kW.CH4Acc > 0 then
    sim.supply.CH4.tank=(sim.supply.kW.CH4Acc / CH4_ACC_POWER_DEMAND_KW) *
        CH4_ACC_PER_TIC * s.env.CH4 * intakeAdjustment
  end

  if sim.supply.kW.btry > 0 then
    sim.availableForStorage.kW=sim.availableForStorage.kW +
        sim.supply.kW.btry
  end

  return sim
end

function drainTanks(sim)
  s.com.clls.one.level=s.com.clls.one.level - math.max(
      math.max(0.01, 1 - s.com.clls.one.st) * BLADDER_MAX_VENT_M3F,
      s.com.clls.one.vent)
  s.com.clls.two.level=s.com.clls.two.level - math.max(
      math.max(0.01, 1 - s.com.clls.two.st) * BLADDER_MAX_VENT_M3F,
      s.com.clls.one.vent)
  s.com.clls.three.level=s.com.clls.three.level - math.max(
      math.max(0.01, 1 - s.com.clls.three.st) * BLADDER_MAX_VENT_M3F,
      s.com.clls.one.vent)
  s.com.clls.four.level=s.com.clls.four.level - math.max(
      math.max(0.01, 1 - s.com.clls.four.st) * BLADDER_MAX_VENT_M3F,
      s.com.clls.one.vent)

  s.com.tanks.H.level=s.com.tanks.H.level -
      sim.supply.H_V.clls.one / H_MASS_TO_VOLUME -
      sim.supply.H_V.clls.two / H_MASS_TO_VOLUME -
      sim.supply.H_V.clls.three / H_MASS_TO_VOLUME -
      sim.supply.H_V.clls.four / H_MASS_TO_VOLUME
  s.com.tanks.O.level=s.com.tanks.O.level - sim.supply.O.bilr
  s.com.tanks.H2O.level=s.com.tanks.H2O.level - sim.supply.H2O.bilr -
      sim.supply.H2O.splitter
  s.com.tanks.CH4.level=s.com.tanks.CH4.level - sim.supply.CH4.bilr

  s.com.hyd.res.level=s.com.hyd.res.level -
      sim.supply.kNSM.rotors.one - sim.supply.kNSM.rotors.two -
      sim.supply.kNSM.rotors.three - sim.supply.kNSM.rotors.four -
      sim.supply.kNSM.props.one - sim.supply.kNSM.props.two
end

function fillTanks(sim)
  s.com.clls.one.level=math.min(BLADDER_MAX_M3,
      s.com.clls.one.level + sim.supply.H_V.clls.one)
  s.com.clls.two.level=math.min(BLADDER_MAX_M3,
      s.com.clls.two.level + sim.supply.H_V.clls.two)
  s.com.clls.three.level=math.min(BLADDER_MAX_M3,
      s.com.clls.three.level + sim.supply.H_V.clls.three)
  s.com.clls.four.level=math.min(BLADDER_MAX_M3,
      s.com.clls.four.level + sim.supply.H_V.clls.four)

  s.com.tanks.H.level=math.min(H_TANK_MAX_KG,
      s.com.tanks.H.level + sim.supply.H_M.tank)
  s.com.tanks.O.level=math.min(O_TANK_MAX_KG,
      s.com.tanks.O.level + sim.supply.O.tank)
  s.com.tanks.H2O.level=math.min(H2O_TANK_MAX_KG,
      s.com.tanks.H2O.level + sim.supply.H2O.tank)
  s.com.tanks.CH4.level=math.min(CH4_TANK_MAX_KG,
      s.com.tanks.CH4.level + sim.supply.CH4.tank)

  s.com.hyd.res.level=math.min(HYDRAULIC_MAX_KNSM,
      s.com.hyd.res.level + sim.supply.kNSM.hydRes)

  s.com.btry.level=math.min(BATTERY_MAX_CHARGE_KW,
      s.com.btry.level + sim.availableForStorage.kW)
end

function applyThrust(sim)
  s.com.rotors.one.thrust=sim.supply.kW.rotors.one /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN
  s.com.rotors.two.thrust=sim.supply.kW.rotors.two /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN
  s.com.rotors.three.thrust=sim.supply.kW.rotors.three /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN
  s.com.rotors.four.thrust=sim.supply.kW.rotors.four /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN

  s.com.props.one.thrust=sim.supply.kW.props.one /
      PROP_MAX_POWER_DEMAND_KW * PROP_MAX_THRUST_KN
  s.com.props.two.thrust=sim.supply.kW.props.two /
      PROP_MAX_POWER_DEMAND_KW * PROP_MAX_THRUST_KN
end

function applyForces(sim)
  altAdjustment=clamp01(5000 / (s.pos.z + 5000))
  thrustAdjustment=lerp(0.2, 1, altAdjustment)
  s.env.Atmo=altAdjustment * SEA_LEVEL_AIR_DENSITY

  rotor1Xcomp=math.cos(math.rad(90 - s.com.rotors.one.rot)) *
      thrustAdjustment
  rotor1Ycomp=math.sin(math.rad(90 - s.com.rotors.one.rot)) *
      thrustAdjustment
  rotor2Xcomp=math.cos(math.rad(90 - s.com.rotors.two.rot)) *
      thrustAdjustment
  rotor2Ycomp=math.sin(math.rad(90 - s.com.rotors.two.rot)) *
      thrustAdjustment
  rotor3Xcomp=math.cos(math.rad(90 - s.com.rotors.three.rot)) *
      thrustAdjustment
  rotor3Ycomp=math.sin(math.rad(90 - s.com.rotors.three.rot)) *
      thrustAdjustment
  rotor4Xcomp=math.cos(math.rad(90 - s.com.rotors.four.rot)) *
      thrustAdjustment
  rotor4Ycomp=math.sin(math.rad(90 - s.com.rotors.four.rot)) *
      thrustAdjustment

  totalHydrogenVolume=s.com.clls.one.level +
      s.com.clls.two.level + s.com.clls.three.level +
      s.com.clls.four.level
  totalHydrogenWeight=totalHydrogenVolume * HYDROGEN_DENSITY
  totalAirWeight=totalHydrogenVolume * SEA_LEVEL_AIR_DENSITY

  totalShipWeightKG=SHIP_DRY_WEIGHT_KG + totalHydrogenWeight +
      s.com.tanks.H.level + s.com.tanks.O.level +
      s.com.tanks.H2O.level + s.com.tanks.CH4.level
  totalShipWeightKN=(totalShipWeightKG * KG_TO_N) * 0.001

  s.heading=(s.com.props.one.rot + s.com.props.two.rot) / 2
  drag=DRAG_COEFFICENT * FRONT_DRAG_AREA * 0.5 * s.env.Atmo *
      (s.speed * s.speed)
  s.accl=(s.com.props.one.thrust * thrustAdjustment +
                  s.com.props.two.thrust * thrustAdjustment +
                  s.com.rotors.one.thrust * rotor1Xcomp +
                  s.com.rotors.two.thrust * rotor2Xcomp +
                  s.com.rotors.three.thrust * rotor3Xcomp +
                  s.com.rotors.four.thrust * rotor4Xcomp - drag) /
      totalShipWeightKN
  -- TODO Remove fudge? Acceleration bump, direction rotation.
  s.speed=s.speed + 0.5 * (s.accl * 10 * 0.00027777777)
  changeX=s.speed * math.sin(math.rad(s.heading))
  changeY=-s.speed * math.cos(math.rad(s.heading))
  s.pos.x=s.pos.x + changeX
  s.pos.y=s.pos.y + changeY

  totalHydrogenLiftForce=(totalAirWeight - totalHydrogenWeight) * KG_TO_N *
      HYDROGEN_LIFT_ADJUST
  totalWingLiftForce=(s.speed * WING_LIFT) * altAdjustment

  s.rot=(s.com.rotors.one.rot + s.com.rotors.two.rot +
                   s.com.rotors.three.rot +
                   s.com.rotors.four.rot) / 4
  vertDrag=DRAG_COEFFICENT * BOTTOM_DRAG_AREA * 0.5 * s.env.Atmo *
      (s.vsi * s.vsi)
  vForce=((s.com.rotors.one.thrust * rotor1Ycomp +
             s.com.rotors.two.thrust * rotor2Ycomp +
             s.com.rotors.three.thrust * rotor3Ycomp +
             s.com.rotors.four.thrust * rotor4Ycomp) +
      totalHydrogenLiftForce + totalWingLiftForce) / totalShipWeightKN
  if s.vsi > 0 then
    vForce=vForce - vertDrag
  elseif s.vsi < 0 then
    vForce=vForce + vertDrag
  end

  s.vsi=s.vsi + 0.5 * ((vForce - totalShipWeightKN - vertDrag) * 0.00027777777)
  s.pos.z=s.pos.z + s.vsi

  -- Auto controls
  if s.vsi < s.set_vsi then
    s.con.thrt.rotors=math.min(s.con.thrt.rotors + 0.1, 1)
  elseif s.vsi > s.set_vsi then
    s.con.thrt.rotors=math.max(s.con.thrt.rotors - 0.1, 0.0)
  end

  if s.pos.z + 40 > s.con.alt and s.vsi > -0.2 then
    altDiff=math.min((s.pos.z+40-s.con.alt)/100,4)
    s.com.clls.one.vent=altDiff
    s.com.clls.two.vent=altDiff
    s.com.clls.three.vent=altDiff
    s.com.clls.four.vent=altDiff
  else
    s.com.clls.one.vent = 0
    s.com.clls.two.vent = 0
    s.com.clls.three.vent = 0
    s.com.clls.four.vent = 0
  end

  if s.pos.z + 10 < s.con.alt and s.con.vsi > 0 then
    s.set_vsi=s.con.vsi
  elseif s.pos.z - 10 > s.con.alt and s.con.vsi < 0 then
    s.set_vsi=s.con.vsi
  else
    s.set_vsi=0.0
  end

  if s.pos.z < 0 then
    s.pos.z=0
    s.speed=0
  end

  tile=getShipTile()
  s.env.H2O=tile.H2O
  s.env.CH4=tile.CH4
end


function calcHydDemand(currentAngle, desiredAngle, st, maxSpeed, maxDemand)
  if currentAngle==desiredAngle then return 0 end
  rotorAngleChange=math.abs(desiredAngle - currentAngle)
  rotorAngleChange=math.min(rotorAngleChange, maxSpeed * st)
  return (rotorAngleChange / maxSpeed) * maxDemand
end

function rotateThruster(sim, type, thruster, maxDemand, maxSpeed)
  if math.abs(s.con.rot[type] - s.com[type][thruster].rot) < 0.0001 then
    s.com[type][thruster].rot=s.con.rot[type]
  else
    hydAvailable=sim.supply.kNSM[type][thruster] / maxDemand
    availableAngle=hydAvailable * maxSpeed
    desiredAngle=s.con.rot[type] - s.com[type][thruster].rot
    moveAngle=math.min(availableAngle, math.abs(desiredAngle))
    if desiredAngle < 0 then
      s.com[type][thruster].rot=s.com[type][thruster].rot - moveAngle
    else
      s.com[type][thruster].rot=s.com[type][thruster].rot + moveAngle
    end
  end

  return sim
end

function rotateRotor(sim, rotor)
  return rotateThruster(sim, 'rotors', rotor, ROTOR_MAX_HYDRAULIC_DEMAND_KNSM,
                        ROTOR_MAX_ROTATE_SPEED_D)
end

function rotateProp(sim, prop)
  return rotateThruster(sim, 'props', prop, PROP_MAX_HYDRAULIC_DEMAND_KNSM,
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
  return a + (b - a) * t
end

function inverseLerp(a, b, v)
  return (v - a) / (b - a)
end

function sqrDistance(ptA, ptB)
  x=ptA.x-ptB.x
  y=ptA.y-ptB.y
  return x*x+y*y
end

function distance(ptA, ptB)
  return math.sqrt(sqrDistance(ptA,ptB))
end

function rotateV2(vec, angle)
  r=math.rad(angle)
  aSin=math.sin(r)
  aCos=math.cos(r)

  return {
    x=vec.x * aCos - vec.y * aSin,
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
