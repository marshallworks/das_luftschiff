-- Game Configuration
-- Constants
KG_TO_N = 9.81
H_MASS_TO_VOLUME = 11.988
DRAG_COEFFICENT = 0.26
FRONT_DRAG_AREA = 28
BOTTOM_DRAG_AREA = 64
GRAVITY = 9.8
SEA_LEVEL_AIR_DENSITY = 1.225
HYDROGEN_DENSITY = 0.08988
WING_LIFT = 128

HYDROGEN_LIFT_ADJUST = 5.95

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
SHIP_MAX_SPEED = 300
SHIP_MAX_ALT = 6000
SHIP_DRY_WEIGHT_KG = 120000

DISPLAYS_POWER_DEMAND_KW = 0.017

SPLITTER_POWER_DEMAND_KW = 0.05
SPLITTER_MAX_H2O = 2.4
SPLITTER_PER_TIC_H = 0.266
SPLITTER_PER_TIC_O = 2.128

ROTOR_MAX_THRUST_KN = 70000
ROTOR_MAX_POWER_DEMAND_KW = 46.4
ROTOR_MAX_ROTATE_SPEED_D = 0.04
ROTOR_MAX_HYDRAULIC_DEMAND_KNSM = 6.4

PROP_MAX_THRUST_KN = 47600
PROP_MAX_POWER_DEMAND_KW = 18.5
PROP_MAX_ROTATE_SPEED_D = 0.06
PROP_MAX_HYDRAULIC_DEMAND_KNSM = 5.2

GEN_MAX_KW = 225
GEN_MAX_NM = 516
TURBINE_MAX_NM = 560
TURBINE_MAX_STEAM_KNSM = 160
BOILER_MAX_STEAM_KNSM = 172
BOILER_MAX_REG_STEAM_KNSM = 104
BOILER_H2O_KG_PER_KNSM = 0.0008
BOILER_CH4_KG_PER_KNSM = 0.0197
BOILER_O_KG_PER_KNSM = 0.0152

BATTERY_MAX_CHARGE_KW = 350
BATTERY_MAX_CHARGE_RATE_KW = 0.022

HYDRAULIC_MAX_KNSM = 32
HYDRAULIC_PUMP_MAX_NM = 16
HYDRAULIC_PUMP_NM_PER_KNSM = 2

BLADDER_MAX_M3 = 12000
H_TANK_MAX_KG = 220
O_TANK_MAX_KG = 2800
H2O_TANK_MAX_KG = 4200
CH4_TANK_MAX_KG = 51000

BLADDER_MAX_VENT_M3F = 7
BLADDER_MAX_M3F = 3.2
H_TANK_MAX_KGF = 0.3
O_TANK_MAX_KGF = 2.3
H2O_TANK_MAX_KGF = 2.6
CH4_TANK_MAX_KGF = 8.274

H2O_ACC_POWER_DEMAND_KW = 0.067
CH4_ACC_POWER_DEMAND_KW = 0.117
H2O_ACC_PER_TIC = 12
CH4_ACC_PER_TIC = 20

-- Game State
p = {
  x = 248,
  y = 48,
  vx = 0,
  vy = 0,
  mapX = 0,
  mapY = 0,
  mapOffsetX = 0,
  mapOffsetY = 0
}

ship = {
  speed = 20,
  acceleration = 0,
  heading = 0,
  rotation = 0,
  vsi = 0,
  set_vsi = 0,
  pos = {
    x = 0,
    y = 0,
    z = 1000
  },
  con = {
    alt = 1000,
    vsi = 0.0,
    throttle = {
      props = 0.1,
      rotors = 0.7
    },
    rotation = {
      props = 0,
      rotors = 0
    }
  },
  env = {
    Atmo = SEA_LEVEL_AIR_DENSITY,
    H2O = 0.4,
    CH4 = 0.4
  },
  com = {
    displays = {
      status = 1.0,
      active = true
    },
    engine = {
      boiler = {
        status = 1.0,
        bb = {
          min_x = 72,
          min_y = 72,
          max_x = 87,
          max_y = 87
        }
      },
      turbine = {
        status = 1.0,
        bb = {
          min_x = 48,
          min_y = 72,
          max_x = 63,
          max_y = 87
        }
      },
    },
    hydraulics = {
      reservoir = {
        status = 1.0,
        level = HYDRAULIC_MAX_KNSM
      },
      pump = {
        status = 1.0
      }
    },
    generator = {
      status = 1.0
    },
    rotors = {
      one = {
        status = 1.0,
        rotation = 0,
        thrust = 0
      },
      two = {
        status = 1.0,
        rotation = 0,
        thrust = 0
      },
      three = {
        status = 1.0,
        rotation = 0,
        thrust = 0
      },
      four = {
        status = 1.0,
        rotation = 0,
        thrust = 0
      }
    },
    props = {
      one = {
        status = 1.0,
        rotation = 0,
        thrust = 0
      },
      two = {
        status = 1.0,
        rotation = 0,
        thrust = 0
      }
    },
    acc = {
      H2O = {
        status = 1.0
      },
      CH4 = {
        status = 1.0
      },
    },
    bladders = {
      one = {
        status = 1.0,
        level = BLADDER_MAX_M3
      },
      two = {
        status = 1.0,
        level = BLADDER_MAX_M3
      },
      three = {
        status = 1.0,
        level = BLADDER_MAX_M3
      },
      four = {
        status = 1.0,
        level = BLADDER_MAX_M3
      }
    },
    battery = {
      status = 1.0,
      level = BATTERY_MAX_CHARGE_KW
    },
    splitter = {
      status = 1.0
    },
    tanks = {
      H = {
        status = 1.0,
        level = H_TANK_MAX_KG
      },
      O = {
        status = 1.0,
        level = O_TANK_MAX_KG
      },
      H2O = {
        status = 1.0,
        level = H2O_TANK_MAX_KG
      },
      CH4 = {
        status = 1.0,
        level = CH4_TANK_MAX_KG
      }
    },
  }
}

start = {
  t= 0,
  x= 60,
  y= 42
}

gauges = {
  needles = {
    vsi = {
      x = 101,
      y = 79,
      c = 6
    },
    heading = {
      x = 175,
      y = 79,
      c = 6
    },
    rotation = {
      x = 76,
      y = 74,
      c = 6
    },
    con_vsi = {
      x = 101,
      y = 80,
      c = 8
    },
    con_heading = {
      x = 176,
      y = 80,
      c = 8
    },
    con_rotation = {
      x = 77,
      y = 75,
      c = 8
    },
    props = {
      one = {
        x = 161,
        y = 113,
        c = 6
      },
      two = {
        x = 185,
        y = 113,
        c = 6
      }
    },
    rotors = {
      one = {
        x = 69,
        y = 110,
        c = 6
      },
      two = {
        x = 93,
        y = 110,
        c = 6
      },
      three = {
        x = 117,
        y = 110,
        c = 6
      },
      four = {
        x = 141,
        y = 110,
        c = 6
      }
    }
  },
  levels = {
    con_alt = {
      x = 114,
      y = 68,
      w = 4,
      h = 24,
      c = 8
    },
    con_throttle = {
      x = 138,
      y = 68,
      w = 4,
      h = 24,
      c = 8
    }
  },
  bars = {
    alt = {
      x = 114,
      y = 68,
      w = 4,
      h = 24,
      c = 6
    },
    speed = {
      x = 138,
      y = 68,
      w = 4,
      h = 24,
      c = 6
    },
    props = {
      one = {
        x = 153,
        y = 108,
        w = 2,
        h = 11,
        c = 6
      },
      two = {
        x = 177,
        y = 108,
        w = 2,
        h = 11,
        c = 6
      }
    },
    rotors = {
      one = {
        x = 57,
        y = 108,
        w = 2,
        h = 11,
        c = 6
      },
      two = {
        x = 81,
        y = 108,
        w = 2,
        h = 11,
        c = 6
      },
      three = {
        x = 105,
        y = 108,
        w = 2,
        h = 11,
        c = 6
      },
      four = {
        x = 129,
        y = 108,
        w = 2,
        h = 11,
        c = 6
      }
    },
    bladders = {
      one = {
        x = 202,
        y = 108,
        w = 4,
        h = 16,
        c = 6
      },
      two = {
        x = 210,
        y = 108,
        w = 4,
        h = 16,
        c = 6
      },
      three = {
        x = 218,
        y = 108,
        w = 4,
        h = 16,
        c = 6
      },
      four = {
        x = 226,
        y = 108,
        w = 4,
        h = 16,
        c = 6
      }
    },
    tanks = {
      H2O = {
        x = 202,
        y = 68,
        w = 4,
        h = 24,
        c = 6
      },
      CH4 = {
        x = 218,
        y = 68,
        w = 4,
        h = 24,
        c = 6
      }
    }
  }
}

