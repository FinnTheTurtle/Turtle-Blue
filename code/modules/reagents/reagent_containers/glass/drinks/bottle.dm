///////////////////////////////////////////////Alchohol bottles! -Agouri //////////////////////////
//Functionally identical to regular drinks. The only difference is that the default bottle size is 100. - Darem
//Bottles now weaken and break when smashed on people's heads. - Giacom

/obj/item/weapon/reagent_containers/glass/drinks/bottle
	/*Specials:
		Rag interaction.*/
	amount_per_transfer_from_this = 10
	volume = 100
	item_state = "broken_beer" //Generic held-item sprite until unique ones are made.
	force = 5
	flags = 0 //starts closed
	isGlass = 1

	var/obj/item/weapon/reagent_containers/glass/rag/rag = null
	var/rag_underlay = "rag"

/obj/item/weapon/reagent_containers/glass/drinks/bottle/Destroy()
	if(rag)
		rag.forceMove(src.loc)
	rag = null
	return ..()

/obj/item/weapon/reagent_containers/glass/drinks/bottle/smash(var/newloc, atom/against = null)
	..()

	if(rag && rag.on_fire && isliving(against))
		rag.forceMove(loc)
		var/mob/living/L = against
		L.IgniteMob()
	verbs -= /obj/item/weapon/reagent_containers/glass/drinks/bottle/verb/smash_bottle

/obj/item/weapon/reagent_containers/glass/drinks/bottle/verb/smash_bottle()
	set name = "Smash Bottle"
	set category = "Object"

	var/list/things_to_smash_on = list()
	for(var/atom/A in range (1, usr))
		if(A.density && usr.Adjacent(A) && !istype(A, /mob))
			things_to_smash_on += A

	var/atom/choice = input("Select what you want to smash the bottle on.") as null|anything in things_to_smash_on
	if(!choice)
		return
	if(!(choice.density && usr.Adjacent(choice)))
		usr << "<span class='warning'>You must stay close to your target! You moved away from \the [choice]</span>"
		return

	usr.put_in_hands(src.smash(usr.loc, choice))
	usr.visible_message("<span class='danger'>\The [usr] smashed \the [src] on \the [choice]!</span>")
	usr << "<span class='danger'>You smash \the [src] on \the [choice]!</span>"

/obj/item/weapon/reagent_containers/glass/drinks/bottle/attackby(obj/item/W, mob/user)
	if(!rag && istype(W, /obj/item/weapon/reagent_containers/glass/rag))
		insert_rag(W, user)
		return
	if(rag && istype(W, /obj/item/weapon/flame))
		rag.attackby(W, user)
		return
	..()

/obj/item/weapon/reagent_containers/glass/drinks/bottle/attack_self(mob/user)
	if(rag)
		remove_rag(user)
	else
		..()

/obj/item/weapon/reagent_containers/glass/drinks/bottle/proc/insert_rag(obj/item/weapon/reagent_containers/glass/rag/R, mob/user)
	if(!isGlass || rag) return
	if(user.unEquip(R))
		user << "<span class='notice'>You stuff [R] into [src].</span>"
		rag = R
		rag.forceMove(src)
		flags &= ~OPENCONTAINER
		update_icon()

/obj/item/weapon/reagent_containers/glass/drinks/bottle/proc/remove_rag(mob/user)
	if(!rag) return
	user.put_in_hands(rag)
	rag = null
	flags |= (initial(flags) & OPENCONTAINER)
	update_icon()

/obj/item/weapon/reagent_containers/glass/drinks/bottle/open(mob/user)
	if(rag) return
	..()

/obj/item/weapon/reagent_containers/glass/drinks/bottle/update_icon()
	underlays.Cut()
	if(rag)
		var/underlay_image = image(icon='icons/obj/drinks.dmi', icon_state=rag.on_fire? "[rag_underlay]_lit" : rag_underlay)
		underlays += underlay_image
		copy_light(rag)
	else
		set_light(0)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	var/blocked = ..()

	if(user.a_intent != I_HURT)
		return
	if(!smash_check(1))
		return //won't always break on the first hit

	// You are going to knock someone out for longer if they are not wearing a helmet.
	var/weaken_duration = 0
	if(blocked < 100)
		weaken_duration = smash_duration + min(0, force - target.getarmor(hit_zone, "melee") + 10)

	if(hit_zone == "head" && istype(target, /mob/living/carbon/))
		user.visible_message("<span class='danger'>\The [user] smashes [src] over [target]'s head!</span>")
		if(weaken_duration)
			target.apply_effect(min(weaken_duration, 5), WEAKEN, blocked) // Never weaken more than a flash!
	else
		user.visible_message("<span class='danger'>\The [user] smashes [src] into [target]!</span>")

	smash(target.loc, target)


//// Precreated bottles ////

