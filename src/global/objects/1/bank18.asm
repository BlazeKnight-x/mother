OBJ_BANK_18:
.addr OBJ_PODUNK_HOTELEXIT
.addr OBJ_PODUNK_HOTELUPSTAIRS
.addr OBJ_PODUNK_HOTELUPROOM1EXIT
.addr OBJ_PODUNK_HOTELUPROOM2EXIT
.addr OBJ_YOUNGTOWN_FAKEHOTELEXIT
.addr OBJ_YOUNGTOWN_FAKEHOTELROOM1ENTRANCE
.addr OBJ_YOUNGTOWN_FAKEHOTELROOM2ENTRANCE
.addr OBJ_MERRYSVILLE_HOTELEXIT
.addr OBJ_MERRYSVILLE_HOTELUPSTAIRS
.addr OBJ_MERRYSVILLE_HOTELUPROOM1EXIT
.addr OBJ_MERRYSVILLE_HOTELUPROOM2EXIT
.addr OBJ_MERRYSVILLE_HOTELDOWN2STAIRS
.addr OBJ_ELLAY_HOTELEXIT
.addr OBJ_ELLAY_HOTELUPSTAIRS
.addr OBJ_REINDEER_HOTELEXIT
.addr OBJ_REINDEER_HOTELUPSTAIRS
.addr OBJ_PODUNK_HOTELBELLHOP
.addr OBJ_REINDEER_HOTELBELLHOP
.addr OBJ_ELLAY_HOTELBELLHOP
.addr OBJ_MERRYSVILLE_HOTELBELLHOP
.addr OBJ_YOUNGTOWN_FAKEHOTELBELLHOP
.addr OBJ_PODUNK_HOTELWOMAN
.addr OBJ_REINDEER_HOTELGUY
.addr OBJ_PODUNK_HOTELGUY
.addr OBJ_MERRYSVILLE_HOTELGUY
.addr OBJ_MERRYSVILLE_HOTELWAITER
.addr OBJ_MERRYSVILLE_HOTELMUSCIALGIRL
.addr OBJ_MERRYSVILLE_HOTELFAVFOODGUY
.addr 0

OBJ_PODUNK_HOTELEXIT:
objectDef OBJ_TYPE::DOOR, $25e, DIRECTIONS::RIGHT, $3b6
doorArgDef $6, $C7, DIRECTIONS::DOWN, $1A5

OBJ_PODUNK_HOTELUPSTAIRS:
objectDef OBJ_TYPE::STAIRS, $252, DIRECTIONS::LEFT, $3b5
doorArgDef $0, $2, DIRECTIONS::RIGHT, $A6

OBJ_PODUNK_HOTELUPROOM1EXIT:
objectDef OBJ_TYPE::DOOR, $2ce, DIRECTIONS::RIGHT, $86
doorArgDef $0, $6, DIRECTIONS::DOWN, $A4

OBJ_PODUNK_HOTELUPROOM2EXIT:
objectDef OBJ_TYPE::DOOR, $34e, DIRECTIONS::RIGHT, $86
doorArgDef $0, $9, DIRECTIONS::DOWN, $A4

OBJ_YOUNGTOWN_FAKEHOTELEXIT:
objectDef OBJ_TYPE::DOOR, $2be, DIRECTIONS::RIGHT, $3d6
doorArgDef $30, $2C9, DIRECTIONS::DOWN, $1C0

OBJ_YOUNGTOWN_FAKEHOTELROOM1ENTRANCE:
objectDef OBJ_TYPE::DOOR, $2b2, DIRECTIONS::LEFT, $3d5
doorArgDef $0, $21D, DIRECTIONS::LEFT, $96

OBJ_YOUNGTOWN_FAKEHOTELROOM2ENTRANCE:
objectDef OBJ_TYPE::DOOR, $2b0, DIRECTIONS::LEFT, $3d7
doorArgDef $0, $1BD, DIRECTIONS::LEFT, $96

OBJ_MERRYSVILLE_HOTELEXIT:
objectDef OBJ_TYPE::DOOR, $2de, DIRECTIONS::RIGHT, $3d6
doorArgDef $6, $16B, DIRECTIONS::DOWN, $1CD

OBJ_MERRYSVILLE_HOTELUPSTAIRS:
objectDef OBJ_TYPE::STAIRS, $2d2, DIRECTIONS::LEFT, $3d5
doorArgDef $0, $302, DIRECTIONS::RIGHT, $3F6

OBJ_MERRYSVILLE_HOTELUPROOM1EXIT:
objectDef OBJ_TYPE::DOOR, $2ee, DIRECTIONS::RIGHT, $86
doorArgDef $0, $306, DIRECTIONS::DOWN, $3F4

OBJ_MERRYSVILLE_HOTELUPROOM2EXIT:
objectDef OBJ_TYPE::DOOR, $36e, DIRECTIONS::RIGHT, $86
doorArgDef $0, $309, DIRECTIONS::DOWN, $3F4