startScreen = true
showControls = false

debugType = 0
controlType = 0

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

    if btnp(6) then
      showControls = not showControls
    end

    if showControls then
      if btnp(2) then controlType = controlType - 1 end
      if btnp(3) then controlType = controlType + 1 end

      if controlType < 0 then controlType = 4 end
      if controlType > 4 then controlType = 0 end

      if controlType == 0 then
        if btn(0) then ship.con.rotation.rotors = ship.con.rotation.rotors + 1 end
        if btn(1) then ship.con.rotation.rotors = ship.con.rotation.rotors - 1 end
        if ship.con.rotation.rotors < 0 then ship.con.rotation.rotors = 0 end
        if ship.con.rotation.rotors > 90 then ship.con.rotation.rotors = 90 end
      elseif controlType == 1 then
        if btn(0) then ship.con.vsi = ship.con.vsi + 0.02 end
        if btn(1) then ship.con.vsi = ship.con.vsi - 0.02 end
        if ship.con.vsi < -1.2 then ship.con.vsi = -1.2 end
        if ship.con.vsi > 1.2 then ship.con.vsi = 1.2 end
      elseif controlType == 2 then
        if btn(0) then ship.con.alt = ship.con.alt + 10 end
        if btn(1) then ship.con.alt = ship.con.alt - 10 end
        if ship.con.alt < 0 then ship.con.alt = 0 end
        if ship.con.alt > SHIP_MAX_ALT then ship.con.alt = SHIP_MAX_ALT end
      elseif controlType == 3 then
        if btn(0) then ship.con.throttle.props = ship.con.throttle.props + 0.01 end
        if btn(1) then ship.con.throttle.props = ship.con.throttle.props - 0.01 end
        if ship.con.throttle.props < 0.0 then ship.con.throttle.props = 0.0 end
        if ship.con.throttle.props > 1.0 then ship.con.throttle.props = 1.0 end
      elseif controlType == 4 then
        if btn(0) then ship.con.rotation.props = ship.con.rotation.props - 1 end
        if btn(1) then ship.con.rotation.props = ship.con.rotation.props + 1 end
        if ship.con.rotation.props < 0 then ship.con.rotation.props = 360 end
        if ship.con.rotation.props > 360 then ship.con.rotation.props = ship.con.rotation.props - 360 end
      end
    else
      onFloor = false
      inCeiling = false
      onLadder = false
      testX = (p.x + 4) // 8
      testYD = (p.y + 16) // 8
      testYU = (p.y) // 8
      if mget(testX, testYD) == 16 then onFloor = true end
      if mget(testX, testYU) == 16 then inCeiling = true end
      if mget(testX, testYD - 1) == 32 then onLadder = true end

      if btn(0) and onLadder then
        p.vy = math.max(p.vy - 0.1, -1.5)
      elseif btn(1) and onLadder then
        p.vy = math.max(p.vy + 0.1, 1.5)
      elseif onLadder then
        p.vy = 0.0
      elseif p.vy == 0 and onFloor then
        p.y = testYD * 8 - 16
        p.vy = math.min(p.vy, 0.0)
      elseif not onFloor then
        p.vy = math.min(p.vy + 0.1, 2.0)
      else
        p.vy = 0.0
      end

      if inCeiling and p.vy < 0 then
        p.vy = -p.vy
      end

      if btn(2) then
        p.vx = math.max(p.vx - 0.1, -2.0)
      elseif btn(3) then
        p.vx = math.min(p.vx + 0.1, 2.0)
      else
        p.vx= 0.0
      end

      p.x=p.x+p.vx
      p.y=p.y+p.vy

      if p.y > 92 then
        if p.x < 40 then p.x = 40 end
        if p.x > 408 then p.x = 408 end
      elseif p.y > 60 then
        if p.x < 24 then p.x = 24 end
        if p.x > 432 then p.x = 432 end
      else
        if p.x < 24 then p.x = 24 end
        if p.x > 448 then p.x = 448 end
      end

      p.mapX = (p.x + 0.5) / 8 - 15
      p.mapY = 0 -- (p.y + 0.5) / 8 - 8
      p.mapOffsetX = p.mapX * 8
      p.mapOffsetY = p.mapY * 8

      -- if mget((p.x+4 - infoW)//8 + cStart,(p.y+16)//8) == 16 then
      --   p.vy=math.min(0,p.vy)
      -- else
      --   p.vy=p.vy+0.1
      -- end


      -- if p.x > 240 then
      --   cStart=24
      --   p.x = infoW + 4
      -- elseif p.x < infoW - 4 then
      --   cStart=0
      --   p.x=239
      -- end
    end

    if btnp(7) then
      debugType = (debugType > 3) and 0 or debugType + 1
    end

    cls(0)
    simulate()

    if debugType == 0 then
      drawGame()
    elseif debugType == 1 then
      drawShipDebugOne(ship)
    elseif debugType == 2 then
      drawShipDebugTwo(ship)
    end
  end

end


function drawGame()
  if showControls then
    map(p.mapX, 3, 30, 6, 0, 0)
    spr(257, p.x - p.mapOffsetX, p.y - 3 * 8, 0, 1, 0, 0, 1, 2)
  else
    map(p.mapX, p.mapY, 30, 17, 0, 0)
    spr(257, p.x - p.mapOffsetX, p.y - p.mapOffsetY, 0, 1, 0, 0, 1, 2)
  end

  if showControls then
    map(0, 125, 30, 11, 0, 48)

    print("DLS Radar", 8, 57, 5, false, 1, true)
    print("RTR", 62, 57, 5, false, 1, true)
    print("Angle", 58, 65, 5, false, 1, true)
    print("VS", 94, 57, 5, false, 1, true)
    print("Alt", 111, 57, 5, false, 1, true)
    print("Spd", 135, 57, 5, false, 1, true)
    print("Heading", 163, 57, 5, false, 1, true)
    print("H2O", 199, 57, 5, false, 1, true)
    print("CH4", 215, 57, 5, false, 1, true)

    drawNeedleLevelStatus(gauges.needles.vsi, ship.vsi, -1.2, 1.2, 0, 180, 8)
    drawNeedleLevelStatus(gauges.needles.con_vsi, ship.con.vsi, -1.2, 1.2, 0, 180, 10)

    drawNeedleAngeStatus(gauges.needles.heading, ship.heading, { x = 0, y = -8 })
    drawNeedleAngeStatus(gauges.needles.rotation, ship.rotation, { x = 0, y = 15 })
    drawNeedleAngeStatus(gauges.needles.con_heading, ship.con.rotation.props,
                     { x = 0, y = -10 })
    drawNeedleAngeStatus(gauges.needles.con_rotation, ship.con.rotation.rotors,
                     { x = 0, y = 17 })

    drawBarStatus(gauges.bars.alt, ship.pos.z, SHIP_MAX_ALT)
    drawBarStatus(gauges.bars.speed, ship.speed, SHIP_MAX_SPEED)

    drawBarStatus(gauges.bars.tanks.H2O, ship.com.tanks.H2O.level, H2O_TANK_MAX_KG)
    drawBarStatus(gauges.bars.tanks.CH4, ship.com.tanks.CH4.level, CH4_TANK_MAX_KG)

    altY = lerp(91, 67, inverseLerp(0, SHIP_MAX_ALT, ship.pos.z)) - 2.5
    spdY = lerp(91, 67, inverseLerp(0, SHIP_MAX_SPEED, ship.speed)) - 2.5
    print(string.sub(string.format("%f", ship.pos.z/1000.0), 1, -6).."k", 120, altY, 6, false, 1, true)
    if ship.speed < 100 then
      print(string.sub(string.format("%f", ship.speed), 1, -6), 144, spdY, 6, false, 1, true)
    else
      print(string.format("%d", ship.speed//1), 144, spdY, 6, false, 1, true)
    end

    drawLevelStatus(gauges.levels.con_alt, ship.con.alt, SHIP_MAX_ALT)
    drawLevelStatus(gauges.levels.con_throttle, ship.con.throttle.props, 1.0)

    print("PRP1", 152, 100, 5, false, 1, true)
    print("PRP2", 176, 100, 5, false, 1, true)

    drawPropRotationStatus(gauges.needles.props.one,
                           ship.com.props.one.rotation)
    drawPropRotationStatus(gauges.needles.props.two,
                           ship.com.props.two.rotation)

    drawPropThrustStatus(gauges.bars.props.one, ship.com.props.one.thrust)
    drawPropThrustStatus(gauges.bars.props.two, ship.com.props.two.thrust)

    print("RTR1", 56, 100, 5, false, 1, true)
    print("RTR2", 80, 100, 5, false, 1, true)
    print("RTR3", 104, 100, 5, false, 1, true)
    print("RTR4", 128, 100, 5, false, 1, true)

    drawRotorRotationStatus(gauges.needles.rotors.one,
                            ship.com.rotors.one.rotation)
    drawRotorRotationStatus(gauges.needles.rotors.two,
                            ship.com.rotors.two.rotation)
    drawRotorRotationStatus(gauges.needles.rotors.three,
                            ship.com.rotors.three.rotation)
    drawRotorRotationStatus(gauges.needles.rotors.four,
                            ship.com.rotors.four.rotation)

    drawRotorThrustStatus(gauges.bars.rotors.one, ship.com.rotors.one.thrust)
    drawRotorThrustStatus(gauges.bars.rotors.two, ship.com.rotors.two.thrust)
    drawRotorThrustStatus(gauges.bars.rotors.three, ship.com.rotors.three.thrust)
    drawRotorThrustStatus(gauges.bars.rotors.four, ship.com.rotors.four.thrust)

    print("Hyd Cells", 200, 100, 5, false, 1, true)

    drawBarStatus(gauges.bars.bladders.one, ship.com.bladders.one.level, BLADDER_MAX_M3)
    drawBarStatus(gauges.bars.bladders.two, ship.com.bladders.two.level, BLADDER_MAX_M3)
    drawBarStatus(gauges.bars.bladders.three, ship.com.bladders.three.level, BLADDER_MAX_M3)
    drawBarStatus(gauges.bars.bladders.four, ship.com.bladders.four.level, BLADDER_MAX_M3)

    if controlType == 0 then
      rectb(55, 63, 26, 34, 14)
    elseif controlType == 1 then
      rectb(87, 63, 18, 34, 14)
    elseif controlType == 2 then
      rectb(111, 63, 24, 34, 14)
    elseif controlType == 3 then
      rectb(135, 63, 24, 34, 14)
    elseif controlType == 4 then
      rectb(159, 63, 34, 34, 14)
    end
  else
    print(string.format("%f:%f", p.x + 4, p.y + 8), 2, 2, 6, false, 1, true)

    testPos = { x = p.x + 4, y = p.y + 8}
    if contains(ship.com.engine.boiler.bb, testPos) then
      print("Boiler", 2, 12, 6, false, 1, true)
    elseif contains(ship.com.engine.turbine.bb, testPos) then
      print("Turbine", 2, 12, 6, false, 1, true)
    end
  end
end

function drawNeedleAngeStatus(needle, angle, vec)
  target = rotateV2(vec, angle)
  line(needle.x, needle.y, needle.x + target.x, needle.y + target.y, needle.c)
end

function drawNeedleLevelStatus(needle, value, min_value, max_value,
                               min_angle, max_angle, length)
  vec = { x = 0, y = length }
  normal = inverseLerp(min_value, max_value, value)
  angle = clamp(lerp(min_angle, max_angle, normal), min_angle,max_angle)
  drawNeedleAngeStatus(needle, angle, vec)
end

function drawPropRotationStatus(needle, angle)
  drawNeedleAngeStatus(needle, angle, { x = 0, y = -5})
end

function drawRotorRotationStatus(needle, angle)
  drawNeedleAngeStatus(needle, angle, { x = 0, y = 7})
end

function drawLevelStatus(level, value, max)
  baseY = level.y + level.h
  normal = inverseLerp(0, max, value)
  levelHeight = (lerp(0, level.h, normal) + 1.5)//1
  levelY = baseY - levelHeight
  line(level.x, levelY, level.x + level.w - 1, levelY, level.c)
end

function drawBarStatus(bar, value, max)
  baseY = bar.y + bar.h
  normal = inverseLerp(0, max, value)
  barHeight = (lerp(0, bar.h, normal) + 0.5)//1
  barY = baseY - barHeight
  rect(bar.x, barY, bar.w, barHeight, bar.c)
end

function drawPropThrustStatus(bar, thrust)
  drawBarStatus(bar, thrust, PROP_MAX_THRUST_KN)
end

function drawRotorThrustStatus(bar, thrust)
  drawBarStatus(bar, thrust, ROTOR_MAX_THRUST_KN)
end

function simulate()
  sim = {
    demand = {
      kW = {
        displays = 0,
        rotors = {
          one = 0,
          two = 0,
          three = 0,
          four = 0
        },
        props = {
          one = 0,
          two = 0
        },
        splitter = 0,
        H2OAcc = 0,
        CH4Acc = 0,
        battery = 0
      },
      kNSM = {
        hydraulicReservoir = 0,
        rotors = {
          one = 0,
          two = 0,
          three = 0,
          four = 0
        },
        props = {
          one = 0,
          two = 0
        }
      },
      NM = {
        hydraulicPump = 0,
        generator = 0
      },
      H2O = {
        tank = 0,
        boiler = 0,
        splitter = 0
      },
      CH4 = {
        tank = 0,
        boiler = 0
      },
      H_M = {
        tank = 0
      },
      H_V = {
        bladders = {
          one = 0,
          two = 0,
          three = 0,
          four = 0
        }
      },
      O = {
        tank = 0,
        boiler = 0
      },
      steam = 0
    },
    supply = {
      kW = {
        displays = 0,
        rotors = {
          one = 0,
          two = 0,
          three = 0,
          four = 0
        },
        props = {
          one = 0,
          two = 0
        },
        splitter = 0,
        H2OAcc = 0,
        CH4Acc = 0,
        battery = 0
      },
      kNSM = {
        hydraulicReservoir = 0,
        rotors = {
          one = 0,
          two = 0,
          three = 0,
          four = 0
        },
        props = {
          one = 0,
          two = 0
        }
      },
      NM = {
        hydraulicPump = 0,
        generator = 0
      },
      H2O = {
        tank = 0,
        boiler = 0,
        splitter = 0
      },
      CH4 = {
        tank = 0,
        boiler = 0
      },
      H_M = {
        tank = 0
      },
      H_V = {
        bladders = {
          one = 0,
          two = 0,
          three = 0,
          four = 0
        }
      },
      O = {
        tank = 0,
        boiler = 0
      },
      steam = 0
    },
    availableForUse = {
      kW = ship.com.battery.level,
      kNSM = ship.com.hydraulics.reservoir.level,
      H2O = ship.com.tanks.H2O.level,
      CH4 = ship.com.tanks.CH4.level,
      H_M = ship.com.tanks.H.level,
      H_V = ship.com.tanks.H.level * H_MASS_TO_VOLUME,
      O = ship.com.tanks.O.level
    },
    availableForStorage = {
      kW = 0,
      kNSM = 0,
      H2O = 0,
      CH4 = 0,
      H_M = 0,
      H_V = 0,
      O = 0
    }
  }

  sim = controlsPowerDemand(sim)
  sim = controlsHydraulicDemand(sim)
  sim = storageTanksDemand(sim)
  sim = bladderDemand(sim)
  sim = batteryDemand(sim)
  sim = hydraulicReservoirDemand(sim)
  sim = splitterAccDemand(sim)
  sim = hydraulicPumpDemand(sim)
  sim = generatorDemand(sim)
  sim = turbineDemand(sim)
  sim = boilerDemand(sim)

  sim = elementSupply(sim)
  sim = steamSupply(sim)
  sim = torqueSupply(sim)
  sim = hydraulicSupply(sim)
  sim = powerSupply(sim)

  sim = distributeHydraulics(sim)
  sim = distributePower(sim)

  drainTanks(sim)
  fillTanks(sim)
  applyThrust(sim)
  applyForces(sim)

  if debugType == 3 then
    drawSimDebug(sim)
  elseif debugType == 4 then
    drawStorageDebug(sim)
  end
end

function controlsPowerDemand(sim)
  sim.demand.kW.displays = DISPLAYS_POWER_DEMAND_KW

  sim.demand.kW.rotors.one = ROTOR_MAX_POWER_DEMAND_KW *
      ship.com.rotors.one.status * ship.con.throttle.rotors
  sim.demand.kW.rotors.two = ROTOR_MAX_POWER_DEMAND_KW *
      ship.com.rotors.two.status * ship.con.throttle.rotors
  sim.demand.kW.rotors.three = ROTOR_MAX_POWER_DEMAND_KW *
      ship.com.rotors.three.status * ship.con.throttle.rotors
  sim.demand.kW.rotors.four = ROTOR_MAX_POWER_DEMAND_KW *
      ship.com.rotors.four.status * ship.con.throttle.rotors

  sim.demand.kW.props.one = PROP_MAX_POWER_DEMAND_KW *
      ship.com.props.one.status * ship.con.throttle.props
  sim.demand.kW.props.two = PROP_MAX_POWER_DEMAND_KW *
      ship.com.props.two.status * ship.con.throttle.props

  return sim
end

function controlsHydraulicDemand(sim)
  sim.demand.kNSM.rotors.one = calcHydDemand(ship.com.rotors.one.rotation,
                                             ship.con.rotation.rotors,
                                             ship.com.rotors.one.status,
                                             ROTOR_MAX_ROTATE_SPEED_D,
                                             ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.rotors.two = calcHydDemand(ship.com.rotors.two.rotation,
                                             ship.con.rotation.rotors,
                                             ship.com.rotors.two.status,
                                             ROTOR_MAX_ROTATE_SPEED_D,
                                             ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.rotors.three = calcHydDemand(ship.com.rotors.three.rotation,
                                               ship.con.rotation.rotors,
                                               ship.com.rotors.three.status,
                                               ROTOR_MAX_ROTATE_SPEED_D,
                                               ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.rotors.four = calcHydDemand(ship.com.rotors.four.rotation,
                                              ship.con.rotation.rotors,
                                              ship.com.rotors.four.status,
                                              ROTOR_MAX_ROTATE_SPEED_D,
                                              ROTOR_MAX_HYDRAULIC_DEMAND_KNSM)

  sim.demand.kNSM.props.one = calcHydDemand(ship.com.props.one.rotation,
                                            ship.con.rotation.props,
                                            ship.com.props.one.status,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYDRAULIC_DEMAND_KNSM)
  sim.demand.kNSM.props.two = calcHydDemand(ship.com.props.two.rotation,
                                            ship.con.rotation.props,
                                            ship.com.props.two.status,
                                            PROP_MAX_ROTATE_SPEED_D,
                                            PROP_MAX_HYDRAULIC_DEMAND_KNSM)

  return sim
end

function storageTanksDemand(sim)
  sim.demand.H2O.tank = math.min(H2O_TANK_MAX_KG - ship.com.tanks.H2O.level,
                                 H2O_TANK_MAX_KGF)
  sim.demand.CH4.tank = math.min(CH4_TANK_MAX_KG - ship.com.tanks.CH4.level,
                                 CH4_TANK_MAX_KGF)
  sim.demand.H_M.tank = math.min(H_TANK_MAX_KG - ship.com.tanks.H.level,
                                 H_TANK_MAX_KGF)
  sim.demand.O.tank = math.min(O_TANK_MAX_KG - ship.com.tanks.O.level,
                               O_TANK_MAX_KGF)

  return sim
end

function bladderDemand(sim)
  sim.demand.H_V.bladders.one = math.min(
      BLADDER_MAX_M3 - ship.com.bladders.one.level, BLADDER_MAX_M3F)
  sim.demand.H_V.bladders.two = math.min(
      BLADDER_MAX_M3 - ship.com.bladders.two.level, BLADDER_MAX_M3F)
  sim.demand.H_V.bladders.three = math.min(
      BLADDER_MAX_M3 - ship.com.bladders.three.level, BLADDER_MAX_M3F)
  sim.demand.H_V.bladders.four = math.min(
      BLADDER_MAX_M3 - ship.com.bladders.four.level, BLADDER_MAX_M3F)

  return sim
end

function batteryDemand(sim)
  batteryStateDemand = math.min(BATTERY_MAX_CHARGE_RATE_KW,
      BATTERY_MAX_CHARGE_KW * ship.com.battery.status - ship.com.battery.level)
  sim.demand.kW.battery = math.max(batteryStateDemand, 0)

  return sim
end

function hydraulicReservoirDemand(sim)
  sim.demand.kNSM.hydraulicReservoir = HYDRAULIC_MAX_KNSM - ship.com.hydraulics.reservoir.level

  return sim
end

function splitterAccDemand(sim)
  if sim.demand.H_M.tank > 0 or sim.demand.O.tank > 0 then
    sim.demand.kW.splitter = SPLITTER_POWER_DEMAND_KW * ship.com.splitter.status
    sim.demand.H2O.splitter = SPLITTER_MAX_H2O * ship.com.splitter.status
  end

  if sim.demand.H2O.tank > 0 then
    sim.demand.kW.H2OAcc = H2O_ACC_POWER_DEMAND_KW * ship.com.acc.H2O.status
  end

  if sim.demand.CH4.tank > 0 then
    sim.demand.kW.CH4Acc = CH4_ACC_POWER_DEMAND_KW * ship.com.acc.CH4.status
  end

  return sim
end

function hydraulicPumpDemand(sim)
  sim.demand.NM.hydraulicPump = math.min(HYDRAULIC_PUMP_MAX_NM,
      sim.demand.kNSM.hydraulicReservoir * HYDRAULIC_PUMP_NM_PER_KNSM)

  return sim
end

function generatorDemand(sim)
  totalPowerDemand = math.min(GEN_MAX_KW * ship.com.generator.status,
      sim.demand.kW.displays + sim.demand.kW.rotors.one +
      sim.demand.kW.rotors.two + sim.demand.kW.rotors.three +
      sim.demand.kW.rotors.four + sim.demand.kW.props.one +
      sim.demand.kW.props.two + sim.demand.kW.splitter +
      sim.demand.kW.H2OAcc + sim.demand.kW.CH4Acc + sim.demand.kW.battery)
  sim.demand.NM.generator = (totalPowerDemand / GEN_MAX_KW) * GEN_MAX_NM

  return sim
end

function turbineDemand(sim)
  totalTorqueDemand = math.min(TURBINE_MAX_NM * ship.com.engine.turbine.status,
      sim.demand.NM.generator + sim.demand.NM.hydraulicPump)
  sim.demand.steam = (totalTorqueDemand / TURBINE_MAX_NM) * TURBINE_MAX_STEAM_KNSM

  return sim
end

function boilerDemand(sim)
  superSteamDemand = 0
  if sim.demand.steam >= BOILER_MAX_REG_STEAM_KNSM then
    superSteamDemand = sim.demand.steam - BOILER_MAX_REG_STEAM_KNSM
  end
  sim.demand.H2O.boiler = sim.demand.steam * BOILER_H2O_KG_PER_KNSM
  sim.demand.CH4.boiler = sim.demand.steam * BOILER_CH4_KG_PER_KNSM
  sim.demand.O.boiler = superSteamDemand * BOILER_O_KG_PER_KNSM

  return sim
end

function elementSupply(sim)
  sim.supply.O.boiler = math.min(sim.demand.O.boiler, sim.availableForUse.O)
  sim.supply.CH4.boiler = math.min(sim.demand.CH4.boiler,
                                   sim.availableForUse.CH4)

  totalH2ODemand = sim.demand.H2O.boiler + sim.demand.H2O.splitter
  if sim.availableForUse.H2O > totalH2ODemand then
    sim.supply.H2O.boiler = sim.demand.H2O.boiler
    sim.supply.H2O.splitter = sim.demand.H2O.splitter
  elseif sim.availableForUse.H2O > 0 then
    boilerPercent = sim.demand.H2O.boiler / totalH2ODemand
    splitterPercent = sim.demand.H2O.splitter / totalH2ODemand
    sim.supply.H2O.boiler = boilerPercent * sim.availableForUse.H2O
    sim.supply.H2O.splitter = splitterPercent * sim.availableForUse.H2O
  end

  totalH_VDemand = sim.demand.H_V.bladders.one + sim.demand.H_V.bladders.two +
      sim.demand.H_V.bladders.three + sim.demand.H_V.bladders.four
  if sim.availableForUse.H_V > totalH_VDemand then
    sim.supply.H_V.bladders.one = sim.demand.H_V.bladders.one
    sim.supply.H_V.bladders.two = sim.demand.H_V.bladders.two
    sim.supply.H_V.bladders.three = sim.demand.H_V.bladders.three
    sim.supply.H_V.bladders.four = sim.demand.H_V.bladders.four
  elseif sim.availableForUse.H_V > 0 then
    bOnePercent = sim.demand.H_V.bladders.one / totalH_VDemand
    bTwoPercent = sim.demand.H_V.bladders.two / totalH_VDemand
    bThreePercent = sim.demand.H_V.bladders.three / totalH_VDemand
    bFourPercent = sim.demand.H_V.bladders.four / totalH_VDemand
    sim.supply.H_V.bladders.one = bOnePercent * sim.availableForUse.H_V
    sim.supply.H_V.bladders.two = bTwoPercent * sim.availableForUse.H_V
    sim.supply.H_V.bladders.three = bThreePercent * sim.availableForUse.H_V
    sim.supply.H_V.bladders.four = bFourPercent * sim.availableForUse.H_V
  end

  return sim
end

function steamSupply(sim)
  suppliedH2O_KNSM = sim.supply.H2O.boiler / BOILER_H2O_KG_PER_KNSM
  suppliedCH4_KNSM = sim.supply.CH4.boiler / BOILER_CH4_KG_PER_KNSM
  suppliedO_KNSM = sim.supply.O.boiler / BOILER_O_KG_PER_KNSM

  if suppliedH2O_KNSM < suppliedCH4_KNSM then
    suppliedCH4_KNSM = suppliedH2O_KNSM
    sim.supply.CH4.boiler = suppliedCH4_KNSM * BOILER_CH4_KG_PER_KNSM
  elseif suppliedCH4_KNSM < suppliedH2O_KNSM then
    suppliedH2O_KNSM = suppliedCH4_KNSM
    sim.supply.H2O.boiler = suppliedH2O_KNSM * BOILER_H2O_KG_PER_KNSM
  end

  suppliedKNSM = suppliedCH4_KNSM

  if suppliedKNSM > BOILER_MAX_REG_STEAM_KNSM then
    superSteam = suppliedKNSM - BOILER_MAX_REG_STEAM_KNSM
    if suppliedO_KNSM >= superSteam then
      sim.supply.O.boiler = superSteam * BOILER_O_KG_PER_KNSM
    else
      missing = superSteam - suppliedO_KNSM
      suppliedKNSM = suppliedKNSM - missing
      sim.supply.CH4.boiler = suppliedKNSM * BOILER_CH4_KG_PER_KNSM
      sim.supply.H2O.boiler = suppliedKNSM * BOILER_H2O_KG_PER_KNSM
    end
  end

  sim.supply.steam = suppliedKNSM

  return sim
end

function torqueSupply(sim)
  torqueSupplied = TURBINE_MAX_NM * (sim.supply.steam / TURBINE_MAX_STEAM_KNSM)
  torqueDemand = sim.demand.NM.generator + sim.demand.NM.hydraulicPump

  if torqueSupplied >= torqueDemand then
    sim.supply.NM.generator = sim.demand.NM.generator
    sim.supply.NM.hydraulicPump = sim.demand.NM.hydraulicPump
  else
    generatorPercent = sim.demand.NM.generator / torqueDemand
    pumpPercent = sim.demand.NM.hydraulicPump / torqueDemand
    sim.supply.NM.generator = torqueSupplied * generatorPercent
    sim.supply.NM.hydraulicPump = torqueSupplied * pumpPercent
  end

  return sim
end

function hydraulicSupply(sim)
  sim.supply.kNSM.hydraulicReservoir = sim.supply.NM.hydraulicPump * HYDRAULIC_PUMP_NM_PER_KNSM

  totalPressureDemand = sim.demand.kNSM.rotors.one +
      sim.demand.kNSM.rotors.two + sim.demand.kNSM.rotors.three +
      sim.demand.kNSM.rotors.four + sim.demand.kNSM.props.one +
      sim.demand.kNSM.props.two

  if sim.availableForUse.kNSM >= totalPressureDemand then
    sim.supply.kNSM.rotors.one = sim.demand.kNSM.rotors.one
    sim.supply.kNSM.rotors.two = sim.demand.kNSM.rotors.two
    sim.supply.kNSM.rotors.three = sim.demand.kNSM.rotors.three
    sim.supply.kNSM.rotors.four = sim.demand.kNSM.rotors.four
    sim.supply.kNSM.props.one = sim.demand.kNSM.props.one
    sim.supply.kNSM.props.two = sim.demand.kNSM.props.two
  elseif sim.availableForUse.kNSM > 0 then
    rotorsOnePercent = sim.demand.kNSM.rotors.one / totalPressureDemand
    rotorsTwoPercent = sim.demand.kNSM.rotors.two / totalPressureDemand
    rotorsThreePercent = sim.demand.kNSM.rotors.three / totalPressureDemand
    rotorsFourPercent = sim.demand.kNSM.rotors.four / totalPressureDemand
    propsOnePercent = sim.demand.kNSM.props.one / totalPressureDemand
    propsTwoPercent = sim.demand.kNSM.props.two / totalPressureDemand

    sim.supply.kNSM.rotors.one = rotorsOnePercent * sim.availableForUse.kNSM
    sim.supply.kNSM.rotors.two = rotorsTwoPercent * sim.availableForUse.kNSM
    sim.supply.kNSM.rotors.three = rotorsThreePercent * sim.availableForUse.kNSM
    sim.supply.kNSM.rotors.four = rotorsFourPercent * sim.availableForUse.kNSM
    sim.supply.kNSM.props.one = propsOnePercent * sim.availableForUse.kNSM
    sim.supply.kNSM.props.two = propsTwoPercent * sim.availableForUse.kNSM
  end

  return sim
end

function powerSupply(sim)
  generatorPower = GEN_MAX_KW * (sim.supply.NM.generator / GEN_MAX_NM)
  batteryPower = sim.availableForUse.kW
  totalPowerDemand = sim.demand.kW.displays + sim.demand.kW.battery +
      sim.demand.kW.rotors.one + sim.demand.kW.rotors.two +
      sim.demand.kW.rotors.three + sim.demand.kW.rotors.four +
      sim.demand.kW.props.one + sim.demand.kW.props.two +
      sim.demand.kW.splitter + sim.demand.kW.H2OAcc + sim.demand.kW.CH4Acc

  if totalPowerDemand <= generatorPower then
    sim.supply.kW.displays = sim.demand.kW.displays
    sim.supply.kW.rotors.one = sim.demand.kW.rotors.one
    sim.supply.kW.rotors.two = sim.demand.kW.rotors.two
    sim.supply.kW.rotors.three = sim.demand.kW.rotors.three
    sim.supply.kW.rotors.four = sim.demand.kW.rotors.four
    sim.supply.kW.props.one = sim.demand.kW.props.one
    sim.supply.kW.props.two = sim.demand.kW.props.two
    sim.supply.kW.splitter = sim.demand.kW.splitter
    sim.supply.kW.H2OAcc = sim.demand.kW.H2OAcc
    sim.supply.kW.CH4Acc = sim.demand.kW.CH4Acc
    sim.supply.kW.battery = sim.demand.kW.battery
  elseif totalPowerDemand <= (generatorPower + batteryPower) then
    sim.supply.kW.displays =  sim.demand.kW.displays
    sim.supply.kW.rotors.one = sim.demand.kW.rotors.one
    sim.supply.kW.rotors.two = sim.demand.kW.rotors.two
    sim.supply.kW.rotors.three = sim.demand.kW.rotors.three
    sim.supply.kW.rotors.four = sim.demand.kW.rotors.four
    sim.supply.kW.props.one = sim.demand.kW.props.one
    sim.supply.kW.props.two = sim.demand.kW.props.two
    sim.supply.kW.splitter = sim.demand.kW.splitter
    sim.supply.kW.H2OAcc = sim.demand.kW.H2OAcc
    sim.supply.kW.CH4Acc = sim.demand.kW.CH4Acc
    sim.supply.kW.battery = sim.demand.kW.battery

    batteryUse = totalPowerDemand - generatorPower
    sim.availableForStorage.kW = sim.availableForStorage.kW - batteryUse
  else
    displaysPercent = sim.demand.kW.displays / totalPowerDemand
    rotorsOnePercent = sim.demand.kW.rotors.one / totalPowerDemand
    rotorsTwoPercent = sim.demand.kW.rotors.two / totalPowerDemand
    rotorsThreePercent = sim.demand.kW.rotors.three / totalPowerDemand
    rotorsFourPercent = sim.demand.kW.rotors.four / totalPowerDemand
    propsOnePercent = sim.demand.kW.props.one / totalPowerDemand
    propsTwoPercent = sim.demand.kW.props.two / totalPowerDemand
    splitterPercent = sim.demand.kW.splitter / totalPowerDemand
    H2OAccPercent = sim.demand.kW.H2OAcc / totalPowerDemand
    CH4AccPercent = sim.demand.kW.CH4Acc / totalPowerDemand
    batteryPercent = sim.demand.kW.battery / totalPowerDemand

    totalPowerAvailable = generatorPower + batteryPower

    sim.supply.kW.displays = displaysPercent * totalPowerAvailable
    sim.supply.kW.rotors.one = rotorsOnePercent * totalPowerAvailable
    sim.supply.kW.rotors.two = rotorsTwoPercent * totalPowerAvailable
    sim.supply.kW.rotors.three = rotorsThreePercent * totalPowerAvailable
    sim.supply.kW.rotors.four = rotorsFourPercent * totalPowerAvailable
    sim.supply.kW.props.one = propsOnePercent * totalPowerAvailable
    sim.supply.kW.props.two = propsTwoPercent * totalPowerAvailable
    sim.supply.kW.splitter = splitterPercent * totalPowerAvailable
    sim.supply.kW.H2OAcc = H2OAccPercent * totalPowerAvailable
    sim.supply.kW.CH4Acc = CH4AccPercent * totalPowerAvailable
    sim.supply.kW.battery = batteryPercent * totalPowerAvailable

    sim.availableForStorage.kW = sim.availableForStorage.kW - batteryPower
  end

  return sim
end

function distributeHydraulics(sim)
  sim = rotateRotor(sim, 'one')
  sim = rotateRotor(sim, 'two')
  sim = rotateRotor(sim, 'three')
  sim = rotateRotor(sim, 'four')

  sim = rotateProp(sim, 'one')
  sim = rotateProp(sim, 'two')

  return sim
end

function distributePower(sim)
  altAdjustment = clamp01(5000 / (ship.pos.z + 5000))
  speedAdjustment = clamp(nroot(6.6, ship.speed) - 1.0, 0.2, 1.2)
  intakeAdjustment = altAdjustment * speedAdjustment

  ship.com.displays.active = (sim.supply.kW.displays >= sim.demand.kW.displays)

  if sim.supply.kW.splitter > 0 then
    powerPercent = sim.supply.kW.splitter / SPLITTER_POWER_DEMAND_KW
    h2oPercent = sim.supply.H2O.splitter / SPLITTER_MAX_H2O
    productionPercent = math.min(powerPercent, h2oPercent)
    if powerPercent < h2oPercent then
      sim.supply.H2O.splitter = productionPercent * sim.demand.H2O.splitter
    elseif h2oPercent < powerPercent then
      sim.supply.kW.splitter = productionPercent * sim.demand.kW.splitter
    end
    sim.supply.H_M.tank = productionPercent * SPLITTER_PER_TIC_H
    sim.supply.O.tank = productionPercent * SPLITTER_PER_TIC_O
  end

  if sim.supply.kW.H2OAcc > 0 then
    sim.supply.H2O.tank = (sim.supply.kW.H2OAcc / H2O_ACC_POWER_DEMAND_KW) *
        H2O_ACC_PER_TIC * ship.env.H2O * intakeAdjustment
  end

  if sim.supply.kW.CH4Acc > 0 then
    sim.supply.CH4.tank = (sim.supply.kW.CH4Acc / CH4_ACC_POWER_DEMAND_KW) *
        CH4_ACC_PER_TIC * ship.env.CH4 * intakeAdjustment
  end

  if sim.supply.kW.battery > 0 then
    sim.availableForStorage.kW = sim.availableForStorage.kW +
        sim.supply.kW.battery
  end

  return sim
end

function drainTanks(sim)
  ship.com.bladders.one.level = ship.com.bladders.one.level -
      math.max(0.01, 1.0 - ship.com.bladders.one.status) * BLADDER_MAX_VENT_M3F
  ship.com.bladders.two.level = ship.com.bladders.two.level -
      math.max(0.01, 1.0 - ship.com.bladders.two.status) * BLADDER_MAX_VENT_M3F
  ship.com.bladders.three.level = ship.com.bladders.three.level -
      math.max(0.01, 1.0 - ship.com.bladders.three.status) * BLADDER_MAX_VENT_M3F
  ship.com.bladders.four.level = ship.com.bladders.four.level -
      math.max(0.01, 1.0 - ship.com.bladders.four.status) * BLADDER_MAX_VENT_M3F

  ship.com.tanks.H.level = ship.com.tanks.H.level -
      sim.supply.H_V.bladders.one / H_MASS_TO_VOLUME -
      sim.supply.H_V.bladders.two / H_MASS_TO_VOLUME -
      sim.supply.H_V.bladders.three / H_MASS_TO_VOLUME -
      sim.supply.H_V.bladders.four / H_MASS_TO_VOLUME
  ship.com.tanks.O.level = ship.com.tanks.O.level - sim.supply.O.boiler
  ship.com.tanks.H2O.level = ship.com.tanks.H2O.level - sim.supply.H2O.boiler -
      sim.supply.H2O.splitter
  ship.com.tanks.CH4.level = ship.com.tanks.CH4.level - sim.supply.CH4.boiler

  ship.com.hydraulics.reservoir.level = ship.com.hydraulics.reservoir.level -
      sim.supply.kNSM.rotors.one - sim.supply.kNSM.rotors.two -
      sim.supply.kNSM.rotors.three - sim.supply.kNSM.rotors.four -
      sim.supply.kNSM.props.one - sim.supply.kNSM.props.two
end

function fillTanks(sim)
  ship.com.bladders.one.level = math.min(BLADDER_MAX_M3,
      ship.com.bladders.one.level + sim.supply.H_V.bladders.one)
  ship.com.bladders.two.level = math.min(BLADDER_MAX_M3,
      ship.com.bladders.two.level + sim.supply.H_V.bladders.two)
  ship.com.bladders.three.level = math.min(BLADDER_MAX_M3,
      ship.com.bladders.three.level + sim.supply.H_V.bladders.three)
  ship.com.bladders.four.level = math.min(BLADDER_MAX_M3,
      ship.com.bladders.four.level + sim.supply.H_V.bladders.four)

  ship.com.tanks.H.level = math.min(H_TANK_MAX_KG,
      ship.com.tanks.H.level + sim.supply.H_M.tank)
  ship.com.tanks.O.level = math.min(O_TANK_MAX_KG,
      ship.com.tanks.O.level + sim.supply.O.tank)
  ship.com.tanks.H2O.level = math.min(H2O_TANK_MAX_KG,
      ship.com.tanks.H2O.level + sim.supply.H2O.tank)
  ship.com.tanks.CH4.level = math.min(CH4_TANK_MAX_KG,
      ship.com.tanks.CH4.level + sim.supply.CH4.tank)

  ship.com.hydraulics.reservoir.level = math.min(HYDRAULIC_MAX_KNSM,
      ship.com.hydraulics.reservoir.level + sim.supply.kNSM.hydraulicReservoir)

  ship.com.battery.level = math.min(BATTERY_MAX_CHARGE_KW,
      ship.com.battery.level + sim.availableForStorage.kW)
end

function applyThrust(sim)
  ship.com.rotors.one.thrust = sim.supply.kW.rotors.one /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN
  ship.com.rotors.two.thrust = sim.supply.kW.rotors.two /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN
  ship.com.rotors.three.thrust = sim.supply.kW.rotors.three /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN
  ship.com.rotors.four.thrust = sim.supply.kW.rotors.four /
      ROTOR_MAX_POWER_DEMAND_KW * ROTOR_MAX_THRUST_KN

  ship.com.props.one.thrust = sim.supply.kW.props.one /
      PROP_MAX_POWER_DEMAND_KW * PROP_MAX_THRUST_KN
  ship.com.props.two.thrust = sim.supply.kW.props.two /
      PROP_MAX_POWER_DEMAND_KW * PROP_MAX_THRUST_KN
end

function applyForces(sim)
  altAdjustment = clamp01(5000 / (ship.pos.z + 5000))
  thrustAdjustment = lerp(0.2, 1.0, altAdjustment)
  ship.env.Atmo = altAdjustment * SEA_LEVEL_AIR_DENSITY

  rotor1Xcomp = math.cos(math.rad(90 - ship.com.rotors.one.rotation)) *
      thrustAdjustment
  rotor1Ycomp = math.sin(math.rad(90 - ship.com.rotors.one.rotation)) *
      thrustAdjustment
  rotor2Xcomp = math.cos(math.rad(90 - ship.com.rotors.two.rotation)) *
      thrustAdjustment
  rotor2Ycomp = math.sin(math.rad(90 - ship.com.rotors.two.rotation)) *
      thrustAdjustment
  rotor3Xcomp = math.cos(math.rad(90 - ship.com.rotors.three.rotation)) *
      thrustAdjustment
  rotor3Ycomp = math.sin(math.rad(90 - ship.com.rotors.three.rotation)) *
      thrustAdjustment
  rotor4Xcomp = math.cos(math.rad(90 - ship.com.rotors.four.rotation)) *
      thrustAdjustment
  rotor4Ycomp = math.sin(math.rad(90 - ship.com.rotors.four.rotation)) *
      thrustAdjustment

  totalHydrogenVolume = ship.com.bladders.one.level +
      ship.com.bladders.two.level + ship.com.bladders.three.level +
      ship.com.bladders.four.level
  totalHydrogenWeight = totalHydrogenVolume * HYDROGEN_DENSITY
  totalAirWeight = totalHydrogenVolume * SEA_LEVEL_AIR_DENSITY

  totalShipWeightKG = SHIP_DRY_WEIGHT_KG + totalHydrogenWeight +
      ship.com.tanks.H.level + ship.com.tanks.O.level +
      ship.com.tanks.H2O.level + ship.com.tanks.CH4.level
  totalShipWeightKN = (totalShipWeightKG * KG_TO_N) * 0.001

  ship.heading = (ship.com.props.one.rotation + ship.com.props.two.rotation) / 2
  drag = DRAG_COEFFICENT * FRONT_DRAG_AREA * 0.5 * ship.env.Atmo *
      (ship.speed * ship.speed)
  ship.acceleration = (ship.com.props.one.thrust * thrustAdjustment +
                       ship.com.props.two.thrust * thrustAdjustment +
                       ship.com.rotors.one.thrust * rotor1Xcomp +
                       ship.com.rotors.two.thrust * rotor2Xcomp +
                       ship.com.rotors.three.thrust * rotor3Xcomp +
                       ship.com.rotors.four.thrust * rotor4Xcomp - drag) /
      totalShipWeightKN
  -- TODO Remove fudge?
  ship.speed = ship.speed + 0.5 * (ship.acceleration * 10 * 0.00027777777)
  changeX = ship.speed * math.cos(math.rad(ship.heading))
  changeY = ship.speed * math.sin(math.rad(ship.heading))
  ship.pos.x = ship.pos.x + changeX
  ship.pos.y = ship.pos.y + changeY

  totalHydrogenLiftForce = (totalAirWeight - totalHydrogenWeight) * KG_TO_N *
      HYDROGEN_LIFT_ADJUST
  totalWingLiftForce = (ship.speed * WING_LIFT) * altAdjustment

  ship.rotation = (ship.com.rotors.one.rotation + ship.com.rotors.two.rotation +
                   ship.com.rotors.three.rotation +
                   ship.com.rotors.four.rotation) / 4
  vertDrag = DRAG_COEFFICENT * BOTTOM_DRAG_AREA * 0.5 * ship.env.Atmo *
      (ship.vsi * ship.vsi)
  vForce = ((ship.com.rotors.one.thrust * rotor1Ycomp +
             ship.com.rotors.two.thrust * rotor2Ycomp +
             ship.com.rotors.three.thrust * rotor3Ycomp +
             ship.com.rotors.four.thrust * rotor4Ycomp) +
      totalHydrogenLiftForce + totalWingLiftForce) / totalShipWeightKN
  if ship.vsi > 0 then
    vForce = vForce - vertDrag
  elseif ship.vsi < 0 then
    vForce = vForce + vertDrag
  end

  ship.vsi = ship.vsi + 0.5 * ((vForce - totalShipWeightKN - vertDrag) * 0.00027777777)
  ship.pos.z = ship.pos.z + ship.vsi

  -- Auto controls
  if ship.vsi < ship.set_vsi then
    ship.con.throttle.rotors = math.min(ship.con.throttle.rotors + 0.1, 1.0)
  elseif ship.vsi > ship.set_vsi then
    ship.con.throttle.rotors = math.max(ship.con.throttle.rotors - 0.1, 0.0)
  end

  if ship.pos.z + 10 < ship.con.alt and ship.con.vsi > 0 then
    ship.set_vsi = ship.con.vsi
  elseif ship.pos.z - 10 > ship.con.alt and ship.con.vsi < 0 then
    ship.set_vsi = ship.con.vsi
  else
    ship.set_vsi = 0.0
  end
end


function calcHydDemand(currentAngle, desiredAngle, status, maxSpeed, maxDemand)
  if currentAngle == desiredAngle then return 0 end
  rotorAngleChange = math.abs(desiredAngle - currentAngle)
  rotorAngleChange = math.min(rotorAngleChange, maxSpeed * status)
  return (rotorAngleChange / maxSpeed) * maxDemand
end

function rotateThruster(sim, type, thruster, maxDemand, maxSpeed)
  if math.abs(ship.con.rotation[type] - ship.com[type][thruster].rotation) < 0.0001 then
    ship.com[type][thruster].rotation = ship.con.rotation[type]
  else
    hydAvailable = sim.supply.kNSM[type][thruster] / maxDemand
    availableAngle = hydAvailable * maxSpeed
    desiredAngle = ship.con.rotation[type] - ship.com[type][thruster].rotation
    moveAngle = math.min(availableAngle, math.abs(desiredAngle))
    if desiredAngle < 0 then
      ship.com[type][thruster].rotation = ship.com[type][thruster].rotation - moveAngle
    else
      ship.com[type][thruster].rotation = ship.com[type][thruster].rotation + moveAngle
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
  return clamp(val, 0.0, 1.0)
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

function rotateV2(vec, angle)
  r = math.rad(angle)
  aSin = math.sin(r)
  aCos = math.cos(r)

  return {
    x = vec.x * aCos - vec.y * aSin,
    y = vec.y * aCos + vec.x * aSin
  }
end

function contains(bb, pos)
  return pos.x >= bb.min_x and pos.y >= bb.min_y and pos.x <= bb.max_x and pos.y <= bb.max_y
end

function drawShipDebugOne(s)
  lines = {}

  lines[1] = "Ship Status Page 1"
  lines[2] = string.format("Alt: %f", s.pos.z)
  lines[3] = string.format("VSI: %f", s.vsi)
  lines[4] = string.format("Con TP: %f", s.con.throttle.props)
  lines[5] = string.format("Con TR: %f", s.con.throttle.rotors)
  lines[6] = string.format("Con RP: %f", s.con.rotation.props)
  lines[7] = string.format("Con RR: %f", s.con.rotation.rotors)
  lines[8] = string.format("Env H2O: %f", s.env.H2O)
  lines[9] = string.format("Env CH4: %f", s.env.CH4)
  lines[10] = "COMPONENTS"
  lines[11] = string.format("Displays S: %f", s.com.displays.status)
  lines[12] = string.format("Boiler S: %f", s.com.engine.boiler.status)
  lines[13] = string.format("Turbine S: %f", s.com.engine.turbine.status)
  lines[14] = string.format("Hyd Res S: %f", s.com.hydraulics.reservoir.status)
  lines[15] = string.format("Hyd Res L: %f", s.com.hydraulics.reservoir.level)
  lines[16] = string.format("Hyd Pum S: %f", s.com.hydraulics.pump.status)
  lines[17] = string.format("Gen S: %f", s.com.generator.status)
  lines[18] = string.format("R1S: %f", s.com.rotors.one.status)
  lines[19] = string.format("R1R: %f", s.com.rotors.one.rotation)
  lines[20] = string.format("R1T: %f", s.com.rotors.one.thrust)
  lines[21] = string.format("P1S: %f", s.com.props.one.status)
  lines[22] = string.format("P1R: %f", s.com.props.one.rotation)
  lines[23] = string.format("P1T: %f", s.com.props.one.thrust)
  lines[24] = string.format("AccH2O S: %f", s.com.acc.H2O.status)
  lines[25] = string.format("AccCH4 S: %f", s.com.acc.CH4.status)
  lines[26] = string.format("BLAD1 S: %f", s.com.bladders.one.status)
  lines[27] = string.format("BLAD1 L: %f", s.com.bladders.one.level)
  lines[28] = string.format("Batt S: %f", s.com.battery.status)
  lines[29] = string.format("Batt L: %f", s.com.battery.level)
  lines[30] = string.format("Split S: %f", s.com.splitter.status)

  drawDebugLines(lines, 30)
end

function drawShipDebugTwo(s)
  lines = {}

  lines[1] = "Ship Status Page 2"
  lines[2] = string.format("T H S: %f", s.com.tanks.H.status)
  lines[3] = string.format("T H L: %f", s.com.tanks.H.level)
  lines[4] = string.format("T O S: %f", s.com.tanks.O.status)
  lines[5] = string.format("T O L: %f", s.com.tanks.O.level)
  lines[6] = string.format("T H2O S: %f", s.com.tanks.H2O.status)
  lines[7] = string.format("T H2O L: %f", s.com.tanks.H2O.level)
  lines[8] = string.format("T CH4 S: %f", s.com.tanks.CH4.status)
  lines[9] = string.format("T CH4 L: %f", s.com.tanks.CH4.level)

  drawDebugLines(lines, 9)
end

function drawSimDebug()
  lines = {}

  lines[1] = "Power"
  lines[2] = string.format("Displays: D%f S%f", sim.demand.kW.displays, sim.supply.kW.displays)
  lines[3] = string.format("Rotors: D%f S%f", sim.demand.kW.rotors.one, sim.supply.kW.rotors.one)
  lines[4] = string.format("Props: D%f S%f", sim.demand.kW.props.one, sim.supply.kW.props.one)
  lines[5] = string.format("Splitter: D%f S%f", sim.demand.kW.splitter, sim.supply.kW.splitter)
  lines[6] = string.format("H2OAcc: D%f S%f", sim.demand.kW.H2OAcc, sim.supply.kW.H2OAcc)
  lines[7] = string.format("CH4Acc: D%f S%f", sim.demand.kW.CH4Acc, sim.supply.kW.CH4Acc)
  lines[8] = string.format("Battery: D%f S%f", sim.demand.kW.battery, sim.supply.kW.battery)
  lines[9] = "KNSM"
  lines[10] = string.format("Hyd Res: D%f S%f", sim.demand.kNSM.hydraulicReservoir, sim.supply.kNSM.hydraulicReservoir)
  lines[11] = string.format("Rotors: D%f S%f", sim.demand.kNSM.rotors.one, sim.supply.kNSM.rotors.one)
  lines[12] = string.format("Props: D%f S%f", sim.demand.kNSM.props.one, sim.supply.kNSM.props.one)
  lines[13] = "NM"
  lines[14] = string.format("Hyd Pum: D%f S%f", sim.demand.NM.hydraulicPump, sim.supply.NM.hydraulicPump)
  lines[15] = string.format("Gen: D%f S%f", sim.demand.NM.generator, sim.supply.NM.generator)
  lines[16] = "H2O"
  lines[17] = string.format("Tank: D%f S%f", sim.demand.H2O.tank, sim.supply.H2O.tank)
  lines[18] = string.format("Boiler: D%f S%f", sim.demand.H2O.boiler, sim.supply.H2O.boiler)
  lines[19] = string.format("Splitter: D%f S%f", sim.demand.H2O.splitter, sim.supply.H2O.splitter)
  lines[20] = "CH4"
  lines[21] = string.format("Tank: D%f S%f", sim.demand.CH4.tank, sim.supply.CH4.tank)
  lines[22] = string.format("Boiler: D%f S%f", sim.demand.CH4.boiler, sim.supply.CH4.boiler)
  lines[23] = "H"
  lines[24] = string.format("Tank: D%f S%f", sim.demand.H_M.tank, sim.supply.H_M.tank)
  lines[25] = string.format("Bladders: D%f S%f", sim.demand.H_V.bladders.one, sim.supply.H_V.bladders.one)
  lines[26] = "O"
  lines[27] = string.format("Tank: D%f S%f", sim.demand.O.tank, sim.supply.O.tank)
  lines[28] = string.format("Boiler: D%f S%f", sim.demand.O.boiler, sim.supply.O.boiler)
  lines[29] = "Steam"
  lines[30] = string.format("Steam: D%f S%f", sim.demand.steam, sim.supply.steam)

  drawDebugLines(lines, 30)
end


function drawStorageDebug(sim)
  lines = {}

  lines[1] = "kW"
  lines[2] = string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.kW, sim.availableForStorage.kW)
  lines[3] = "KNSM"
  lines[4] = string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.kNSM, sim.availableForStorage.kNSM)
  lines[5] = "H2O"
  lines[6] = string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.H2O, sim.availableForStorage.H2O)
  lines[7] = "CH4"
  lines[8] = string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.CH4, sim.availableForStorage.CH4)
  lines[9] = "H"
  lines[10] = string.format("In Storage: %f, Available for Storage: %f",
                            sim.availableForUse.H_M, sim.availableForStorage.H_M)
  lines[11] = "O"
  lines[12] = string.format("In Storage: %f, Available for Storage: %f",
                            sim.availableForUse.O, sim.availableForStorage.O)

  drawDebugLines(lines, 12)
end


function drawDebugLines(lines, count)
  for i=1, count do
    if i < 16 then
      print(lines[i], 1, i*9-8, 15, false, 1, true)
    else
      print(lines[i], 120, i*9-143, 15, false, 1, true)
    end
  end
end