/obj/item/weapon/reagent_containers/glass/drinks/bottle/gin
	name = "Griffeater Gin"
	desc = "A bottle of high quality gin, produced in the New London Space Station."
	icon_state = "ginbottle"
	center_of_mass = list("x"=16, "y"=4)
	preloaded = list("gin" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/whiskey
	name = "Uncle Git's Special Reserve"
	desc = "A premium single-malt whiskey, gently matured inside the tunnels of a nuclear shelter. TUNNEL WHISKEY RULES."
	icon_state = "whiskeybottle"
	center_of_mass = list("x"=16, "y"=3)
	preloaded = list("whiskey" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/specialwhiskey
	name = "Special Blend Whiskey"
	desc = "Just when you thought regular station whiskey was good... This silky, amber goodness has to come along and ruin everything."
	icon_state = "whiskeybottle2"
	center_of_mass = list("x"=16, "y"=3)
	preloaded = list("specialwhiskey" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/vodka
	name = "Tunguska Triple Distilled"
	desc = "Aah, vodka. Prime choice of drink AND fuel by Russians worldwide."
	icon_state = "vodkabottle"
	center_of_mass = list("x"=17, "y"=3)
	preloaded = list("vodka" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/tequilla
	name = "Caccavo Guaranteed Quality Tequilla"
	desc = "Made from premium petroleum distillates, pure thalidomide and other fine quality ingredients!"
	icon_state = "tequillabottle"
	center_of_mass = list("x"=16, "y"=3)
	preloaded = list("tequilla" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/bottleofnothing
	name = "Bottle of Nothing"
	desc = "A bottle filled with nothing"
	icon_state = "bottleofnothing"
	center_of_mass = list("x"=17, "y"=5)
	preloaded = list("nothing" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/patron
	name = "Wrapp Artiste Patron"
	desc = "Silver laced tequilla, served in space night clubs across the galaxy."
	icon_state = "patronbottle"
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("patron" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/rum
	name = "Captain Pete's Cuban Spiced Rum"
	desc = "This isn't just rum, oh no. It's practically GRIFF in a bottle."
	icon_state = "rumbottle"
	center_of_mass = list("x"=16, "y"=8)
	preloaded = list("rum" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/holywater
	name = "Flask of Holy Water"
	desc = "A flask of the chaplain's holy water."
	icon_state = "holyflask"
	center_of_mass = list("x"=17, "y"=10)
	preloaded = list("holywater" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/vermouth
	name = "Goldeneye Vermouth"
	desc = "Sweet, sweet dryness~"
	icon_state = "vermouthbottle"
	center_of_mass = list("x"=17, "y"=3)
	preloaded = list("vermouth" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/kahlua
	name = "Robert Robust's Coffee Liqueur"
	desc = "A widely known, Mexican coffee-flavoured liqueur. In production since 1936, HONK"
	icon_state = "kahluabottle"
	center_of_mass = list("x"=17, "y"=3)
	preloaded = list("kahlua" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/goldschlager
	name = "College Girl Goldschlager"
	desc = "Because they are the only ones who will drink 100 proof cinnamon schnapps."
	icon_state = "goldschlagerbottle"
	center_of_mass = list("x"=15, "y"=3)
	preloaded = list("goldschlager" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/cognac
	name = "Chateau De Baton Premium Cognac"
	desc = "A sweet and strongly alchoholic drink, made after numerous distillations and years of maturing. You might as well not scream 'SHITCURITY' this time."
	icon_state = "cognacbottle"
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("cognac" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/wine
	name = "Doublebeard Bearded Special Wine"
	desc = "A faint aura of unease and asspainery surrounds the bottle."
	icon_state = "winebottle"
	center_of_mass = list("x"=16, "y"=4)
	preloaded = list("wine" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/absinthe
	name = "Jailbreaker Verte"
	desc = "One sip of this and you just know you're gonna have a good time."
	icon_state = "absinthebottle"
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("absinthe" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/melonliquor
	name = "Emeraldine Melon Liquor"
	desc = "A bottle of 46 proof Emeraldine Melon Liquor. Sweet and light."
	icon_state = "alco-green" //Placeholder.
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("melonliquor" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/bluecuracao
	name = "Miss Blue Curacao"
	desc = "A fruity, exceptionally azure drink. Does not allow the imbiber to use the fifth magic."
	icon_state = "alco-blue" //Placeholder.
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("bluecuracao" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/grenadine
	name = "Briar Rose Grenadine Syrup"
	desc = "Sweet and tangy, a bar syrup used to add color or flavor to drinks."
	icon_state = "grenadinebottle"
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("grenadine" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/cola
	name = "\improper Space Cola"
	desc = "Cola. in space"
	icon_state = "colabottle"
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("cola" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/space_up
	name = "\improper Space-Up"
	desc = "Tastes like a hull breach in your mouth."
	icon_state = "space-up_bottle"
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("space_up" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/space_mountain_wind
	name = "\improper Space Mountain Wind"
	desc = "Blows right through you like a space wind."
	icon_state = "space_mountain_wind_bottle"
	center_of_mass = list("x"=16, "y"=6)
	preloaded = list("spacemountainwind" = 100)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/pwine
	name = "Warlock's Velvet"
	desc = "What a delightful packaging for a surely high quality wine! The vintage must be amazing!"
	icon_state = "pwinebottle"
	center_of_mass = list("x"=16, "y"=4)
	preloaded = list("pwine" = 100)

//Small bottles
/obj/item/weapon/reagent_containers/glass/drinks/bottle/small
	volume = 50
	smash_duration = 1
	flags = 0 //starts closed
	rag_underlay = "rag_small"

/obj/item/weapon/reagent_containers/glass/drinks/bottle/small/beer
	name = "space beer"
	desc = "Contains only water, malt and hops."
	icon_state = "beer"
	center_of_mass = list("x"=16, "y"=12)
	preloaded = list("beer" = 30)

/obj/item/weapon/reagent_containers/glass/drinks/bottle/small/ale
	name = "\improper Magm-Ale"
	desc = "A true dorf's drink of choice."
	icon_state = "alebottle"
	item_state = "beer"
	center_of_mass = list("x"=16, "y"=10)
	preloaded = list("ale" = 30)
