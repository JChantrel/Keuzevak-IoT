# Keuzevak-IoT Save the Plants
Voor het het keuzevak Internet of Things moet er een relatief simpel IoT project gerealiseerd worden. Ik heb gekozen voor het monitoren van de vochtigheid van de potgrond van planten. Als deze te laag is zal er een notificatie gezonden worden naar mijn telefoon.
# Probleem- en doelstelling
Mijn vriendin en ik vinden bloemen en planten erg mooi maar verdomd moeilijk om in leven te houden. Vandaar wil ik dit project gebruiken om wat meer te leren over hoevaak een plant water moet krijgen en dus de toekomstige aangeschafte bloemen/planten een langer leven geven. Het product wat gerealiseerd wordt houd dus de vochtigheid van de potgrond bij en geeft een notificatie wanneer deze te laag is. Het idee is dat dit product dan een maand gebruikt kan worden bij een plant om het bewaterings schema te achterhalen. Vervolgens kan de volgende plant bijgehouden worden en het bewaterings schema opgeslagen worden voor reguliere notificaties.
# Hardware
Voor dit project worden de volgende spullen gebruikt
 * Raspberry Pi 3 model B+
 * Grove - Capacitive Moisture Sensor
 * Grove - 4 pin Female Jumper to Grove 4 pin Conversion Cable
 * MCP3008 - 8-kanaals ADC met SPI-interface
 * Spullen voor shield/hat
 
Er is voor een capacitieve sensor gekozen omdat deze niet corroderen na lang gebruik. Hier horen de juiste kabels bij. De MCP3008 is nodig omdat de sensor een analoge output heeft. deze kan de Raspberry niet uitlezen. Deze elektronica zal waarschijnlijk eerst op een breadboard getest worden, als alles werkt wordt het gesoldeerd op een shield/hat voor de Raspberry.

# Raspberry setup
Door gebruik te maken van de imager van raspberry pi zelf was het erg simpel raspian op raspberry te zetten.

![](Images/Raspberry_Setup.jpeg)

# Hello World
Eerste proramma wat veel gebruikt wordt in de code wereld is een "Hello World" programma. Hierbij was dat niet helemaal van toepassing, in plaats daarvan heb ik een klein stukje code geschreven dat een ledje laat knipperen. Hieronder is de test te zien.

![](Images/Blink_Test.jpeg)

Daarna is er ook nog een knop aan toegevoed om te kijken of daarmee het ledje aangezet kan worden. Dat is hieronder te zien.

![](Images/Button_Setup.jpeg)

# Analog to digital
Om het analoge signaal naar digitaal om te zetten wordt er gebruik gemaakt van een MCP3008 op adafruit stond er een voorbeeldje voor code om een potmeter uit te lezen met deze chip. Ik heb dit voorbeeldje na gemaakt en het werkt allemaal naar behoren. Vervolgens heb ik de sensor aangesloten op de pin waar de potmeter was aangesloten en een glas water gepakt. Om te kijken of er verschillende waardes uitkwamen. Dit was ook het geval. Ook had ik ergens gelezen dat het mogelijk was voor water om tussen de lagen van de pcb te komen op de lange duur. Om dit te voorkomen kun je nagellak op de raden van de pcb smeren. Dus had mijn zusje lief gevraagd of ik wat van haar nagelak kon lenen.

# Thinger.io
Na wat onderzoek gedaan te hebben over dashboards voor data kwam ik uit op Thinger.io. Na een dag prielen met de code heb ik het voor elkaar gekregen om met mijn telefoon een lampje aan en uit te zetten en een knop uit te lezen. Mijn volgende stap zou dan zijn het uitlezen van de sensor. Alleen de thinger.io client is een C++ maar de sensor uitlezen is in python. Dat gaat moeilijk samen en om in plaats van moeilijk te doen om het werkend te krijgen heb ik ervoor gekozen om een ander data dashboard te gebruiken. In de lessen werdt er aanbevolen om thingspeak te gebruiken dus ik ben hier mee verder gegaan.

# Thingspeak
Ik maakte een thingspeak account aan en zocht naar een test programmatje wat ik kon gebruiken om te kijken of het allemaal werkte. Ik had er een gevonden, deze is te vinden in de software map genaamd cpu.py. Deze stuurt elke 15 seconde de cpu temperatuur naar thingspeak. Ik moest alleen de key van mijn channel in te vullen en het delay van 15 seconde in programeren en het werkte.
Volgende stap was om een conversie te doen van de spanning die gemeten wordt door de raspberry naar het daadwerkelijk vochtgehalte van de grond. Hiervoor heb ik een mooi artikel gevonden die het stap voor stap uitlegt. Om het goed te berekenen heb ik eigenlijk een test plant nodig om daar wat grond van te pakken om de sensor mee te eiken. Die heb ik nog niet dus heb gekeken hoe de algemene vergelijking er uit ziet en die in de software gezet. de conversie was dus geimlementeerd maar had nog niet de juiste waardes. Die komen later wel
Nu kon ik het verzenden van data naar thingspeak implementeren in het sensor programma. Ik had het deel van het programma wat de data verzond gekopieerd en geplakt alleen gaf deze nu errors. Het probleem was dat cpu.py in python2 staat geschreven en het sensor programma in python3. Gelukkig betekende dat alleen dat er van librarys anders genoemd moesten worden. Na dat alles aangepast was werkte het gewoon naar behoren.

