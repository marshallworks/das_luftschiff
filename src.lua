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
ENT_DWN_ACC=.1
ENT_DWN_TRM_V=2
ENT_DRG=.3

SHIP_STRT_SPD=80
SHIP_MAX_SPD=300
SHIP_MAX_VSI=2
SHIP_MAX_ALT=10000
SHIP_DRY_WEIGHT_KG=120000

DISPLAYS_PWR_DMD_KW=0.021

SPLTR_PWR_DMD_KW=0.05
SPLTR_MAX_H2O=2.4
SPLTR_PER_TIC_H=0.266
SPLTR_PER_TIC_O=0.628

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
BILR_O_KG_PER_KNSM=0.0252

BTRY_MAX_CHARGE_KW=650
BTRY_MAX_CHARGE_RATE_KW=0.022

HYD_MAX_KNSM=32
HYD_PUMP_MAX_NM=16
HYD_PUMP_NM_PER_KNSM=2

CLL_MAX_M3=12000
H_TANK_MAX_KG=220
O_TANK_MAX_KG=2800
H2O_TANK_MAX_KG=16800
CH4_TANK_MAX_KG=16800

CLL_MAX_VENT_M3F=7.2
CLL_MAX_M3F=6.1
H_TANK_MAX_KGF=0.3
O_TANK_MAX_KGF=2.3
H2O_TANK_MAX_KGF=2.6
CH4_TANK_MAX_KGF=8.274

LIGHTS_PWR_DMD_KW=0.032
H2O_ACC_PWR_DMD_KW=0.067
CH4_ACC_PWR_DMD_KW=0.117
H2O_ACC_PER_TIC=12
CH4_ACC_PER_TIC=20

str={
	t=0,
	x=60,
	y=42,
	crashSoundTimeout=0,
	crashTimeout=0,
	endTimeOut=0
}

gg={
	ndl={
		vsi={x=141,y=79,c=5},
		hdg={x=215,y=87,c=5},
		rot={x=140,y=106,c=5},
		req_vsi={x=141,y=80,c=15},
		con_hdg={x=216,y=88,c=15},
		con_rot={x=141,y=107,c=15}
	},
	lvls={
		con_alt={x=154,y=68,w=4,h=56,c=15},
		con_thrt={x=178,y=68,w=4,h=56,c=15}
	},
	bars={
		alt={x=154,y=68,w=4,h=56,c=5},
		spd={x=178,y=68,w=4,h=56,c=5}
	}
}
sDspIn={x=9,y=56}
strScreen=true
endScreen=false
showNav=false
showSta=false
showMap=false
gremlinSpawned=false
gremlinInSight=false
gremlinLastSeen=0
controlType=1
RES_PT_COUNT=4200
mapVls={}
CH4pts={}
H2Opts={}

-- temp
pwrType=0
PAUSED=false
estVsiPerHV=0
-- endtemp

function camShake(atTime,crashSpd)
	cam.isShake=true
	cam.shakeTime=atTime+clamp01(invLerp(0,-16,crashSpd))*60*2
end

function updCam(x,y)
	if cam.shakeTime>0 then
		tRem=str.t-cam.shakeTime
		if tRem<0 then
			amt=invLerp(0,-2*60,tRem)*5//1
			cam.x=x+math.random(-amt,amt)
			cam.y=y+math.random(-amt,amt)
		else
			cam.shakeTime=0
		end
	else
		cam.x=x
		cam.y=y
	end
	cam.xCell=x//8
	cam.yCell=y//8
	cam.xOff=-(x%8)//1
	cam.yOff=-(y%8)//1
end

function rstStr()
	music(0)
	str.x=60
	str.y=42
end

function initStats()
	sta={dis=0,gremlinSightings=0,crashes=0}
end

function initCam()
	cam={x=0,y=0,xCell=0,yCell=0,xOff=0,yOff=0,shakeTime=0}
	updCam(p.x-120,136)
end

function initPlyr()
	p={bs=256,s=256,x=492,y=190,vx=0,vy=0,isAcc=false,isDeAcc=false,flip=0,onFlr=false,onLdr=false,hasMoLdr=false,inCil=false}
end

function initGrmln()
	g={bs=264,s=264,x=508,y=190,vx=0,vy=0,isAcc=false,isDeAcc=false,flip=0,onFlr=false,onLdr=false,hasMoLdr=false,inCil=false}
	gb={up=false,dwn=false,lft=false,rgt=false,srchDir=0,trgt=nil,trgtT=0}
end

function initGame()
	-- Background color
	poke(0x03FF8,8)
	math.randomseed(8778)

	buildMap()
	music(0)
	initPlyr()
	initGrmln()
	initCam()
	initShip()
	initStats()
	dmgPart={}
end

function rstGame()
	initPlyr()
	initGrmln()
	initCam()
	initShip()
	initStats()
	dmgPart={}
end

