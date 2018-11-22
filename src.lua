-- Game Configuration
-- Constants
KG_TO_N = 9.81
H_MASS_TO_VOLUME = 11.988
DRAG_COEFFICENT = 0.26
DRAG_AREA = 28
GRAVITY = 9.8
SEA_LEVEL_AIR_DENSITY = 1.225
HYDROGEN_DENSITY = 0.08988

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
SHIP_DRY_WEIGHT_KG = 120000

DISPLAYS_POWER_DEMAND_KW = 0.017

SPLITTER_POWER_DEMAND_KW = 0.05
SPLITTER_MAX_H2O = 2.4
SPLITTER_PER_TIC_H = 0.266
SPLITTER_PER_TIC_O = 2.128

ROTOR_MAX_THRUST_KN = 70000
ROTOR_MAX_POWER_DEMAND_KW = 46.4
ROTOR_MAX_ROTATE_SPEED_D = 0.02
ROTOR_MAX_HYDRAULIC_DEMAND_KNSM = 6.4

PROP_MAX_THRUST_KN = 47600
PROP_MAX_POWER_DEMAND_KW = 18.5
PROP_MAX_ROTATE_SPEED_D = 0.03
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
H2O_ACC_PER_TIC = 2.6090
CH4_ACC_PER_TIC = 5.0662

-- Game State
p={
  x=52,
  y=16,
  vx=0,
  vy=0
}

ship = {
  speed = 0,
  acceleration = 0,
  heading = 0,
  alt = 100,
  vsi = 0,
  con = {
    throttle = {
      props = 0.5,
      rotors = 0.7
    },
    rotation = {
      props = 90,
      rotors = 90
    }
  },
  env = {
    Atmo = SEA_LEVEL_AIR_DENSITY,
    H2O = 0.5,
    CH4 = 0.5
  },
  com = {
    displays = {
      status = 1.0,
      active = true
    },
    engine = {
      boiler = {
        status = 1.0
      },
      turbine = {
        status = 1.0
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

start={
  t=0,
  x=60,
  y=42
}

infoW=40
cStart=0
startScreen=true

debugType = 0

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

    if btn(2) then
      p.vx=math.max(p.vx-0.1, -2.0)
    elseif btn(3) then
      p.vx=math.min(p.vx+0.1, 2.0)
    else
      p.vx=0
    end

    if btnp(4) then p.vy=p.vy-2.4 end

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
  map(cStart,0,25,17,infoW,0)
  spr(257,p.x,p.y,0,1,0,0,1,2)
  drawStatus()
end

function drawStatus()
  rect(0, 0, infoW, 136, 0)
  print("Luftschiff", 1, 1, 15, false, 1, true)
  print(string.format("Spd %d", ship.speed//1), 1, 10, 14, false, 1, true)
  print(string.format("Acc %d", ship.acceleration//1), 1, 20, 14, false, 1, true)
  print(string.format("Hdg %d", ship.heading//1), 1, 30, 14, false, 1, true)
  print(string.format("Alt %d", ship.alt//1), 1, 40, 14, false, 1, true)
  print(string.sub(string.format("VSI %f", ship.vsi), 1, -5), 1, 50, 14, false, 1, true)
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
        H2O_ACC_PER_TIC * ship.env.H2O
  end

  if sim.supply.kW.CH4Acc > 0 then
    sim.supply.CH4.tank = (sim.supply.kW.CH4Acc / CH4_ACC_POWER_DEMAND_KW) *
        CH4_ACC_PER_TIC * ship.env.CH4
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
  altAdjustment = 5000 / (ship.alt + 5000)
  ship.env.Atmo = altAdjustment * SEA_LEVEL_AIR_DENSITY

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
  drag = DRAG_COEFFICENT * DRAG_AREA * 0.5 * ship.env.Atmo * (ship.speed * ship.speed)
  ship.acceleration = (ship.com.props.one.thrust * altAdjustment +
                       ship.com.props.two.thrust * altAdjustment - drag) /
      totalShipWeightKN
  ship.speed = ship.speed + 0.5 * (ship.acceleration * 0.00027777777)

  totalHydrogenLiftForce = (totalAirWeight - totalHydrogenWeight) * KG_TO_N * 5.6395

  vForce = ((ship.com.rotors.one.thrust * altAdjustment +
             ship.com.rotors.two.thrust * altAdjustment +
             ship.com.rotors.three.thrust * altAdjustment +
             ship.com.rotors.four.thrust * altAdjustment) +
      totalHydrogenLiftForce) / totalShipWeightKN
  ship.vsi = ship.vsi + 0.5 * ((vForce - totalShipWeightKN) * 0.00027777777)
  ship.alt = ship.alt + ship.vsi
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

function drawShipDebugOne(s)
  lines = {}

  lines[1] = "Ship Status Page 1"
  lines[2] = string.format("Alt: %f", s.alt)
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
