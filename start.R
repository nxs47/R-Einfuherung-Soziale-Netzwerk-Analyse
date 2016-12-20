# R - Einführung in R & Kleine Einführung in die Netzwerkanalyse mit R
# Version 1.0.0
#
# von 
# Michael Kronenwett (http://www.kronenwett-adolphs.com)
# Till Krenz (https://github.com/tilltnet)
#
# R (http://www.r-project.org/) ist eine freie und quelloffene Software, die viele Möglichkeiten für statistische Analysen 
# und graphische Darstellungen bereithält. Die Grundinstallation von R kann durch Pakete (Libraries) erweitert werden. 
# Die Steuerung von R erfolgt über eine Skriptsprache (wie z.B. die Syntax in SPSS). Dies bringt bekannte Vorteile 
# (Nachvollziehbarkeit, Transparenz, Reproduzierbarkeit) mit sich, verlangt von der Wissenschaftler*In aber auch, 
# dass diese sich in die Skriptsprache einarbeitet.
# Dieses Skript gibt eine kurze Einführung in die Funktionsweise von R, es werden die Grundlegenden Datenformate 
# eingeübt sowie einfach statistische Verfahren und das Installieren und Laden von Paketen und Daten demonstriert.
# Es wird die Verwendung der R-Studio (http://www.r-studio.org) Oberfläche empfohlen, das Skript funktioniert aber 
# auch mit dem herkömlichen R-GUI und anderen Oberflächen.


# Inhalt
# 1. R als Taschenrechner mit Variablenfunktion
# 2. Arbeiten und rechnen mit Vektoren
# 3. Matrizen und Datensätze
# 4. Datenselektion, Schleifen und Kreuztabellen
# 5. Häufigkeits- und Kreuztabellen
# 6. Netzwerkanalyse mit R (Package: network)
# 7. Netzwerkmaßzahlen (Package: sna)
# 8. Netzwerkgraphen plotten
# 9. Karten

# Achtung: Zeilen die mit einer Raute '#' anfangen, werden bei der Ausführung von R ignoriert.



#################################################
# 1. R als Taschenrechner mit Variablenfunktion #
#################################################

# Die Folgenden Eingaben demonstrieren auf einfache Weise, wie mit R gerechnet werden kann. Markieren Sie die drei Zeilen und klicken Sie oben rechts auf 'Run'.
4 + 3 + 2.5 # Achtung! Statt einem Komma (,) wird zu Trennung der Dezimalstellen ein Punkt (.) verwendet (englische Notation).
12 * 13
5 * pi

# Überlegen Sie sich zwei eigene Rechnungen, die Sie von R durchführen lassen und kommentieren Sie diese jeweils.
9 / 4 + 3 * 2 - 5 # 1
(3 - 1)/ 2  # 2

# Die Ausgaben von R können auch in Variablen umgelenkt werden. Dazu wird ein Varialbenname angegeben 
# und dahinter ein '<-' verwendet.
jahrgang <- 1984
jahr <- 2015
alter <- jahr - jahrgang
alter

# Übung: Wieviel muss eine Person bezahlen, die fünf Kuchenstücke zu je 2,10 EUR kauft? Hinterlegen Sie 
# zunächst die einzelnen Werte in Variablen bevor sie den Gesamtpreis berechnen
anzahl <- 5
preis_pro_stueck <- 2.1
preis <- anzahl * preis_pro_stueck
preis # Ausgabe des Ergebnis.



########################################
# 2. Arbeiten und rechnen mit Vektoren #
########################################

# Vektoren dienen dazu mehrere Werte einer Eigenschaft abzuspeichern. z.B. das Alter mehrerer Personen.
# Mit der Funktion c() kann ein Vektor erstellt werden:
alter.personen <- c(34,25,50,40)

# c() steht für 'concatenate'/ 'combine' (=Aneinanderhängen); die Werte werden von Komata getrennt eingegeben 
# und müssen alle vom selben Typ (numeric/ factor/ string) sein.
# Viele Funktionen in R können Vektoren als Parameter verarbeiten:
length(alter.personen) # length() gibt die Anzahl der Elemente des übergebenen Objekts aus.
sum(alter.personen) # sum() summiert die Werte eines Objektes auf.
sum(alter.personen) / length(alter.personen) # Durch das aufsummieren der Werte für das Alter der Personen und die Division des Ergebnis durch die Länge des Vektors erhalten wir ...(?).