function initShip()
	s={
		spd=SHIP_STRT_SPD,accl=0,hdg=0,rot=0,vsi=0,reqVsi=0,reqBou=0,isCrash=false,isLit=true,dis=0,
		pos={x=0,y=0,z=2000},
		con={
			alt=2000,
			thrt={prps=0.3,rtrs=0.7},
			rot={prps=0,rtrs=0}
		},
		env={Atmo=SEA_LEVEL_AIR_DENSITY,H2O=0.0,CH4=0.0}
	}
	clDrw={s=370,w=5,h=2,rx=3}
	prpDrw={s=288,w=2,h=3}
	rtr1Drw={s=322,w=6,h=1}
	rtr2Drw={s=308,w=2,h=1}
	accH2O={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.000001,0.000003),
		maxWr=randRangeF(0.00002,0.00004),
		bb={{minX=85,minY=23,maxX=86,maxY=24}},
		drw={{s=318,w=2,h=2}},
		sdsp={{x=169,y=29,minX=240,minY=145,maxX=252,maxY=159,lbl="Acc",lblOff=1,c=4}},
		dmg={{efct="elec",emi=nil,x=.6,y=.6,xR=.6,yR=.6}}
	}
	accCH4={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.000002,0.000006),
		maxWr=randRangeF(0.00004,0.00008),
		bb={{minX=83,minY=27,maxX=84,maxY=28}},
		drw={{s=316,w=2,h=2}},
		sdsp={{x=169,y=54,minX=225,minY=145,maxX=237,maxY=159,lbl="Acc",lblOff=1,c=4}},
		dmg={{efct="elec",emi=nil,x=.6,y=.6,xR=.6,yR=.6}}
	}
	btry={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000003,0.0000007),
		maxWr=randRangeF(0.000003,0.000007),
		lvl=BTRY_MAX_CHARGE_KW,
		bb={{minX=42,minY=23,maxX=47,maxY=24}},
		drw={{s=336,w=3,h=2,rx=2}},
		sdsp={{x=40,y=5,minX=129,minY=164,maxX=150,maxY=175,lbl="Battery",lblOff=-3,c=4}},
		dmg={{efct="elec",emi=nil,x=.5,y=.6,xR=3,yR=.6}}
	}
	bilr={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		bb={{minX=48,minY=27,maxX=51,maxY=28}},
		drw={{s=347,w=3,h=2,rx=2}},
		sdsp={{x=124,y=54,minX=219,minY=161,maxX=239,maxY=175,lbl="Boiler",c=1}},
		dmg={{efct="fire",emi=nil,x=.8,y=.5,xR=.5,yR=.8}}
	}
	cl1={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.000001,0.000004),
		maxWr=randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		fill=0,
		bb={{minX=77,minY=21,maxX=84,maxY=22}},
		drw={clDrw},
		sdsp={{x=154,y=5,minX=145,minY=177,maxX=158,maxY=190,lbl="Cell 1",lblOff=4,c=3},
					{x=168,y=5,minX=169,minY=177,maxX=182,maxY=190,lbl="",c=3}},
		dmg={{efct="hydrogen",emi=nil,x=.5,y=.5,xR=4,yR=1}}
	}
	cl2={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.000001,0.000004),
		maxWr=randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		fill=0,
		bb={{minX=68,minY=21,maxX=75,maxY=22}},
		drw={clDrw},
		sdsp={{x=124,y=5,minX=145,minY=177,maxX=158,maxY=190,lbl="Cell 2",lblOff=4,c=3},
					{x=138,y=5,minX=169,minY=177,maxX=182,maxY=190,lbl="",c=3}},
		dmg={{efct="hydrogen",emi=nil,x=.5,y=.5,xR=4,yR=1}}
	}
	cl3={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.000001,0.000004),
		maxWr=randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		fill=0,
		bb={{minX=44,minY=21,maxX=51,maxY=22}},
		drw={clDrw},
		sdsp={{x=94,y=5,minX=145,minY=177,maxX=158,maxY=190,lbl="Cell 3",lblOff=4,c=3},
					{x=108,y=5,minX=169,minY=177,maxX=182,maxY=190,lbl="",c=3}},
		dmg={{efct="hydrogen",emi=nil,x=.5,y=.5,xR=4,yR=1}}
	}
	cl4={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.000001,0.000004),
		maxWr=randRangeF(0.00001,0.00004),
		lvl=CLL_MAX_M3*.7,
		fill=0,
		bb={{minX=35,minY=21,maxX=42,maxY=22}},
		drw={clDrw},
		sdsp={{x=64,y=5,minX=145,minY=177,maxX=158,maxY=190,lbl="Cell 4",lblOff=4,c=3},
					{x=78,y=5,minX=169,minY=177,maxX=182,maxY=190,lbl="",c=3}},
		dmg={{efct="hydrogen",emi=nil,x=.5,y=.5,xR=4,yR=1}}
	}
	dispNav={
		st=1,
		on=true,
		bb={{minX=56,minY=23,maxX=59,maxY=24}},
		drw={{s=312,w=4,h=2}}
	}
	dispSta={
		st=1,
		on=true,
		bb={{minX=60,minY=23,maxX=63,maxY=24}},
		drw={{s=424,w=4,h=2}}
	}
	hydPump={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		bb={{minX=37,minY=27,maxX=38,maxY=28}},
		drw={{s=339,w=2,h=2}},
		sdsp={{x=21,y=29,minX=152,minY=161,maxX=167,maxY=175,lbl="Pump",c=6}},
		dmg={{efct="hydraulics",emi=nil,x=.4,y=.6,xR=.5,yR=.45}}
	}
	hydRes={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000002,0.0000004),
		maxWr=randRangeF(0.000002,0.000004),
		lvl=HYD_MAX_KNSM,
		bb={{minX=37,minY=23,maxX=38,maxY=24}},
		drw={{s=368,w=2,h=2}},
		sdsp={{x=22,y=5,minX=130,minY=179,maxX=141,maxY=190,lbl="Res",c=5}},
		dmg={{efct="hydraulics",emi=nil,x=.5,y=.6,xR=.5,yR=.45}}
	}
	gen={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		bb={{minX=40,minY=27,maxX=43,maxY=28}},
		drw={{s=341,w=4,h=2}},
		sdsp={{x=39,y=29,minX=169,minY=161,maxX=200,maxY=175,lbl="Generator",lblOff=-2,c=6}},
		dmg={{efct="elec",emi=nil,x=.5,y=.5,xR=1,yR=1}}
	}
	prp1={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{minX=33,minY=22,maxX=34,maxY=24}},
		drw={prpDrw},
		sdsp={{x=0,y=5,minX=129,minY=142,maxX=142,maxY=153,lbl="Prop1",c=4}},
		ndl={x=209,y=121,c=5},
		bar={x=201,y=116,w=2,h=11,c=5},
		dmg={{efct="elec",emi=nil,x=.7,y=.5,xR=.8,yR=.6}}
	}
	prp2={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{minX=33,minY=26,maxX=34,maxY=28}},
		drw={prpDrw},
		sdsp={{x=0,y=29,minX=129,minY=142,maxX=142,maxY=153,lbl="Prop2",c=4}},
		ndl={x=225,y=121,c=5},
		bar={x=217,y=116,w=2,h=11,c=5},
		dmg={{efct="elec",emi=nil,x=.7,y=.5,xR=.8,yR=.6}}
	}
	pto1={
		bb={{minX=39,minY=27,maxX=39,maxY=27},{minX=39,minY=28,maxX=39,maxY=28}},
		drw={{s=350,w=1,h=1},{s=351,w=1,h=1}}
	}
	pto2={
		bb={{minX=44,minY=27,maxX=45,maxY=27},{minX=44,minY=28,maxX=45,maxY=28}},
		drw={{s=350,w=1,h=1},{s=351,w=1,h=1}}
	}
	rtr1={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{minX=76,minY=32,maxX=81,maxY=32},{minX=78,minY=31,maxX=79,maxY=31}},
		drw={rtr1Drw,rtr2Drw},
		sdsp={{x=60,y=54,minX=162,minY=145,maxX=173,maxY=158,lbl="Rtr1",c=4}},
		ndl={x=101,y=70,c=5},
		bar={x=89,y=68,w=2,h=11,c=5},
		dmg={{efct="elec",emi=nil,x=.5,y=.5,xR=1,yR=1}}
	}
	rtr2={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{minX=66,minY=32,maxX=71,maxY=32},{minX=68,minY=31,maxX=69,maxY=31}},
		drw={rtr1Drw,rtr2Drw},
		sdsp={{x=40,y=54,minX=162,minY=145,maxX=173,maxY=158,lbl="Rtr2",c=4}},
		ndl={x=101,y=86,c=5},
		bar={x=89,y=84,w=2,h=11,c=5},
		dmg={{efct="elec",emi=nil,x=.5,y=.5,xR=1,yR=1}}
	}
	rtr3={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{minX=48,minY=32,maxX=53,maxY=32},{minX=50,minY=31,maxX=51,maxY=31}},
		drw={rtr1Drw,rtr2Drw},
		sdsp={{x=20,y=54,minX=162,minY=145,maxX=173,maxY=158,lbl="Rtr3",c=4}},
		ndl={x=101,y=102,c=5},
		bar={x=89,y=100,w=2,h=11,c=5},
		dmg={{efct="elec",emi=nil,x=.5,y=.5,xR=1,yR=1}}
	}
	rtr4={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		rot=0,
		thrst=0,
		bb={{minX=38,minY=32,maxX=43,maxY=32},{minX=40,minY=31,maxX=41,maxY=31}},
		drw={rtr1Drw,rtr2Drw},
		sdsp={{x=0,y=54,minX=162,minY=145,maxX=173,maxY=158,lbl="Rtr4",c=4}},
		ndl={x=101,y=118,c=5},
		bar={x=89,y=116,w=2,h=11,c=5},
		dmg={{efct="elec",emi=nil,x=.5,y=.5,xR=1,yR=1}}
	}
	spltr={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		bb={{minX=62,minY=27,maxX=63,maxY=27},{minX=62,minY=28,maxX=63,maxY=28}},
		drw={{s=306,w=2,h=1},{s=0,w=1,h=1}},
		sdsp={{x=126,y=29,minX=145,minY=144,maxX=158,maxY=150,lbl="Splitter",lblOff=-8,c=4}},
		dmg={{efct="elec",emi=nil,x=.5,y=.6,xR=.4,yR=.4}}
	}
	tkH={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000001,0.0000002),
		maxWr=randRangeF(0.000001,0.000002),
		lvl=H_TANK_MAX_KG,
		bb={{minX=58,minY=26,maxX=61,maxY=29}},
		drw={{s=366,w=2,h=3,ry=2}},
		sdsp={{x=94,y=29,minX=242,minY=169,maxX=253,maxY=190,lbl="H",lblOff=6,c=3}},
		dmg={{efct="hydrogen",emi=nil,x=.5,y=.6,xR=1.2,yR=1.8}}
	}
	tkO={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000001,0.0000002),
		maxWr=randRangeF(0.000001,0.000002),
		lvl=O_TANK_MAX_KG,
		bb={{minX=58,minY=31,maxX=61,maxY=32}},
		drw={{s=380,w=2,h=2}},
		sdsp={{x=108,y=29,minX=226,minY=177,maxX=237,maxY=191,lbl="O",lblOff=4,c=13}},
		dmg={{efct="oxygen",emi=nil,x=.5,y=.5,xR=1,yR=1}}
	}
	tkH2O={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000001,0.0000002),
		maxWr=randRangeF(0.000001,0.000002),
		lvl=H2O_TANK_MAX_KG,
		bb={{minX=68,minY=27,maxX=73,maxY=28}},
		drw={{s=375,w=3,h=2,rx=2}},
		sdsp={{x=145,y=29,minX=185,minY=178,maxX=206,maxY=191,lbl="H2O",lblOff=5,c=7}},
		dmg={{efct="water",emi=nil,x=.5,y=.6,xR=1.5,yR=.45}}
	}
	tkCH4={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000001,0.0000002),
		maxWr=randRangeF(0.000001,0.000002),
		lvl=CH4_TANK_MAX_KG,
		bb={{minX=75,minY=27,maxX=80,maxY=28}},
		drw={{s=378,w=2,h=2}},
		sdsp={{x=151,y=53,minX=208,minY=176,maxX=223,maxY=191,lbl="CH4",lblOff=2,c=1}},
		dmg={{efct="methane",emi=nil,x=.5,y=.4,xR=2.2,yR=.6}}
	}
	turb={
		st=1,effc=1,ut=0,
		minWr=randRangeF(0.0000015,0.000003),
		maxWr=randRangeF(0.000015,0.00003),
		bb={{minX=46,minY=27,maxX=47,maxY=28}},
		drw={{s=345,w=2,h=2}},
		sdsp={{x=75,y=29,minX=200,minY=161,maxX=215,maxY=175,lbl="Turbine",lblOff=-2,c=15}},
		dmg={{efct="steam",emi=nil,x=.5,y=.5,xR=1,yR=1}}
	}
	drw1={dispNav,dispSta,bilr,turb,hydRes,hydPump,gen,rtr1,rtr3,prp1,prp2,accH2O,accCH4,spltr,tkO,tkH2O,pto1,pto2}
	drw2={cl1,cl2,cl3,cl4,rtr2,rtr4,tkH,tkCH4,btry}
	sDsps={bilr,turb,hydRes,hydPump,gen,rtr1,rtr2,rtr3,rtr4,prp1,prp2,accH2O,accCH4,cl1,cl2,cl3,cl4,btry,spltr,tkH,tkO,tkH2O,tkCH4}
	wear={bilr,turb,hydRes,hydPump,gen,rtr1,rtr2,rtr3,rtr4,prp1,prp2,accH2O,accCH4,cl1,cl2,cl3,cl4,btry,spltr,tkH,tkO,tkH2O,tkCH4}
	ggPrp={prp1,prp2}
	ggRtr={rtr1,rtr2,rtr3,rtr4}
end

function buildMap()
	for i=1,RES_PT_COUNT do
		CH4pts[i]={x=ranMapCoor(),y=ranMapCoor()}
		H2Opts[i]={x=ranMapCoor(),y=ranMapCoor()}
	end
end