OBJ_MERRYSVILLE_HOTELDOWN2STAIRS:
objectDef OBJ_TYPE::STAIRS, $271, DIRECTIONS::LEFT, $3c6
doorArgDef $0, $303, DIRECTIONS::RIGHT, $3F5

OBJ_ELLAY_HOTELEXIT:
objectDef OBJ_TYPE::DOOR, $2be, DIRECTIONS::RIGHT, $3f6
doorArgDef $6, $307, DIRECTIONS::DOWN, $12D

OBJ_ELLAY_HOTELUPSTAIRS:
objectDef OBJ_TYPE::STAIRS, $2b2, DIRECTIONS::LEFT, $3f5
doorArgDef $0, $1F2, DIRECTIONS::RIGHT, $96

OBJ_REINDEER_HOTELEXIT:
objectDef OBJ_TYPE::DOOR, $e, DIRECTIONS::RIGHT, $106
doorArgDef $6, $1A7, DIRECTIONS::DOWN, $3BD

OBJ_REINDEER_HOTELUPSTAIRS:
objectDef OBJ_TYPE::STAIRS, $2, DIRECTIONS::LEFT, $105
doorArgDef $0, $12, DIRECTIONS::RIGHT, $D6

OBJ_PODUNK_HOTELBELLHOP:
objectDef OBJ_TYPE::WANDERING_NPC, $258, DIRECTIONS::DOWN, $3b4
.addr SPRITEDEF_B2 ;sprite
.byte SCRIPTS::N_LOADNUMBER
.word 39
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_PODUNK_HOTELBELLHOP
.byte OBJ_PODUNK_HOTELBELLHOP_OJSUBROUTINE0-OBJ_PODUNK_HOTELBELLHOP
.byte 0
    OBJ_PODUNK_HOTELBELLHOP_OJSUBROUTINE0:
.byte SCRIPTS::J_TALK, OBJ_PODUNK_HOTELBELLHOP_JTALK0-OBJ_PODUNK_HOTELBELLHOP
.byte SCRIPTS::CHARMULT
.byte SCRIPTS::DIALOGUE
.word UMSG::HOTELBELLHOP
.byte SCRIPTS::J_YESNO, OBJ_PODUNK_HOTELBELLHOP_JYESNO1-OBJ_PODUNK_HOTELBELLHOP
.byte SCRIPTS::J_TAKEMONEY, OBJ_PODUNK_HOTELBELLHOP_JTAKEMONEY2-OBJ_PODUNK_HOTELBELLHOP
.byte SCRIPTS::DIALOGUE
.word UMSG::HOTELBELLHOP_ACCEPT
.byte SCRIPTS::SLEEP
.byte SCRIPTS::SHOWMONEY
.byte SCRIPTS::DIALOGUE
.word UMSG::HOTELBELLHOP_GOODMORNING
.byte SCRIPTS::RETURN
    OBJ_PODUNK_HOTELBELLHOP_JTAKEMONEY2:
.byte SCRIPTS::DIALOGUE
.word UMSG::HOSPITAL_NURSE_NOMONEY
.byte SCRIPTS::RETURN
    OBJ_PODUNK_HOTELBELLHOP_JYESNO1:
.byte SCRIPTS::DIALOGUE
.word UMSG::HOTELBELLHOP_DECLINE
    OBJ_PODUNK_HOTELBELLHOP_JTALK0:
.byte SCRIPTS::RETURN

OBJ_REINDEER_HOTELBELLHOP:
objectDef OBJ_TYPE::WANDERING_NPC, $8, DIRECTIONS::DOWN, $104
.addr SPRITEDEF_B2 ;sprite
.byte SCRIPTS::N_LOADNUMBER
.word 100
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_PODUNK_HOTELBELLHOP
.byte OBJ_PODUNK_HOTELBELLHOP_OJSUBROUTINE0-OBJ_PODUNK_HOTELBELLHOP
.byte 0

OBJ_ELLAY_HOTELBELLHOP:
objectDef OBJ_TYPE::WANDERING_NPC, $2b8, DIRECTIONS::DOWN, $3f4
.addr SPRITEDEF_B2 ;sprite
.byte SCRIPTS::N_LOADNUMBER
.word 165
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_PODUNK_HOTELBELLHOP
.byte OBJ_PODUNK_HOTELBELLHOP_OJSUBROUTINE0-OBJ_PODUNK_HOTELBELLHOP
.byte 0

OBJ_MERRYSVILLE_HOTELBELLHOP:
objectDef OBJ_TYPE::WANDERING_NPC, $2d8, DIRECTIONS::DOWN, $3d4
.addr SPRITEDEF_B2 ;sprite
.byte SCRIPTS::N_LOADNUMBER
.word 65
.byte SCRIPTS::OJ_SUBROUTINE
.addr OBJ_PODUNK_HOTELBELLHOP
.byte OBJ_PODUNK_HOTELBELLHOP_OJSUBROUTINE0-OBJ_PODUNK_HOTELBELLHOP
.byte 0