# Um die Dokumentation zu einer Funktion zu erhalten kann der help() Befehl verwendet werden.
help(c)
# In R-Studio kann zudem mit der 'F1'-Taste die Dokumentation des aktuell markierten Befehls aufgerufen werden. 

# Mit Vektoren können auch Rechenoperationen durchgeführt werden.
alter.personen / 2 # gibt einen Vektor aus, der jeweils das halbierte alter der Personen enthält.
alter.personen * alter.personen # gibt einen Vektor mit dem jeweils quadrierten Alter der Personen aus. Bei Rechenoperationen, bei denen zwei Vektoren unterschiedlicher Länge kombiniert werden, wird der kürzere so lange erneut durchlaufen, bis alle Elemente des größeren Vektors abgearbeitet wurden.

# Übung: Fünf Personen kaufen eine unterschiedliche Anzahl Kuchenstücke zum Preis von je 2,10 EUR.
# Peter 3 Stücke, Anna 2 Stücke, Frau Müller 4 Stücke, Karl 1 Stück, Christina 3 Stücke: c(3, 2, 4, 1, 3) 
# Wieviel hat der Kuchenverkäufer eingenommen?
anz_stueck_person <- c(3, 2, 4, 1, 3)
summe_stuecke <- sum(anz_stueck_person)
gesamtpreis <- summe_stuecke * preis_pro_stueck
gesamtpreis # Ausgabe des Ergebnis.

# Übung: Peter, Anna und Frau Müller müssen nach dem Essen der vielen Kuchenstücke ein bisschen Sport treiben. 
#Am Montag joggt Peter 7 km, Anna fährt 12 km mit dem Fahrrad und Frau Müller macht einen ausgedehnten 
#Spaziergang von 4 km. Am Dienstag treiben alle drei erneut etwas Sport und legen jeweils Strecken 
#von 9, 7 und 3 km zurück. Wieviele km legen die einzelnen Personen jeweils zurück und wie lang ist die 
#Strecke, die Peter, Anna und Frau Müller gemeinsam absolviert haben.
montag <- c(7,12,4)
dienstag <- c(9,7,3)
einzeln.km <- montag + dienstag
einzeln.km # Einzelne Ergebnisse für Peter, Anna und Frau Müller
gesamt.km <- sum(einzeln.km)
gesamt.km <- sum(montag + dienstag)
gesamt.km # Gesamte Strecke.

# Einzelne Einträge eines Vektors können durch die Angabe eines Index adressiert werden:
montag[1] #gibt die die Tageskilometer von Peter für Montag aus.
einzeln.km[3] # gibt die Länge der gesamten Strecke von Frau Müller aus.

# Die Werte eines Vektors können auf diese Weise auch überschrieben werden:
einzeln.km[2] <- 50 # setzt die Gesamtkilometer für Anna auf 50.
einzeln.km
##############################
# 3. Matrizen und Datensätze #
##############################

# Eine Matrix ist ein Datenobjekt, welches sich als eine zwei-dimensionale Tabelle mit eindeutig adressierbaren Zellen darstellt.
# Um eine Matrix in R zu erstellen, erzeugen wir zunächsten einen Vektor:
ein.vektor <- c(100, 200, 20, 30, 50, 120)

# Mit dem matrix() Befehl erzeigen wir aus dem Vektor nun eine Matrix 2 Zeilen und 3 Spalten.
eine.matrix <- matrix(ein.vektor, 2, 3)

# Wir geben unsere Matrix aus:
eine.matrix

# Da eine Matrix zwei-dimensional ist, müssen bei der Adressierung einzelner Elemnte zwei Werte, einer für die Zeile, einer für Spalte, angegeben werden.
eine.matrix[2,3]

# Übung: Setzen Sie die Zellen (1, 2) und (2, 2) in der Matrix eine.matrix auf den Wert 999.
eine.matrix[1, 2] <- 999
eine.matrix[2, 2] <- 999
eine.matrix # Ausgabe der modifizierten Matrix.

# Das Konzept eines Datensatzes, welcher in den Zeilen Fälle und in den Spalten Variablen unterschiedlicher Messniveaus enthält, wird in R 'dataframe' genannt. 
# Wir wollen nun einen Datensatz aus eine Datei laden.

