KG_TO_N=9.81
H_MASS_TO_VOL=11.988
DRAG_COEFFICENT=0.26
FRONT_DRAG_AREA=28
BOTTOM_DRAG_AREA=64
GRAVITY=9.8
SEA_LEVEL_AIR_DENSITY=1.225
HYDROGEN_DENSITY=0.08988
WING_LIFT=128

HYDROGEN_LIFT_ADJ=5.95

SHIP_STRT_SPD=42
SHIP_MAX_SPD=300
SHIP_MAX_ALT=10000
SHIP_DRY_WEIGHT_KG=120000

DISPLAYS_PWR_DMD_KW=0.017

SPLTR_PWR_DMD_KW=0.05
SPLTR_MAX_H2O=2.4
SPLTR_PER_TIC_H=0.266
SPLTR_PER_TIC_O=2.128

RTR_MAX_THRST_KN=70000
RTR_MAX_PWR_DMD_KW=46.4
RTR_MAX_ROTATE_SPD_D=0.08
RTR_MAX_HYD_DMD_KNSM=6.4

PROP_MAX_THRST_KN=47600
PROP_MAX_PWR_DMD_KW=18.5
PROP_MAX_ROTATE_SPD_D=0.12
PROP_MAX_HYD_DMD_KNSM=5.2

GEN_MAX_KW=225
GEN_MAX_NM=516
TURB_MAX_NM=560
TURB_MAX_STEAM_KNSM=160
BILR_MAX_STEAM_KNSM=172
BILR_MAX_REG_STEAM_KNSM=104
BILR_H2O_KG_PER_KNSM=0.0008
BILR_CH4_KG_PER_KNSM=0.0394
BILR_O_KG_PER_KNSM=0.0152

BTRY_MAX_CHARGE_KW=350
BTRY_MAX_CHARGE_RATE_KW=0.022

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

H2O_ACC_PWR_DMD_KW=0.067
CH4_ACC_PWR_DMD_KW=0.117
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
  xCell=0,
  yCell=0,
	xOff=0,
	yOff=0
}

gg={
	ndl={
		vsi={x=109,y=79,c=5},
		hdg={x=175,y=79,c=5},
		rot={x=92,y=74,c=5},
		con_vsi={x=109,y=80,c=15},
		con_hdg={x=176,y=80,c=15},
		con_rot={x=93,y=75,c=15}
	},
	lvls={
		con_alt={x=114,y=68,w=4,h=24,c=15},
		con_thrt={x=138,y=68,w=4,h=24,c=15}
	},
	bars={
		alt={x=114,y=68,w=4,h=24,c=5},
		spd={x=138,y=68,w=4,h=24,c=5}
	}
}

strScreen=true
endScreen=false
showControls=false
showMap=false
controlType=0

RES_PT_COUNT=4200
MAP_DIM=500
mapVls={}
CH4pts={}
H2Opts={}

function upCam(x,y)
  cam.x=x
  cam.y=y
  cam.xCell=x//8
  cam.yCell=y//8
  cam.xOff=-(x%8)
  cam.yOff=-(y%8)
end

function initCam()
  upCam(p.x-120,136)
end

function initPlyr()
  p={
    s=257,
    x=492,
    y=190,
    vx=0,
    vy=0,
    flip=0,
  }
end

function initGame()
	-- Background color
	poke(0x03FF8,8)
	math.randomseed(8778)

	buildMap()
	music(0)
  initPlyr()
  initCam()
	initShip()
end

function initShip()
  s={
    spd=SHIP_STRT_SPD,accl=0,hdg=0,rot=0,vsi=0,setVsi=0,isCrash=false,dis=0,
    pos={x=0,y=0,z=1000},
    con={
      alt=1000,vsi=0.2,
      thrt={prps=0.3,rtrs=0.7},
      rot={prps=0,rtrs=0}
    },
    env={Atmo=SEA_LEVEL_AIR_DENSITY,H2O=0.0,CH4=0.0}
  }
  clDrw={s=482,w=5,h=2,rx=3}
  prpDrw={s=400,w=2,h=3}
  rtr1Drw={s=434,w=6,h=1}
  rtr2Drw={s=420,w=2,h=1}
	accH2O={
		st=1,
		wr=randRangeF(0.00001,0.00003),
		bb={{min_x=85,min_y=23,max_x=86,max_y=24}},
		drw={{s=430,w=2,h=2}}
	}
	accCH4={
		st=1,
		wr=randRangeF(0.00001,0.00003),
		bb={{min_x=83,min_y=27,max_x=84,max_y=28}},
		drw={{s=428,w=2,h=2}}
	}
	btry={
		st=1,
		wr=randRangeF(0.000003,0.000007),
		lvl=BTRY_MAX_CHARGE_KW,
		bb={{min_x=42,min_y=23,max_x=47,max_y=24}},
		drw={{s=448,w=3,h=2,rx=2}}
	}
	bilr={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		bb={{min_x=48,min_y=27,max_x=51,max_y=28}},
		drw={{s=459,w=3,h=2,rx=2}}
	}
	cl1={
		st=1,
		wr=0.00001, --randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=77,min_y=21,max_x=84,max_y=22}},
		drw={clDrw},
    bar={x=202,y=108,w=4,h=16,c=5}
	}
	cl2={
		st=1,
		wr=0.00001, --randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=68,min_y=21,max_x=75,max_y=22}},
		drw={clDrw},
    bar={x=210,y=108,w=4,h=16,c=5}
	}
	cl3={
		st=1,
		wr=0.00001, --randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=44,min_y=21,max_x=51,max_y=22}},
		drw={clDrw},
    bar={x=218,y=108,w=4,h=16,c=5}
	}
	cl4={
		st=1,
		wr=0.00001, --randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=35,min_y=21,max_x=42,max_y=22}},
		drw={clDrw},
    bar={x=226,y=108,w=4,h=16,c=5}
	}
	disps={
		st=1,
		on=true,
		bb={{min_x=56,min_y=23,max_x=59,max_y=24}},
		drw={{s=424,w=4,h=2}}
	}
	hydPump={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		bb={{min_x=37,min_y=27,max_x=38,max_y=28}},
		drw={{s=451,w=2,h=2}}
	}
	hydRes={
		st=1,
		wr=randRangeF(0.000002,0.000004),
		lvl=HYD_MAX_KNSM,
		bb={{min_x=37,min_y=23,max_x=38,max_y=24}},
		drw={{s=480,w=2,h=2}}
	}
	gen={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		bb={{min_x=40,min_y=27,max_x=43,max_y=28}},
		drw={{s=453,w=4,h=2}}
	}
	prp1={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{min_x=33,min_y=22,max_x=34,max_y=24}},
		drw={prpDrw},
    ndl={x=169,y=113,c=5},
    bar={x=161,y=108,w=2,h=11,c=5}
	}
	prp2={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{min_x=33,min_y=26,max_x=34,max_y=28}},
		drw={prpDrw},
    ndl={x=185,y=113,c=5},
    bar={x=177,y=108,w=2,h=11,c=5}
	}
	pto1={
		bb={{min_x=39,min_y=27,max_x=39,max_y=27},{min_x=39,min_y=28,max_x=39,max_y=28}},
		drw={{s=462,w=1,h=1},{s=463,w=1,h=1}}
	}
	pto2={
		bb={{min_x=44,min_y=27,max_x=45,max_y=27},{min_x=44,min_y=28,max_x=45,max_y=28}},
		drw={{s=462,w=1,h=1},{s=463,w=1,h=1}}
	}
	rtr1={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{min_x=76,min_y=32,max_x=81,max_y=32},{min_x=78,min_y=31,max_x=79,max_y=31}},
		drw={rtr1Drw,rtr2Drw},
    ndl={ x=85,y=110,c=5},
    bar={x=73,y=108,w=2,h=11,c=5}
	}
	rtr2={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{min_x=66,min_y=32,max_x=71,max_y=32},{min_x=68,min_y=31,max_x=69,max_y=31}},
		drw={rtr1Drw,rtr2Drw},
    ndl={x=101,y=110,c=5},
    bar={x=89,y=108,w=2,h=11,c=5}
	}
	rtr3={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{min_x=48,min_y=32,max_x=53,max_y=32},{min_x=50,min_y=31,max_x=51,max_y=31}},
		drw={rtr1Drw,rtr2Drw},
    ndl={x=133,y=110,c=5},
    bar={x=121,y=108,w=2,h=11,c=5}
	}
	rtr4={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{min_x=38,min_y=32,max_x=43,max_y=32},{min_x=40,min_y=31,max_x=41,max_y=31}},
		drw={rtr1Drw,rtr2Drw},
    ndl={x=149,y=110,c=5},
    bar={x=137,y=108,w=2,h=11,c=5}
	}
	spltr={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		bb={{min_x=62,min_y=28,max_x=63,max_y=28}},
		drw={{s=418,w=2,h=1}}
	}
	tkH={
		st=1,
		wr=randRangeF(0.000001,0.000002),
		lvl=H_TANK_MAX_KG,
		bb={{min_x=58,min_y=26,max_x=61,max_y=29}},
		drw={{s=478,w=2,h=3,ry=2}}
	}
	tkO={
		st=1,
		wr=randRangeF(0.000001,0.000002),
		lvl=O_TANK_MAX_KG,
		bb={{min_x=58,min_y=31,max_x=61,max_y=32}},
		drw={{s=492,w=2,h=2}}
	}
	tkH2O={
		st=1,
		wr=randRangeF(0.000001,0.000002),
		lvl=H2O_TANK_MAX_KG,
		bb={{min_x=68,min_y=27,max_x=73,max_y=28}},
		drw={{s=487,w=3,h=2,rx=2}},
    bar={x=202,y=68,w=4,h=24,c=5}
	}
	tkCH4={
		st=1,
		wr=randRangeF(0.000001,0.000002),
		lvl=CH4_TANK_MAX_KG,
		bb={{min_x=75,min_y=27,max_x=80,max_y=28}},
		drw={{s=490,w=2,h=2}},
    bar={x=218,y=68,w=4,h=24,c=5}
	}
	turb={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		bb={{min_x=46,min_y=27,max_x=47,max_y=28}},
		drw={{s=457,w=2,h=2}}
	}
	drw1={disps,bilr,turb,hydRes,hydPump,gen,rtr1,rtr3,prp1,prp2,accH2O,accCH4,spltr,tkO,tkH2O,pto1,pto2}
	drw2={cl1,cl2,cl3,cl4,rtr2,rtr4,tkH,tkCH4,btry}
	wear={bilr,turb,hydRes,hydPump,gen,rtr1,rtr2,rtr3,rtr4,prp1,prp2,accH2O,accCH4,cl1,cl2,cl3,cl4,btry,spltr,tkH,tkO,tkH2O,tkCH4}
  ggPrp={prp1,prp2}
  ggRtr={rtr1,rtr2,rtr3,rtr4}
  ggCl={cl1,cl2,cl3,cl4}
