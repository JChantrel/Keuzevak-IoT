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

![](Images/Raspberry_Setup.jpeg)

# Thinger.io