function ranMapCoor()
	return math.random(-120,120)*8
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
		print("Das Luftschiff",5,5,8,false,2)
		print("Das Luftschiff",4,4,15,false,2)
		print("X Start",84,94)
		print("A Repair/Activate",84,106)
	elseif endScreen then
	  music()
		cls()
		if btnp(5) then
			rstGame()
			endScreen=false
		end
		if (str.t-str.endTimeOut)>18000 then
			rstStr()
			rstGame()
			endScreen=false
			strScreen=true
		end
		map(0,1)
		spr(57,48,108,0,2,0,0,2,1)
		spr(73,80,92,0,2,0,0,6,2)
		spr(59,68,120,0,2,0,0,2,1)
		spr(61,142,120,0,2,0,0,2,1)
		print("Das Luftschiff",5,5,8,false,2)
		print("Das Luftschiff",4,4,15,false,2)
		print("Game Over",16,32,8,false,2)
		if s.dis<10000 then
			print(string.format("Distance: %dm",s.dis//1),16,48,9)
		else
			print(string.format("Distance: %dkm",s.dis//1000),16,48,9)
		end
		print(string.format("Crashes: %d",sta.crashes//1),16,58,9)
		print(string.format("Gremlin Sightings: %d",sta.gremlinSightings//1),16,68,9)
		print("X Restart",174,78,9)

		sfx(-1,"D#1",-1,0,0,0)
		sfx(-1,"D#1",-1,1,0,0)
		sfx(-1,"D#1",-1,2,0,0)
		sfx(-1,"D#1",-1,3,0,0)
	else
		music()
		if comContains(dispNav.bb,p) then
			if btnp(6) and not showMap then showNav=not showNav end
		end
		if comContains(dispSta.bb,p) then
			if btnp(6) then showSta=not showSta end
		end
		doRepairs()

		sfx(24,"E-2",-1,0,8,0)

		playAmbientChannel(1,{
			{c=accH2O,id=22,nt="C-1"},
			{c=turb,id=23,nt="A-2"},
			{c=prp1,id=21,nt="D-2"},
			{c=prp2,id=21,nt="D-2"},
			{c=rtr1,id=21,nt="D-1"},
			{c=rtr3,id=21,nt="D-1"}
		},6)

		playAmbientChannel(2,{
			{c=bilr,id=23,nt="C-1"},
			{c=gen,id=23,nt="C-4"},
			{c=accCH4,id=22,nt="D#3"},
			{c=rtr2,id=21,nt="D-1"},
			{c=rtr4,id=21,nt="D-1"}
		},5)

		if gremlinSpawned then
			if (distance(p,g)<120 and not isLinThFlr(p.x,p.y-7,g.x,g.y-1)) or str.t-gremlinLastSeen<60 then
				gremlinInSight=true
				if gremlinLastSeen==0 then
					gremlinLastSeen=str.t
				end
			else
				gremlinInSight=false
				gremlinLastSeen=0
			end
		end

		if showNav then
			if btnp(2) then controlType=controlType-1 end
			if btnp(3) then controlType=controlType+1 end

			if controlType<0 then controlType=4 end
			if controlType>4 then controlType=0 end

			if controlType==0 then
				if btnp(0) or btnp(1) then
					showMap=not showMap
				end
			elseif controlType==1 then
				if btn(0) then s.con.rot.rtrs=s.con.rot.rtrs+1 end
				if btn(1) then s.con.rot.rtrs=s.con.rot.rtrs-1 end
				if s.con.rot.rtrs<0 then s.con.rot.rtrs=0 end
				if s.con.rot.rtrs>90 then s.con.rot.rtrs=90 end
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
		elseif showSta then
			-- Station controls.
		else
			playerMovement()
		end
		if gremlinSpawned then
			gremlinMovement()
			gremlinSpawned=distance(p,g)>2
			if not gremlinSpawned then
				sfx(26,"F-5",60,3,12)
				doGremlinVanishAnim(g)
			end
		else
			maybeSpawnGremlin()
		end

		cls(0)
    if btnp(7) then PAUSED=not PAUSED end
    if not PAUSED then
  		simulate()
  		applyWear()
    end

		if not showMap then
			drwGame()
		end

		if showMap then
			drwMap(30,17)
		end

		drwShipSt()
		drwDmgCom()
	end
	str.t=str.t+1
end

function doGremlinVanishAnim(pos)
	particles={}
	for i=1,32 do
		path=rotV2({x=1,y=1},math.random(359))
		particles[i]={x=pos.x,y=pos.y,lt=12,dir=path,spd=math.random(1,4)}
	end
end

function addNxtSprPrt(stts,emi,bb)
	local x=emi.x+(randRangeF(emi.xR*-8,emi.xR*8))//1
	local y=emi.y+(randRangeF(emi.yR*-8,emi.yR*8))//1
	emi.nxt=time()+math.random((emi.spwMin*1000*math.max(stts,.1))//1,(emi.spwMax*1000*math.max(stts,.1))//1)
	local sprId=emi.sprs[math.random(1,#emi.sprs)]
	if sprId==408 or sprId==409 or sprId==411 or sprId==412 then y=(emi.y+emi.yR*8)//1 end
	table.insert(dmgPart,{spr=sprId,x=x,y=y,vx=randRangeF(-emi.vx,emi.vx),vy=randRangeF(-emi.vy,emi.vy),flk=emi.flk,rot=emi.rot,t=0,lt=math.random(emi.ltMin*60//1,emi.ltMax*60//1),grv=emi.grv})
end

function addDmgSprPrtEmi(sprIds,spwMin,spwMax,ltMin,ltMax,grv,vx,vy,flk,rot,dmg,bb)
	local x=(bb.maxX-bb.minX)*dmg.x+bb.minX-4
	local y=(bb.maxY-bb.minY)*dmg.y+bb.minY-4
	dmg.emi={sprs=sprIds,spwMin=spwMin,spwMax=spwMax,ltMin=ltMin,ltMax=ltMax,t=time(),nxt=time()+10,x=x,y=y,xR=dmg.xR,yR=dmg.yR,vx=vx,vy=vy,flk=flk,rot=rot,grv=grv}
end

function drwDmg(stts,dmg,bb)
	if dmg.efct=="steam" then
		addDmgSprPrtEmi({402,403},.002,.006,.06,.25,-1,.1,.1,true,true,dmg,bb)
	elseif dmg.efct=="water" then
		addDmgSprPrtEmi({407,408,409},2.4,7.2,4.2,6.8,0,0,0,false,false,dmg,bb)
	elseif dmg.efct=="methane" then
		addDmgSprPrtEmi({404},.008,.012,.06,.25,-.6,.1,.1,true,true,dmg,bb)
	elseif dmg.efct=="oxygen" then
		addDmgSprPrtEmi({403,404},.04,.08,.06,.25,-.5,.15,.15,true,true,dmg,bb)
	elseif dmg.efct=="hydrogen" then
		addDmgSprPrtEmi({405,406},.008,.048,.12,.5,-0.1,.08,.08,true,true,dmg,bb)
	elseif dmg.efct=="elec" then
		addDmgSprPrtEmi({413,414,415},.16,.32,.12,.5,0,.002,.002,true,true,dmg,bb)
	elseif dmg.efct=="hydraulics" then
		addDmgSprPrtEmi({410,411,412},2.2,6.8,3.8,6.2,0,0,0,false,false,dmg,bb)
	elseif dmg.efct=="fire" then
		addDmgSprPrtEmi({422,423},.64,1.28,.76,2,0,.001,0,false,false,dmg,bb)
	end
end

function drwDmgCom()
	for i,com in pairs(wear) do
		if com.dmg~=nil then
			if com.st<.5 then
				for i=1,#com.dmg do
					local emi=com.dmg[i].emi
					if emi==nil then
						drwDmg(com.st,com.dmg[i],joinPxlBB(com.bb))
					else
						if time()>=emi.nxt then
							addNxtSprPrt(com.st,emi,joinPxlBB(com.bb))
						end
					end
				end
			else
				for i=1,#com.dmg do
					com.dmg[i].emi=nil
				end
			end
		end
	end
end

function drwParticles(yDown)
	local hasPart=false
	if particles~=nil then
		for i=1,#particles do
			part=particles[i]
			part.lt=part.lt-1
			if part.lt>0 then
				hasPart=true
				trv=scaleV2(part.dir,part.spd/6)
				part.x=part.x+trv.x
				part.y=part.y+trv.y
				pix(part.x-cam.x,part.y-cam.y+yDown,1)
			else
			end
		end
	end
	if not hasPart then particles=nil end

	for i=1,#dmgPart do
		dp=dmgPart[i]
		if dp~=nil then
			dp.lt=dp.lt-1
			if dp.lt>0 then
				dp.x=dp.x+dp.vx
				dp.y=dp.y+dp.vy+dp.grv
				dp.t=dp.t+1
				if not dp.flk or (dp.t%2==0) then
					local rot=0
					if dp.rot then rot=math.random(3) end
					spr(dp.spr,dp.x-cam.x,dp.y-cam.y+yDown,0,1,rot)
				end
			else
				table.remove(dmgPart,i)
			end
		end
	end
end

function playerMovement()
	entStUpd(p)
	entMv(p,btn(0),btn(1),btn(2),btn(3),.06,.8,.04,.3,1.2)
	entSetSpr(p)
	if p.onFlr and p.vx~=0 and (str.t%12)==0 then
		sfx(25,12,3,3,2,0)
	end
	entSetPos(p)
	updCam(lerp(cam.x,p.x-120,0.15),lerp(cam.y,136,0.15))
	entKpInShip(p)
end

function maybeSpawnGremlin()
	spwChnc=lerp(99990,99910,clamp01(invLerp(0,8000000,s.dis)))
	gremlinSpawned = math.random(100000)>spwChnc
	if gremlinSpawned then
		g.x=g.x+math.random(-100,100)
		g.y=g.y+math.random(-60,60)
		sta.gremlinSightings=sta.gremlinSightings+1
	end
end

function gremlinTarget()
	local count=#wear
	local tries=count
	while true do
		local com=wear[math.random(count)]
		if com.st>0 then return com end
		tries=tries-1
		if tries<=0 then return nil end
	end
end

function gremlinMovement()
	entStUpd(g)
	gb.up=false
	gb.dwn=false
	gb.lft=false
	gb.rgt=false
	if gb.trgt==nil then
		gb.trgt=gremlinTarget()
		gb.trgtT=str.t
	end
	if gremlinInSight then
		gb.srchDir=0
		if distance(p,g)<62 then
			if g.onLdr and math.abs(p.y-g.y)>2 then
				if g.y>p.y and not g.onFlr then gb.dwn=true end
				if g.y<p.y and g.hasMoLdr then gb.up=true end
			end
			if not gb.dwn and not gb.up then
				if g.x>p.x then gb.rgt=true end
				if g.x<p.x then gb.lft=true end
			end
		elseif distance(p,g)>100 then
			if g.onLdr and math.abs(p.y-g.y)>2 then
				if g.y>p.y and g.hasMoLdr then gb.up=true end
				if g.y<p.y and not g.onFlr then gb.dwn=true end
			end
			if not gb.dwn and not gb.up then
				if g.x>p.x then gb.lft=true end
				if g.x<p.x then gb.rgt=true end
			end
		end
	else
		if gb.trgt~=nil and comContains(gb.trgt.bb,g) and gb.trgt.st>0 then
			gb.trgt.st=math.max(gb.trgt.st-.0004,0)
			gb.trgtT=str.t
		elseif gb.trgt~=nil and gb.trgt.st>0 then
			local go2=bbHorPxlCntr(gb.trgt.bb)
			if math.abs(go2.y-(g.y+6))>1 then
				if g.onLdr then
					if g.y+6>go2.y and g.hasMoLdr then gb.up=true end
					if g.y+6<go2.y and not g.onFlr then gb.dwn=true end
				end
				if not gb.up and not gb.dwn then
					if gb.srchDir<0 then
						gb.lft=true
						if g.x<37*8 then gb.srchDir=1 end
					elseif gb.srchDir>0 then
						gb.rgt=true
						if g.x>82*8 then gb.srchDir=-1 end
					else
						if g.x>=60*8 then gb.srchDir=-1 else gb.srchDir=1 end
					end
				end
			else
				if not gb.dwn and not gb.up then
					if g.x>go2.x then gb.lft=true end
					if g.x<go2.x then gb.rgt=true end
				end
			end
			if str.t-gb.trgtT>1100 then
				gb.trgt=nil
				gb.trgtT=0
				gb.srchDir=0
			end
		else
			gb.trgt=nil
			gb.trgtT=0
			gb.srchDir=0
		end
	end
	entMv(g,gb.up,gb.dwn,gb.lft,gb.rgt,.08,.55,.03,.2,1.2)
	entSetSpr(g)
	entSetPos(g)
	entKpInShip(g)
end

function entStUpd(ent)
	ent.onFlr=false
	ent.inCil=false
	ent.onLdr=false
	ent.hasMoLdr=false
	local testX=ent.x//8
	local testY=ent.y//8
	local testYD=testY+1
	local testYU=testY-1
	local onId=mget(testX,testY)
	local downId=mget(testX,testYD)
	if downId==16 or downId==31 or downId==64 or downId==79 or downId==80 or downId==95 or downId==189 or downId==158 or downId==223 or downId==254 then ent.onFlr=true end
	if mget(testX,testYU)==16 then ent.inCil=true end
	if onId==32 or onId==47 or mget(testX,testYD)==32 or mget(testX,testYD)==47 then ent.onLdr=true end
	if onId==32 or onId==47 or mget(testX,(ent.y-4)//8)==32 or mget(testX,(ent.y-4)//8)==47 then ent.hasMoLdr=true end
end

function entMv(e,up,dwn,lft,rgt,xAcc,xMax,yAcc,yMax,yBurst)
	if up and e.onLdr then
		e.vy=math.max(e.vy-yAcc,-yMax)
	elseif dwn and e.onLdr and not e.onFlr then
		e.vy=math.max(e.vy+yAcc,yMax)
	elseif e.onLdr then
		e.vy=0
	elseif up and e.onFlr then
		e.vy=-yBurst
	elseif e.vy==0 and e.onFlr then
		e.y=(e.y//8)*8+1
		e.vy=math.min(e.vy,0)
	elseif not e.onFlr then
		e.vy=math.min(e.vy+ENT_DWN_ACC,ENT_DWN_TRM_V)
	else
		e.vy=0
	end
	if e.inCil and e.vy<0 then
		e.vy=-e.vy
	end

	e.isAcc=false
	e.isDeAcc=false

	if lft then
		e.vx=math.max(e.vx-xAcc,-xMax)
		e.isAcc=e.vx>-.3
	elseif rgt then
		e.vx=math.min(e.vx+xAcc,xMax)
		e.isAcc=e.vx<.3
	else
		if e.vx>0 then
			e.vx=math.max(e.vx-ENT_DRG,0)
		else
			e.vx=math.min(e.vx+ENT_DRG,0)
		end
		e.isDeAcc=e.vx~=0
	end

	if e.vx>0 then
		e.flip=0
	elseif e.vx<0 then
		e.flip=1
	end
end

function entSetPos(e)
	e.x=e.x+e.vx
	e.y=e.y+e.vy
end

function entSetSpr(e)
	if not e.onLdr and not e.onFlr then
		e.s=e.bs+5
	elseif e.vx==0 and e.onLdr and not e.onFlr then
		if e.vy==0 then
			e.s=e.bs+6
		else
			if (str.t%16)//8==0 then
				e.s=e.bs+6
			else
				e.s=e.bs+7
			end
		end
	elseif e.vx==0 then
		e.s=e.bs
	elseif e.isAcc then
		e.s=e.bs+3
	elseif e.isDeAcc then
		e.s=e.bs+4
	else
		if (str.t%12)//6==0 then
			e.s=e.bs+1
		else
			e.s=e.bs+2
		end
	end
end

function entKpInShip(e)
	if e.y>234 then
		if e.x<292 then e.x=292 end
		if e.x>668 then e.x=668 end
	elseif e.y>202 then
		if e.x<268 then e.x=268 end
		if e.x>684 then e.x=684 end
	else
		if e.x<268 then e.x=268 end
		if e.x>700 then e.x=700 end
	end

	if e.y>257 then e.y=257 end
	if e.y<176 then e.y=176 end
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
		if com.st~=nil and com.minWr~=nil and com.maxWr~=nil then
			com.st=clamp01(com.st-lerp(com.minWr,com.maxWr,com.ut))
		end
	end
end

function maybeDoRepair(c,p)
	if comContains(c.bb,p) then
		c.st=math.min(c.st+0.01,1)
		if c.st<1 and not showNav and btn(6) then
			if (str.t%16)==0 then
				sfx(25,"C-1",4,3,6,2)
			end
		end
	end
end

function crashSound(stTime)
	str.crashSoundTimeout=stTime+48
	sfx(27,"C-1",24,1,15,1)
	sfx(27,"D-2",48,2,15,0)
end

function playAmbient(c,dis,channel,id,note)
	if str.crashSoundTimeout>0 and str.t>str.crashSoundTimeout then
		str.crashSoundTimeout=0
	elseif str.crashSoundTimeout<1 then
	  sfx(id,note,-1,channel,clamp01(invLerp(1000,0,dis))*15//1,0)
	end
end

function playAmbientChannel(ch,comps,count)
	nearDis=1000000
	nearest=nil
	for i=1,count do
		item=comps[i]
		soundPos=scaleV2(bbCntr(item.c.bb),8)
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
	repair=math.max((math.min(dispNav.st,dispSta.st,bilr.st,turb.st,hydRes.st,hydPump.st,
			gen.st,rtr1.st,rtr2.st,rtr3.st,rtr4.st,prp1.st,prp2.st,accH2O.st,
			accCH4.st,cl1.st,cl2.st,cl3.st,cl4.st,btry.st,spltr.st,tkH.st,tkO.st,
			tkH2O.st,tkCH4.st)*100+0.5)//1,0)
	resources=(math.min((tkH2O.lvl/H2O_TANK_MAX_KG)*100+0.5,
											(tkCH4.lvl/CH4_TANK_MAX_KG)*100+0.5))//1
	rect(0,0,96,8,8)
	rect(127,0,113,8,8)
	print(string.format("Speed: %d",s.spd//1),1,1,6,false,1,true)
	if s.pos.z >=10000 then
		print(string.format("Altitude: %d",s.pos.z//1000).."k",48,1,6,false,1,true)
	elseif s.pos.z >=1000 then
		print(string.sub(string.format("Altitude: %f",s.pos.z/1000.0),1,-6).."k",48,1,6,false,1,true)
	else
		print(string.format("Altitude: %d",s.pos.z//1),48,1,6,false,1,true)
	end
	print(string.format("Repair: %d%%",repair),128,1,6,false,1,true)
	print(string.format("Resources: %d%%",resources),180,1,6,false,1,true)

	if s.pos.z<1 and math.abs(s.spd)<1 and resources<1 then
		if str.crashTimeout>0 and (str.t-str.crashTimeout)>(30*60) then
			endScreen=true
			str.endTimeOut=str.t
			str.crashTimeout=0
		elseif str.crashTimeout<1 then
			str.crashTimeout=str.t
		end
	else
		str.crashTimeout=0
	end
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
	for cY=cYOffset,ySize+cYOffset do
		for cX=cXOffset,xSize+cXOffset do
			mapVl=getMapTile(cX,cY)
			spr(lerp(144,148,mapVl.CH4),(cX-cXOffset-1)*8+xOff,
					(cY-cYOffset-1)*8+yOff,0)
			spr(lerp(149,153,mapVl.H2O),(cX-cXOffset-1)*8+xOff,
					(cY-cYOffset-1)*8+yOff,0)
		end
	end
	sHCent={x=120,y=68}
	local pt1=rotV2Ct(sHCent,{x=120,y=64},s.hdg)
	local pt2=rotV2Ct(sHCent,{x=118,y=72},s.hdg)
	local pt3=rotV2Ct(sHCent,{x=122,y=72},s.hdg)
	tri(pt1.x,pt1.y,pt2.x,pt2.y,pt3.x,pt3.y,5)
end

function drwGame()
	drwEnv()
	drwShip()

	if showNav then
		map(0,125,30,11,0,48)

		print("Resource Radar",15,57,15,false,1,true)
		print("Rtr Angle",116,98,6,false,1,true)
		print("Vertical",116,60,6,false,1,true)
		print("Spd",116,68,6,false,1,true)
		print("Alt",151,60,6,false,1,true)
		print("Spd",175,60,6,false,1,true)
		print("Heading",204,60,6,false,1,true)

		drwNdlLvlSt(gg.ndl.vsi,s.vsi,-1.2,1.2,0,180,8)
		drwNdlLvlSt(gg.ndl.req_vsi,s.reqVsi,-1.2,1.2,0,180,10)

		drwNdlAglSt(gg.ndl.hdg,s.hdg,{ x=0,y=-8 })
		drwNdlAglSt(gg.ndl.rot,s.rot,{ x=0,y=15 })
		drwNdlAglSt(gg.ndl.con_hdg,s.con.rot.prps,
										 { x=0,y=-10 })
		drwNdlAglSt(gg.ndl.con_rot,s.con.rot.rtrs,
										 { x=0,y=17 })

		drwBarSt(gg.bars.alt,s.pos.z,SHIP_MAX_ALT)
		drwBarSt(gg.bars.spd,s.spd,SHIP_MAX_SPD)

		altY=lerp(123,67,invLerp(0,SHIP_MAX_ALT,s.pos.z))-2.5
		spdY=lerp(123,67,invLerp(0,SHIP_MAX_SPD,s.spd))-2.5
		print(string.sub(string.format("%f",s.pos.z/1000.0),1,-6).."k",160,altY,5,false,1,true)
		if s.spd<100 then
			print(string.sub(string.format("%f",s.spd),1,-6),184,spdY,5,false,1,true)
		else
			print(string.format("%d",s.spd//1),184,spdY,5,false,1,true)
		end

		drwLvlSt(gg.lvls.con_alt,s.con.alt,SHIP_MAX_ALT)
		drwLvlSt(gg.lvls.con_thrt,s.con.thrt.prps,1)

		print("Propeller",199,108,6,false,1,true)
		print("1",213,126,6,false,1,true)
		print("2",229,126,6,false,1,true)

		for i,prp in pairs(ggPrp) do
			drwPropRotSt(prp.ndl,prp.rot)
			drwPropThrstSt(prp.bar,prp.thrst)
		end

		print("Rotor",88,60,6,false,1,true)
		print("1",105,71,6,false,1,true)
		print("2",105,87,6,false,1,true)
		print("3",105,103,6,false,1,true)
		print("4",105,119,6,false,1,true)

		for i,rtr in pairs(ggRtr) do
			drwRtrRotSt(rtr.ndl,rtr.rot)
			drwRtrThrstSt(rtr.bar,rtr.thrst)
		end

    if dispNav.on then
  		clip(6,64,66,63)
  		drwMap(7,7,16,72)
  		sHCent={x=40,y=96}
  		local pt1=rotV2Ct(sHCent,{x=40,y=92},s.hdg)
  		local pt2=rotV2Ct(sHCent,{x=38,y=100},s.hdg)
  		local pt3=rotV2Ct(sHCent,{x=42,y=100},s.hdg)
  		tri(pt1.x,pt1.y,pt2.x,pt2.y,pt3.x,pt3.y,5)
  		clip()
    end

    if controlType==0 then
    	rectb(0,56,80,80,7)
		elseif controlType==1 then
			rectb(114,96,37,34,7)
		elseif controlType==2 then
			rectb(149,58,26,71,7)
		elseif controlType==3 then
			rectb(173,58,26,71,7)
		elseif controlType==4 then
			rectb(199,71,34,34,7)
		end
	elseif showSta then
		map(30,125,30,11,0,48)
		if dispSta.on then
			print("Status",193,57,11,false,1,false)
			print("Steam",193,65,15,false,1,true)
			print("Torque",193,73,6,false,1,true)
			print("Electricity",193,81,4,false,1,true)
			print("Hydraulic",193,89,5,false,1,true)
			print("Water",193,97,7,false,1,true)
			print("Methane",193,105,1,false,1,true)
			print("Hydrogen",193,113,3,false,1,true)
			print("Oxygen",193,121,13,false,1,true)
			if str.t%2==0 then
				rect(87+sDspIn.x,42+sDspIn.y,2,18,15)
				rect(89+sDspIn.x,58+sDspIn.y,37,2,15)
				rect(35+sDspIn.x,35+sDspIn.y,42,2,6)
				rect(26+sDspIn.x,9+sDspIn.y,2,24,5)
				rect(6+sDspIn.x,9+sDspIn.y,20,2,5)
				rect(4+sDspIn.x,9+sDspIn.y,2,51,5)
				rect(6+sDspIn.x,58+sDspIn.y,60,2,5)
				rect(142+sDspIn.x,39+sDspIn.y,30,2,7)
				rect(142+sDspIn.x,41+sDspIn.y,2,3,7)
				rect(128+sDspIn.x,44+sDspIn.y,16,2,7)
				rect(128+sDspIn.x,46+sDspIn.y,2,10,7)
				rect(138+sDspIn.x,31+sDspIn.y,10,2,7)
				rect(143+sDspIn.x,65+sDspIn.y,28,2,1)
				rect(121+sDspIn.x,31+sDspIn.y,7,2,3)
				rect(121+sDspIn.x,26+sDspIn.y,2,5,3)
				rect(105+sDspIn.x,26+sDspIn.y,16,2,3)
				rect(103+sDspIn.x,26+sDspIn.y,2,8,3)
				rect(99+sDspIn.x,13+sDspIn.y,2,18,3)
				rect(90+sDspIn.x,11+sDspIn.y,66,2,3)
				rect(118+sDspIn.x,34+sDspIn.y,10,2,13)
				rect(115+sDspIn.x,42+sDspIn.y,2,24,13)
				rect(117+sDspIn.x,64+sDspIn.y,8,2,13)
				rect(46+sDspIn.x,13+sDspIn.y,2,20,4)
				rect(11+sDspIn.x,13+sDspIn.y,2,34,4)
				rect(7+sDspIn.x,45+sDspIn.y,4,2,4)
				rect(7+sDspIn.x,47+sDspIn.y,2,7,4)
				rect(7+sDspIn.x,54+sDspIn.y,68,2,4)
				rect(75+sDspIn.x,54+sDspIn.y,2,7,4)
				rect(75+sDspIn.x,61+sDspIn.y,46,2,4)
				rect(121+sDspIn.x,41+sDspIn.y,2,22,4)
				rect(123+sDspIn.x,41+sDspIn.y,11,2,4)
				rect(132+sDspIn.x,26+sDspIn.y,2,17,4)
				rect(134+sDspIn.x,26+sDspIn.y,35,2,4)
				rect(167+sDspIn.x,28+sDspIn.y,2,8,4)
				rect(169+sDspIn.x,34+sDspIn.y,5,2,4)
				rect(174+sDspIn.x,34+sDspIn.y,2,26,4)
			end
			for i,sDsp in pairs(sDsps) do
				local hDim={w=0,h=0,a=0}
				for j,sD in pairs(sDsp.sdsp) do
					hDim.w=hDim.w+sD.maxX-sD.minX
					hDim.h=sD.maxY-sD.minY
					hDim.a=hDim.a+1
					drwSDsp(sDsp.st,sDsp.effc,sD)
				end
				baseY=sDspIn.y+sDsp.sdsp[1].y+hDim.h+2
				baseX=sDspIn.x+sDsp.sdsp[1].x
				baseWidth=hDim.w+hDim.a
				sW=(lerp(0,baseWidth,sDsp.st)+0.5)//1
				rect(baseX,baseY,sW,2,6)
				rect(baseX+sW,baseY,baseWidth-sW,2,5)
			end
		end
	end
end

function drwSDsp(stts,effc,sdsp)
	local lblOff=0
	if sdsp.lblOff~=nil then lblOff=sdsp.lblOff end
	print(sdsp.lbl,sDspIn.x+sdsp.x+lblOff,sDspIn.y+sdsp.y-6,sdsp.c,false,1,true)
	for x=sdsp.minX,sdsp.maxX do
		for y=sdsp.minY,sdsp.maxY do
			local c=sget(x,y)
			local sc=10
			if (1-invLerp(sdsp.minY,sdsp.maxY,y))<=effc then sc=sdsp.c end
			if c~=0 then
				pix(x-sdsp.minX+sdsp.x+sDspIn.x,y-sdsp.minY+sdsp.y+sDspIn.y,sc)
			end
		end
	end
end

function sget(x,y)
	local addr=0x4000+(x//8+y//8*16)*32
	return peek4(addr*2+x%8+y%8*8)
end

function drwEnv()
	vLoc=mapVertLoc()
	xDiff=vLoc.x%8
	yDiff=vLoc.y%8
	map(vLoc.x//8,vLoc.y//8,31,18,-xDiff,-yDiff)
end

function drwShip()
	maxMapHeight=18
	mapXAdjust=0
	mapYAdjust=0
	if showNav or showSta then
		maxMapHeight=6
		mapYAdjust=3
		clip(0,0,240,48)
	end
	if not s.isLit then mapXAdjust=90 end
	yDown=mapYAdjust*-8

	map(cam.xCell+mapXAdjust,cam.yCell+mapYAdjust,31,maxMapHeight,cam.xOff,cam.yOff,0)

	for i,drw in pairs(drw1) do
		drwCom(drw,yDown)
	end

	if gremlinSpawned and gremlinInSight then spr(g.s,g.x-cam.x-4,g.y-cam.y-9+yDown,0,1,g.flip,0,1,2) end
	spr(p.s,p.x-cam.x-4,p.y-cam.y-9+yDown,0,1,p.flip,0,1,2)

	for i,drw in pairs(drw2) do
		drwCom(drw,yDown)
	end
	drwParticles(yDown)
	clip()
end

function drwCom(com,yDown)
	for i,bb in pairs(com.bb) do
		local dmged=false
		if com.st~=nil and com.st<.25 then dmged=true end
		drwPart(bb,com.drw[i],yDown,dmged)
	end
end

function drwPart(bb,drw,yDown,dmged)
	local posX=bb.minX-cam.xCell
	local posY=bb.minY-cam.yCell
	local reqX=bb.maxX-bb.minX
	local reqY=bb.maxY-bb.minY
	local dmgedOff=0
	if dmged then dmgedOff=112 end

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
			spr(drw.s+yOff+xOff+dmgedOff,(posX+x)*8+cam.xOff,(posY+y)*8+cam.yOff+yDown,0)
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
			com.st=clamp01(math.max(com.st-clamp01(invLerp(0,-8,vSpeed)),0))
		end
	end
end

function simulate()
	dmd={
		kW={dispNav=0,dispSta=0,rtr1=0,rtr2=0,rtr3=0,rtr4=0,prp1=0,prp2=0,spltr=0,accH2O=0,accCH4=0,lights=0,btry=0},
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
		kW={dispNav=0,dispSta=0,rtr1=0,rtr2=0,rtr3=0,rtr4=0,prp1=0,prp2=0,spltr=0,accH2O=0,accCH4=0,lights=0,btry=0},
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
	dmd.kW.dispNav=DISPLAYS_PWR_DMD_KW
	dmd.kW.dispSta=DISPLAYS_PWR_DMD_KW
	dmd.kW.lights=LIGHTS_PWR_DMD_KW
	dmd.kW.rtr1=RTR_MAX_PWR_DMD_KW*stToEf(rtr1.st)*s.con.thrt.rtrs
	dmd.kW.rtr2=RTR_MAX_PWR_DMD_KW*stToEf(rtr2.st)*s.con.thrt.rtrs
	dmd.kW.rtr3=RTR_MAX_PWR_DMD_KW*stToEf(rtr3.st)*s.con.thrt.rtrs
	dmd.kW.rtr4=RTR_MAX_PWR_DMD_KW*stToEf(rtr4.st)*s.con.thrt.rtrs
	dmd.kW.prp1=PROP_MAX_PWR_DMD_KW*stToEf(prp1.st)*s.con.thrt.prps
	dmd.kW.prp2=PROP_MAX_PWR_DMD_KW*stToEf(prp2.st)*s.con.thrt.prps
end

function cntrlsHydDmd()
	dmd.kNSM.rtr1=calcHydDmd(rtr1.rot,s.con.rot.rtrs,stToEf(rtr1.st),RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.rtr2=calcHydDmd(rtr2.rot,s.con.rot.rtrs,stToEf(rtr2.st),RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.rtr3=calcHydDmd(rtr3.rot,s.con.rot.rtrs,stToEf(rtr3.st),RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.rtr4=calcHydDmd(rtr4.rot,s.con.rot.rtrs,stToEf(rtr4.st),RTR_MAX_ROTATE_SPD_D,RTR_MAX_HYD_DMD_KNSM)
	dmd.kNSM.prp1=calcHydDmd(prp1.rot,s.con.rot.prps,stToEf(prp1.st),PROP_MAX_ROTATE_SPD_D,PROP_MAX_HYD_DMD_KNSM)
	dmd.kNSM.prp2=calcHydDmd(prp2.rot,s.con.rot.prps,stToEf(prp2.st),PROP_MAX_ROTATE_SPD_D,PROP_MAX_HYD_DMD_KNSM)
end

function strgTanksDmd()
	dmd.H2O.tank=math.min(H2O_TANK_MAX_KG-tkH2O.lvl,H2O_TANK_MAX_KGF)
	dmd.CH4.tank=math.min(CH4_TANK_MAX_KG-tkCH4.lvl,CH4_TANK_MAX_KGF)
	dmd.H_M.tank=math.min(H_TANK_MAX_KG-tkH.lvl,H_TANK_MAX_KGF)
	dmd.O.tank=math.min(O_TANK_MAX_KG-tkO.lvl,O_TANK_MAX_KGF)
end

function cellDmd()
	if cl1.fill>0 then dmd.H_V.cl1=math.min(CLL_MAX_M3-cl1.lvl,cl1.fill) end
	if cl2.fill>0 then dmd.H_V.cl2=math.min(CLL_MAX_M3-cl2.lvl,cl2.fill) end
	if cl3.fill>0 then dmd.H_V.cl3=math.min(CLL_MAX_M3-cl3.lvl,cl3.fill) end
	if cl4.fill>0 then dmd.H_V.cl4=math.min(CLL_MAX_M3-cl4.lvl,cl4.fill) end
end

function btryHydDmd()
	btryStateDmd=math.min(BTRY_MAX_CHARGE_RATE_KW,BTRY_MAX_CHARGE_KW*stToEf(btry.st)-btry.lvl)
	dmd.kW.btry=math.max(btryStateDmd,0)
	dmd.kNSM.hydRes=HYD_MAX_KNSM-hydRes.lvl
	dmd.NM.hydPump=math.min(HYD_PUMP_MAX_NM,dmd.kNSM.hydRes*HYD_PUMP_NM_PER_KNSM)
end

function spltrAccDmd()
	if dmd.H_M.tank>0 or dmd.O.tank>0 then
		dmd.kW.spltr=SPLTR_PWR_DMD_KW*stToEf(spltr.st)
		dmd.H2O.spltr=SPLTR_MAX_H2O*stToEf(spltr.st)
	end
	if dmd.H2O.tank>0 then dmd.kW.accH2O=H2O_ACC_PWR_DMD_KW*stToEf(accH2O.st) end
	if dmd.CH4.tank>0 then dmd.kW.accCH4=CH4_ACC_PWR_DMD_KW*stToEf(accCH4.st) end
end

function genTurbDmd()
	ttlPwr=math.min(GEN_MAX_KW*stToEf(gen.st),dmd.kW.dispNav+dmd.kW.dispSta+
			dmd.kW.rtr1+dmd.kW.rtr2+dmd.kW.rtr3+dmd.kW.rtr4+dmd.kW.prp1+dmd.kW.prp2+
			dmd.kW.spltr+dmd.kW.accH2O+dmd.kW.accCH4+dmd.kW.lights+dmd.kW.btry+1)
	dmd.NM.gen=(ttlPwr/GEN_MAX_KW)*GEN_MAX_NM
	ttlTorqueDmd=math.min(TURB_MAX_NM*stToEf(turb.st),dmd.NM.gen+dmd.NM.hydPump)
	dmd.steam=(ttlTorqueDmd/TURB_MAX_NM)*TURB_MAX_STEAM_KNSM
end

function bilrDmd()
	superSteamDmd=0
	if dmd.steam >= BILR_MAX_REG_STEAM_KNSM then
		superSteamDmd=(dmd.steam-BILR_MAX_REG_STEAM_KNSM)*stToEf(bilr.st)
	end
	steamDmd=math.min(BILR_MAX_STEAM_KNSM*stToEf(bilr.st),dmd.steam)
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
	turb.effc=safeUpDivide(sply.steam,dmd.steam)
	turb.ut=clamp01(sply.steam/TURB_MAX_STEAM_KNSM)
end

function torqueSupply()
	torqueSpld=TURB_MAX_NM*turb.ut
	torqueDmd=dmd.NM.gen+dmd.NM.hydPump

	if torqueSpld >= torqueDmd then
		sply.NM.gen=dmd.NM.gen
		sply.NM.hydPump=dmd.NM.hydPump
	else
		genPrct=safeDivide(dmd.NM.gen,torqueDmd)
		pumpPrct=safeDivide(dmd.NM.hydPump,torqueDmd)
		sply.NM.gen=torqueSpld*genPrct
		sply.NM.hydPump=torqueSpld*pumpPrct
	end
	hydPump.effc=safeUpDivide(sply.NM.hydPump,dmd.NM.hydPump)
	hydPump.ut=clamp01(sply.NM.hydPump/HYD_PUMP_MAX_NM)
	gen.effc=safeUpDivide(sply.NM.gen,dmd.NM.gen)
	gen.ut=clamp01(sply.NM.gen/GEN_MAX_NM)
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
		rtrs1Prct=safeDivide(dmd.kNSM.rtr1,tlPrssDmd)
		rtrs2Prct=safeDivide(dmd.kNSM.rtr2,tlPrssDmd)
		rtrs3Prct=safeDivide(dmd.kNSM.rtr3,tlPrssDmd)
		rtrs4Prct=safeDivide(dmd.kNSM.rtr4,tlPrssDmd)
		prps1Prct=safeDivide(dmd.kNSM.prp1,tlPrssDmd)
		prps2Prct=safeDivide(dmd.kNSM.prp2,tlPrssDmd)

		sply.kNSM.rtr1=rtrs1Prct*avlb4Use.kNSM
		sply.kNSM.rtr2=rtrs2Prct*avlb4Use.kNSM
		sply.kNSM.rtr3=rtrs3Prct*avlb4Use.kNSM
		sply.kNSM.rtr4=rtrs4Prct*avlb4Use.kNSM
		sply.kNSM.prp1=prps1Prct*avlb4Use.kNSM
		sply.kNSM.prp2=prps2Prct*avlb4Use.kNSM
	end
	rtr1.effc=safeUpDivide(sply.kNSM.rtr1,dmd.kNSM.rtr1)
	rtr2.effc=safeUpDivide(sply.kNSM.rtr2,dmd.kNSM.rtr2)
	rtr3.effc=safeUpDivide(sply.kNSM.rtr3,dmd.kNSM.rtr3)
	rtr4.effc=safeUpDivide(sply.kNSM.rtr4,dmd.kNSM.rtr4)
	prp1.effc=safeUpDivide(sply.kNSM.prp1,dmd.kNSM.prp1)
	prp2.effc=safeUpDivide(sply.kNSM.prp2,dmd.kNSM.prp2)
	rtr1.ut=clamp01(sply.kNSM.rtr1/RTR_MAX_HYD_DMD_KNSM)
	rtr2.ut=clamp01(sply.kNSM.rtr2/RTR_MAX_HYD_DMD_KNSM)
	rtr3.ut=clamp01(sply.kNSM.rtr3/RTR_MAX_HYD_DMD_KNSM)
	rtr4.ut=clamp01(sply.kNSM.rtr4/RTR_MAX_HYD_DMD_KNSM)
	prp1.ut=clamp01(sply.kNSM.prp1/PROP_MAX_HYD_DMD_KNSM)
	prp2.ut=clamp01(sply.kNSM.prp2/PROP_MAX_HYD_DMD_KNSM)
end

function pwrSupply()
	genPwr=GEN_MAX_KW*(sply.NM.gen/GEN_MAX_NM)
	btryPwr=avlb4Use.kW
	emPwrDmd=dmd.kW.dispNav+dmd.kW.dispSta+dmd.kW.btry
	priPwrDmd=dmd.kW.spltr+dmd.kW.accH2O+dmd.kW.accCH4
	secPwrDmd=dmd.kW.rtr1+dmd.kW.rtr2+dmd.kW.rtr3+dmd.kW.rtr4+dmd.kW.prp1+dmd.kW.prp2+dmd.kW.lights
	ttlPwrDmd=priPwrDmd+secPwrDmd+emPwrDmd

	if ttlPwrDmd<=genPwr then
		sply.kW.dispNav=dmd.kW.dispNav
		sply.kW.dispSta=dmd.kW.dispSta
		sply.kW.rtr1=dmd.kW.rtr1
		sply.kW.rtr2=dmd.kW.rtr2
		sply.kW.rtr3=dmd.kW.rtr3
		sply.kW.rtr4=dmd.kW.rtr4
		sply.kW.prp1=dmd.kW.prp1
		sply.kW.prp2=dmd.kW.prp2
		sply.kW.spltr=dmd.kW.spltr
		sply.kW.accH2O=dmd.kW.accH2O
		sply.kW.accCH4=dmd.kW.accCH4
		sply.kW.lights=dmd.kW.lights
		sply.kW.btry=dmd.kW.btry
    pwrType=4
	elseif genPwr>=(priPwrDmd+emPwrDmd) then
		sply.kW.dispNav=dmd.kW.dispNav
		sply.kW.dispSta=dmd.kW.dispSta
		sply.kW.spltr=dmd.kW.spltr
		sply.kW.accH2O=dmd.kW.accH2O
		sply.kW.accCH4=dmd.kW.accCH4
		sply.kW.btry=dmd.kW.btry
		remGen=genPwr-priPwrDmd-emPwrDmd

		rtrs1Prct=safeDivide(dmd.kW.rtr1,secPwrDmd)
		rtrs2Prct=safeDivide(dmd.kW.rtr2,secPwrDmd)
		rtrs3Prct=safeDivide(dmd.kW.rtr3,secPwrDmd)
		rtrs4Prct=safeDivide(dmd.kW.rtr4,secPwrDmd)
		prps1Prct=safeDivide(dmd.kW.prp1,secPwrDmd)
		prps2Prct=safeDivide(dmd.kW.prp2,secPwrDmd)
		lightsPrct=safeDivide(dmd.kW.lights,secPwrDmd)

		sply.kW.rtr1=rtrs1Prct*remGen
		sply.kW.rtr2=rtrs2Prct*remGen
		sply.kW.rtr3=rtrs3Prct*remGen
		sply.kW.rtr4=rtrs4Prct*remGen
		sply.kW.prp1=prps1Prct*remGen
		sply.kW.prp2=prps2Prct*remGen
		sply.kW.lights=lightsPrct*remGen
    pwrType=3
	elseif genPwr>=emPwrDmd or btryPwr>(BTRY_MAX_CHARGE_KW*.2) then
		sply.kW.dispNav=dmd.kW.dispNav
		sply.kW.dispSta=dmd.kW.dispSta
		sply.kW.btry=dmd.kW.btry
		remGen=genPwr-emPwrDmd

		spltrPrct=safeDivide(dmd.kW.spltr,priPwrDmd)
		accH2OPrct=safeDivide(dmd.kW.accH2O,priPwrDmd)
		accCH4Prct=safeDivide(dmd.kW.accCH4,priPwrDmd)
    battUse=math.min(btryPwr,priPwrDmd-remGen)
		resPwr=remGen+battUse

		sply.kW.spltr=spltrPrct*resPwr
		sply.kW.accH2O=accH2OPrct*resPwr
		sply.kW.accCH4=accCH4Prct*resPwr
		avlb4Stg.kW=-battUse
    pwrType=2
	else
		sply.kW.btry=math.min(dmd.kW.btry,genPwr)
		dispNavPrct=safeDivide(dmd.kW.dispNav,emPwrDmd)
		dispStaPrct=safeDivide(dmd.kW.dispSta,emPwrDmd)
		remGen=genPwr-sply.kW.btry
    battUse=math.min(btryPwr,emPwrDmd-remGen)
    resPwr=remGen+battUse

    sply.kW.dispNav=dispNavPrct*resPwr
    sply.kW.dispSta=dispStaPrct*resPwr
    avlb4Stg.kW=remGen-sply.kW.dispNav-sply.kW.dispSta
    pwrType=1
	end
	rtr1.effc=math.min(rtr1.effc,safeUpDivide(sply.kW.rtr1,dmd.kW.rtr1))
	rtr2.effc=math.min(rtr2.effc,safeUpDivide(sply.kW.rtr2,dmd.kW.rtr2))
	rtr3.effc=math.min(rtr3.effc,safeUpDivide(sply.kW.rtr3,dmd.kW.rtr3))
	rtr4.effc=math.min(rtr4.effc,safeUpDivide(sply.kW.rtr4,dmd.kW.rtr4))
	prp1.effc=math.min(prp1.effc,safeUpDivide(sply.kW.prp1,dmd.kW.prp1))
	prp2.effc=math.min(prp2.effc,safeUpDivide(sply.kW.prp2,dmd.kW.prp2))
	rtr1.ut=clamp01(rtr1.ut+sply.kW.rtr1/RTR_MAX_PWR_DMD_KW)
	rtr2.ut=clamp01(rtr2.ut+sply.kW.rtr2/RTR_MAX_PWR_DMD_KW)
	rtr3.ut=clamp01(rtr3.ut+sply.kW.rtr3/RTR_MAX_PWR_DMD_KW)
	rtr4.ut=clamp01(rtr4.ut+sply.kW.rtr4/RTR_MAX_PWR_DMD_KW)
	prp1.ut=clamp01(prp1.ut+sply.kW.prp1/PROP_MAX_PWR_DMD_KW)
	prp2.ut=clamp01(prp2.ut+sply.kW.prp2/PROP_MAX_PWR_DMD_KW)
	spltr.effc=safeUpDivide(sply.kW.spltr,dmd.kW.spltr)
	accH2O.effc=safeUpDivide(sply.kW.accH2O,dmd.kW.accH2O)
	accCH4.effc=safeUpDivide(sply.kW.accCH4,dmd.kW.accCH4)
	spltr.ut=clamp01(sply.kW.spltr/SPLTR_PWR_DMD_KW)
	accH2O.ut=clamp01(sply.kW.accH2O/H2O_ACC_PWR_DMD_KW)
	accCH4.ut=clamp01(sply.kW.accCH4/CH4_ACC_PWR_DMD_KW)
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
	dispNav.on=(sply.kW.dispNav>=dmd.kW.dispNav)
	dispSta.on=(sply.kW.dispSta>=dmd.kW.dispSta)
	s.isLit=(sply.kW.lights>=dmd.kW.lights)
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
	if sply.kW.accH2O>0 then
		sply.H2O.tank=(sply.kW.accH2O/H2O_ACC_PWR_DMD_KW)*H2O_ACC_PER_TIC*s.env.H2O*intakeAdj
	end
	if sply.kW.accCH4>0 then
		sply.CH4.tank=(sply.kW.accCH4/CH4_ACC_PWR_DMD_KW)*CH4_ACC_PER_TIC*s.env.CH4*intakeAdj
	end
	if sply.kW.btry>0 then
		avlb4Stg.kW=sply.kW.btry+avlb4Stg.kW
	end
end

function drainTanks()
	cl1.lvl=cl1.lvl-math.max(math.max(0.01,1-stToEf(cl1.st))*CLL_MAX_VENT_M3F,-cl1.fill)
	cl2.lvl=cl2.lvl-math.max(math.max(0.01,1-stToEf(cl2.st))*CLL_MAX_VENT_M3F,-cl2.fill)
	cl3.lvl=cl3.lvl-math.max(math.max(0.01,1-stToEf(cl3.st))*CLL_MAX_VENT_M3F,-cl3.fill)
	cl4.lvl=cl4.lvl-math.max(math.max(0.01,1-stToEf(cl4.st))*CLL_MAX_VENT_M3F,-cl4.fill)

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

	cl1.ut=clamp01(sply.H_V.cl1/CLL_MAX_M3F)
	cl2.ut=clamp01(sply.H_V.cl2/CLL_MAX_M3F)
	cl3.ut=clamp01(sply.H_V.cl3/CLL_MAX_M3F)
	cl4.ut=clamp01(sply.H_V.cl4/CLL_MAX_M3F)
	tkH.ut=clamp01(sply.H_M.tank/H_TANK_MAX_KGF)
	tkO.ut=clamp01(sply.O.tank/O_TANK_MAX_KGF)
	tkH2O.ut=clamp01(sply.H2O.tank/H2O_TANK_MAX_KGF)
	tkCH4.ut=clamp01(sply.CH4.tank/CH4_TANK_MAX_KGF)
	hydRes.ut=clamp01(sply.kNSM.hydRes/HYD_MAX_KNSM)
	btry.ut=clamp01(avlb4Stg.kW/BTRY_MAX_CHARGE_RATE_KW)

	cl1.effc=cl1.lvl/CLL_MAX_M3
	cl2.effc=cl2.lvl/CLL_MAX_M3
	cl3.effc=cl3.lvl/CLL_MAX_M3
	cl4.effc=cl4.lvl/CLL_MAX_M3
	tkH.effc=tkH.lvl/H_TANK_MAX_KG
	tkO.effc=tkO.lvl/O_TANK_MAX_KG
	tkH2O.effc=tkH2O.lvl/H2O_TANK_MAX_KG
	tkCH4.effc=tkCH4.lvl/CH4_TANK_MAX_KG
	hydRes.effc=hydRes.lvl/HYD_MAX_KNSM
	btry.effc=btry.lvl/BTRY_MAX_CHARGE_KW
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
	sta.dis=s.dis

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
	estVsiPerHV=calcEstVsiPerHV(vForce,ttlShipWeightKG,vertDrag)

	if s.con.alt<s.pos.z then
		altDiff=clamp01(invLerp(0,2000,s.pos.z-s.con.alt))
		s.reqVsi=-altDiff*SHIP_MAX_VSI
	elseif s.con.alt>s.pos.z then
		altDiff=clamp01(invLerp(0,2000,s.con.alt-s.pos.z))
		s.reqVsi=altDiff*SHIP_MAX_VSI
	end

	vsiDiff=math.abs(s.vsi-s.reqVsi)
	thrtAdj=lerp(0,1,vsiDiff/SHIP_MAX_VSI)
	if s.vsi<s.reqVsi then
		s.con.thrt.rtrs=math.min(s.con.thrt.rtrs+thrtAdj,1)
		s.reqBou=math.min(lerp(s.reqBou,(s.reqVsi-s.vsi)*estVsiPerHV,.001),4*CLL_MAX_M3F)
	elseif s.vsi>s.reqVsi then
		s.con.thrt.rtrs=math.max(s.con.thrt.rtrs-thrtAdj,0)
		s.reqBou=math.max(lerp(s.reqBou,-(s.vsi-s.reqVsi)*estVsiPerHV,.001),-4*CLL_MAX_M3F)
	else
		s.reqBou=lerp(s.reqBou,0,.001)
	end

	if s.reqBou~=0 and math.abs(s.con.alt-s.pos.z)>200 then
		trgtLvl=.25*(cl1.lvl+cl2.lvl+cl3.lvl+cl4.lvl+s.reqBou)
		calcClFill(cl1,trgtLvl)
		calcClFill(cl2,trgtLvl)
		calcClFill(cl3,trgtLvl)
		calcClFill(cl4,trgtLvl)
	end

	if s.pos.z<=1 then
		s.pos.z=0
		s.spd=0
		if not s.isCrash then
			dmgSysts(s.vsi)
			camShake(str.t,s.vsi)
			crashSound(str.t)
			s.isCrash=true
			sta.crashes=sta.crashes+1
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

function calcEstVsiPerHV(vForce,weight,drag)
	forceReq=7200+drag+weight-vForce
	return (forceReq/HYDROGEN_LIFT_ADJ/KG_TO_N)/(SEA_LEVEL_AIR_DENSITY-HYDROGEN_DENSITY)
end

function calcClFill(cl,trgt)
	if cl.lvl<trgt then
		cl.fill=math.min(trgt-cl.lvl,CLL_MAX_M3F)
	elseif cl.lvl>trgt then
		cl.fill=math.max(trgt-cl.lvl,-CLL_MAX_M3F)
	end
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

		if thrst.rot<s.con.rot[type] then
			if math.abs(thrst.rot-s.con.rot[type])<180 then
				thrst.rot=thrst.rot+moveAngl
			else
				thrst.rot=thrst.rot-moveAngl
			end
		else
			if math.abs(thrst.rot-s.con.rot[type])<180 then
				thrst.rot=thrst.rot-moveAngl
			else
				thrst.rot=thrst.rot+moveAngl
			end
		end
		if thrst.rot>=360 then thrst.rot=thrst.rot-360 end
		if thrst.rot<0 then thrst.rot=360+thrst.rot end
	end
end

function rotRtr(spl,rtr)
	return rotThrster('rtrs',spl,rtr,RTR_MAX_HYD_DMD_KNSM,RTR_MAX_ROTATE_SPD_D)
end

function rotProp(spl,prop)
	return rotThrster('prps',spl,prop,PROP_MAX_HYD_DMD_KNSM,PROP_MAX_ROTATE_SPD_D)
end

function isLinThFlr(lx1,ly1,lx2,ly2)
	local chkCnt=distance({x=lx1,y=ly1},{x=lx2,y=ly2})//8
	for i=0,chkCnt do
		local tId=mget(lerp(lx1,lx2,i/chkCnt)//8,lerp(ly1,ly2,i/chkCnt)//8)
		if tId==16 or tId==31 or tId==64 or tId==79 or tId==80 or tId==95 or tId==189 or tId==158 or tId==223 or tId==254 then
			return true
		end
	end
	return false
end

function stToEf(val)
	return clamp01(1-(1/(1+(-val-.7)^16)))
end

function randRangeF(min,max)
	return lerp(min,max,math.random())
end

function safeDivide(num,den)
	return (den>0) and num/den or 0
end

function safeUpDivide(num,den)
	if num==0 and den==0 then return 1 end
	return num/den
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
	local minX=10000
	local minY=10000
	local maxX=-10000
	local maxY=-10000
	for i,bb in pairs(bbs) do
		if bb.minX<minX then minX=bb.minX end
		if bb.minY<minY then minY=bb.minY end
		if bb.maxX>maxX then maxX=bb.maxX end
		if bb.maxY>maxY then maxY=bb.maxY end
	end
	return {minX=minX,minY=minY,maxX=maxX,maxY=maxY}
end

function joinPxlBB(bbs)
	local bb=joinBBs(bbs)
	return {minX=bb.minX*8,minY=bb.minY*8,maxX=bb.maxX*8+7,maxY=bb.maxY*8+7}
end

function bbHorPxlCntr(bbs)
	local bb=joinBBs(bbs)
	return {x=((bb.maxX+1-bb.minX)/2+bb.minX)*8,y=(bb.maxY+1)*8-1}
end

function bbCntr(bbs)
	local bb=joinBBs(bbs)
	return {x=(bb.maxX+1-bb.minX)/2+bb.minX,y=(bb.maxY-bb.minY)/2+bb.minY}
end

function rotV2(vec,angl)
	r=math.rad(angl)
	aSin=math.sin(r)
	aCos=math.cos(r)
	return {x=vec.x*aCos-vec.y*aSin,y=vec.y*aCos+vec.x*aSin}
end

function rotV2Ct(cnt,vec,angl)
	r=rotV2({x=vec.x-cnt.x,y=vec.y-cnt.y},angl)
	return {x=r.x+cnt.x,y=r.y+cnt.y}
end

function contains(bb,pos)
	return pos.x>=bb.minX and pos.y>=bb.minY and pos.x<=bb.maxX and pos.y<=bb.maxY
end

function mapContains(bb,pos)
	return contains({minX=bb.minX*8,minY=bb.minY*8,maxX=bb.maxX*8+7,maxY=bb.maxY*8+7},pos)
end

function comContains(bbs,pos)
	local res=false
	for i,bb in pairs(bbs) do
		if mapContains(bb,pos) then res=true end
	end
	return res
end

initGame()
