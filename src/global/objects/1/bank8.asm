;differences are the us added mt. itoi rooms
;and the cheapest flightplan added a loop around the cactus

OBJ_BANK_8:
.addr OBJ_YUCCA_PILOT
.addr OBJ_YUCCA_TANK
.addr OBJ_YUCCA_PLANE
.addr OBJ_YUCCA_SIGN
.addr OBJ_YUCCA_TANK2
.addr OBJ_YUCCA_R7037_TANK
.ifndef VER_JP ;us only
.addr OBJ_MTITOI_GIEGUECAVEEXIT
.addr OBJ_MTITOI_TUBESENTRANCE
.addr OBJ_MTITOI_GIEGUECAVETOP
.endif
.addr 0

OBJ_YUCCA_PILOT:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $1f3, DIRECTIONS::DOWN, $121
.addr SPRITEDEF_2B5 ;sprite
.byte SCRIPTS::F_DISAPPEAR, $17
.byte SCRIPTS::IJ_USE, $64, OBJ_YUCCA_PILOT_IJUSE0-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_RESETCOUNTER, $5
    OBJ_YUCCA_PILOT_CNJCOMPCOUNTER2:
.byte SCRIPTS::IJ_HASITEM, $64, OBJ_YUCCA_PILOT_IJHASITEM1-OBJ_YUCCA_PILOT
.byte SCRIPTS::SHOWMONEY
.byte SCRIPTS::I_PICKITEM, $64
.byte SCRIPTS::J_REMOVEITEM, OBJ_YUCCA_PILOT_IJHASITEM1-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_INCCOUNTER, $5
.byte SCRIPTS::CNJ_COMPCOUNTER, $5, $A, OBJ_YUCCA_PILOT_CNJCOMPCOUNTER2-OBJ_YUCCA_PILOT
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_TANK
.byte SCRIPTS::F_SETFLAG, $88
.byte 0
    OBJ_YUCCA_PILOT_IJHASITEM1:
.byte SCRIPTS::CNJ_COMPCOUNTER, $5, $1, OBJ_YUCCA_PILOT_CNJCOMPCOUNTER3-OBJ_YUCCA_PILOT
.byte SCRIPTS::IJ_HASITEM, $0, OBJ_YUCCA_PILOT_CNJCOMPCOUNTER3-OBJ_YUCCA_PILOT
.byte SCRIPTS::I_PICKITEM, $64
.byte SCRIPTS::J_GIVEITEM, OBJ_YUCCA_PILOT_CNJCOMPCOUNTER3-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_DECCOUNTER, $5
.byte SCRIPTS::J_JUMP, OBJ_YUCCA_PILOT_IJHASITEM1-OBJ_YUCCA_PILOT
    OBJ_YUCCA_PILOT_CNJCOMPCOUNTER3:
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_NOMONEY2
.byte 0
    OBJ_YUCCA_PILOT_IJUSE0:
.byte SCRIPTS::J_TALK, OBJ_YUCCA_PILOT_JTALK4-OBJ_YUCCA_PILOT
.byte SCRIPTS::FJ_JUMP, $88, OBJ_YUCCA_PILOT_FJJUMP5-OBJ_YUCCA_PILOT
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_TANKRIDE
.byte 0
    OBJ_YUCCA_PILOT_FJJUMP5:
.byte SCRIPTS::FJ_JUMP, $3A, OBJ_YUCCA_PILOT_FJJUMP6-OBJ_YUCCA_PILOT
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_RIDE
.byte SCRIPTS::J_YESNO, OBJ_YUCCA_PILOT_JYESNO7-OBJ_YUCCA_PILOT
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_CHOOSEPLAN
.byte SCRIPTS::IIIIJ_LIST, $9C, $9D, $9E, $0, OBJ_YUCCA_PILOT_JYESNO7-OBJ_YUCCA_PILOT
.byte SCRIPTS::F_CLEARFLAG, $89
.byte SCRIPTS::F_CLEARFLAG, $8A
.byte SCRIPTS::F_CLEARFLAG, $8B
.byte SCRIPTS::IJ_SELECTEDITEM, $9C, OBJ_YUCCA_PILOT_IJSELECTEDITEM8-OBJ_YUCCA_PILOT
.byte SCRIPTS::F_SETFLAG, $89
.byte SCRIPTS::J_JUMP, OBJ_YUCCA_PILOTJ_JUMP9-OBJ_YUCCA_PILOT
    OBJ_YUCCA_PILOT_IJSELECTEDITEM8:
.byte SCRIPTS::IJ_SELECTEDITEM, $9D, OBJ_YUCCA_PILOT_IJSELECTEDITEM10-OBJ_YUCCA_PILOT
.byte SCRIPTS::F_SETFLAG, $8A
.byte SCRIPTS::J_JUMP, OBJ_YUCCA_PILOTJ_JUMP9-OBJ_YUCCA_PILOT
    OBJ_YUCCA_PILOT_IJSELECTEDITEM10:
.byte SCRIPTS::IJ_SELECTEDITEM, $9E, OBJ_YUCCA_PILOTJ_JUMP9-OBJ_YUCCA_PILOT
.byte SCRIPTS::F_SETFLAG, $8B
    OBJ_YUCCA_PILOTJ_JUMP9:
.byte SCRIPTS::C_RESETCOUNTER, $0
.byte SCRIPTS::C_INCCOUNTER, $0
.byte SCRIPTS::CJ_SELECTPARTY, $1, OBJ_YUCCA_PILOT_CJSELECTPARTY11-OBJ_YUCCA_PILOT
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_YUCCA_PILOT_SJPRESENT12-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_INCCOUNTER, $0
    OBJ_YUCCA_PILOT_SJPRESENT12:
.byte SCRIPTS::CJ_SELECTPARTY, $2, OBJ_YUCCA_PILOT_CJSELECTPARTY11-OBJ_YUCCA_PILOT
.byte SCRIPTS::SJ_PRESENT, $80, OBJ_YUCCA_PILOT_CJSELECTPARTY11-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_INCCOUNTER, $0
    OBJ_YUCCA_PILOT_CJSELECTPARTY11:
.byte SCRIPTS::CHARMULT
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_RIDE_ACCEPT
.byte SCRIPTS::J_TAKEMONEY, OBJ_YUCCA_PILOT_JTAKEMONEY13-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_RESETCOUNTER, $6
    OBJ_YUCCA_PILOTJ_JUMP16:
.byte SCRIPTS::CNJ_COMPCOUNTER, $0, $1, OBJ_YUCCA_PILOT_CNJCOMPCOUNTER14-OBJ_YUCCA_PILOT
.byte SCRIPTS::IJ_HASITEM, $0, OBJ_YUCCA_PILOT_IJHASITEM15-OBJ_YUCCA_PILOT
.byte SCRIPTS::I_PICKITEM, $64
.byte SCRIPTS::J_GIVEITEM, OBJ_YUCCA_PILOT_IJHASITEM15-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_INCCOUNTER, $6
.byte SCRIPTS::C_DECCOUNTER, $0
.byte SCRIPTS::J_JUMP, OBJ_YUCCA_PILOTJ_JUMP16-OBJ_YUCCA_PILOT
    OBJ_YUCCA_PILOT_IJHASITEM15:
.byte SCRIPTS::CNJ_COMPCOUNTER, $6, $1, OBJ_YUCCA_PILOT_CNJCOMPCOUNTER17-OBJ_YUCCA_PILOT
.byte SCRIPTS::IJ_HASITEM, $64, OBJ_YUCCA_PILOT_JTALK4-OBJ_YUCCA_PILOT
.byte SCRIPTS::I_PICKITEM, $64
.byte SCRIPTS::J_REMOVEITEM, OBJ_YUCCA_PILOT_JTALK4-OBJ_YUCCA_PILOT
.byte SCRIPTS::C_DECCOUNTER, $6
.byte SCRIPTS::J_JUMP, OBJ_YUCCA_PILOT_IJHASITEM15-OBJ_YUCCA_PILOT
    OBJ_YUCCA_PILOT_CNJCOMPCOUNTER17:
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_NOROOM
.byte SCRIPTS::FJ_JUMP, $89, OBJ_YUCCA_PILOT_FJJUMP18-OBJ_YUCCA_PILOT
.byte SCRIPTS::I_PICKITEM, $9C
.byte SCRIPTS::J_JUMP, OBJ_YUCCA_PILOTJ_JUMP19-OBJ_YUCCA_PILOT
    OBJ_YUCCA_PILOT_FJJUMP18:
.byte SCRIPTS::FJ_JUMP, $8A, OBJ_YUCCA_PILOT_FJJUMP20-OBJ_YUCCA_PILOT
.byte SCRIPTS::I_PICKITEM, $9D
.byte SCRIPTS::J_JUMP, OBJ_YUCCA_PILOTJ_JUMP19-OBJ_YUCCA_PILOT
    OBJ_YUCCA_PILOT_FJJUMP20:
.byte SCRIPTS::I_PICKITEM, $9E
    OBJ_YUCCA_PILOTJ_JUMP19:
.byte SCRIPTS::CHARMULT
.byte SCRIPTS::J_GIVEMONEY, OBJ_YUCCA_PILOT_JTALK4-OBJ_YUCCA_PILOT
.byte 0
    OBJ_YUCCA_PILOT_JTAKEMONEY13:
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_NOMONEY
.byte 0
    OBJ_YUCCA_PILOT_JYESNO7:
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_RIDE_DECLINE
.byte 0
    OBJ_YUCCA_PILOT_FJJUMP6:
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_PILOT_MINE
.byte SCRIPTS::F_SETFLAG, $3A
    OBJ_YUCCA_PILOT_JTALK4:
.byte 0
    OBJ_YUCCA_PILOT_CNJCOMPCOUNTER14:
.byte SCRIPTS::S_PLAYSOUND, $6
.byte SCRIPTS::M_MOVE
.addr OBJ_YUCCA_PILOT_MOVE0
.byte SCRIPTS::O_SIGNAL, $2
.byte SCRIPTS::F_SETFLAG, $17
.byte 0
    OBJ_YUCCA_PILOT_MOVE0:
moveDef DIRECTIONS::UP, $6, $1
moveDef DIRECTIONS::DOWN, $2, $1
.byte 0

OBJ_YUCCA_TANK:
objectDef $1e, $1f8, DIRECTIONS::DOWN, $124
.addr SPRITEDEF_2CB ;sprite
.byte SCRIPTS::F_DISAPPEAR, $18
.byte SCRIPTS::J_TOUCH, OBJ_YUCCA_TANK_JTOUCH0-OBJ_YUCCA_TANK
.byte SCRIPTS::FJ_JUMP, $88, OBJ_YUCCA_TANK_JTOUCH0-OBJ_YUCCA_TANK
.byte SCRIPTS::M_MUSIC, $17
.byte SCRIPTS::D_TANK, DIRECTIONS::DOWN
.byte SCRIPTS::F_SETFLAG, $18
.byte SCRIPTS::F_SETFLAG, $73
    OBJ_YUCCA_TANK_JTOUCH0:
.byte 0

OBJ_YUCCA_PLANE:
objectDef $1e, $1f3, DIRECTIONS::LEFT, $120
.addr SPRITEDEF_2C5 ;sprite
.byte SCRIPTS::F_DISAPPEAR, $19
.byte SCRIPTS::J_SIGNALED, OBJ_YUCCA_PLANE_JSIGNALED0-OBJ_YUCCA_PLANE
.byte SCRIPTS::FJ_JUMP, $89, OBJ_YUCCA_PLANE_FJJUMP1-OBJ_YUCCA_PLANE
.byte SCRIPTS::D_AIRPLANE, DIRECTIONS::LEFT
.byte SCRIPTS::M_MUSIC, $1E
.byte SCRIPTS::M_MOVE
.addr OBJ_YUCCA_PLANE_MOVE0
.byte SCRIPTS::PLANEEND
.byte SCRIPTS::M_MOVE
.addr OBJ_YUCCA_PLANE_MOVE1
.byte SCRIPTS::D_NOVEC, DIRECTIONS::DOWN
.byte SCRIPTS::M_MUSIC, $8
.byte SCRIPTS::F_CLEARFLAG, $17
.byte 0
    OBJ_YUCCA_PLANE_FJJUMP1:
