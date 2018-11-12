-- Game Configuration
CONTROLS_POWER_DEMAND = 1

SPLITTER_POWER_DEMAND = 10
SPLITTER_MAX_H2O = 10
SPLITTER_PER_TIC_H = 200
SPLITTER_PER_TIC_O = 100

ROTOR_MAX_POWER_DEMAND = 20
ROTOR_MAX_ROTATE_SPEED = 4
ROTOR_PER_DEGREE_HYDRAULIC_DEMAND = 5

PROP_MAX_POWER_DEMAND = 10
PROP_MAX_ROTATE_SPEED = 2
PROP_PER_DEGREE_HYDRAULIC_DEMAND = 2

GEN_MAX_KWH = 1000
GEN_MAX_RPM = 8000
TURBINE_MAX_RPM = 8000
TURBINE_MAX_STEAM = 1000
BOILER_MAX_REG_STEAM = 800
BOILER_H2O_PER_STEAM = 1
BOILER_CH4_PER_STEAM = 4
BOILER_O_PER_STEAM = 2

BATTERY_MAX_CHARGE = 200
BATTERY_MAX_CHARGE_RATE = 20

HYDRAULIC_MAX_PRESSURE = 100
HYDRAULIC_PUMP_MAX_RPM = 10
HYDRAULIC_PUMP_RPM_PER_PSI = 2

BLADDER_MAX_FILL = 1000
H_TANK_MAX_FILL = 100
O_TANK_MAX_FILL = 100
H2O_TANK_MAX_FILL = 100
CH4_TANK_MAX_FILL = 100

BLADDER_MAX_FILL_RATE = 10
H_TANK_MAX_FILL_RATE = 10
O_TANK_MAX_FILL_RATE = 10
H2O_TANK_MAX_FILL_RATE = 10
CH4_TANK_MAX_FILL_RATE = 10

H2O_ACC_POWER_DEMAND = 10
CH4_ACC_POWER_DEMAND = 12
H2O_ACC_PER_TIC = 2
CH4_ACC_PER_TIC = 1

-- Game State
p={
  x=52,
  y=16,
  vx=0,
  vy=0
}