OBJ_YOUNGTOWN_FAKEHOTELBELLHOP:
objectDef OBJ_TYPE::WANDERING_NPC, $2b5, DIRECTIONS::DOWN, $3d4
.addr SPRITEDEF_8A ;sprite
.byte SCRIPTS::J_TALK, OBJ_YOUNGTOWN_FAKEHOTELBELLHOP_JTALK0-OBJ_YOUNGTOWN_FAKEHOTELBELLHOP
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_HOTELBELLHOP
.byte SCRIPTS::J_YESNO, OBJ_YOUNGTOWN_FAKEHOTELBELLHOP_JYESNO1-OBJ_YOUNGTOWN_FAKEHOTELBELLHOP
.byte SCRIPTS::DIALOGUE
.word UMSG::HOTELBELLHOP_ACCEPT
.byte SCRIPTS::SLEEP
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_HOTELBELLHOP_GOODMORNING
.byte 0
    OBJ_YOUNGTOWN_FAKEHOTELBELLHOP_JYESNO1:
.byte SCRIPTS::DIALOGUE
.word UMSG::YOUNGTOWN_HOTELBELLHOP_DECLINE
    OBJ_YOUNGTOWN_FAKEHOTELBELLHOP_JTALK0:
.byte 0

OBJ_PODUNK_HOTELWOMAN:
objectDef OBJ_TYPE::WANDERING_NPC, $255, DIRECTIONS::DOWN, $3b6
.addr SPRITEDEF_A2 ;sprite
.byte SCRIPTS::J_TALK, OBJ_PODUNK_HOTELWOMAN_JTALK0-OBJ_PODUNK_HOTELWOMAN
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_HOTELWOMAN
    OBJ_PODUNK_HOTELWOMAN_JTALK0:
.byte 0

OBJ_REINDEER_HOTELGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $5, DIRECTIONS::RIGHT, $106
.addr SPRITEDEF_9A ;sprite
.byte SCRIPTS::J_TALK, OBJ_REINDEER_HOTELGUY_JTALK0-OBJ_REINDEER_HOTELGUY
.byte SCRIPTS::DIALOGUE
.ifdef VER_JP
.word UMSG::ELLAY_BBGANG1_TEDDY
.else
.word UMSG::REINDEER_HOTELGUY
.endif
    OBJ_REINDEER_HOTELGUY_JTALK0:
.byte 0

OBJ_PODUNK_HOTELGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $257, DIRECTIONS::LEFT, $3b6
.addr SPRITEDEF_8A ;sprite
.byte SCRIPTS::J_TALK, OBJ_PODUNK_HOTELGUY_JTALK0-OBJ_PODUNK_HOTELGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_HOTELGUY
    OBJ_PODUNK_HOTELGUY_JTALK0:
.byte 0

OBJ_MERRYSVILLE_HOTELGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $2d5, DIRECTIONS::RIGHT, $3d6
.addr SPRITEDEF_8A ;sprite
.byte SCRIPTS::J_TALK, OBJ_MERRYSVILLE_HOTELGUY_JTALK0-OBJ_MERRYSVILLE_HOTELGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::MERRYSVILLE_HOTELGUY
    OBJ_MERRYSVILLE_HOTELGUY_JTALK0:
.byte 0

OBJ_MERRYSVILLE_HOTELWAITER:
objectDef OBJ_TYPE::WANDERING_NPC, $274, DIRECTIONS::DOWN, $3c4
.addr SPRITEDEF_6A ;sprite
.byte SCRIPTS::J_TALK, OBJ_MERRYSVILLE_HOTELWAITER_JTALK0-OBJ_MERRYSVILLE_HOTELWAITER
.byte SCRIPTS::DIALOGUE
.word UMSG::MERRYSVILLE_HOTELWAITER
    OBJ_MERRYSVILLE_HOTELWAITER_JTALK0:
.byte 0

OBJ_MERRYSVILLE_HOTELMUSCIALGIRL:
objectDef OBJ_TYPE::WANDERING_NPC, $279, DIRECTIONS::LEFT, $3c6
.addr SPRITEDEF_AA ;sprite
.byte SCRIPTS::J_TALK, OBJ_MERRYSVILLE_HOTELMUSCIALGIRL_JTALK0-OBJ_MERRYSVILLE_HOTELMUSCIALGIRL
.byte SCRIPTS::DIALOGUE
.word UMSG::MERRYSVILLE_HOTELMUSCIALGIRL
    OBJ_MERRYSVILLE_HOTELMUSCIALGIRL_JTALK0:
.byte 0

OBJ_MERRYSVILLE_HOTELFAVFOODGUY:
objectDef OBJ_TYPE::WANDERING_NPC, $27c, DIRECTIONS::LEFT, $3c7
.addr SPRITEDEF_8A ;sprite
.byte SCRIPTS::J_TALK, OBJ_MERRYSVILLE_HOTELFAVFOODGUY_JTALK0-OBJ_MERRYSVILLE_HOTELFAVFOODGUY
.byte SCRIPTS::DIALOGUE
.word UMSG::MERRYSVILLE_HOTELFAVFOODGUY
    OBJ_MERRYSVILLE_HOTELFAVFOODGUY_JTALK0:
.byte 0