![](Images/Thingspeak.PNG)

Hier is de data te zien van een paar dagen. Halverwege is de plant water gegeven en er is een paar dagen niets verzonden. Dit omdat het internet gereset was maar de raspberry niet gereset is.

# Hat
Nu dit allemaal goed werkt is alle elektronica op een lege hat voor raspberry gesoldeerd zodat het er allemaal wat netter uit ziet en wat robuster is.

![](Images/Raspberry_met_Hat.jpeg)

# Senor eiken
Bij de Jumbo vond ik een mooi plantje, een kalanchoe. Dat leek me een mooie kandidaat voor mijn experiment. Toen ik hem gekocht had viel me helaas pas op dat het een vetplant is en dus helemaal niet zo veel water nodig heeft. Dan maar hopen dat me vriendin hem gewoon mooi vind. Thuis heb ik de plant uit de pot gehaald en wat grond van de onderkant gehaald. Deze grond op een in aluminium gewikkelde kartonnen plaat gelegd en in de oven op 50 graden tot deze kurk droog is. Deze droge grond in een beker gestopt en de sensor erin gestopt. Gekeken wat voor waarde de sensor geeft bij deze droge grond. De volgende stap was het toevoegen van water, er werdt elke keer 5 ml toegevoegd, gemengd en gemeten met de sensor. Dit is gedaan tot de grond te nat is, dit is bepaald door mijn zusje de planten expert (ze heeft een opleiding groene detailhandel gedaan, dat leek mij wel een bonafide bron).

![](Images/excel.PNG)

Nu kon ik met een lineare vergelijking de waarde van de ADC omzeten naar een percentage water. Hierin is 0% de grond uit de oven en 100% de net te natte grond. Om de juiste lineare vergelijking te bepalen moet de door excel gegenereerde vergelijking een kwartslag gedraait worden, door dit wiskundig te doen komt er de volgende vergelijking uit:

`Waterpercentage = -0.00831*ADC + 335.42`

Deze is geimplemeteerd in de software, dat betekent dat de software voor de raspberry compleet is. Deze laatste versie is [hier](Software/MCP3008.py) te vinden in het mapje Software.

# Notificatie
Om een notificatie te laten sturen wanneer de plant water nodig heeft wordt er gebruik gemaakt van Pushover. De volgende [tutorial](https://www.hackster.io/matlab-iot/real-time-notifications-with-pushover-mqtt-and-thingspeak-7b87df) is gevold om de in te stellen, alleen stap 5 is overgeslagen omdat deze niet van toepassing is.

![](Images/Pushover.PNG)

De applicatie gemaakt in Pushover.

![](Images/Thingspeak%20HTTP.PNG)

De instellingen van ThingHTTP.

![](Images/Thingspeak%20react.PNG)

De instellingen van de Thingspeak react.

# Demo
In deze [demo](Plant%20demo%20small.mp4) is te zien wat het resultaat is van het project.

# Instructie
 * Installeer de raspberry
 * Sluit de hardware aan volgens het schema

![](Images/Schema.jpg)

 * Zet het programma MCP3008.py op de raspberry
 * Zorg dat he programma start met het booten van de raspberry volgens [deze](https://www.raspberrypi-spy.co.uk/2015/02/how-to-autorun-a-python-script-on-raspberry-pi-boot/) tuturial.
  * Maak een account op Thingsspeak
  * Maak channel voor de raspberry
  * Verander de API key op de raspberry naar die van je channel
  * Implementeer de notificaties met [deze](https://www.hackster.io/matlab-iot/real-time-notifications-with-pushover-mqtt-and-thingspeak-7b87df) tutorial
  
# Data-Pipeline
Hieronder staat de gerealiseerdde data-pipeline.

![](Images/Data%20pipeline.jpg)

# Conclusie
Mijn doel aan het einde van deze module was om te leren werken met Github, raspberry en er achter komen wat Dat Internet of Things is waar iedereen het over heeft. Ik kreeg voor de module het idee dat IoT aan alles geplakt wordt wat een internet verbinding kan maken. Achteraf blijkt dat ook een klein beetje waar. Dit IoT project is naar mijn idee de makkelijkste vorm van IoT. Een vorm van data verzamelen, grond vochtigheid dus, en deze data opslaan en verwerken. Dit is dus een erg simpele data-pipeline.
Dit probleem hoefde niet perse aangesloten te worden op het internet om opgelost te worden. De sensor lezen en een pompje met water had het ook opgelost, dat zou de elktrotechnicus in mij dan ook graag willen doen. Door het op deze wijze te doen heb ik veel geleerd over de basis van IoT. Ik ben vooral onder de indruk van hoeveelheid software die beschikbaar is voor IoT projecten. Toen ik eraan begon voelde het ook een beetje als een jungle.
Wat betreft Github. Ik zal vanaf nu Github altijd gebruiken bij het schrijven van software, het is nog even wennen aan al de stappen die nodig zijn om een aanpassing toe te voegen. Maar het werkt zo fijn voor versie beheer. De Rapsberry pi kan ik nu ook toevoegen aan mijn arsenaal van micro controllers/computers.
