module RoomsHelper

	def name_rooms(type)
		case type
		when Room::ROOMS109
			'Apartmán 109'
		when Room::ROOMS110
			'Apartmán 110'
		when Room::ROOMS111
			'Apartmán 111'
		when Room::ROOMS112
			'Apartmán 112'
		when Room::ROOMS109110
			'Spodní patro (109 + 110)'
		when Room::ROOMSall
			'Celý penzion'
		else
			'nondef'
		end
	end

	def description_room(type)
		case type
			when Room::ROOMS109
				'Jednopokojový apartmán o výměře 46m2 s kapacitou 5 osob je vybaven postelí pro 2 osoby, rozkládací pohovkou a rozkládacím křeslem. Součástí apartmánu je také jídelní stůl s židlemi, TV a kuchyňským koutem vybaveným jednoplotýnkovým indukčním vařičem, rychlovarnou konvicí, lednicí, elektrickou a mikrovlnou troubou. Samozřejmostí je vlastní sociální zařízení s masážní vanou.'
			when Room::ROOMS110
				'Jednopokojový apartmán o výměře 22m2 je vybavený manželskou postelí, TV a kuchyňským koutem ,který je vybaven mikrovlnou troubou, jednoplotýnkovým indukčním vařičem a rychlovarnou konvicí. Součástí apartmánu je vlastní sociální zařízení s masážní sprchou.'
			when Room::ROOMS111
				'Třípokojový apartmán o výměře 65m2 s kapacitou 6 osob je složen s dvou samostatných pokojů a podkroví. Jeden pokoj slouží jako společenská místnost, která je vybavena TV, kuchyňským koutem vybaveným jednoplotýnkovým indukčním vařičem, rychlovarnou konvicí, lednicí a mikrovlnou troubou. Druhý sousedící pokoj je vybaven postelí po 2 osoby s přímou možností vstupu do sociálního zařízení, které je vybaveno rohovou masážní vanou.Do sociálního zařízení lze také vstoupit s chodby. Dřevěným schodištěm ze společenské místnosti se dostanete do podkoroví, které je vybaveno postelí pro 2 osoby, samostatnou postelí a matrací která slouží jako přistýlka.'
			when Room::ROOMS112
				'Dvoupokojový apartmán o výměře 32m2 s kapacitou 5 osob se skládá s pokoje vybaveným TV, kuchyňským koutem vybaveným jednoplotýnkovým indukčním vařičem, rychlovarnou konvicí, lednicí, elektrickou a mikrovlnou troubou a také rozkládací pohovkou s možností přespání dvou osob. S tohoto pokoje se dřevěným schodištěm dostanete do podkoroví, které je vybaveno třemi samostatnými postelemi. Samozřejmostí je vlastní sociální zařízení s masážní vanou.' 
			when Room::ROOMS109110
				'Pomocí uzamykatelných dveří mezi apartmány 109 a 110 vznikne ubytovací prostor pro 7 osob s dvěma sociálními zařízeními. Při této objednávce je poskytnuta sleva.'
			when Room::ROOMSall
				'Možnost pronájmu celého penzionu sestávajíciho ze dvou samostatných a dvou propojitelných apartmánů. Penzion je určen až pro 14 osob. Každý apartmán má vlastní koupelnu a sociální zařízení. Ve třech apartmánech je rovněž kuchyňský kout vybavený spotřebiči pro výrobu a uchování jídla.'
			else
				'nondef'
		end
	end

	def file_pictures(type)
		case type
		when Room::ROOMS109
			'pictures_109'
		when Room::ROOMS110
			'pictures_110'
		when Room::ROOMS111
			'pictures_111'
		when Room::ROOMS112
			'pictures_112'
		when Room::ROOMS109110
			'pictures_half'
		when Room::ROOMSall
			'pictures_all'
		else
			'nondef'
		end
	end

end