end

function buildMap()
	for i=1,RES_PT_COUNT do
		CH4pts[i]={x=math.random(-MAP_DIM,MAP_DIM),y=math.random(-MAP_DIM,MAP_DIM)}
		H2Opts[i]={x=math.random(-MAP_DIM,MAP_DIM),y=math.random(-MAP_DIM,MAP_DIM)}
	end
end

function mapVertLoc()
  xLoc=((s.dis/1000)%(240*8))+cam.x
  yLoc=lerp(102*8,51*8,clamp01(invLerp(0,SHIP_MAX_ALT,s.pos.z)))
  return {x=xLoc,y=yLoc}
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

		if comContains(disps.bb,{x=p.x,y=p.y}) then
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
			if btnp(3) then controlType=controlType+1 end

			if controlType<0 then controlType=4 end
			if controlType>4 then controlType=0 end

			if controlType==0 then
				if btn(0) then s.con.rot.rtrs=s.con.rot.rtrs+1 end
				if btn(1) then s.con.rot.rtrs=s.con.rot.rtrs-1 end
				if s.con.rot.rtrs<0 then s.con.rot.rtrs=0 end
				if s.con.rot.rtrs>90 then s.con.rot.rtrs=90 end
			elseif controlType==1 then
				if btn(0) then s.con.vsi=s.con.vsi+0.02 end
				if btn(1) then s.con.vsi=s.con.vsi-0.02 end
				if s.con.vsi<-1.2 then s.con.vsi=-1.2 end
				if s.con.vsi>1.2 then s.con.vsi=1.2 end
			elseif controlType==2 then
				if btn(0) then s.con.alt=s.con.alt+10 end
				if btn(1) then s.con.alt=s.con.alt-10 end
				if s.con.alt<0 then s.con.alt=0 end
				if s.con.alt>SHIP_MAX_ALT then s.con.alt=SHIP_MAX_ALT end
			elseif controlType==3 then
				if btn(0) then s.con.thrt.prps=s.con.thrt.prps+0.01 end
				if btn(1) then s.con.thrt.prps=s.con.thrt.prps-0.01 end
				if s.con.thrt.prps<0.0 then s.con.thrt.prps=0.0 end
				if s.con.thrt.prps>1 then s.con.thrt.prps=1 end
			elseif controlType==4 then
				if btn(0) then s.con.rot.prps=s.con.rot.prps-1 end
				if btn(1) then s.con.rot.prps=s.con.rot.prps+1 end
				if s.con.rot.prps<0 then s.con.rot.prps=360 end
				if s.con.rot.prps>360 then s.con.rot.prps=s.con.rot.prps-360 end
			end
		else
			playerMovement()
		end

		cls(0)
		simulate()

		applyWear()

		if not showMap then
			drwGame()
		end

		if showMap then
			drwMap(30,17)
		end

		drwShipSt()
	end
	str.t=str.t+1
end

