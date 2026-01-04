
# Telepromter Ügyfélszegmentáció és Konverzió Előrejelzés

Ez a projekt egy Telepromter alkalmazás felhasználói adatainak elemzését, szegmentálását és a fizetős előfizetésre való konvertálás előrejelzését tűzte ki célul gépi tanulási (ML) módszerek segítségével.

## 🎯 Projekt Célkitűzések

A projekt három fő pillérre épül:

1. 
**Szegmentálás:** A felhasználók megismerése és csoportosítása (klaszterezés) közös ismérveik alapján.


2. 
**Osztályozás:** A felhasználók kategorizálása konvertált (vásárló) és nem konvertált csoportokba.


3. 
**Predikció:** A konverzió valószínűségének előrejelzése, különös tekintettel a korai (próbaidőszak alatti) fázisra.



## 📊 Adatelőkészítés és Feltáró Elemzés

Az elemzés során a következő lépések történtek:


**Adattisztítás:** Minimális NA-kezelés, az adathalmazra nem jellemzőek az outlier-ek.


  
**Változók:** 66 funkció- vagy eseménycsoport kialakítása a honlap funkciólistája alapján.


  
**Fókusz:** Az elemzés a próbaidőszakot megkezdett és lezárt (konvertált vagy lemorzsolódott) felhasználókra koncentrált.


  
**Megállapítás:** A konvertált felhasználók körében kiemelkedően magas (legalább ezer esemény és +15% relatív gyakoriság) bizonyos funkciók használata, amikre a fejlesztés során érdemes hangsúlyt fektetni.



## 🧪 Alkalmazott Modellek

### 1. Klaszterezés (K-means)


**Módszer:** KNN módszer Standard Scaler használatával.


**Eredmény:** Az "elbow" módszer alapján 5 klaszter került meghatározásra.


* **Kiemelt szegmensek:**
  
**1-es klaszter:** Gyakori belépés, alapfunkciók használata (USA, Ukrajna, Brazília túlsúly).



**4-es klaszter:** Intenzív használat (recording, script generation), egyedi beállítások, Live stream használat.





### 2. Osztályozás (Classification)

Három fő algoritmus került tesztelésre: **Logisztikus regresszió, Random Forest és Gradient Boosting**.


**Kezdeti eredmények:** Jó accuracy (85%), de gyenge recall (33%) a konvertált osztályban az adatok kiegyensúlyozatlansága miatt.


  
**Optimalizáció:** A hiba-súlyozás (compute_sample_weight) jelentősen javította a recall-t (74%-ra), elfogadható AUROC (0,85) mellett.



## 📈 Főbb Megállapítások

* A **konverzió legfőbb jelzői**: az operációs rendszer verziója, az ország, a script funkciók aktív használata és a videofelvétel funkciók.


  
**Early Prediction:** Már a próbaidőszak alatt azonosíthatók a "billegő" felhasználók, akiknél egyedi ajánlatokkal (pl. díjcsökkentés, próbaidőszak hosszabbítás) növelhető a konverzió.



## 🚀 Továbbfejlesztési Lehetőségek

* Változók magyarázó erejének pontosabb mérése (Gini, IV, WOE).


* Feature selection finomítása és a technikai események szigorúbb szűrése.


* Viselkedési mutatók (időbeli gyakoriság) beépítése a modellekbe.

