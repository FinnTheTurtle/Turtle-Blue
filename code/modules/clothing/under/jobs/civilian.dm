//Alphabetical order of civilian jobs.

/obj/item/clothing/under/rank/bartender
	desc = "It looks like it could use some more flair."
	name = "bartender's uniform"
	icon_state = "ba_suit"
	item_state = "ba_suit"
	worn_state = "ba_suit"
	rolled_sleeves = 0

/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Captain\"."
	name = "captain's jumpsuit"
	icon_state = "captain"
	item_state = "b_suit"
	worn_state = "captain"
	rolled_sleeves = 0

/obj/item/clothing/under/rank/cargo
	name = "quartermaster's jumpsuit"
	desc = "It's a jumpsuit worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm"
	item_state = "lb_suit"
	worn_state = "qm"
	rolled_sleeves = 0

/obj/item/clothing/under/rank/cargo/jeans
	name = "quartermaster's jumpjeans"
	desc = "Jeeeaaans! They're comfy!"
	icon_state = "qmj"
	worn_state = "qmj"

/obj/item/clothing/under/rank/cargo/jeans/female
	name = "quartermaster's jumpjeans"
	desc = "Jeeeaaans! They're comfy!"
	icon_state = "qmjf"
	worn_state = "qmjf"
	rolled_sleeves = -1

/obj/item/clothing/under/rank/cargotech
	name = "cargo technician's jumpsuit"
	desc = "Shooooorts! They're comfy and easy to wear!"
	icon_state = "cargotech"
	item_state = "lb_suit"
	worn_state = "cargo"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	rolled_sleeves = 0

/obj/item/clothing/under/rank/cargotech/jeans
	name = "cargo technician's jumpjeans"
	desc = "Jeeeaaans! They're comfy!"
	icon_state = "cargoj"
	worn_state = "cargoj"
	rolled_sleeves = -1

/obj/item/clothing/under/rank/cargotech/jeans/female
	name = "cargo technician's jumpjeans"
	desc = "Jeeeaaans! They're comfy!"
	icon_state = "cargojf"
	worn_state = "cargojf"

/obj/item/clothing/under/rank/chaplain
	desc = "It's a black jumpsuit, often worn by religious folk."
	name = "chaplain's jumpsuit"
	icon_state = "chaplain"
	item_state = "bl_suit"
	worn_state = "chapblack"
	rolled_sleeves = 0

/obj/item/clothing/under/rank/chef
	desc = "It's an apron which is given only to the most <b>hardcore</b> chefs in space."
	name = "chef's uniform"
	icon_state = "chef"
	item_state = "w_suit"
	worn_state = "chef"
	rolled_sleeves = 0

/obj/item/clothing/under/rank/clown
	name = "clown suit"
	desc = "<i>'HONK!'</i>"
	icon_state = "clown"
	item_state = "clown"
	worn_state = "clown"
	rolled_sleeves = -1

/obj/item/clothing/under/rank/head_of_personnel
	desc = "It's a jumpsuit worn by someone who works in the position of \"Head of Personnel\"."
	name = "head of personnel's jumpsuit"
	icon_state = "hop"
	item_state = "b_suit"
	worn_state = "hop"
	rolled_sleeves = 0

/obj/item/clothing/under/rank/head_of_personnel_whimsy
	desc = "A blue jacket and red tie, with matching red cuffs! Snazzy. Wearing this makes you feel more important than your job title does."
	name = "head of personnel's suit"
	icon_state = "hopwhimsy"
	item_state = "b_suit"
	worn_state = "hopwhimsy"
	rolled_sleeves = -1

/obj/item/clothing/under/rank/hydroponics
	desc = "It's a jumpsuit designed to protect against minor plant-related hazards."
	name = "botanist's jumpsuit"
	icon_state = "hydroponics"
	item_state = "g_suit"
	worn_state = "hydroponics"
	permeability_coefficient = 0.50
	rolled_sleeves = 0

/obj/item/clothing/under/rank/internalaffairs
	desc = "The plain, professional attire of an Internal Affairs Agent. The collar is <i>immaculately</i> starched."
	name = "Internal Affairs uniform"
	icon_state = "internalaffairs"
	item_state = "ba_suit"
	worn_state = "internalaffairs"
	rolled_sleeves = 0
	starting_accessories = list(/obj/item/clothing/accessory/black)

/obj/item/clothing/under/rank/janitor
	desc = "It's the official uniform of the station's janitor. It has minor protection from biohazards."
	name = "janitor's jumpsuit"
	icon_state = "janitor"
	worn_state = "janitor"
	item_state = "janitor"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)
	rolled_sleeves = 0

/obj/item/clothing/under/lawyer
	desc = "Slick threads."
	name = "Lawyer suit"

/obj/item/clothing/under/lawyer/black
	name = "black Lawyer suit"
	icon_state = "lawyer_black"
	item_state = "lawyer_black"
	worn_state = "lawyer_black"

/obj/item/clothing/under/lawyer/female
	name = "black Lawyer suit"
	icon_state = "black_suit_fem"
	item_state = "lawyer_black"
	worn_state = "black_suit_fem"

/obj/item/clothing/under/lawyer/red
	name = "red Lawyer suit"
	icon_state = "lawyer_red"
	item_state = "lawyer_red"
	worn_state = "lawyer_red"

/obj/item/clothing/under/lawyer/blue
	name = "blue Lawyer suit"
	icon_state = "lawyer_blue"
	item_state = "lawyer_blue"
	worn_state = "lawyer_blue"

/obj/item/clothing/under/lawyer/bluesuit
	name = "Blue Suit"
	desc = "A classy suit."
	icon_state = "bluesuit"
	item_state = "ba_suit"
	worn_state = "bluesuit"
	starting_accessories = list(/obj/item/clothing/accessory/red)

/obj/item/clothing/under/lawyer/purpsuit
	name = "Purple Suit"
	icon_state = "lawyer_purp"
	item_state = "ba_suit"
	worn_state = "lawyer_purp"

/obj/item/clothing/under/lawyer/oldman
	name = "Old Man's Suit"
	desc = "A classic suit for the older gentleman with built in back support."
	icon_state = "oldman"
	item_state = "johnny"
	worn_state = "oldman"

/obj/item/clothing/under/librarian
	name = "sensible suit"
	desc = "It's very... sensible."
	icon_state = "red_suit"
	item_state = "lawyer_red"
	worn_state = "red_suit"

/obj/item/clothing/under/mime
	name = "mime's outfit"
	desc = "It's not very colourful."
	icon_state = "mime"
	item_state = "ba_suit"
	worn_state = "mime"

/obj/item/clothing/under/rank/miner
	desc = "It's a snappy jumpsuit with a sturdy set of overalls. It is very dirty."
	name = "shaft miner's jumpsuit"
	icon_state = "miner"
	item_state = "lb_suit"
	worn_state = "miner"
	rolled_sleeves = 0