function playerMovement()
	onFloor=false
	inCeiling=false
	onLadder=false
	testX=p.x // 8
	testY=p.y // 8
	testYD=(p.y // 8)+1
	testYU=(p.y // 8)-1
	downId=mget(testX,testYD)
	if downId==16 or downId==189 or downId==158 then onFloor=true end
	if mget(testX,testYU)==16 then inCeiling=true end
	if mget(testX,testY)==32 or mget(testX,testYD)==32 then onLadder=true end

	if btn(0) and onLadder then
		p.vy=math.max(p.vy-0.06,-.3)
	elseif btn(1) and onLadder and not onFloor then
		p.vy=math.max(p.vy+0.06,.3)
	elseif onLadder then
		p.vy=0.0
	elseif btn(0) and onFloor then
		p.vy=-1.2
	elseif p.vy==0 and onFloor then
		p.y=testY*8+1
		p.vy=math.min(p.vy,0.0)
	elseif not onFloor then
		p.vy=math.min(p.vy+0.1,2.0)
	else
		p.vy=0.0
	end

	if inCeiling and p.vy<0 then
		p.vy=-p.vy
	end

	isAcc=false
	isDeAcc=false

	if btn(2) then
		p.vx=math.max(p.vx-0.06,-0.8)
		isAcc=p.vx>-.3
	elseif btn(3) then
		p.vx=math.min(p.vx+0.06,0.8)
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

  upCam(lerp(cam.x,p.x-120,0.15),lerp(cam.y,136,0.15))

	if p.y>234 then
		if p.x<292 then p.x=292 end
		if p.x>668 then p.x=668 end
	elseif p.y>202 then
		if p.x<268 then p.x=268 end
		if p.x>684 then p.x=684 end
	else
		if p.x<268 then p.x=268 end
		if p.x>700 then p.x=700 end
	end

	if p.y>257 then p.y=257 end
	if p.y<176 then p.y=176 end
end

function doRepairs()
	tP={x=p.x,y=p.y}
	if btn(6) then
		for i,com in pairs(wear) do
			maybeDoRepair(com,tP)
		end
	end
end

function applyWear()
	for i,com in pairs(wear) do
		if com.st~=nil and com.wr~=nil then
			com.st=com.st-com.wr
		end
	end
end

function maybeDoRepair(c,p)
	if comContains(c.bb,p) then c.st=math.min(c.st+0.01,1) end
end

function playAmbient(c,dis,channel,id,note)
	sfx(id,note,-1,channel,clamp01(invLerp(2000,0,dis))*12//1,0)
end

function playAmbientChannel(ch,comps,count)
	nearDis=1000000
	nearest=nil
	for i=1,count do
		item=comps[i]
		soundPos=scaleV2(bbCenter(item.c.bb),8)
		soundDis=sqrDistance({x=p.x,y=p.y},soundPos)
		if soundDis<nearDis then
			nearDis=soundDis
			nearest=item
		end
	end

	if nearest~=nil then
		playAmbient(nearest.c,nearDis,ch,nearest.id,nearest.nt)
	end
end

function drwShipSt()
	repair=math.max((math.min(disps.st,bilr.st,turb.st,hydRes.st,hydPump.st,
      gen.st,rtr1.st,rtr2.st,rtr3.st,rtr4.st,prp1.st,prp2.st,accH2O.st,
      accCH4.st,cl1.st,cl2.st,cl3.st,cl4.st,btry.st,spltr.st,tkH.st,tkO.st,
			tkH2O.st,tkCH4.st)*100+0.5)//1,0)
	resources=(math.min((tkH2O.lvl/H2O_TANK_MAX_KG)*100+0.5,
											(tkCH4.lvl/CH4_TANK_MAX_KG)*100+0.5))//1
	rect(0,0,96,8,8)
	rect(127,0,113,8,8)
	print(string.format("Speed: %d",s.spd//1),1,1,6,false,1,true)
	if s.pos.z >=1000 then
		print(string.sub(string.format("Altitude: %f",s.pos.z/1000.0),1,-6).."k",48,1,6,false,1,true)
	else
		print(string.format("Altitude: %d",s.pos.z//1),48,1,6,false,1,true)
	end
	print(string.format("Repair: %d%%",repair),128,1,6,false,1,true)
	print(string.format("Resources: %d%%",resources),180,1,6,false,1,true)

	if s.pos.z<1 and s.spd<1 and resources<1 then
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
		for i=1,RES_PT_COUNT do
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

function drwMap(xSize,ySize,xOff,yOff)
	if xOff==nil then xOff=0 end
	if yOff==nil then yOff=0 end
	sP=getShipTilePos()
	cYOffset=sP.y-ySize//2
	cXOffset=sP.x-xSize//2
	-- print(string.format("%d:%d",cXOffset,cYOffset),2,2,10,false,1,true)
	-- print(string.format("%d:%d",s.pos.x//1,s.pos.y//1),2,10,10,false,1,true)
	for cY=cYOffset,ySize+cYOffset do
		for cX=cXOffset,xSize+cXOffset do
			mapVl=getMapTile(cX,cY)
			spr(lerp(144,148,mapVl.CH4),(cX-cXOffset-1)*8+xOff,
					(cY-cYOffset-1)*8+yOff,0)
			spr(lerp(149,153,mapVl.H2O),(cX-cXOffset-1)*8+xOff,
					(cY-cYOffset-1)*8+yOff,0)
		end
	end
end

function drwGame()
  drwEnv()
	drwShip()

	if showControls then
		map(0,125,30,11,0,48)

		print("DLS Radar",8,57,15,false,1,true)
		print("RTR",78,57,6,false,1,true)
		print("Angl",74,65,6,false,1,true)
		print("VS",100,57,6,false,1,true)
		print("Alt",111,57,6,false,1,true)
		print("Spd",135,57,6,false,1,true)
		print("Heading",163,57,6,false,1,true)
		print("H2O",199,57,6,false,1,true)
		print("CH4",215,57,6,false,1,true)

		drwNdlLvlSt(gg.ndl.vsi,s.vsi,-1.2,1.2,0,180,8)
		drwNdlLvlSt(gg.ndl.con_vsi,s.con.vsi,-1.2,1.2,0,180,10)

		drwNdlAglSt(gg.ndl.hdg,s.hdg,{ x=0,y=-8 })
		drwNdlAglSt(gg.ndl.rot,s.rot,{ x=0,y=15 })
		drwNdlAglSt(gg.ndl.con_hdg,s.con.rot.prps,
										 { x=0,y=-10 })
		drwNdlAglSt(gg.ndl.con_rot,s.con.rot.rtrs,
										 { x=0,y=17 })

		drwBarSt(gg.bars.alt,s.pos.z,SHIP_MAX_ALT)
		drwBarSt(gg.bars.spd,s.spd,SHIP_MAX_SPD)

		drwBarSt(tkH2O.bar,tkH2O.lvl,H2O_TANK_MAX_KG)
		drwBarSt(tkCH4.bar,tkCH4.lvl,CH4_TANK_MAX_KG)

		altY=lerp(91,67,invLerp(0,SHIP_MAX_ALT,s.pos.z))-2.5
		spdY=lerp(91,67,invLerp(0,SHIP_MAX_SPD,s.spd))-2.5
		print(string.sub(string.format("%f",s.pos.z/1000.0),1,-6).."k",120,altY,5,false,1,true)
		if s.spd<100 then
			print(string.sub(string.format("%f",s.spd),1,-6),144,spdY,5,false,1,true)
		else
			print(string.format("%d",s.spd//1),144,spdY,5,false,1,true)
		end

		drwLvlSt(gg.lvls.con_alt,s.con.alt,SHIP_MAX_ALT)
		drwLvlSt(gg.lvls.con_thrt,s.con.thrt.prps,1)

		print("PRP1",159,100,6,false,1,true)
		print("PRP2",178,100,6,false,1,true)

    for i,prp in pairs(ggPrp) do
      drwPropRotSt(prp.ndl,prp.rot)
      drwPropThrstSt(prp.bar,prp.thrst)
    end

		print("RTR1",71,100,6,false,1,true)
		print("RTR2",90,100,6,false,1,true)
		print("RTR3",119,100,6,false,1,true)
		print("RTR4",138,100,6,false,1,true)

    for i,rtr in pairs(ggRtr) do
      drwRtrRotSt(rtr.ndl,rtr.rot)
      drwRtrThrstSt(rtr.bar,rtr.thrst)
    end

		print("Hyd Cells",199,100,6,false,1,true)

    for i,cl in pairs(ggCl) do
      drwBarSt(cl.bar,cl.lvl,CLL_MAX_M3)
    end

		drwMap(5,7,16,72)
		sHRot=0
		if s.hdg>=45 and s.hdg<135 then
			sHRot=1
		elseif s.hdg>=135 and s.hdg<225 then
			sHRot=2
		elseif s.hdg>=225 and s.hdg<315 then
			sHRot=3
		end
		spr(422,28,92,0,1,0,sHRot)

		if controlType==0 then
			rectb(71,63,26,34,7)
		elseif controlType==1 then
			rectb(95,63,18,34,7)
		elseif controlType==2 then
			rectb(111,63,24,34,7)
		elseif controlType==3 then
			rectb(135,63,24,34,7)
		elseif controlType==4 then
			rectb(159,63,34,34,7)
		end
	end
end

function drwEnv()
  vLoc=mapVertLoc()
  xDiff=vLoc.x%8
  yDiff=vLoc.y%8
  map(vLoc.x//8,vLoc.y//8,31,18,-xDiff,-yDiff)
end

function drwShip()
	maxMapHeight=18
	mapYAdjust=0
	if showControls then
		maxMapHeight=6
		mapYAdjust=3
	end
  yDown=mapYAdjust*-8

  map(cam.xCell,cam.yCell+mapYAdjust,31,maxMapHeight,cam.xOff,cam.yOff,0)

	for i,drw in pairs(drw1) do
		drwCom(drw,yDown)
	end

	spr(p.s,p.x-cam.x-4,p.y-cam.y-9+yDown,0,1,p.flip,0,1,2)

	for i,drw in pairs(drw2) do
		drwCom(drw,yDown)
	end
end

function drwCom(com,yDown)
	for i,bb in pairs(com.bb) do
		drwPart(bb,com.drw[i],yDown)
	end

	if com.st~=nil then
		local bb=joinBBs(com.bb)
    local posX=(bb.min_x-cam.xCell)*8+cam.xOff
		baseY=(bb.max_y*8-cam.y+9)
		baseX=posX+((bb.max_x-bb.min_x)/2)*8-4
		sW=(lerp(0,16,com.st)+0.5)//1
		rect(baseX,baseY,sW,2,6)
		rect(baseX+sW,baseY,16-sW,2,5)
	end
end

function drwPart(bb,drw,yDown)
  local posX=bb.min_x-cam.xCell
  local posY=bb.min_y-cam.yCell
  local reqX=bb.max_x-bb.min_x
  local reqY=bb.max_y-bb.min_y

  local ySub=0
  for y=0,reqY do
    yAdj=y
    if drw.ry~=nil and y>=drw.ry-1 and y<reqX-(drw.ry-1) then
      yAdj=drw.ry-1
      ySub=ySub+1
    elseif drw.ry~=nil and y>drw.ry-1 then
      yAdj=yAdj-ySub
    else
      yAdj=y%drw.h
    end
    yOff=yAdj*16
    local xSub=0
    for x=0,reqX do
      xOff=x
      if drw.rx~=nil and x>=drw.rx-1 and x<reqX-(drw.rx-1) then
        xOff=drw.rx-1
        xSub=xSub+1
      elseif drw.rx~=nil and x>drw.rx-1 then
        xOff=xOff-xSub
      else
        xOff=x%drw.w
      end
      spr(drw.s+yOff+xOff,(posX+x)*8+cam.xOff,(posY+y)*8+cam.yOff+yDown,0)
    end
  end
end

function drwNdlAglSt(needle,angle,vec)
	target=rotV2(vec,angle)
	line(needle.x,needle.y,needle.x+target.x,needle.y+target.y,needle.c)
end

function drwNdlLvlSt(needle,value,min_value,max_value,min_angle,max_angle,length)
	vec={x=0,y=length}
	normal=invLerp(min_value,max_value,value)
	angle=clamp(lerp(min_angle,max_angle,normal),min_angle,max_angle)
	drwNdlAglSt(needle,angle,vec)
end

function drwPropRotSt(needle,angle)
	drwNdlAglSt(needle,angle,{x=0,y=-5})
end

function drwRtrRotSt(needle,angle)
	drwNdlAglSt(needle,angle,{x=0,y=7})
end

function drwLvlSt(lvl,value,max)
	baseY=lvl.y+lvl.h
	normal=invLerp(0,max,value)
	lvlHeight=(lerp(0,lvl.h,normal)+1.5)//1
	lvlY=baseY-lvlHeight
	line(lvl.x,lvlY,lvl.x+lvl.w-1,lvlY,lvl.c)
end

function drwBarSt(bar,value,max)
	baseY=bar.y+bar.h
	normal=invLerp(0,max,value)
	barHeight=(lerp(0,bar.h,normal)+0.5)//1
	barY=baseY-barHeight
	rect(bar.x,barY,bar.w,barHeight,bar.c)
end

function drwPropThrstSt(bar,thrst)
	drwBarSt(bar,thrst,PROP_MAX_THRST_KN)
end

function drwRtrThrstSt(bar,thrst)
	drwBarSt(bar,thrst,RTR_MAX_THRST_KN)
end

function dmgSysts(vSpeed)
  for i,com in pairs(wear) do
    if math.random()>clamp01(invLerp(-16,0,vSpeed)) then
      com.st=math.max(com.st-clamp01(invLerp(0,-8,vSpeed)),0)
    end
  end
end

function simulate()
	dmd={
		kW={disps=0,rtr1=0,rtr2=0,rtr3=0,rtr4=0,prp1=0,prp2=0,spltr=0,H2OAcc=0,CH4Acc=0,btry=0},
		kNSM={hydRes=0,rtr1=0,rtr2=0,rtr3=0,rtr4=0,prp1=0,prp2=0},
		NM={hydPump=0,gen=0},
		H2O={tank=0,bilr=0,spltr=0},
		CH4={tank=0,bilr=0},
		H_M={tank=0},
		H_V={cl1=0,cl2=0,cl3=0,cl4=0},
		O={tank=0,bilr=0},
		steam=0
	}
	sply={
		kW={disps=0,rtr1=0,rtr2=0,rtr3=0,rtr4=0,prp1=0,prp2=0,spltr=0,H2OAcc=0,CH4Acc=0,btry=0},
		kNSM={hydRes=0,rtr1=0,rtr2=0,rtr3=0,rtr4=0,prp1=0,prp2=0},
		NM={hydPump=0,gen=0},
		H2O={tank=0,bilr=0,spltr=0},
		CH4={tank=0,bilr=0},
		H_M={tank=0},
		H_V={cl1=0,cl2=0,cl3=0,cl4=0},
		O={tank=0,bilr=0},
		steam=0
	}
	avlb4Use={
		kW=btry.lvl,
		kNSM=hydRes.lvl,
		H2O=tkH2O.lvl,
		CH4=tkCH4.lvl,
		H_M=tkH.lvl,
		H_V=tkH.lvl*H_MASS_TO_VOL,
		O=tkO.lvl
	}
	avlb4Stg={kW=0,kNSM=0,H2O=0,CH4=0,H_M=0,H_V=0,O=0}

	cntrlsPwrDmd()
	cntrlsHydDmd()
	strgTanksDmd()
	cellDmd()
	btryHydDmd()
	spltrAccDmd()
	genTurbDmd()
	bilrDmd()

	elementSupply()
	steamSupply()
	torqueSupply()
	hydSupply()
	pwrSupply()

	distHyds()
	distPwr()

	drainTanks()
	fillTanks()
	applyThrst()
	applyForces()
end

function cntrlsPwrDmd()
	dmd.kW.disps=DISPLAYS_PWR_DMD_KW
	dmd.kW.rtr1=RTR_MAX_PWR_DMD_KW*rtr1.st*s.con.thrt.rtrs
	dmd.kW.rtr2=RTR_MAX_PWR_DMD_KW*rtr2.st*s.con.thrt.rtrs
	dmd.kW.rtr3=RTR_MAX_PWR_DMD_KW*rtr3.st*s.con.thrt.rtrs
	dmd.kW.rtr4=RTR_MAX_PWR_DMD_KW*rtr4.st*s.con.thrt.rtrs
	dmd.kW.prp1=PROP_MAX_PWR_DMD_KW*prp1.st*s.con.thrt.prps
	dmd.kW.prp2=PROP_MAX_PWR_DMD_KW*prp2.st*s.con.thrt.prps
end

function cntrlsHydDmd()
	dmd.kNSM.rtr1=calcHydDmd(rtr1.rot,s.con.rot.rtrs,rtr1.st,RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.rtr2=calcHydDmd(rtr2.rot,s.con.rot.rtrs,rtr2.st,RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.rtr3=calcHydDmd(rtr3.rot,s.con.rot.rtrs,rtr3.st,RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.rtr4=calcHydDmd(rtr4.rot,s.con.rot.rtrs,rtr4.st,RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.prp1=calcHydDmd(prp1.rot,s.con.rot.prps,prp1.st,PROP_MAX_ROTATE_SPD_D,PROP_MAX_HYD_DMD_KNSM)
	dmd.kNSM.prp2=calcHydDmd(prp2.rot,s.con.rot.prps,prp2.st,PROP_MAX_ROTATE_SPD_D,PROP_MAX_HYD_DMD_KNSM)
end

function strgTanksDmd()
	dmd.H2O.tank=math.min(H2O_TANK_MAX_KG-tkH2O.lvl,H2O_TANK_MAX_KGF)
	dmd.CH4.tank=math.min(CH4_TANK_MAX_KG-tkCH4.lvl,CH4_TANK_MAX_KGF)
	dmd.H_M.tank=math.min(H_TANK_MAX_KG-tkH.lvl,H_TANK_MAX_KGF)
	dmd.O.tank=math.min(O_TANK_MAX_KG-tkO.lvl,O_TANK_MAX_KGF)
end

function cellDmd()
	if cl1.vent<=0 then dmd.H_V.cl1=math.min(CLL_MAX_M3-cl1.lvl,-cl1.vent) end
	if cl2.vent<=0 then dmd.H_V.cl2=math.min(CLL_MAX_M3-cl2.lvl,-cl2.vent) end
	if cl3.vent<=0 then dmd.H_V.cl3=math.min(CLL_MAX_M3-cl3.lvl,-cl3.vent) end
	if cl4.vent<=0 then dmd.H_V.cl4=math.min(CLL_MAX_M3-cl4.lvl,-cl4.vent) end
end

function btryHydDmd()
	btryStateDmd=math.min(BTRY_MAX_CHARGE_RATE_KW,BTRY_MAX_CHARGE_KW*btry.st-btry.lvl)
	dmd.kW.btry=math.max(btryStateDmd,0)
  dmd.kNSM.hydRes=HYD_MAX_KNSM-hydRes.lvl
  dmd.NM.hydPump=math.min(HYD_PUMP_MAX_NM,dmd.kNSM.hydRes*HYD_PUMP_NM_PER_KNSM)
end

function spltrAccDmd()
	if dmd.H_M.tank>0 or dmd.O.tank>0 then
		dmd.kW.spltr=SPLTR_PWR_DMD_KW*spltr.st
		dmd.H2O.spltr=SPLTR_MAX_H2O*spltr.st
	end
	if dmd.H2O.tank>0 then dmd.kW.H2OAcc=H2O_ACC_PWR_DMD_KW*accH2O.st end
  if dmd.CH4.tank>0 then dmd.kW.CH4Acc=CH4_ACC_PWR_DMD_KW*accCH4.st end
end

function genTurbDmd()
	ttlPwrDmd=math.min(GEN_MAX_KW*gen.st,dmd.kW.disps+dmd.kW.rtr1+dmd.kW.rtr2+
      dmd.kW.rtr3+dmd.kW.rtr4+dmd.kW.prp1+dmd.kW.prp2+dmd.kW.spltr+
      dmd.kW.H2OAcc+dmd.kW.CH4Acc+dmd.kW.btry)
	dmd.NM.gen=(ttlPwrDmd/GEN_MAX_KW)*GEN_MAX_NM
  ttlTorqueDmd=math.min(TURB_MAX_NM*turb.st,dmd.NM.gen+dmd.NM.hydPump)
  dmd.steam=(ttlTorqueDmd/TURB_MAX_NM)*TURB_MAX_STEAM_KNSM
end

function bilrDmd()
	superSteamDmd=0
	if dmd.steam >= BILR_MAX_REG_STEAM_KNSM then
		superSteamDmd=(dmd.steam-BILR_MAX_REG_STEAM_KNSM)*bilr.st
	end
	steamDmd=math.min(BILR_MAX_STEAM_KNSM*bilr.st,dmd.steam)
	dmd.H2O.bilr=steamDmd*BILR_H2O_KG_PER_KNSM
	dmd.CH4.bilr=steamDmd*BILR_CH4_KG_PER_KNSM
	dmd.O.bilr=superSteamDmd*BILR_O_KG_PER_KNSM
end

function elementSupply()
	sply.O.bilr=math.min(dmd.O.bilr,avlb4Use.O)
	sply.CH4.bilr=math.min(dmd.CH4.bilr,avlb4Use.CH4)
	ttlH2ODmd=dmd.H2O.bilr+dmd.H2O.spltr
	if avlb4Use.H2O>ttlH2ODmd then
		sply.H2O.bilr=dmd.H2O.bilr
		sply.H2O.spltr=dmd.H2O.spltr
	elseif avlb4Use.H2O>0 then
		bilrPrct=dmd.H2O.bilr/ttlH2ODmd
		spltrPrct=dmd.H2O.spltr/ttlH2ODmd
		sply.H2O.bilr=bilrPrct*avlb4Use.H2O
		sply.H2O.spltr=spltrPrct*avlb4Use.H2O
	end
	ttlH_VDmd=dmd.H_V.cl1+dmd.H_V.cl2+dmd.H_V.cl3+dmd.H_V.cl4
	if avlb4Use.H_V>ttlH_VDmd then
		sply.H_V.cl1=dmd.H_V.cl1
		sply.H_V.cl2=dmd.H_V.cl2
		sply.H_V.cl3=dmd.H_V.cl3
		sply.H_V.cl4=dmd.H_V.cl4
	elseif avlb4Use.H_V>0 then
		b1Prct=dmd.H_V.cl1/ttlH_VDmd
		b2Prct=dmd.H_V.cl2/ttlH_VDmd
		b3Prct=dmd.H_V.cl3/ttlH_VDmd
		b4Prct=dmd.H_V.cl4/ttlH_VDmd
		sply.H_V.cl1=b1Prct*avlb4Use.H_V
		sply.H_V.cl2=b2Prct*avlb4Use.H_V
		sply.H_V.cl3=b3Prct*avlb4Use.H_V
		sply.H_V.cl4=b4Prct*avlb4Use.H_V
	end
end

function steamSupply()
	spldH2O_KNSM=sply.H2O.bilr/BILR_H2O_KG_PER_KNSM
	spldCH4_KNSM=sply.CH4.bilr/BILR_CH4_KG_PER_KNSM
	spldO_KNSM=sply.O.bilr/BILR_O_KG_PER_KNSM
	if spldH2O_KNSM<spldCH4_KNSM then
		spldCH4_KNSM=spldH2O_KNSM
		sply.CH4.bilr=spldCH4_KNSM*BILR_CH4_KG_PER_KNSM
	elseif spldCH4_KNSM<spldH2O_KNSM then
		spldH2O_KNSM=spldCH4_KNSM
		sply.H2O.bilr=spldH2O_KNSM*BILR_H2O_KG_PER_KNSM
	end
	spldKNSM=spldCH4_KNSM
	if spldKNSM>BILR_MAX_REG_STEAM_KNSM then
		superSteam=spldKNSM-BILR_MAX_REG_STEAM_KNSM
		if spldO_KNSM >= superSteam then
			sply.O.bilr=superSteam*BILR_O_KG_PER_KNSM
		else
			missing=superSteam-spldO_KNSM
			spldKNSM=spldKNSM-missing
			sply.CH4.bilr=spldKNSM*BILR_CH4_KG_PER_KNSM
			sply.H2O.bilr=spldKNSM*BILR_H2O_KG_PER_KNSM
		end
	end
	sply.steam=spldKNSM
end

function torqueSupply()
	torqueSpld=TURB_MAX_NM*(sply.steam/TURB_MAX_STEAM_KNSM)
	torqueDmd=dmd.NM.gen+dmd.NM.hydPump

	if torqueSpld >= torqueDmd then
		sply.NM.gen=dmd.NM.gen
		sply.NM.hydPump=dmd.NM.hydPump
	else
		genPrct=dmd.NM.gen/torqueDmd
		pumpPrct=dmd.NM.hydPump/torqueDmd
		sply.NM.gen=torqueSpld*genPrct
		sply.NM.hydPump=torqueSpld*pumpPrct
	end
end

function hydSupply()
	sply.kNSM.hydRes=sply.NM.hydPump*HYD_PUMP_NM_PER_KNSM

	tlPrssDmd=dmd.kNSM.rtr1+dmd.kNSM.rtr2+dmd.kNSM.rtr3+dmd.kNSM.rtr4+
            dmd.kNSM.prp1+dmd.kNSM.prp2

	if avlb4Use.kNSM >= tlPrssDmd then
		sply.kNSM.rtr1=dmd.kNSM.rtr1
		sply.kNSM.rtr2=dmd.kNSM.rtr2
		sply.kNSM.rtr3=dmd.kNSM.rtr3
		sply.kNSM.rtr4=dmd.kNSM.rtr4
		sply.kNSM.prp1=dmd.kNSM.prp1
		sply.kNSM.prp2=dmd.kNSM.prp2
	elseif avlb4Use.kNSM>0 then
		rtrs1Prct=dmd.kNSM.rtr1/tlPrssDmd
		rtrs2Prct=dmd.kNSM.rtr2/tlPrssDmd
		rtrs3Prct=dmd.kNSM.rtr3/tlPrssDmd
		rtrs4Prct=dmd.kNSM.rtr4/tlPrssDmd
		prps1Prct=dmd.kNSM.prp1/tlPrssDmd
		prps2Prct=dmd.kNSM.prp2/tlPrssDmd

		sply.kNSM.rtr1=rtrs1Prct*avlb4Use.kNSM
		sply.kNSM.rtr2=rtrs2Prct*avlb4Use.kNSM
		sply.kNSM.rtr3=rtrs3Prct*avlb4Use.kNSM
		sply.kNSM.rtr4=rtrs4Prct*avlb4Use.kNSM
		sply.kNSM.prp1=prps1Prct*avlb4Use.kNSM
		sply.kNSM.prp2=prps2Prct*avlb4Use.kNSM
	end
end

function pwrSupply()
	genPwr=GEN_MAX_KW*(sply.NM.gen/GEN_MAX_NM)
	btryPwr=avlb4Use.kW
	ttlPwrDmd=dmd.kW.disps+dmd.kW.btry+dmd.kW.rtr1+dmd.kW.rtr2+dmd.kW.rtr3+
            dmd.kW.rtr4+dmd.kW.prp1+dmd.kW.prp2+dmd.kW.spltr+dmd.kW.H2OAcc+
            dmd.kW.CH4Acc

	if ttlPwrDmd<=genPwr then
		sply.kW.disps=dmd.kW.disps
		sply.kW.rtr1=dmd.kW.rtr1
		sply.kW.rtr2=dmd.kW.rtr2
		sply.kW.rtr3=dmd.kW.rtr3
		sply.kW.rtr4=dmd.kW.rtr4
		sply.kW.prp1=dmd.kW.prp1
		sply.kW.prp2=dmd.kW.prp2
		sply.kW.spltr=dmd.kW.spltr
		sply.kW.H2OAcc=dmd.kW.H2OAcc
		sply.kW.CH4Acc=dmd.kW.CH4Acc
		sply.kW.btry=dmd.kW.btry
	elseif ttlPwrDmd<=(genPwr+btryPwr) then
		sply.kW.disps= dmd.kW.disps
		sply.kW.rtr1=dmd.kW.rtr1
		sply.kW.rtr2=dmd.kW.rtr2
		sply.kW.rtr3=dmd.kW.rtr3
		sply.kW.rtr4=dmd.kW.rtr4
		sply.kW.prp1=dmd.kW.prp1
		sply.kW.prp2=dmd.kW.prp2
		sply.kW.spltr=dmd.kW.spltr
		sply.kW.H2OAcc=dmd.kW.H2OAcc
		sply.kW.CH4Acc=dmd.kW.CH4Acc
		sply.kW.btry=dmd.kW.btry

		btryUse=ttlPwrDmd-genPwr
		avlb4Stg.kW=avlb4Stg.kW-btryUse
	else
		dispsPrct=dmd.kW.disps/ttlPwrDmd
		rtrs1Prct=dmd.kW.rtr1/ttlPwrDmd
		rtrs2Prct=dmd.kW.rtr2/ttlPwrDmd
		rtrs3Prct=dmd.kW.rtr3/ttlPwrDmd
		rtrs4Prct=dmd.kW.rtr4/ttlPwrDmd
		prps1Prct=dmd.kW.prp1/ttlPwrDmd
		prps2Prct=dmd.kW.prp2/ttlPwrDmd
		spltrPrct=dmd.kW.spltr/ttlPwrDmd
		H2OAccPrct=dmd.kW.H2OAcc/ttlPwrDmd
		CH4AccPrct=dmd.kW.CH4Acc/ttlPwrDmd
		btryPrct=dmd.kW.btry/ttlPwrDmd

		ttlPwrAvlb=genPwr+btryPwr

		sply.kW.disps=dispsPrct*ttlPwrAvlb
		sply.kW.rtr1=rtrs1Prct*ttlPwrAvlb
		sply.kW.rtr2=rtrs2Prct*ttlPwrAvlb
		sply.kW.rtr3=rtrs3Prct*ttlPwrAvlb
		sply.kW.rtr4=rtrs4Prct*ttlPwrAvlb
		sply.kW.prp1=prps1Prct*ttlPwrAvlb
		sply.kW.prp2=prps2Prct*ttlPwrAvlb
		sply.kW.spltr=spltrPrct*ttlPwrAvlb
		sply.kW.H2OAcc=H2OAccPrct*ttlPwrAvlb
		sply.kW.CH4Acc=CH4AccPrct*ttlPwrAvlb
		sply.kW.btry=btryPrct*ttlPwrAvlb

		avlb4Stg.kW=avlb4Stg.kW-btryPwr
	end
end

function distHyds()
	rotRtr(sply.kNSM.rtr1,rtr1)
	rotRtr(sply.kNSM.rtr2,rtr2)
	rotRtr(sply.kNSM.rtr3,rtr3)
	rotRtr(sply.kNSM.rtr4,rtr4)
	rotProp(sply.kNSM.prp1,prp1)
	rotProp(sply.kNSM.prp2,prp2)
end

function distPwr()
	altAdj=clamp01(5000/(s.pos.z+5000))
	spdAdj=clamp(nroot(6.6,s.spd)-1,0.2,1.2)
	intakeAdj=altAdj*spdAdj
	disps.on=(sply.kW.disps>=dmd.kW.disps)
	if sply.kW.spltr>0 then
		pwrPrct=sply.kW.spltr/SPLTR_PWR_DMD_KW
		h2oPrct=sply.H2O.spltr/SPLTR_MAX_H2O
		prodPrct=math.min(pwrPrct,h2oPrct)
		if pwrPrct<h2oPrct then
			sply.H2O.spltr=prodPrct*dmd.H2O.spltr
		elseif h2oPrct<pwrPrct then
			sply.kW.spltr=prodPrct*dmd.kW.spltr
		end
		sply.H_M.tank=prodPrct*SPLTR_PER_TIC_H
		sply.O.tank=prodPrct*SPLTR_PER_TIC_O
	end
	if sply.kW.H2OAcc>0 then
		sply.H2O.tank=(sply.kW.H2OAcc/H2O_ACC_PWR_DMD_KW)*H2O_ACC_PER_TIC*s.env.H2O*intakeAdj
	end
	if sply.kW.CH4Acc>0 then
		sply.CH4.tank=(sply.kW.CH4Acc/CH4_ACC_PWR_DMD_KW)*CH4_ACC_PER_TIC*s.env.CH4*intakeAdj
	end
	if sply.kW.btry>0 then
		avlb4Stg.kW=avlb4Stg.kW+sply.kW.btry
	end
end

function drainTanks()
	cl1.lvl=cl1.lvl-math.max(math.max(0.01,1-cl1.st)*CLL_MAX_VENT_M3F,cl1.vent)
	cl2.lvl=cl2.lvl-math.max(math.max(0.01,1-cl2.st)*CLL_MAX_VENT_M3F,cl2.vent)
	cl3.lvl=cl3.lvl-math.max(math.max(0.01,1-cl3.st)*CLL_MAX_VENT_M3F,cl3.vent)
	cl4.lvl=cl4.lvl-math.max(math.max(0.01,1-cl4.st)*CLL_MAX_VENT_M3F,cl4.vent)

	tkH.lvl=tkH.lvl-sply.H_V.cl1/H_MASS_TO_VOL-sply.H_V.cl2/H_MASS_TO_VOL-sply.H_V.cl3/H_MASS_TO_VOL-sply.H_V.cl4/H_MASS_TO_VOL
	tkO.lvl=tkO.lvl-sply.O.bilr
	tkH2O.lvl=tkH2O.lvl-sply.H2O.bilr-sply.H2O.spltr
	tkCH4.lvl=tkCH4.lvl-sply.CH4.bilr

	hydRes.lvl=hydRes.lvl-sply.kNSM.rtr1-sply.kNSM.rtr2-sply.kNSM.rtr3-sply.kNSM.rtr4-sply.kNSM.prp1-sply.kNSM.prp2
end

function fillTanks()
	cl1.lvl=math.min(CLL_MAX_M3,cl1.lvl+sply.H_V.cl1)
	cl2.lvl=math.min(CLL_MAX_M3,cl2.lvl+sply.H_V.cl2)
	cl3.lvl=math.min(CLL_MAX_M3,cl3.lvl+sply.H_V.cl3)
	cl4.lvl=math.min(CLL_MAX_M3,cl4.lvl+sply.H_V.cl4)
	tkH.lvl=math.min(H_TANK_MAX_KG,tkH.lvl+sply.H_M.tank)
	tkO.lvl=math.min(O_TANK_MAX_KG,tkO.lvl+sply.O.tank)
	tkH2O.lvl=math.min(H2O_TANK_MAX_KG,tkH2O.lvl+sply.H2O.tank)
	tkCH4.lvl=math.min(CH4_TANK_MAX_KG,tkCH4.lvl+sply.CH4.tank)
	hydRes.lvl=math.min(HYD_MAX_KNSM,hydRes.lvl+sply.kNSM.hydRes)
	btry.lvl=math.min(BTRY_MAX_CHARGE_KW,btry.lvl+avlb4Stg.kW)
end

function applyThrst()
	rtr1.thrst=sply.kW.rtr1/RTR_MAX_PWR_DMD_KW*RTR_MAX_THRST_KN
	rtr2.thrst=sply.kW.rtr2/RTR_MAX_PWR_DMD_KW*RTR_MAX_THRST_KN
	rtr3.thrst=sply.kW.rtr3/RTR_MAX_PWR_DMD_KW*RTR_MAX_THRST_KN
	rtr4.thrst=sply.kW.rtr4/RTR_MAX_PWR_DMD_KW*RTR_MAX_THRST_KN

	prp1.thrst=sply.kW.prp1/PROP_MAX_PWR_DMD_KW*PROP_MAX_THRST_KN
	prp2.thrst=sply.kW.prp2/PROP_MAX_PWR_DMD_KW*PROP_MAX_THRST_KN
end

function applyForces()
	altAdj=clamp01(5000/(s.pos.z+5000))
	thrstAdj=lerp(0.2,1,altAdj)
	s.env.Atmo=altAdj*SEA_LEVEL_AIR_DENSITY

	rtr1Xcomp=math.cos(math.rad(90-rtr1.rot))*thrstAdj
	rtr1Ycomp=math.sin(math.rad(90-rtr1.rot))*thrstAdj
	rtr2Xcomp=math.cos(math.rad(90-rtr2.rot))*thrstAdj
	rtr2Ycomp=math.sin(math.rad(90-rtr2.rot))*thrstAdj
	rtr3Xcomp=math.cos(math.rad(90-rtr3.rot))*thrstAdj
	rtr3Ycomp=math.sin(math.rad(90-rtr3.rot))*thrstAdj
	rtr4Xcomp=math.cos(math.rad(90-rtr4.rot))*thrstAdj
	rtr4Ycomp=math.sin(math.rad(90-rtr4.rot))*thrstAdj

	ttlHydrogenVolume=cl1.lvl+cl2.lvl+cl3.lvl+cl4.lvl
	ttlHydrogenWeight=ttlHydrogenVolume*HYDROGEN_DENSITY
	ttlAirWeight=ttlHydrogenVolume*SEA_LEVEL_AIR_DENSITY

	ttlShipWeightKG=SHIP_DRY_WEIGHT_KG+ttlHydrogenWeight+tkH.lvl+tkO.lvl+tkH2O.lvl+tkCH4.lvl
	ttlShipWeightKN=(ttlShipWeightKG*KG_TO_N)*0.001

	s.hdg=(prp1.rot+prp2.rot)/2
	drag=DRAG_COEFFICENT*FRONT_DRAG_AREA*0.5*s.env.Atmo *
			(s.spd*s.spd)
	s.accl=(prp1.thrst*thrstAdj+prp2.thrst*thrstAdj+rtr1.thrst*rtr1Xcomp+
      rtr2.thrst*rtr2Xcomp+rtr3.thrst*rtr3Xcomp+rtr4.thrst*rtr4Xcomp-drag) /
      ttlShipWeightKN
	-- TODO Remove fudge? Acceleration bump,direction rotation.
	s.spd=s.spd+0.5*s.accl*10*0.00027777777
	changeX=s.spd*math.sin(math.rad(s.hdg))
	changeY=-s.spd*math.cos(math.rad(s.hdg))
	s.pos.x=s.pos.x+changeX
	s.pos.y=s.pos.y+changeY
	s.dis=s.dis+math.sqrt(changeX*changeX+changeY*changeY)

	ttlHydrogenLiftForce=(ttlAirWeight-ttlHydrogenWeight)*KG_TO_N*HYDROGEN_LIFT_ADJ
	ttlWingLiftForce=s.spd*WING_LIFT*altAdj

	s.rot=(rtr1.rot+rtr2.rot+rtr3.rot+rtr4.rot)/4
	vertDrag=DRAG_COEFFICENT*BOTTOM_DRAG_AREA*0.5*s.env.Atmo*s.vsi*s.vsi
	vForce=((rtr1.thrst*rtr1Ycomp+
            rtr2.thrst*rtr2Ycomp+
            rtr3.thrst*rtr3Ycomp+
            rtr4.thrst*rtr4Ycomp)+
			ttlHydrogenLiftForce+ttlWingLiftForce)/ttlShipWeightKN
	if s.vsi>0 then
		vForce=vForce-vertDrag
	elseif s.vsi<0 then
		vForce=vForce+vertDrag
	end

	s.vsi=s.vsi+0.5*((vForce-ttlShipWeightKN-vertDrag)*0.00027777777)
	s.pos.z=s.pos.z+s.vsi

	-- Auto controls
	if s.vsi<s.setVsi then
		s.con.thrt.rtrs=math.min(s.con.thrt.rtrs+0.1,1)
	elseif s.vsi>s.setVsi then
		s.con.thrt.rtrs=math.max(s.con.thrt.rtrs-0.1,0.0)
	end

	if s.pos.z-100>s.con.alt and s.vsi>-0.2 then
		altDiff=math.min((s.pos.z-100-s.con.alt)/100,8)*4
    ttlLvl=safeDivide(1,cl1.lvl+cl2.lvl+cl3.lvl+cl4.lvl)
    cl1.vent=altDiff*cl1.lvl*ttlLvl
    cl2.vent=altDiff*cl2.lvl*ttlLvl
    cl3.vent=altDiff*cl3.lvl*ttlLvl
    cl4.vent=altDiff*cl4.lvl*ttlLvl
	elseif s.pos.z+100<s.con.alt and s.vsi<0.2 then
		altDiff=math.max((s.pos.z+100-s.con.alt)/100,-8)*4
    ttlLvl=safeDivide(1,cl1.lvl+cl2.lvl+cl3.lvl+cl4.lvl)
    cl1.vent=altDiff*(1-cl1.lvl*ttlLvl)
    cl2.vent=altDiff*(1-cl2.lvl*ttlLvl)
    cl3.vent=altDiff*(1-cl3.lvl*ttlLvl)
    cl4.vent=altDiff*(1-cl4.lvl*ttlLvl)
	else
		cl1.vent=0
		cl2.vent=0
		cl3.vent=0
		cl4.vent=0
	end

	if s.pos.z+10<s.con.alt and s.con.vsi>0 then
		s.setVsi=s.con.vsi
	elseif s.pos.z-10>s.con.alt and s.con.vsi<0 then
		s.setVsi=s.con.vsi
	else
		s.setVsi=0.0
	end

	if s.pos.z<=0 then
		s.pos.z=0
		s.spd=0
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

function calcHydDmd(curAngl,dsrdAngl,st,maxSpd,maxDmd)
	if curAngl==dsrdAngl then return 0 end
	rtrAnglChg=math.abs(dsrdAngl-curAngl)
	rtrAnglChg=math.min(rtrAnglChg,maxSpd*st)
	return (rtrAnglChg/maxSpd)*maxDmd
end

function rotThrster(type,spl,thrst,maxDmd,maxSpd)
	if math.abs(s.con.rot[type]-thrst.rot)<0.0001 then
		thrst.rot=s.con.rot[type]
	else
		-- replace thrster type.
		hydAvl=spl/maxDmd
		aglAvl=hydAvl*maxSpd
		dsrdAngl=s.con.rot[type]-thrst.rot
		moveAngl=math.min(aglAvl,math.abs(dsrdAngl))
		if dsrdAngl<0 then
			thrst.rot=thrst.rot-moveAngl
		else
			thrst.rot=thrst.rot+moveAngl
		end
	end
end

function rotRtr(spl,rtr)
	return rotThrster('rtrs',spl,rtr,RTR_MAX_HYD_DMD_KNSM,RTR_MAX_ROTATE_SPD_D)
end

function rotProp(spl,prop)
	return rotThrster('prps',spl,prop,PROP_MAX_HYD_DMD_KNSM,PROP_MAX_ROTATE_SPD_D)
end

function randRangeF(min,max)
  return lerp(min,max,math.random())
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

function joinBBs(bbs)
	local min_x=10000
	local min_y=10000
	local max_x=-10000
	local max_y=-10000
	for i,bb in pairs(bbs) do
		if bb.min_x<min_x then min_x=bb.min_x end
		if bb.min_y<min_y then min_y=bb.min_y end
		if bb.max_x>max_x then max_x=bb.max_x end
		if bb.max_y>max_y then max_y=bb.max_y end
	end
	return {min_x=min_x,min_y=min_y,max_x=max_x,max_y=max_y}
end

function bbCenter(bbs)
	local bb=joinBBs(bbs)
	return {x=(bb.max_x-bb.min_x)/2+bb.min_x,y=(bb.max_y-bb.min_y)/2+bb.min_y}
end

function rotV2(vec,angle)
	r=math.rad(angle)
	aSin=math.sin(r)
	aCos=math.cos(r)
	return {x=vec.x*aCos-vec.y*aSin,y=vec.y*aCos+vec.x*aSin}
end

function contains(bb,pos)
	return pos.x>=bb.min_x and pos.y>=bb.min_y and pos.x<=bb.max_x and pos.y<=bb.max_y
end

function mapContains(bb,pos)
	return contains({min_x=bb.min_x*8,min_y=bb.min_y*8,max_x=bb.max_x*8+7,max_y=bb.max_y*8+7},pos)
end

function comContains(bbs,pos)
	local res=false
	for i,bb in pairs(bbs) do
		if mapContains(bb,pos) then res=true end
	end
	return res
end

initGame()
