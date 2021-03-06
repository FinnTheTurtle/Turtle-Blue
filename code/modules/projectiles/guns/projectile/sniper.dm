////////////// PTR-7 Anti-Materiel Rifle //////////////

/obj/item/weapon/gun/projectile/heavysniper
	name = "anti-materiel rifle"
	desc = "A portable anti-armour rifle fitted with a scope, the HI PTR-7 Rifle was originally designed to used against armoured exosuits. It is capable of punching through windows and non-reinforced walls with ease. Fires armor piercing 14.5mm shells."
	icon_state = "heavysniper"
	item_state = "l6closed-empty" // placeholder
	w_class = 5 // So it can't fit in a backpack.
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	caliber = "14.5mm"
	recoil = 5 //extra kickback
	fire_sound = 'sound/weapons/sniper.ogg' // extra boom
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/a145
	accuracy = -5
	scoped_accuracy = 5
	var/bolt_open = 0

/obj/item/weapon/gun/projectile/heavysniper/update_icon()
	if(bolt_open)
		icon_state = "heavysniper-open"
	else
		icon_state = "heavysniper"

/obj/item/weapon/gun/projectile/heavysniper/attack_self(mob/user as mob)
	playsound(src.loc, 'sound/weapons/flipblade.ogg', 50, 1)
	bolt_open = !bolt_open
	if(bolt_open)
		if(chambered)
			user << "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>"
			chambered.loc = get_turf(src)
			loaded -= chambered
			chambered = null
		else
			user << "<span class='notice'>You work the bolt open.</span>"
	else
		user << "<span class='notice'>You work the bolt closed.</span>"
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/weapon/gun/projectile/heavysniper/special_check(mob/user)
	if(bolt_open)
		user << "<span class='warning'>You can't fire [src] while the bolt is open!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/heavysniper/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/heavysniper/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/heavysniper/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)


////////////// Dragunov Sniper Rifle //////////////

/* // Commented out until it's not worthless. Also might be nice to have a new icon that looks more sci-fi Dragunov-ish.
/obj/item/weapon/gun/projectile/SVD
	name = "\improper Dragunov"
	desc = "The SVD, also known as the Dragunov, was mass produced with an Optical Sniper Sight so simple that even Ivan can figure out how it works. Too bad for you that it's written in Russian. Uses 7.62mm rounds."
	icon_state = "SVD"
	item_state = "SVD"
	w_class = 5 // So it can't fit in a backpack.
	force = 10
	slot_flags = SLOT_BACK // Needs a sprite.
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	recoil = 2 //extra kickback
	caliber = "a762"
	load_method = MAGAZINE
	accuracy = -3 //shooting at the hip
	scoped_accuracy = 0
//	requires_two_hands = 1
	one_handed_penalty = 4 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	fire_sound = 'sound/weapons/SVD_shot.ogg'
	magazine_type = /obj/item/ammo_magazine/SVD
	allowed_magazines = list(/obj/item/ammo_magazine/SVD, /obj/item/ammo_magazine/c762)

/obj/item/weapon/gun/projectile/SVD/update_icon()
	..()
//	if(istype(ammo_magazine,/obj/item/ammo_magazine/c762)
//		icon_state = "SVD-bigmag" //No icon for this exists yet.
	if(ammo_magazine)
		icon_state = "SVD"
	else
		icon_state = "SVD-empty"

/obj/item/weapon/gun/projectile/SVD/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)*/