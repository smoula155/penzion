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
				'Jednopokojový apartmán o výměře 46m2 s kapacitou 5 osob je vybaven postelí pro 2 osoby, rozkládací pohovkou a rozkládacím křeslem. Součástí apartmánu je také jídelní stůl s židlemi,TV  a kuchyňským koutem vybaveným jednoplotýnkovým indukčním vařičem, rychlovarnou konvicí, lednicí, elektrickou a mikrovlnou troubou. Samozřejmostí je vlastní sociální zařízení vybavené masážní vanou.' 
			when Room::ROOMS110
				'Jednopokojový apartmán o výměře 22m2 je vybavený manželskou postelí, TV a kuchyňským koutem ,který je vybaven mikrovlnou troubou, jednoplotýnkovým indukčním vařičem a rychlovarnou konvicí. Součástí apartmánu je vlastní sociální zařízení s masážní sprchou.'
			when Room::ROOMS111
				'Třípokojový dvoupatrový apartmán s koupelnou se sociálním zařízením, samostatným sociálním zařízením a kuchyňským koutem o výměře 65m2. Apartmán má koupelnu vybavenou vanou, umyvadlem a sociálním zařízením a další samostatné sociální zařízení. Ve spodním patře  se nacházejí 2 pokoje. V jednom je umístěna velká postel pro 2 osoby, skříň a noční stolek, ve druhém pokoji je umístěn gauč se stolkem a kuchynský kout pro přípravu pokrmů. Kuchyňská linka vybavena spotřebiči pro přípravu a skladování jídla. V pokoji je rovněž TV. Ve druhém patře se nachází pokoj vybavený velkou postelí pro 2 osoby a postelí pro jednu osobu.'
			when Room::ROOMS112
				'Dvoupokojový dvoupatrový apartmán s koupelnou se sociálním zařízením a kuchyňským koutem o výměře 32m2. Apartmán má koupelnu vybavenou vanou, umyvadlem a sociálním zařízením. Ve spodním patře se nachází pokoj, v němž je umístěn gauč se stolkem a kuchyňský kout pro přípravu pokrmů. Kuchyňská linka vybavena spotřebiči pro přípravu jídla. V pokoji je rovněž TV. Ve druhém patře se nachází pokoj vybavený velkou postelí pro 2 osoby a postelí pro jednu osobu.'
			when Room::ROOMS109110
				'Možnost propojení dvou sousedních apartmánů číslo 109 a 110 a vytvoření jednoho velkého pro ubytování 6 osob. Průchod mezi apartmány je pomocí spojovacích dveří.'
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