# Zunächst setzen wir dazu das Verzeichnis, welches des Datensatz enthält, als unser Arbeitsverzeichnis (Working Directory).
setwd("V:\\woche\\uebungsdateien_gesamtnetzwerk\\R Daten")
getwd()# gibt das aktuelle Arbeitsverzeichnis aus.

# Daten aus der Datei in eine neue Variable einlesen
schulnoten <- read.table("Schulnote.txt")

# names() gibt die Namen der Varialben aus.
names(schulnoten)

# Das Geschlecht aus einer Datei einlesen
geschlecht <- read.table("Geschlecht.txt")

# Mit den Befehlen View() und edit() kann eine Inspektion der Daten vorgenommen werden. edit() erlaubt zusätzlich das bearbeiten der einzelnen Zellen.
View(geschlecht)
edit(schulnoten)

# Wenn zwei Objekte die selbe Länge aufweisen, können diese zu einem Dataframe zusammengefügt werden. Hier kann dies genutzt werden, um die Notenliste um die Information über das Geschlecht der Schüler zu ergänzen.
mdata <- data.frame(schulnoten, geschlecht)
names(mdata) <- c("Noten", "Geschlecht")
View(mdata)

# Einzelne Variablen können auf unterschiedliche Weise adressiert werden:
mdata$Noten
mdata[,1] 

# mit write.csv2() kann das neue dataframe/ der neue Datensatz in einer csv-Datei abgspeichert werden.
write.csv2(mdata, "mdata.txt")



###################################
# 4. Datenselektion und Schleifen #
###################################

# Mit logischen Bedingungen können bestimmte Werte aus einem Datenobjekt herausgefiltert werden.
# Ein paar Beispiele, die auf die oben erstellten Datenobjekte zurückgreifen:
ein.vektor[ein.vektor < 100] # zeigt nur die Elemente aus ein.vektor, die kleiner 100 sind.
mdata[mdata$Geschlecht == 1, ] # zeigt nur die Noten aller weiblichen Schüler an.
mdata[mdata$Geschlecht == 1 & mdata$Noten == 2, ] # Logische Bedingungen können mit '&' (und), '|' (oder) verknüpft werden.
mdata[!mdata$Noten == 4, ] # '!' negiert eine logische Bedingungen. In diesem Fall werden also nur die Schüler berücksichtigt, die keine sechs in Mathe haben.


# Schleifen sind sehr hilfreich, wenn eine Aktion wiederholt durchgeführt werden soll.
# Eine einfache Variante ist das Durchlaufen der Elemtnte eines Vektors mit Hilfe einer for()-Schleife.
zaehl.vektor <- c("R", "ist", "ganz", "ganz", "toll", "!")

for(zaehler in 1:6) {
  print(zaehler)
  print(zaehl.vektor[zaehler])
}

# Übung: Schreiben Sie eine Schleife, die einen String Vektor 10 Mal durchläuft und den Inhalt ausgibt.
... {
  ...
  ...
}


#####################################
# 5. Häufigkeits- und Kreuztabellen #
#####################################

# Absolute Häufigkeiten einer Variable können mit table() ausgegeben werden.
table(schulnoten$mathe)

# Kreuztabellen mit absoluten Häufigkeiten ebenso:
table(mdata$Noten, mdata$Geschlecht)

# Das Paket 'descr' stellt Befehle für die Ausgabe von Häufigkeits- und Kreuztabellen mit Zahlreichen Optionen zur Verfügung.
# install.packages("descr") # Auskommentierung entfernen und Zeile ausführen, wenn 'descr' noch nicht installiert ist.

# Um die Befehle von descr für die aktuelle R-Sessions zur Verfügung zu stellen muss das Paket mit library() geladen werden.
library(descr)

freq(mdata$Noten, y.axis = "percent")
crosstab(mdata$Noten, mdata$Geschlecht, prop.c = T, chisq = T)



####################################################
# 6. Netzwerkanalyse in R (packages: network) #
####################################################

# Installieren und Laden des 'network' Paketes.
# In R-Studio kan im Help Fenster das Tab 'Packages' angewählt werden, um über den 'Install' Knopf Pakete zu installieren.
# install.packages("network")
library(network)

help(network)

# Netzwerkobjekt mit 5 Knoten anlegen
net <- network.initialize(5)
net

#
par(mfrow = c(1, 4))

#Netzwerkgraph ausgeben
plot(net, label = network.vertex.names(net))

