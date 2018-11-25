
function drawShipDebugOne(s)
  lines={}

  lines[1]="Ship Status Page 1"
  lines[2]=string.format("Alt: %f", s.pos.z)
  lines[3]=string.format("VSI: %f", s.vsi)
  lines[4]=string.format("Con TP: %f", s.con.thrt.props)
  lines[5]=string.format("Con TR: %f", s.con.thrt.rotors)
  lines[6]=string.format("Con RP: %f", s.con.rot.props)
  lines[7]=string.format("Con RR: %f", s.con.rot.rotors)
  lines[8]=string.format("Env H2O: %f", s.env.H2O)
  lines[9]=string.format("Env CH4: %f", s.env.CH4)
  lines[10]="COMPONENTS"
  lines[11]=string.format("Displays S: %f", s.com.disps.st)
  lines[12]=string.format("Boiler S: %f", s.com.engine.bilr.st)
  lines[13]=string.format("Turbine S: %f", s.com.engine.turb.st)
  lines[14]=string.format("Hyd Res S: %f", s.com.hyd.res.st)
  lines[15]=string.format("Hyd Res L: %f", s.com.hyd.res.level)
  lines[16]=string.format("Hyd Pum S: %f", s.com.hyd.pump.st)
  lines[17]=string.format("Gen S: %f", s.com.gen.st)
  lines[18]=string.format("R1S: %f", s.com.rotors.one.st)
  lines[19]=string.format("R1R: %f", s.com.rotors.one.rot)
  lines[20]=string.format("R1T: %f", s.com.rotors.one.thrust)
  lines[21]=string.format("P1S: %f", s.com.props.one.st)
  lines[22]=string.format("P1R: %f", s.com.props.one.rot)
  lines[23]=string.format("P1T: %f", s.com.props.one.thrust)
  lines[24]=string.format("AccH2O S: %f", s.com.acc.H2O.st)
  lines[25]=string.format("AccCH4 S: %f", s.com.acc.CH4.st)
  lines[26]=string.format("BLAD1 S: %f", s.com.clls.one.st)
  lines[27]=string.format("BLAD1 L: %f", s.com.clls.one.level)
  lines[28]=string.format("Batt S: %f", s.com.btry.st)
  lines[29]=string.format("Batt L: %f", s.com.btry.level)
  lines[30]=string.format("Split S: %f", s.com.splitter.st)

  drawDebugLines(lines, 30)
end

function drawShipDebugTwo(s)
  lines={}

  lines[1]="Ship Status Page 2"
  lines[2]=string.format("T H S: %f", s.com.tanks.H.st)
  lines[3]=string.format("T H L: %f", s.com.tanks.H.level)
  lines[4]=string.format("T O S: %f", s.com.tanks.O.st)
  lines[5]=string.format("T O L: %f", s.com.tanks.O.level)
  lines[6]=string.format("T H2O S: %f", s.com.tanks.H2O.st)
  lines[7]=string.format("T H2O L: %f", s.com.tanks.H2O.level)
  lines[8]=string.format("T CH4 S: %f", s.com.tanks.CH4.st)
  lines[9]=string.format("T CH4 L: %f", s.com.tanks.CH4.level)

  drawDebugLines(lines, 9)
end

function drawSimDebug()
  lines={}

  lines[1]="Power"
  lines[2]=string.format("Displays: D%f S%f", sim.demand.kW.disps, sim.supply.kW.disps)
  lines[3]=string.format("Rotors: D%f S%f", sim.demand.kW.rotors.one, sim.supply.kW.rotors.one)
  lines[4]=string.format("Props: D%f S%f", sim.demand.kW.props.one, sim.supply.kW.props.one)
  lines[5]=string.format("Splitter: D%f S%f", sim.demand.kW.splitter, sim.supply.kW.splitter)
  lines[6]=string.format("H2OAcc: D%f S%f", sim.demand.kW.H2OAcc, sim.supply.kW.H2OAcc)
  lines[7]=string.format("CH4Acc: D%f S%f", sim.demand.kW.CH4Acc, sim.supply.kW.CH4Acc)
  lines[8]=string.format("Battery: D%f S%f", sim.demand.kW.btry, sim.supply.kW.btry)
  lines[9]="KNSM"
  lines[10]=string.format("Hyd Res: D%f S%f", sim.demand.kNSM.hydRes, sim.supply.kNSM.hydRes)
  lines[11]=string.format("Rotors: D%f S%f", sim.demand.kNSM.rotors.one, sim.supply.kNSM.rotors.one)
  lines[12]=string.format("Props: D%f S%f", sim.demand.kNSM.props.one, sim.supply.kNSM.props.one)
  lines[13]="NM"
  lines[14]=string.format("Hyd Pum: D%f S%f", sim.demand.NM.hydPump, sim.supply.NM.hydPump)
  lines[15]=string.format("Gen: D%f S%f", sim.demand.NM.gen, sim.supply.NM.gen)
  lines[16]="H2O"
  lines[17]=string.format("Tank: D%f S%f", sim.demand.H2O.tank, sim.supply.H2O.tank)
  lines[18]=string.format("Boiler: D%f S%f", sim.demand.H2O.bilr, sim.supply.H2O.bilr)
  lines[19]=string.format("Splitter: D%f S%f", sim.demand.H2O.splitter, sim.supply.H2O.splitter)
  lines[20]="CH4"
  lines[21]=string.format("Tank: D%f S%f", sim.demand.CH4.tank, sim.supply.CH4.tank)
  lines[22]=string.format("Boiler: D%f S%f", sim.demand.CH4.bilr, sim.supply.CH4.bilr)
  lines[23]="H"
  lines[24]=string.format("Tank: D%f S%f", sim.demand.H_M.tank, sim.supply.H_M.tank)
  lines[25]=string.format("Cells: D%f S%f", sim.demand.H_V.clls.one, sim.supply.H_V.clls.one)
  lines[26]="O"
  lines[27]=string.format("Tank: D%f S%f", sim.demand.O.tank, sim.supply.O.tank)
  lines[28]=string.format("Boiler: D%f S%f", sim.demand.O.bilr, sim.supply.O.bilr)
  lines[29]="Steam"
  lines[30]=string.format("Steam: D%f S%f", sim.demand.steam, sim.supply.steam)

  drawDebugLines(lines, 30)
end


function drawStorageDebug(sim)
  lines={}

  lines[1]="kW"
  lines[2]=string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.kW, sim.availableForStorage.kW)
  lines[3]="KNSM"
  lines[4]=string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.kNSM, sim.availableForStorage.kNSM)
  lines[5]="H2O"
  lines[6]=string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.H2O, sim.availableForStorage.H2O)
  lines[7]="CH4"
  lines[8]=string.format("In Storage: %f, Available for Storage: %f",
                           sim.availableForUse.CH4, sim.availableForStorage.CH4)
  lines[9]="H"
  lines[10]=string.format("In Storage: %f, Available for Storage: %f",
                            sim.availableForUse.H_M, sim.availableForStorage.H_M)
  lines[11]="O"
  lines[12]=string.format("In Storage: %f, Available for Storage: %f",
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