ship = {
  alt = 10000,
  vsi = 0,
  con = {
    throttle = {
      props = 0.5,
      rotors = 0.5
    },
    rotation = {
      props = 90,
      rotors = 90
    }
  },
  env = {
    H2O = 100,
    CH4 = 100
  },
  com = {
    controls = {
      status = 1
    },
    engine = {
      boiler = {
        status = 1
      },
      turbine = {
        status = 1
      },
    },
    hydraulics = {
      reservoir = {
        status = 1,
        level = HYDRAULIC_MAX_PRESSURE - 10
      },
      pump = {
        status = 1
      }
    },
    generator = {
      status = 1
    },
    rotors = {
      one = {
        status = 1,
        rotation = 0
      }
    },
    props = {
      one = {
        status = 1,
        rotation = 0
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
        status = 1,
        level = BLADDER_MAX_FILL - 10
      }
    },
    battery = {
      status = 1,
      level = BATTERY_MAX_CHARGE - 10
    },
    splitter = {
      status = 1
    },
    tanks = {
      H = {
        status = 1,
        level = H_TANK_MAX_FILL - 1
      },
      O = {
        status = 1,
        level = O_TANK_MAX_FILL - 2
      },
      H2O = {
        status = 1,
        level = H2O_TANK_MAX_FILL - 3
      },
      CH4 = {
        status = 1,
        level = CH4_TANK_MAX_FILL - 4
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

    cls(0)
    simulate()
    -- drawGame()
  end

end


function drawGame()
  map(cStart,0,25,17,infoW,0)
  if cStart==0 then
    rect(92,89-boilerLevel,8,boilerLevel,2)
    rect(117,89-waterLevel,6,waterLevel,2)
  end
  spr(257,p.x,p.y,0,1,0,0,1,2)
  drawStatus()
end


function drawStatus()
  rect(0, 0, infoW, 136, 0)
  print("Luftschiff", 1, 1, 15, false, 1, true)
  print(string.format("Alt %d", ship.alt//1), 1, 10, 14, false, 1, true)
  print(string.sub(string.format("VSI %f", ship.vsi), 1, -5), 1, 20, 14, false, 1, true)
end


function simulate()
  demand = {
    kW = {
      controls = CONTROLS_POWER_DEMAND,
      rotorOne = 0,
      propOne = 0,
      splitter = 0,
      H2OAcc = 0,
      CH4Acc = 0,
      battery = 0
    },
    psi = {
      hydraulicReservoir = 0,
      rotorOne = 0,
      propOne = 0
    },
    rpm = {
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
    H = {
      tank = 0,
      bladders = 0
    },
    O = {
      tank = 0,
      boiler = 0
    },
    steam = 0
  }

  storageSupply = {
    kW = 0,
    psi = 0,
    H2O = 0,
    CH4 = 0,
    H = 0,
    O = 0
  }

  systemSupply = {
    kW = ship.com.battery.level,
    psi = ship.com.hydraulics.reservoir.level,
    H2O = ship.com.tanks.H2O.level,
    CH4 = ship.com.tanks.CH4.level,
    H = ship.com.tanks.H.level,
    O = ship.com.tanks.O.level
  }

  supply = {
    kW = {
      controls = 0,
      rotorOne = 0,
      propOne = 0,
      splitter = 0,
      H2OAcc = 0,
      CH4Acc = 0,
      battery = 0
    },
    psi = {
      hydraulicReservoir = 0,
      rotorOne = 0,
      propOne = 0
    },
    rpm = {
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
    H = {
      tank = 0,
      bladders = 0
    },
    O = {
      tank = 0,
      boiler = 0
    },
    steam = 0
  }

  -- ************
  -- PASS ONE
  -- ************

  -- Adjust demand for control input
  demand.kW.rotorOne = ROTOR_MAX_POWER_DEMAND * ship.com.rotors.one.status *
      ship.con.throttle.rotors
  demand.kW.propOne = PROP_MAX_POWER_DEMAND * ship.com.props.one.status *
      ship.con.throttle.props
  if ship.con.rotation.rotors ~= ship.com.rotors.one.rotation then
    rotorAngleChange = math.abs(ship.con.rotation.rotors - ship.com.rotors.one.rotation)
    rotorAngleChange = math.min(rotorAngleChange, ROTOR_MAX_ROTATE_SPEED)
    demand.psi.rotorOne = rotorAngleChange * ROTOR_PER_DEGREE_HYDRAULIC_DEMAND
  end
  if ship.con.rotation.props ~= ship.com.props.one.rotation then
    propAngleChange = math.abs(ship.con.rotation.props - ship.com.props.one.rotation)
    propAngleChange = math.min(propAngleChange, PROP_MAX_ROTATE_SPEED)
    demand.psi.propOne = propAngleChange * PROP_PER_DEGREE_HYDRAULIC_DEMAND
  end

  -- Adjust demand for tank levels
  demand.H2O.tank = math.min(H2O_TANK_MAX_FILL - ship.com.tanks.H2O.level,
                             H2O_TANK_MAX_FILL_RATE)
  demand.CH4.tank = math.min(CH4_TANK_MAX_FILL - ship.com.tanks.CH4.level,
                             CH4_TANK_MAX_FILL_RATE)
  demand.H.tank = math.min(H_TANK_MAX_FILL - ship.com.tanks.H.level,
                           H_TANK_MAX_FILL_RATE)
  demand.O.tank = math.min(O_TANK_MAX_FILL - ship.com.tanks.O.level,
                           O_TANK_MAX_FILL_RATE)

  -- Adjust demand for bladder levels
  demand.H.bladders = math.min(BLADDER_MAX_FILL - ship.com.bladders.one.level,
                               BLADDER_MAX_FILL_RATE)

  -- Adjust demand for battery level
  demand.kW.battery = math.min(BATTERY_MAX_CHARGE_RATE,
      BATTERY_MAX_CHARGE * ship.com.battery.status - ship.com.battery.level)
  demand.kW.battery = math.max(demand.kW.battery, 0)

  -- Adjust demand for hydraulic reservoir level
  demand.psi.hydraulicReservoir = HYDRAULIC_MAX_PRESSURE - ship.com.hydraulics.reservoir.level

  -- ************
  -- PASS TWO
  -- ************

  -- Add splitter energy demand
  if demand.H.tank > 0 or demand.O.tank > 0 then
    demand.kW.splitter = SPLITTER_POWER_DEMAND * ship.com.splitter.status
    demand.H2O.splitter = SPLITTER_MAX_H2O * ship.com.splitter.status
    storageSupply.H = SPLITTER_PER_TIC_H * ship.com.splitter.status
    storageSupply.O = SPLITTER_PER_TIC_O * ship.com.splitter.status
  end

  -- Add H2O demand
  if demand.H2O.tank > 0 then
    demand.kW.H2OAcc = H2O_ACC_POWER_DEMAND * ship.com.acc.H2O.status
    storageSupply.H2O = ship.env.H2O * H2O_ACC_PER_TIC * ship.com.acc.H2O.status
  end

  -- Add CH4 demand
  if demand.CH4.tank > 0 then
    demand.kW.CH4Acc = CH4_ACC_POWER_DEMAND * ship.com.acc.CH4.status
    storageSupply.CH4 = ship.env.CH4 * CH4_ACC_PER_TIC * ship.com.acc.CH4.status
  end

  -- ************
  -- PASS THREE
  -- ************

  -- Get hydraulic rpm
  if demand.psi.hydraulicReservoir > 0 then
    demand.rpm.hydraulicPump = math.min(HYDRAULIC_PUMP_MAX_RPM,
        demand.psi.hydraulicReservoir * HYDRAULIC_PUMP_RPM_PER_PSI)
  end

  -- Get generator rpm
  totalPowerDemand = math.min(demand.kW.controls + demand.kW.rotorOne +
      demand.kW.propOne + demand.kW.splitter + demand.kW.H2OAcc +
      demand.kW.CH4Acc + demand.kW.battery,
      GEN_MAX_KWH * ship.com.generator.status)
  demand.rpm.generator = (totalPowerDemand / GEN_MAX_KWH) * GEN_MAX_RPM

  -- ************
  -- PASS FOUR
  -- ************

  totalRPMDemand = math.min(demand.rpm.hydraulicPump + demand.rpm.generator,
      TURBINE_MAX_RPM * ship.com.engine.turbine.status)
  demand.steam = (totalRPMDemand / TURBINE_MAX_RPM) * TURBINE_MAX_STEAM

  -- ************
  -- PASS FIVE
  -- ************

  regSteamDemand = demand.steam
  plusSteamDemand = 0
  if demand.steam > BOILER_MAX_REG_STEAM then
    regSteamDemand = BOILER_MAX_REG_STEAM
    plusSteamDemand = demand.steam - BOILER_MAX_REG_STEAM
  end
  demand.H2O.boiler = regSteamDemand * BOILER_H2O_PER_STEAM
  demand.CH4.boiler = regSteamDemand * BOILER_CH4_PER_STEAM
  demand.O.boiler = plusSteamDemand * BOILER_O_PER_STEAM

  -- ************
  -- PASS SIX
  -- ************

  supply.H.bladders = math.min(demand.H.bladders, systemSupply.H)
  supply.O.boiler = math.min(demand.O.boiler, systemSupply.O)
  supply.CH4.boiler = math.min(demand.CH4.boiler, systemSupply.CH4)

  if demand.H2O.boiler + demand.H2O.splitter <= systemSupply.H2O then
    supply.H2O.boiler = demand.H2O.boiler
    supply.H2O.splitter = demand.H2O.splitter
  elseif systemSupply.H2O > 0 then
    totalH2ODemand = demand.H2O.boiler + demand.H2O.splitter
    boilerDemand = demand.H2O.boiler / totalH2ODemand
    splitterDemand = demand.H2O.splitter / totalH2ODemand
    supply.H2O.boiler = boilerDemand * systemSupply.H2O
    supply.H2O.splitter = splitterDemand * systemSupply.H2O
  end

  -- ************
  -- PASS SEVEN
  -- ************

  boilerH2OSupplied = (demand.H2O.boiler > 0) and supply.H2O.boiler / demand.H2O.boiler or 0
  boilerCH4Supplied = (demand.CH4.boiler > 0) and supply.CH4.boiler / demand.CH4.boiler or 0
  boilerOSupplied = (demand.O.boiler > 0) and supply.O.boiler / demand.O.boiler or 0

  supply.steam = math.min(boilerH2OSupplied, boilerCH4Supplied) * regSteamDemand + boilerOSupplied * plusSteamDemand

  -- ************
  -- PASS EIGHT
  -- ************

  turbineSteamSupplied = (demand.steam > 0) and supply.steam / demand.steam or 0
  supply.rpm.generator = demand.rpm.generator * turbineSteamSupplied
  supply.rpm.hydraulicPump = demand.rpm.hydraulicPump * turbineSteamSupplied

  -- ************
  -- PASS NINE
  -- ************

  hydraulicPumpRPMSupplied = (demand.rpm.hydraulicPump > 0) and supply.rpm.hydraulicPump / demand.rpm.hydraulicPump or 0
  supply.psi.hydraulicReservoir = demand.psi.hydraulicReservoir * hydraulicPumpRPMSupplied

  if (demand.psi.rotorOne > 0 or demand.psi.propOne > 0) then
    totalPSIDemand = demand.psi.rotorOne + demand.psi.propOne
    psiSuppliedPercent = systemSupply.psi / totalPSIDemand
    supply.psi.rotorOne = demand.psi.rotorOne * psiSuppliedPercent
    supply.psi.propOne = demand.psi.propOne * psiSuppliedPercent
  end

  generatorRPMSupplied = (demand.rpm.generator > 0) and supply.rpm.generator / demand.rpm.generator or 0
  supply.kW.controls = demand.kW.controls * generatorRPMSupplied
  supply.kW.rotorOne = demand.kW.rotorOne * generatorRPMSupplied
  supply.kW.propOne = demand.kW.propOne * generatorRPMSupplied
  supply.kW.splitter = demand.kW.splitter * generatorRPMSupplied
  supply.kW.H2OAcc = demand.kW.H2OAcc * generatorRPMSupplied
  supply.kW.CH4Acc = demand.kW.CH4Acc * generatorRPMSupplied
  supply.kW.battery = demand.kW.battery * generatorRPMSupplied

  -- ************
  -- APPLY
  -- ************
  drawSimDebug(demand, supply)
end


function drawSimDebug(demand, supply)
  lines = {}

  lines[1] = "Power"
  lines[2] = string.format("Controls: D%f S%f", demand.kW.controls, supply.kW.controls)
  lines[3] = string.format("Rotors: D%f S%f", demand.kW.rotorOne, supply.kW.rotorOne)
  lines[4] = string.format("Props: D%f S%f", demand.kW.propOne, supply.kW.propOne)
  lines[5] = string.format("Splitter: D%f S%f", demand.kW.splitter, supply.kW.splitter)
  lines[6] = string.format("H2OAcc: D%f S%f", demand.kW.H2OAcc, supply.kW.H2OAcc)
  lines[7] = string.format("CH4Acc: D%f S%f", demand.kW.CH4Acc, supply.kW.CH4Acc)
  lines[8] = string.format("Battery: D%f S%f", demand.kW.battery, supply.kW.battery)
  lines[9] = "PSI"
  lines[10] = string.format("Hyd Res: D%f S%f", demand.psi.hydraulicReservoir, supply.psi.hydraulicReservoir)
  lines[11] = string.format("Rotors: D%f S%f", demand.psi.rotorOne, supply.psi.rotorOne)
  lines[12] = string.format("Props: D%f S%f", demand.psi.propOne, supply.psi.propOne)
  lines[13] = "RPM"
  lines[14] = string.format("Hyd Pum: D%f S%f", demand.rpm.hydraulicPump, supply.rpm.hydraulicPump)
  lines[15] = string.format("Gen: D%f S%f", demand.rpm.generator, supply.rpm.generator)
  lines[16] = "H2O"
  lines[17] = string.format("Tank: D%f S%f", demand.H2O.tank, supply.H2O.tank)
  lines[18] = string.format("Boiler: D%f S%f", demand.H2O.boiler, supply.H2O.boiler)
  lines[19] = string.format("Splitter: D%f S%f", demand.H2O.splitter, supply.H2O.splitter)
  lines[20] = "CH4"
  lines[21] = string.format("Tank: D%f S%f", demand.CH4.tank, supply.CH4.tank)
  lines[22] = string.format("Boiler: D%f S%f", demand.CH4.boiler, supply.CH4.boiler)
  lines[23] = "H"
  lines[24] = string.format("Tank: D%f S%f", demand.H.tank, supply.H.tank)
  lines[25] = string.format("Bladders: D%f S%f", demand.H.bladders, supply.H.bladders)
  lines[26] = "O"
  lines[27] = string.format("Tank: D%f S%f", demand.O.tank, supply.O.tank)
  lines[28] = string.format("Boiler: D%f S%f", demand.O.boiler, supply.O.boiler)
  lines[29] = "Steam"
  lines[30] = string.format("Steam: D%f S%f", demand.steam, supply.steam)

  for i=1, 30 do
    if i < 16 then
      print(lines[i], 1, i*9-8, 15, false, 1, true)
    else
      print(lines[i], 120, i*9-143, 15, false, 1, true)
    end
  end
end