# Kanten können auf unterschiedliche Weisen hinzugefügt werden.
# mit add.edge()
add.edge(net, 2, 5)
plot(net, label = network.vertex.names(net))

# oder über die Adressierung des []-Index
net[3,2] <- 1 
plot(net, label = network.vertex.names(net))
net[,2] <- 1
plot(net, label = network.vertex.names(net))

# Netzwerk in Matrixform ausgeben
net[,]

# Kanten löschen.
delete.edges(net, 1)

# Netzwerkdaten laden
pfad <- "Schulklasse.net"
net <- read.paj(pfad)

# Zusammenfassung allgemeiner Netzwerkdaten
summary(net)

# Beziehungsmatrix anzeigen
net[,]

par(mfrow = c(1,1))

# Netzwerkplot
plot(net)



#######################################
# 7. Netzwerkmaßzahlen (Package: sna) #
#######################################

# install.packages('sna')
library(sna)

# Degree
degreev <- degree(net)
degreev

# Betweenness
betweennessv <- betweenness(net)
betweennessv

# Dyadenzensus
dyad.census(net)

# Triadenzensus
triad.census(net)

# Zentralisierung. help(centralization) für weitere Informationen! 
centralization(net, g = 1, degree, cmode = "indegree")

# Akteursattribute einlesen: Geschlecht
geschlecht <- read.table("Geschlecht.txt")
geschlechtv <- as.vector(geschlecht$V1)

# Akteursattribute einlesen: Schulnoten
schulnoten <- read.table("Schulnote.txt")
schulnotenv <- as.vector(schulnoten$V1)

# Erzeugen einer Übersichtstabelle mit Netzwerkmaßen.
sumTable <- data.frame(name = network.vertex.names(net),
                       note = schulnotenv,
                       geschlecht = geschlechtv,
                       degree = degreev,
                       outdegree = degree(net, cmode="outdegree"),
                       indegree = degree(net, cmode="indegree"),
                       betweenness = round(betweennessv, digits = 2))
sumTable
summary(sumTable)

# Netzwerkgraph zeichnen. help(plot.network) zeigt die zahlreichen Möglichkeiten zur Manipulation der Netzwerkdarstellung auf.
plot.network(net)

# windows() öffnet ein Extra Fenster für das plotten von Diagrammen, für Max/ Linux lautet der Befehl X11(). Alle plot Befehle nach windows() werden in diesem Fenster dargestellt. Mit dev.off() kann dieses wieder geschlossen werden. Zum direkten exportieren der Grafiken siehe help(png) - ist genauso zu verwenden wie windows() inklusive dev.off().
windows()

# Netzwerkgraph zeichnen, Knotengroesse abhaengig von Betweenness-Wert

plot(net, vertex.cex = betweennessv)

# Normalisieren
betweennessv_n <- betweennessv / 100

# Netzwerkgraph zeichnen, Knotengroesse abhaengig von Betweenness-Wert
plot(net, vertex.cex = betweennessv_n)

# Knotenfarbe abhaengig vom Geschlecht
plot(net, vertex.cex = 2, vertex.col = geschlechtv)

# Knotengröße abhängig von der Note.
plot(net, vertex.cex = schulnotenv, vertex.col = geschlechtv)

plot(net, vertex.cex = degree(net)/2, vertex.col= geschlechtv)

help(gplot.layout)

# Circle-Layout
plot(net, vertex.cex = schulnotenv, vertex.col = geschlechtv, coord = gplot.layout.circle(net))

# Fruchtermanreingold
plot(net, vertex.cex = schulnotenv, label = network.vertex.names(net),
     vertex.col = geschlechtv, coord = gplot.layout.fruchtermanreingold(net, NULL))

# Grafik Device (windows() oder png()) schließen:
dev.off()



#Punkte auf Karte einzeichnen
require(ggmap)
library(ggplot2)
library(grid)

#longitude = geographische Länge
#latitude = geographische Breite

lat=c(49.746933428439, 49.745730608033)
lon=c(6.6877313224789, 6.6859396068569)
sizenum=c(5, 10)
d<-data.frame(lat=lat,lon=lon)

#load the google map
map <- get_map(location = 'university trier',zoom=17,maptype="roadmap",color="color",source="google")

#display the map
p<-ggmap(map, extent = "device")
p <-  p + geom_point(data=d, aes(x=lon, y=lat),size=sizenum)
p