.byte SCRIPTS::FJ_JUMP, $8A, OBJ_YUCCA_PLANE_FJJUMP2-OBJ_YUCCA_PLANE
.byte SCRIPTS::D_AIRPLANE, DIRECTIONS::LEFT
.byte SCRIPTS::M_MUSIC, $1E
.byte SCRIPTS::M_MOVE
.addr OBJ_YUCCA_PLANE_MOVE2
.byte SCRIPTS::PLANEEND
.byte SCRIPTS::M_MOVE
.addr OBJ_YUCCA_PLANE_MOVE1
.byte SCRIPTS::D_NOVEC, DIRECTIONS::DOWN
.byte SCRIPTS::M_MUSIC, $8
.byte SCRIPTS::F_CLEARFLAG, $17
.byte 0
    OBJ_YUCCA_PLANE_FJJUMP2:
.byte SCRIPTS::FJ_JUMP, $8B, OBJ_YUCCA_PLANE_JSIGNALED0-OBJ_YUCCA_PLANE
.byte SCRIPTS::D_AIRPLANE, DIRECTIONS::LEFT
.byte SCRIPTS::M_MUSIC, $1E
.byte SCRIPTS::M_MOVE
.addr OBJ_YUCCA_PLANE_MOVE3
.byte SCRIPTS::PLANEEND
.byte SCRIPTS::M_MOVE
.addr OBJ_YUCCA_PLANE_MOVE1
.byte SCRIPTS::D_NOVEC, DIRECTIONS::DOWN
.byte SCRIPTS::M_MUSIC, $8
.byte SCRIPTS::F_CLEARFLAG, $17
    OBJ_YUCCA_PLANE_JSIGNALED0:
.byte 0
    OBJ_YUCCA_PLANE_MOVE0:
;jp didnt have the loop
.ifdef VER_JP
moveDef DIRECTIONS::LEFT, $2, $30
moveDef DIRECTIONS::UP_LEFT, $2, $5
moveDef DIRECTIONS::UP, $2, $4C
moveDef DIRECTIONS::UP_RIGHT, $2, $5
moveDef DIRECTIONS::RIGHT, $2, $B4
.else
moveDef DIRECTIONS::LEFT, $2, $33
moveDef DIRECTIONS::UP_LEFT, $2, $5
moveDef DIRECTIONS::UP, $2, $A
moveDef DIRECTIONS::UP, $2, $2
moveDef DIRECTIONS::UP_RIGHT, $2, $2
moveDef DIRECTIONS::RIGHT, $2, $4
moveDef DIRECTIONS::DOWN_RIGHT, $2, $2
moveDef DIRECTIONS::DOWN, $2, $4
moveDef DIRECTIONS::DOWN_LEFT, $2, $2
moveDef DIRECTIONS::LEFT, $2, $4
moveDef DIRECTIONS::UP_LEFT, $2, $2
moveDef DIRECTIONS::UP, $2, $4
moveDef DIRECTIONS::UP_RIGHT, $2, $2
moveDef DIRECTIONS::RIGHT, $2, $4
moveDef DIRECTIONS::DOWN_RIGHT, $2, $2
moveDef DIRECTIONS::DOWN, $2, $4
moveDef DIRECTIONS::DOWN_LEFT, $2, $2
moveDef DIRECTIONS::LEFT, $2, $4
moveDef DIRECTIONS::UP_LEFT, $2, $2
moveDef DIRECTIONS::UP, $2, $1
moveDef DIRECTIONS::UP, $2, $43
moveDef DIRECTIONS::UP_RIGHT, $2, $5
moveDef DIRECTIONS::RIGHT, $2, $B7
.endif
moveDef DIRECTIONS::DOWN_RIGHT, $2, $5
moveDef DIRECTIONS::DOWN, $2, $4C
moveDef DIRECTIONS::DOWN_LEFT, $2, $5
moveDef DIRECTIONS::LEFT, $2, $7A
.byte 3
    OBJ_YUCCA_PLANE_MOVE2:
moveDef DIRECTIONS::LEFT, $2, $D6
moveDef DIRECTIONS::DOWN_LEFT, $2, $2E
moveDef DIRECTIONS::LEFT, $2, $32
moveDef DIRECTIONS::UP_LEFT, $2, $A
moveDef DIRECTIONS::UP, $2, $40
moveDef DIRECTIONS::UP_RIGHT, $2, $D
moveDef DIRECTIONS::RIGHT, $2, $C8
moveDef DIRECTIONS::RIGHT, $2, $7A
moveDef DIRECTIONS::DOWN_RIGHT, $2, $8
moveDef DIRECTIONS::DOWN, $2, $19
moveDef DIRECTIONS::DOWN_LEFT, $2, $8
moveDef DIRECTIONS::LEFT, $2, $5
.byte 3
    OBJ_YUCCA_PLANE_MOVE3:
moveDef DIRECTIONS::LEFT, $2, $F
moveDef DIRECTIONS::UP_LEFT, $2, $5
moveDef DIRECTIONS::UP, $2, $4C
moveDef DIRECTIONS::UP_RIGHT, $2, $5
moveDef DIRECTIONS::RIGHT, $2, $C8
moveDef DIRECTIONS::RIGHT, $2, $46
moveDef DIRECTIONS::DOWN_RIGHT, $2, $A
moveDef DIRECTIONS::DOWN, $2, $C3
moveDef DIRECTIONS::DOWN_LEFT, $2, $5
moveDef DIRECTIONS::LEFT, $2, $54
moveDef DIRECTIONS::UP_LEFT, $2, $7C
moveDef DIRECTIONS::LEFT, $2, $2A
.byte 3
    OBJ_YUCCA_PLANE_MOVE1:
moveDef DIRECTIONS::LEFT, $2, $A
.byte 0

OBJ_YUCCA_SIGN:
objectDef $19, $1e9, DIRECTIONS::UP, $122
.addr SPRITEDEF_65 ;sprite
.byte SCRIPTS::J_CHECK, OBJ_YUCCA_SIGN_JCHECK0-OBJ_YUCCA_SIGN
.byte SCRIPTS::DIALOGUE
.word UMSG::YUCCA_SIGN
    OBJ_YUCCA_SIGN_JCHECK0:
.byte 0

OBJ_YUCCA_TANK2:
objectDef $1f, $1f8, DIRECTIONS::UP, $124
.byte SCRIPTS::F_APPEAR, $73
.byte SCRIPTS::J_TOUCH, OBJ_YUCCA_TANK2_JTOUCH0-OBJ_YUCCA_TANK2
.byte SCRIPTS::F_CLEARFLAG, $18
.byte SCRIPTS::F_CLEARFLAG, $73
.byte SCRIPTS::M_MUSIC, $8
.byte SCRIPTS::D_NOVEC, DIRECTIONS::UP
    OBJ_YUCCA_TANK2_JTOUCH0:
.byte 0

OBJ_YUCCA_R7037_TANK:
objectDef $1c, $275, DIRECTIONS::UP, $119
.byte SCRIPTS::F_APPEAR, $73
.byte SCRIPTS::J_TOUCH, OBJ_YUCCA_R7037_TANK_JTOUCH0-OBJ_YUCCA_R7037_TANK
.byte SCRIPTS::B_BATTLE, $6F
.byte SCRIPTS::F_SETFLAG, $78
.byte SCRIPTS::F_SETFLAG, $90
.byte SCRIPTS::F_CLEARFLAG, $73
.byte SCRIPTS::F_SETFLAG, $17
.byte SCRIPTS::F_SETFLAG, $19
.byte SCRIPTS::F_SETFLAG, $1A
.byte SCRIPTS::M_MUSIC, $8
.byte SCRIPTS::D_NOVEC, DIRECTIONS::UP
    OBJ_YUCCA_R7037_TANK_JTOUCH0:
.byte 0

;us only
.ifndef VER_JP
OBJ_MTITOI_GIEGUECAVEEXIT:
objectDef OBJ_TYPE::DOOR, $305, DIRECTIONS::UP, $280
doorArgDef $B, $389, DIRECTIONS::DOWN, $246

OBJ_MTITOI_TUBESENTRANCE:
objectDef OBJ_TYPE::DOOR, $30d, DIRECTIONS::UP, $274
doorArgDef $0, $38D, DIRECTIONS::LEFT, $B6

OBJ_MTITOI_GIEGUECAVETOP:
objectDef $18, $306, DIRECTIONS::UP, $248
.byte SCRIPTS::J_UNK, OBJ_MTITOI_GIEGUECAVETOP_JUNK0-OBJ_MTITOI_GIEGUECAVETOP
.byte SCRIPTS::J_TOUCH, OBJ_MTITOI_GIEGUECAVETOP_JUNK0-OBJ_MTITOI_GIEGUECAVETOP
.byte SCRIPTS::B_BATTLE, $A2
    OBJ_MTITOI_GIEGUECAVETOP_JUNK0:
.byte 0
.endif