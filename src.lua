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
	spd=42,
	accl=0,
	hdg=0,
	rot=0,
	vsi=0,
	setVsi=0,
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
			prps=0.3,
			rtrs=0.7
		},
		rot={
			prps=0,
			rtrs=0
		}
	},
	env={
		Atmo=SEA_LEVEL_AIR_DENSITY,
		H2O=0.0,
		CH4=0.0
	}
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

debugType=0
controlType=0

RES_PT_COUNT=4200
MAP_DIM=500
mapVls={}
CH4pts={}
H2Opts={}

function initGame()
	-- Background color
	poke(0x03FF8,8)
	math.randomseed(8778)

	buildMap()

	cam.x=p.x-120
	cam.y=p.y-64
	cam.cellX=cam.x/8
	cam.cellY=cam.y/8

	music(0)
	initShip()
end

function initShip()
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
		level=BATTERY_MAX_CHARGE_KW,
		bb={{min_x=42,min_y=23,max_x=47,max_y=24}},
		drw={{s=448,w=3,h=2}}
	}
	bilr={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		bb={{min_x=48,min_y=27,max_x=51,max_y=28}},
		drw={{s=459,w=3,h=2}}
	}
	cl1={
		st=1,
		wr=randRangeF(0.00002,0.00008),
		level=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=77,min_y=21,max_x=84,max_y=22}},
		drw={{s=482,w=5,h=2}},
    bar={x=202,y=108,w=4,h=16,c=5}
	}
	cl2={
		st=1,
		wr=randRangeF(0.00002,0.00008),
		level=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=68,min_y=21,max_x=75,max_y=22}},
		drw={{s=482,w=5,h=2}},
    bar={x=210,y=108,w=4,h=16,c=5}
	}
	cl3={
		st=1,
		wr=randRangeF(0.00002,0.00008),
		level=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=44,min_y=21,max_x=51,max_y=22}},
		drw={{s=482,w=5,h=2}},
    bar={x=218,y=108,w=4,h=16,c=5}
	}
	cl4={
		st=1,
		wr=randRangeF(0.00002,0.00008),
		level=CLL_MAX_M3*.7,
		vent=0.0,
		bb={{min_x=35,min_y=21,max_x=42,max_y=22}},
		drw={{s=482,w=5,h=2}},
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
		level=HYD_MAX_KNSM,
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
		thrust=0,
		bb={{min_x=33,min_y=22,max_x=34,max_y=24}},
		drw={{s=400,w=2,h=3}},
    ndl={x=169,y=113,c=5},
    bar={x=161,y=108,w=2,h=11,c=5}
	}
	prp2={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrust=0,
		bb={{min_x=33,min_y=26,max_x=34,max_y=28}},
		drw={{s=400,w=2,h=3}},
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
		thrust=0,
		bb={{min_x=76,min_y=32,max_x=81,max_y=32},{min_x=78,min_y=31,max_x=79,max_y=31}},
		drw={{s=434,w=6,h=1},{s=420,w=2,h=1}},
    ndl={ x=85,y=110,c=5},
    bar={x=73,y=108,w=2,h=11,c=5}
	}
	rtr2={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrust=0,
		bb={{min_x=66,min_y=32,max_x=71,max_y=32},{min_x=68,min_y=31,max_x=69,max_y=31}},
		drw={{s=434,w=6,h=1},{s=420,w=2,h=1}},
    ndl={x=101,y=110,c=5},
    bar={x=89,y=108,w=2,h=11,c=5}
	}
	rtr3={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrust=0,
		bb={{min_x=48,min_y=32,max_x=53,max_y=32},{min_x=50,min_y=31,max_x=51,max_y=31}},
		drw={{s=434,w=6,h=1},{s=420,w=2,h=1}},
    ndl={x=133,y=110,c=5},
    bar={x=121,y=108,w=2,h=11,c=5}
	}
	rtr4={
		st=1,
		wr=randRangeF(0.000015,0.00003),
		rot=0,
		thrust=0,
		bb={{min_x=38,min_y=32,max_x=43,max_y=32},{min_x=40,min_y=31,max_x=41,max_y=31}},
		drw={{s=434,w=6,h=1},{s=420,w=2,h=1}},
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
		level=H_TANK_MAX_KG,
		bb={{min_x=58,min_y=26,max_x=61,max_y=29}},
		drw={{s=478,w=2,h=3}}
	}
	tkO={
		st=1,
		wr=randRangeF(0.000001,0.000002),
		level=O_TANK_MAX_KG,
		bb={{min_x=58,min_y=31,max_x=61,max_y=32}},
		drw={{s=492,w=2,h=2}}
	}
	tkH2O={
		st=1,
		wr=randRangeF(0.000001,0.000002),
		level=H2O_TANK_MAX_KG,
		bb={{min_x=68,min_y=27,max_x=73,max_y=28}},
		drw={{s=487,w=3,h=2}},
    bar={x=202,y=68,w=4,h=24,c=5}
	}
	tkCH4={
		st=1,
		wr=randRangeF(0.000001,0.000002),
		level=CH4_TANK_MAX_KG,
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
	drw2={cl1,cl2,cl3,cl4,rtr2,rtr4,tkH,tkCH4,btr}
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

	cam.x=lerp(cam.x,p.x-120,0.15)
	cam.y=lerp(cam.y,137,0.15) -- p.y-64
	cam.cellX=cam.x/8
	cam.cellY=cam.y/8

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

	if nearest ~= nil then
		playAmbient(nearest.c,nearDis,ch,nearest.id,nearest.nt)
	end
end

function drwShipSt()
	repair=math.max((math.min(disps.st,bilr.st,turb.st,hydRes.st,hydPump.st,
      gen.st,rtr1.st,rtr2.st,rtr3.st,rtr4.st,prp1.st,prp2.st,accH2O.st,
      accCH4.st,cl1.st,cl2.st,cl3.st,cl4.st,btry.st,spltr.st,tkH.st,tkO.st,
			tkH2O.st,tkCH4.st)*100+0.5)//1,0)
	resources=(math.min((tkH2O.level/H2O_TANK_MAX_KG)*100+0.5,
											(tkCH4.level/CH4_TANK_MAX_KG)*100+0.5))//1
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
	drwShip()

	if showControls then
		map(0,125,30,11,0,48)

		print("DLS Radar",8,57,15,false,1,true)
		print("RTR",78,57,6,false,1,true)
		print("Angle",74,65,6,false,1,true)
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
		drwBarSt(gg.bars.spd,s.spd,SHIP_MAX_SPEED)

		drwBarSt(tkH2O.bar,tkH2O.level,H2O_TANK_MAX_KG)
		drwBarSt(tkCH4.bar,tkCH4.level,CH4_TANK_MAX_KG)

		altY=lerp(91,67,invLerp(0,SHIP_MAX_ALT,s.pos.z))-2.5
		spdY=lerp(91,67,invLerp(0,SHIP_MAX_SPEED,s.spd))-2.5
		print(string.sub(string.format("%f",s.pos.z/1000.0),1,-6).."k",120,altY,5,false,1,true)
		if s.spd<100 then
			print(string.sub(string.format("%f",s.spd),1,-6),144,spdY,5,false,1,true)
		else
			print(string.format("%d",s.spd//1),144,spdY,5,false,1,true)
		end

		drwLevelSt(gg.lvls.con_alt,s.con.alt,SHIP_MAX_ALT)
		drwLevelSt(gg.lvls.con_thrt,s.con.thrt.prps,1)

		print("PRP1",159,100,6,false,1,true)
		print("PRP2",178,100,6,false,1,true)

    for i,prp in pairs(ggPrp) do
      drwPropRotSt(prp.ndl,prp.rot)
      drwPropThrustSt(prp.bar,prp.thrust)
    end

		print("RTR1",71,100,6,false,1,true)
		print("RTR2",90,100,6,false,1,true)
		print("RTR3",119,100,6,false,1,true)
		print("RTR4",138,100,6,false,1,true)

    for i,rtr in pairs(ggRtr) do
      drwRotorRotSt(rtr.ndl,rtr.rot)
      drwRotorThrustSt(rtr.bar,rtr.thrust)
    end

		print("Hyd Cells",199,100,6,false,1,true)

    for i,cl in pairs(ggCl) do
      drwBarSt(cl.bar,cl.level,CLL_MAX_M3)
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

function drwShip()
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
	map(cam.cellX+camXCellAdd,cam.cellY+camYCellAdd+mapYAdjust,31,
			maxMapHeight,camXCor,camYCor)

	for i,drw in pairs(drw1) do
		drwCom(drw,yDown)
	end

	spr(p.s,p.x-cam.x-4,p.y-cam.y-8+yDown,0,1,p.flip,0,1,2)

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
		baseY=(bb.max_y*8-cam.y+9)
		baseX=posX+((bb.max_x-bb.min_x)/2)*8-4
		sW=(lerp(0,16,com.st)+0.5)//1
		rect(baseX,baseY,sW,2,6)
		rect(baseX+sW,baseY,16-sW,2,5)
	end
end

function drwPart(bb,drw,yDown)
	posX=(bb.min_x*8-cam.x) // 1+1
	posY=(bb.min_y*8-cam.y) // 1+1+yDown

	requestedX=bb.max_x+1-bb.min_x
	requestedY=bb.max_y+1-bb.min_y

	if requestedY>drw.h and drw.h==3 and
		 requestedX>drw.w and drw.w==2 then
		for y=1,requestedY do
			adjYPos=(y-1)*8+posY
			yOffset=(y-1)*16
			if y>1 and y<requestedY then
				yOffset=16
			elseif y==requestedY then
				yOffset=32
			end
			for x=1,requestedX do
				adjXPos=(x-1)*8+posX
				xOffset=(x-1) % drw.w
				spr(drw.s+yOffset+xOffset,adjXPos,adjYPos,0)
			end
		end
	elseif requestedX>drw.w and drw.w==5 then
		for y=1,requestedY do
			adjYPos=(y-1)*8+posY
			yOffset=(y-1)*16
			for x=1,requestedX do
				adjXPos=(x-1)*8+posX
				xOffset=x-1
				if x<3 then
					spr(drw.s+yOffset+xOffset,adjXPos,adjYPos,0)
				elseif x<requestedX-1 then
					spr(drw.s+yOffset+2,adjXPos,adjYPos,0)
				else
					spr(drw.s+yOffset+xOffset-3,adjXPos,adjYPos,0)
				end
			end
		end
	elseif requestedX>drw.w and drw.w==3 then
		for y=1,requestedY do
			adjYPos=(y-1)*8+posY
			yOffset=(y-1)*16
			for x=1,requestedX do
				adjXPos=(x-1)*8+posX
				xOffset=x-1
				if x==1 then
					spr(drw.s+yOffset+xOffset,adjXPos,adjYPos,0)
				elseif x<requestedX then
					spr(drw.s+yOffset+1,adjXPos,adjYPos,0)
				else
					spr(drw.s+yOffset+drw.w-1,adjXPos,adjYPos,0)
				end
			end
		end
	elseif requestedX>drw.w and drw.w==2 then
		for y=1,requestedY do
			adjYPos=(y-1)*8+posY
			yOffset=(y-1)*16
			for x=1,requestedX do
				adjXPos=(x-1)*8+posX
				xOffset=(x-1) % drw.w
				spr(drw.s+yOffset+xOffset,adjXPos,adjYPos,0)
			end
		end
	else
		spr(drw.s,posX,posY,0,1,0,0,drw.w,drw.h)
	end
end

function drwNdlAglSt(needle,angle,vec)
	target=rotateV2(vec,angle)
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

function drwRotorRotSt(needle,angle)
	drwNdlAglSt(needle,angle,{x=0,y=7})
end

function drwLevelSt(level,value,max)
	baseY=level.y+level.h
	normal=invLerp(0,max,value)
	levelHeight=(lerp(0,level.h,normal)+1.5)//1
	levelY=baseY-levelHeight
	line(level.x,levelY,level.x+level.w-1,levelY,level.c)
end

function drwBarSt(bar,value,max)
	baseY=bar.y+bar.h
	normal=invLerp(0,max,value)
	barHeight=(lerp(0,bar.h,normal)+0.5)//1
	barY=baseY-barHeight
	rect(bar.x,barY,bar.w,barHeight,bar.c)
end

function drwPropThrustSt(bar,thrust)
	drwBarSt(bar,thrust,PROP_MAX_THRUST_KN)
end

function drwRotorThrustSt(bar,thrust)
	drwBarSt(bar,thrust,RTR_MAX_THRUST_KN)
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
		kW={
			disps=0,
			rtr1=0,
			rtr2=0,
			rtr3=0,
			rtr4=0,
			prp1=0,
			prp2=0,
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
			prps={
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
	}
	sply={
		kW={
			disps=0,
			rtrs={
				one=0,
				two=0,
				three=0,
				four=0
			},
			prps={
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
			prps={
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
	}
	avlb4Use={
		kW=btry.level,
		kNSM=hydRes.level,
		H2O=tkH2O.level,
		CH4=tkCH4.level,
		H_M=tkH.level,
		H_V=tkH.level*H_MASS_TO_VOLUME,
		O=tkO.level
	}
	avlb4Stg={
		kW=0,
		kNSM=0,
		H2O=0,
		CH4=0,
		H_M=0,
		H_V=0,
		O=0
	}

	controlsPowerDemand()
	controlsHydraulicDemand()
	storageTanksDemand()
	cellDemand()
	btryDemand()
	hydResDemand()
	spltrAccDemand()
	hydPumpDemand()
	genDemand()
	turbDemand()
	bilrDemand()

	elementSupply()
	steamSupply()
	torqueSupply()
	hydraulicSupply()
	powerSupply()

	distributeHydraulics()
	distributePower()

	drainTanks()
	fillTanks()
	applyThrust()
	applyForces()

	if debugType==3 then
		drwSimDebug()
	elseif debugType==4 then
		drwStorageDebug()
	end
end

function controlsPowerDemand()
	dmd.kW.disps=DISPLAYS_PWR_DEMAND_KW

	dmd.kW.rtr1=RTR_MAX_PWR_DEMAND_KW *
			rtr1.st*s.con.thrt.rtrs
	dmd.kW.rtr2=RTR_MAX_PWR_DEMAND_KW *
			rtr2.st*s.con.thrt.rtrs
	dmd.kW.rtr3=RTR_MAX_PWR_DEMAND_KW *
			rtr3.st*s.con.thrt.rtrs
	dmd.kW.rtr4=RTR_MAX_PWR_DEMAND_KW *
			rtr4.st*s.con.thrt.rtrs

	dmd.kW.prp1=PROP_MAX_PWR_DEMAND_KW *
			prp1.st*s.con.thrt.prps
	dmd.kW.prp2=PROP_MAX_PWR_DEMAND_KW *
			prp2.st*s.con.thrt.prps

	return sim
end

function controlsHydraulicDemand()
	dmd.kNSM.rtrs.one=calcHydDemand(rtr1.rot,
																						 s.con.rot.rtrs,
																						 rtr1.st,
																						 RTR_MAX_ROTATE_SPEED_D,
																						 RTR_MAX_HYD_DEMAND_KNSM)
	dmd.kNSM.rtrs.two=calcHydDemand(rtr2.rot,
																						 s.con.rot.rtrs,
																						 rtr2.st,
																						 RTR_MAX_ROTATE_SPEED_D,
																						 RTR_MAX_HYD_DEMAND_KNSM)
	dmd.kNSM.rtrs.three=calcHydDemand(rtr3.rot,
																							 s.con.rot.rtrs,
																							 rtr3.st,
																							 RTR_MAX_ROTATE_SPEED_D,
																							 RTR_MAX_HYD_DEMAND_KNSM)
	dmd.kNSM.rtrs.four=calcHydDemand(rtr4.rot,
																							s.con.rot.rtrs,
																							rtr4.st,
																							RTR_MAX_ROTATE_SPEED_D,
																							RTR_MAX_HYD_DEMAND_KNSM)

	dmd.kNSM.prps.one=calcHydDemand(prp1.rot,
																						s.con.rot.prps,
																						prp1.st,
																						PROP_MAX_ROTATE_SPEED_D,
																						PROP_MAX_HYD_DEMAND_KNSM)
	dmd.kNSM.prps.two=calcHydDemand(prp2.rot,
																						s.con.rot.prps,
																						prp2.st,
																						PROP_MAX_ROTATE_SPEED_D,
																						PROP_MAX_HYD_DEMAND_KNSM)

	return sim
end

function storageTanksDemand()
	dmd.H2O.tank=math.min(H2O_TANK_MAX_KG-tkH2O.level,
																 H2O_TANK_MAX_KGF)
	dmd.CH4.tank=math.min(CH4_TANK_MAX_KG-tkCH4.level,
																 CH4_TANK_MAX_KGF)
	dmd.H_M.tank=math.min(H_TANK_MAX_KG-tkH.level,
																 H_TANK_MAX_KGF)
	dmd.O.tank=math.min(O_TANK_MAX_KG-tkO.level,
															 O_TANK_MAX_KGF)

	return sim
end

function cellDemand()
	if cl1.vent <= 0 then
		dmd.H_V.clls.one=math.min(
				CLL_MAX_M3-cl1.level,-cl1.vent)
	end
	if cl2.vent <= 0 then
		dmd.H_V.clls.two=math.min(
				CLL_MAX_M3-cl2.level,-cl2.vent)
	end
	if cl3.vent <= 0 then
		dmd.H_V.clls.three=math.min(
				CLL_MAX_M3-cl3.level,-cl3.vent)
	end
	if cl4.vent <= 0 then
		dmd.H_V.clls.four=math.min(
				CLL_MAX_M3-cl4.level,-cl4.vent)
	end

	return sim
end

function btryDemand()
	btryStateDemand=math.min(BATTERY_MAX_CHARGE_RATE_KW,
			BATTERY_MAX_CHARGE_KW*btry.st-btry.level)
	dmd.kW.btry=math.max(btryStateDemand,0)

	return sim
end

function hydResDemand()
	dmd.kNSM.hydRes=HYD_MAX_KNSM-hydRes.level

	return sim
end

function spltrAccDemand()
	if dmd.H_M.tank>0 or dmd.O.tank>0 then
		dmd.kW.spltr=SPLTR_PWR_DEMAND_KW*spltr.st
		dmd.H2O.spltr=SPLTR_MAX_H2O*spltr.st
	end

	if dmd.H2O.tank>0 then
		dmd.kW.H2OAcc=H2O_ACC_PWR_DEMAND_KW*accH2O.st
	end

	if dmd.CH4.tank>0 then
		dmd.kW.CH4Acc=CH4_ACC_PWR_DEMAND_KW*accCH4.st
	end

	return sim
end

function hydPumpDemand()
	dmd.NM.hydPump=math.min(HYD_PUMP_MAX_NM,
			dmd.kNSM.hydRes*HYD_PUMP_NM_PER_KNSM)

	return sim
end

function genDemand()
	totalPowerDemand=math.min(GEN_MAX_KW*gen.st,
			dmd.kW.disps+dmd.kW.rtr1 +
			dmd.kW.rtr2+dmd.kW.rtr3 +
			dmd.kW.rtr4+dmd.kW.prp1 +
			dmd.kW.prp2+dmd.kW.spltr +
			dmd.kW.H2OAcc+dmd.kW.CH4Acc+dmd.kW.btry)
	dmd.NM.gen=(totalPowerDemand/GEN_MAX_KW)*GEN_MAX_NM

	return sim
end

function turbDemand()
	totalTorqueDemand=math.min(TURB_MAX_NM*turb.st,
			dmd.NM.gen+dmd.NM.hydPump)
	dmd.steam=(totalTorqueDemand/TURB_MAX_NM)*TURB_MAX_STEAM_KNSM

	return sim
end

function bilrDemand()
	superSteamDemand=0
	if dmd.steam >= BILR_MAX_REG_STEAM_KNSM then
		superSteamDemand=(dmd.steam-BILR_MAX_REG_STEAM_KNSM)*bilr.st
	end
	steamDemand=math.min(BILR_MAX_STEAM_KNSM*bilr.st,
											 dmd.steam)
	dmd.H2O.bilr=steamDemand*BILR_H2O_KG_PER_KNSM
	dmd.CH4.bilr=steamDemand*BILR_CH4_KG_PER_KNSM
	dmd.O.bilr=superSteamDemand*BILR_O_KG_PER_KNSM

	return sim
end

function elementSupply()
	sply.O.bilr=math.min(dmd.O.bilr,avlb4Use.O)
	sply.CH4.bilr=math.min(dmd.CH4.bilr,
																	 avlb4Use.CH4)

	totalH2ODemand=dmd.H2O.bilr+dmd.H2O.spltr
	if avlb4Use.H2O>totalH2ODemand then
		sply.H2O.bilr=dmd.H2O.bilr
		sply.H2O.spltr=dmd.H2O.spltr
	elseif avlb4Use.H2O>0 then
		bilrPrct=dmd.H2O.bilr/totalH2ODemand
		spltrPrct=dmd.H2O.spltr/totalH2ODemand
		sply.H2O.bilr=bilrPrct*avlb4Use.H2O
		sply.H2O.spltr=spltrPrct*avlb4Use.H2O
	end

	totalH_VDemand=dmd.H_V.clls.one+dmd.H_V.clls.two +
			dmd.H_V.clls.three+dmd.H_V.clls.four
	if avlb4Use.H_V>totalH_VDemand then
		sply.H_V.clls.one=dmd.H_V.clls.one
		sply.H_V.clls.two=dmd.H_V.clls.two
		sply.H_V.clls.three=dmd.H_V.clls.three
		sply.H_V.clls.four=dmd.H_V.clls.four
	elseif avlb4Use.H_V>0 then
		b1Prct=dmd.H_V.clls.one/totalH_VDemand
		b2Prct=dmd.H_V.clls.two/totalH_VDemand
		b3Prct=dmd.H_V.clls.three/totalH_VDemand
		b4Prct=dmd.H_V.clls.four/totalH_VDemand
		sply.H_V.clls.one=b1Prct*avlb4Use.H_V
		sply.H_V.clls.two=b2Prct*avlb4Use.H_V
		sply.H_V.clls.three=b3Prct*avlb4Use.H_V
		sply.H_V.clls.four=b4Prct*avlb4Use.H_V
	end

	return sim
end

function steamSupply()
	suppliedH2O_KNSM=sply.H2O.bilr/BILR_H2O_KG_PER_KNSM
	suppliedCH4_KNSM=sply.CH4.bilr/BILR_CH4_KG_PER_KNSM
	suppliedO_KNSM=sply.O.bilr/BILR_O_KG_PER_KNSM

	if suppliedH2O_KNSM<suppliedCH4_KNSM then
		suppliedCH4_KNSM=suppliedH2O_KNSM
		sply.CH4.bilr=suppliedCH4_KNSM*BILR_CH4_KG_PER_KNSM
	elseif suppliedCH4_KNSM<suppliedH2O_KNSM then
		suppliedH2O_KNSM=suppliedCH4_KNSM
		sply.H2O.bilr=suppliedH2O_KNSM*BILR_H2O_KG_PER_KNSM
	end

	suppliedKNSM=suppliedCH4_KNSM

	if suppliedKNSM>BILR_MAX_REG_STEAM_KNSM then
		superSteam=suppliedKNSM-BILR_MAX_REG_STEAM_KNSM
		if suppliedO_KNSM >= superSteam then
			sply.O.bilr=superSteam*BILR_O_KG_PER_KNSM
		else
			missing=superSteam-suppliedO_KNSM
			suppliedKNSM=suppliedKNSM-missing
			sply.CH4.bilr=suppliedKNSM*BILR_CH4_KG_PER_KNSM
			sply.H2O.bilr=suppliedKNSM*BILR_H2O_KG_PER_KNSM
		end
	end

	sply.steam=suppliedKNSM

	return sim
end

function torqueSupply()
	torqueSupplied=TURB_MAX_NM*(sply.steam/TURB_MAX_STEAM_KNSM)
	torqueDemand=dmd.NM.gen+dmd.NM.hydPump

	if torqueSupplied >= torqueDemand then
		sply.NM.gen=dmd.NM.gen
		sply.NM.hydPump=dmd.NM.hydPump
	else
		genPrct=dmd.NM.gen/torqueDemand
		pumpPrct=dmd.NM.hydPump/torqueDemand
		sply.NM.gen=torqueSupplied*genPrct
		sply.NM.hydPump=torqueSupplied*pumpPrct
	end

	return sim
end

function hydraulicSupply()
	sply.kNSM.hydRes=sply.NM.hydPump*HYD_PUMP_NM_PER_KNSM

	totalPressureDemand=dmd.kNSM.rtrs.one +
			dmd.kNSM.rtrs.two+dmd.kNSM.rtrs.three +
			dmd.kNSM.rtrs.four+dmd.kNSM.prps.one +
			dmd.kNSM.prps.two

	if avlb4Use.kNSM >= totalPressureDemand then
		sply.kNSM.rtrs.one=dmd.kNSM.rtrs.one
		sply.kNSM.rtrs.two=dmd.kNSM.rtrs.two
		sply.kNSM.rtrs.three=dmd.kNSM.rtrs.three
		sply.kNSM.rtrs.four=dmd.kNSM.rtrs.four
		sply.kNSM.prps.one=dmd.kNSM.prps.one
		sply.kNSM.prps.two=dmd.kNSM.prps.two
	elseif avlb4Use.kNSM>0 then
		rtrs1Prct=dmd.kNSM.rtrs.one/totalPressureDemand
		rtrs2Prct=dmd.kNSM.rtrs.two/totalPressureDemand
		rtrs3Prct=dmd.kNSM.rtrs.three/totalPressureDemand
		rtrs4Prct=dmd.kNSM.rtrs.four/totalPressureDemand
		prps1Prct=dmd.kNSM.prps.one/totalPressureDemand
		prps2Prct=dmd.kNSM.prps.two/totalPressureDemand

		sply.kNSM.rtrs.one=rtrs1Prct*avlb4Use.kNSM
		sply.kNSM.rtrs.two=rtrs2Prct*avlb4Use.kNSM
		sply.kNSM.rtrs.three=rtrs3Prct*avlb4Use.kNSM
		sply.kNSM.rtrs.four=rtrs4Prct*avlb4Use.kNSM
		sply.kNSM.prps.one=prps1Prct*avlb4Use.kNSM
		sply.kNSM.prps.two=prps2Prct*avlb4Use.kNSM
	end

	return sim
end

function powerSupply()
	genPower=GEN_MAX_KW*(sply.NM.gen/GEN_MAX_NM)
	btryPower=avlb4Use.kW
	totalPowerDemand=dmd.kW.disps+dmd.kW.btry +
			dmd.kW.rtr1+dmd.kW.rtr2 +
			dmd.kW.rtr3+dmd.kW.rtr4 +
			dmd.kW.prp1+dmd.kW.prp2 +
			dmd.kW.spltr+dmd.kW.H2OAcc+dmd.kW.CH4Acc

	if totalPowerDemand <= genPower then
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
	elseif totalPowerDemand <= (genPower+btryPower) then
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

		btryUse=totalPowerDemand-genPower
		avlb4Stg.kW=avlb4Stg.kW-btryUse
	else
		dispsPrct=dmd.kW.disps/totalPowerDemand
		rtrs1Prct=dmd.kW.rtr1/totalPowerDemand
		rtrs2Prct=dmd.kW.rtr2/totalPowerDemand
		rtrs3Prct=dmd.kW.rtr3/totalPowerDemand
		rtrs4Prct=dmd.kW.rtr4/totalPowerDemand
		prps1Prct=dmd.kW.prp1/totalPowerDemand
		prps2Prct=dmd.kW.prp2/totalPowerDemand
		spltrPrct=dmd.kW.spltr/totalPowerDemand
		H2OAccPrct=dmd.kW.H2OAcc/totalPowerDemand
		CH4AccPrct=dmd.kW.CH4Acc/totalPowerDemand
		btryPrct=dmd.kW.btry/totalPowerDemand

		totalPowerAvailable=genPower+btryPower

		sply.kW.disps=dispsPrct*totalPowerAvailable
		sply.kW.rtr1=rtrs1Prct*totalPowerAvailable
		sply.kW.rtr2=rtrs2Prct*totalPowerAvailable
		sply.kW.rtr3=rtrs3Prct*totalPowerAvailable
		sply.kW.rtr4=rtrs4Prct*totalPowerAvailable
		sply.kW.prp1=prps1Prct*totalPowerAvailable
		sply.kW.prp2=prps2Prct*totalPowerAvailable
		sply.kW.spltr=spltrPrct*totalPowerAvailable
		sply.kW.H2OAcc=H2OAccPrct*totalPowerAvailable
		sply.kW.CH4Acc=CH4AccPrct*totalPowerAvailable
		sply.kW.btry=btryPrct*totalPowerAvailable

		avlb4Stg.kW=avlb4Stg.kW-btryPower
	end

	return sim
end

function distributeHydraulics()
	sim=rotateRotor(sim,'one',rtr1)
	sim=rotateRotor(sim,'two',rtr2)
	sim=rotateRotor(sim,'three',rtr3)
	sim=rotateRotor(sim,'four',rtr4)

	sim=rotateProp(sim,'one',prp1)
	sim=rotateProp(sim,'two',prp2)

	return sim
end

function distributePower()
	altAdj=clamp01(5000/(s.pos.z+5000))
	spdAdj=clamp(nroot(6.6,s.spd)-1,0.2,1.2)
	intakeAdj=altAdj*spdAdj

	disps.on=(sply.kW.disps>=dmd.kW.disps)

	if sply.kW.spltr>0 then
		powerPrct=sply.kW.spltr/SPLTR_PWR_DEMAND_KW
		h2oPrct=sply.H2O.spltr/SPLTR_MAX_H2O
		productionPrct=math.min(powerPrct,h2oPrct)
		if powerPrct<h2oPrct then
			sply.H2O.spltr=productionPrct*dmd.H2O.spltr
		elseif h2oPrct<powerPrct then
			sply.kW.spltr=productionPrct*dmd.kW.spltr
		end
		sply.H_M.tank=productionPrct*SPLTR_PER_TIC_H
		sply.O.tank=productionPrct*SPLTR_PER_TIC_O
	end

	if sply.kW.H2OAcc>0 then
		sply.H2O.tank=(sply.kW.H2OAcc/H2O_ACC_PWR_DEMAND_KW) *
				H2O_ACC_PER_TIC*s.env.H2O*intakeAdj
	end

	if sply.kW.CH4Acc>0 then
		sply.CH4.tank=(sply.kW.CH4Acc/CH4_ACC_PWR_DEMAND_KW) *
				CH4_ACC_PER_TIC*s.env.CH4*intakeAdj
	end

	if sply.kW.btry>0 then
		avlb4Stg.kW=avlb4Stg.kW+sply.kW.btry
	end

	return sim
end

function drainTanks()
	cl1.level=cl1.level-math.max(
			math.max(0.01,1-cl1.st)*CLL_MAX_VENT_M3F,
			cl1.vent)
	cl2.level=cl2.level-math.max(
			math.max(0.01,1-cl2.st)*CLL_MAX_VENT_M3F,
			cl2.vent)
	cl3.level=cl3.level-math.max(
			math.max(0.01,1-cl3.st)*CLL_MAX_VENT_M3F,
			cl3.vent)
	cl4.level=cl4.level-math.max(
			math.max(0.01,1-cl4.st)*CLL_MAX_VENT_M3F,
			cl4.vent)

	tkH.level=tkH.level -
			sply.H_V.clls.one/H_MASS_TO_VOLUME -
			sply.H_V.clls.two/H_MASS_TO_VOLUME -
			sply.H_V.clls.three/H_MASS_TO_VOLUME -
			sply.H_V.clls.four/H_MASS_TO_VOLUME
	tkO.level=tkO.level-sply.O.bilr
	tkH2O.level=tkH2O.level-sply.H2O.bilr -
			sply.H2O.spltr
	tkCH4.level=tkCH4.level-sply.CH4.bilr

	hydRes.level=hydRes.level -
			sply.kNSM.rtrs.one-sply.kNSM.rtrs.two -
			sply.kNSM.rtrs.three-sply.kNSM.rtrs.four -
			sply.kNSM.prps.one-sply.kNSM.prps.two
end

function fillTanks()
	cl1.level=math.min(CLL_MAX_M3,
			cl1.level+sply.H_V.clls.one)
	cl2.level=math.min(CLL_MAX_M3,
			cl2.level+sply.H_V.clls.two)
	cl3.level=math.min(CLL_MAX_M3,
			cl3.level+sply.H_V.clls.three)
	cl4.level=math.min(CLL_MAX_M3,
			cl4.level+sply.H_V.clls.four)

	tkH.level=math.min(H_TANK_MAX_KG,
			tkH.level+sply.H_M.tank)
	tkO.level=math.min(O_TANK_MAX_KG,
			tkO.level+sply.O.tank)
	tkH2O.level=math.min(H2O_TANK_MAX_KG,
			tkH2O.level+sply.H2O.tank)
	tkCH4.level=math.min(CH4_TANK_MAX_KG,
			tkCH4.level+sply.CH4.tank)

	hydRes.level=math.min(HYD_MAX_KNSM,
			hydRes.level+sply.kNSM.hydRes)

	btry.level=math.min(BATTERY_MAX_CHARGE_KW,
			btry.level+avlb4Stg.kW)
end

function applyThrust()
	rtr1.thrust=sply.kW.rtr1 /
			RTR_MAX_PWR_DEMAND_KW*RTR_MAX_THRUST_KN
	rtr2.thrust=sply.kW.rtr2 /
			RTR_MAX_PWR_DEMAND_KW*RTR_MAX_THRUST_KN
	rtr3.thrust=sply.kW.rtr3 /
			RTR_MAX_PWR_DEMAND_KW*RTR_MAX_THRUST_KN
	rtr4.thrust=sply.kW.rtr4 /
			RTR_MAX_PWR_DEMAND_KW*RTR_MAX_THRUST_KN

	prp1.thrust=sply.kW.prp1 /
			PROP_MAX_PWR_DEMAND_KW*PROP_MAX_THRUST_KN
	prp2.thrust=sply.kW.prp2 /
			PROP_MAX_PWR_DEMAND_KW*PROP_MAX_THRUST_KN
end

function applyForces()
	altAdj=clamp01(5000/(s.pos.z+5000))
	thrustAdj=lerp(0.2,1,altAdj)
	s.env.Atmo=altAdj*SEA_LEVEL_AIR_DENSITY

	rtr1Xcomp=math.cos(math.rad(90-rtr1.rot))*thrustAdj
	rtr1Ycomp=math.sin(math.rad(90-rtr1.rot))*thrustAdj
	rtr2Xcomp=math.cos(math.rad(90-rtr2.rot))*thrustAdj
	rtr2Ycomp=math.sin(math.rad(90-rtr2.rot))*thrustAdj
	rtr3Xcomp=math.cos(math.rad(90-rtr3.rot))*thrustAdj
	rtr3Ycomp=math.sin(math.rad(90-rtr3.rot))*thrustAdj
	rtr4Xcomp=math.cos(math.rad(90-rtr4.rot))*thrustAdj
	rtr4Ycomp=math.sin(math.rad(90-rtr4.rot))*thrustAdj

	totalHydrogenVolume=cl1.level+cl2.level+cl3.level+cl4.level
	totalHydrogenWeight=totalHydrogenVolume*HYDROGEN_DENSITY
	totalAirWeight=totalHydrogenVolume*SEA_LEVEL_AIR_DENSITY

	totalShipWeightKG=SHIP_DRY_WEIGHT_KG+totalHydrogenWeight+tkH.level+tkO.level+tkH2O.level+tkCH4.level
	totalShipWeightKN=(totalShipWeightKG*KG_TO_N)*0.001

	s.hdg=(prp1.rot+prp2.rot)/2
	drag=DRAG_COEFFICENT*FRONT_DRAG_AREA*0.5*s.env.Atmo *
			(s.spd*s.spd)
	s.accl=(prp1.thrust*thrustAdj +
					prp2.thrust*thrustAdj +
					rtr1.thrust*rtr1Xcomp +
					rtr2.thrust*rtr2Xcomp +
					rtr3.thrust*rtr3Xcomp +
					rtr4.thrust*rtr4Xcomp-drag) /
			totalShipWeightKN
	-- TODO Remove fudge? Acceleration bump,direction rotation.
	s.spd=s.spd+0.5*s.accl*10*0.00027777777
	changeX=s.spd*math.sin(math.rad(s.hdg))
	changeY=-s.spd*math.cos(math.rad(s.hdg))
	s.pos.x=s.pos.x+changeX
	s.pos.y=s.pos.y+changeY
	s.dis=s.dis+math.sqrt(changeX*changeX+changeY*changeY)

	totalHydrogenLiftForce=(totalAirWeight-totalHydrogenWeight)*KG_TO_N*HYDROGEN_LIFT_ADJUST
	totalWingLiftForce=s.spd*WING_LIFT*altAdj

	s.rot=(rtr1.rot+rtr2.rot+rtr3.rot+rtr4.rot)/4
	vertDrag=DRAG_COEFFICENT*BOTTOM_DRAG_AREA*0.5*s.env.Atmo*s.vsi*s.vsi
	vForce=((rtr1.thrust*rtr1Ycomp+
					 rtr2.thrust*rtr2Ycomp+
					 rtr3.thrust*rtr3Ycomp+
					 rtr4.thrust*rtr4Ycomp)+
			totalHydrogenLiftForce+totalWingLiftForce)/totalShipWeightKN
	if s.vsi>0 then
		vForce=vForce-vertDrag
	elseif s.vsi<0 then
		vForce=vForce+vertDrag
	end

	s.vsi=s.vsi+0.5*((vForce-totalShipWeightKN-vertDrag)*0.00027777777)
	s.pos.z=s.pos.z+s.vsi

	-- Auto controls
	if s.vsi<s.setVsi then
		s.con.thrt.rtrs=math.min(s.con.thrt.rtrs+0.1,1)
	elseif s.vsi>s.setVsi then
		s.con.thrt.rtrs=math.max(s.con.thrt.rtrs-0.1,0.0)
	end

	if s.pos.z-100>s.con.alt and s.vsi>-0.2 then
		altDiff=math.min((s.pos.z-100-s.con.alt)/100,8)
		cl1.vent=altDiff
		cl2.vent=altDiff
		cl3.vent=altDiff
		cl4.vent=altDiff
	elseif s.pos.z+100<s.con.alt and s.vsi<0.2 then
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

	if s.pos.z+10<s.con.alt and s.con.vsi>0 then
		s.setVsi=s.con.vsi
	elseif s.pos.z-10>s.con.alt and s.con.vsi<0 then
		s.setVsi=s.con.vsi
	else
		s.setVsi=0.0
	end

	if s.pos.z <= 0 then
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


function calcHydDemand(curAngle,dsrdAgl,st,maxSpd,maxDmnd)
	if curAngle==dsrdAgl then return 0 end
	rtrAngleChange=math.abs(dsrdAgl-curAngle)
	rtrAngleChange=math.min(rtrAngleChange,maxSpd*st)
	return (rtrAngleChange/maxSpd)*maxDmnd
end

function rotateThruster(sim,type,id,thrustr,maxDmnd,maxSpd)
	if math.abs(s.con.rot[type]-thrustr.rot)<0.0001 then
		thrustr.rot=s.con.rot[type]
	else
		-- replace sim thruster type.
		hydAvl=sply.kNSM[type][id]/maxDmnd
		aglAvl=hydAvl*maxSpd
		dsrdAgl=s.con.rot[type]-thrustr.rot
		moveAngle=math.min(aglAvl,math.abs(dsrdAgl))
		if dsrdAgl<0 then
			thrustr.rot=thrustr.rot-moveAngle
		else
			thrustr.rot=thrustr.rot+moveAngle
		end
	end

	return sim
end

function rotateRotor(sim,id,rtr)
	return rotateThruster(sim,'rtrs',id,rtr,RTR_MAX_HYD_DEMAND_KNSM,RTR_MAX_ROTATE_SPEED_D)
end

function rotateProp(sim,id,prop)
	return rotateThruster(sim,'prps',id,prop,PROP_MAX_HYD_DEMAND_KNSM,PROP_MAX_ROTATE_SPEED_D)
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

function rotateV2(vec,angle)
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
