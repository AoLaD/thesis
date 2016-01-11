\label[SMAIN]
\chap Popis programových částí práce

\label[SRTEMS]
\sec RTEMS

The Real-Time Executive for Multiprocessor Systems or RTEMS is an open source Real Time Operating System (RTOS) that supports open standard application programming interfaces (API) such as POSIX. It is used in space flight, medical, networking and many more embedded devices using processor architectures including ARM, PowerPC, Intel, Blackfin, MIPS, Microblaze and more. Commercial support is available from US and European companies, and free support comes via the active global community. Major decisions about RTEMS are made by the core developers in concert with the user community, guided by the Mission Statement. We provide access to our development sources via a Git Repository (see these Instructions for details). We strive to provide regular, high quality releases, which we want to work well on a wide range of embedded targets using cross development from a variety of hosts including GNU/Linux distributions, MS Windows, BSDs, Solaris, and Mac OS. We encourage everyone to contribute changes and feedback to RTEMS.

\label[SLWIP]
\sec LwIP

Knihovna LwIP poskytuje implementaci protokulu TCP/IP vhodnou pro aplikace s omezeným množstvím paměti.

Knihovna LwIP je dostupná pod BSD licencí a je vhodná do aplikací využívajících jazyk C. Cílem projektu bylo poskytnout plnou podporu TCP/IP při co nejmenším využítí operační paměti. Knihovna je vhodná pro mikrokontroléry s více jak deseti kilobyty operační paměti a čtyřicetikilobyty paměti programu.

Knihovna LwIP je schopna funkce na různých operačních systémech pro mikrokontroléry. Stejně tak byla přizpůsobena rozličným hardwarovým platformám.

\label[SETH]
\sec ETHERNET

Protože je implementace Ethernetu jedním z požadavků, poskytuje následující kapitola alespoň stručnou teorii týkající se tohoto tématu.
Jsou zde rozebrány i protokoly vyšších vrstev, které s Ethernetem souvisí.

\secc Co je ethernet

Ethernet je širokopásmový komunikační systém určený k přenosu datagramů (packetů) přes lokální síť.

Počátky Ethernetu sahají do 70. let minulého století, kdy s jeho vývojem započala firma Xerox.
Na této prvotní verzi se spolu s firmou Xerox dále podílely firmy DEC a Intel.
První standardizace byla provedena organizací IEEE pod označením 802.3 (následně pak organizací ISO jako 8802.3).

Jako přenosové médium se dnes používají převážně kabely s kroucenou dvojlinkou a optické kabely s přenosovou rychlostí od 10Mbit/s až po 100Gbit/s.

\secc ISO/OSI model

Nejpoužívanějším referenčním modelem v dnešní době je referenční model ISO/OSI popsaný v následující kapitole.

Základem chápání ethernetu je jeho rozdělení do jednotlivých vrstev.
K tomu slouží referenční model ISO/OSI.
Jedná se o referenční model otevřené komunikace, odtud potom zkratka OSI znamenající Open Systems Interconnection.
Jelikož samotný referenční model je velmi rozsáhlý a vydal by za sepsání několika samostatných svazků, uvádím v této práci pouze nezbytný přehled.

\secc Vrstvy

Referenční model ISO/OSI definuje následující vrstvy:

fyzická vrstva, spojová vrstva, síťová vrstva, transportní vrstva, relační vrstva, prezentační vrstva, aplikační vrstva

Díky rozdělení ethernetu do jednotlivých vrstev je možné stanovit podmínky, za kterých je možné spolehlivě komunikovat mezi sebou po sériové sběrnici.
Model je tvořen sedmi vrstvami, z nichž každá plní svoji předem definovanou funkci a službu.
V referenčním modelu je vysvětleno jak se zpracovává odesílaná a přijímaná zpráva postupně po vrstvách od odesílatele až k příjemci.
K samotnému přenosu informace dochází přes fyzický spoj.
Účastníci komunikace, kteří spolu komunikují na aplikační vrstvě nemají žádné informace o funkci nižších vrstev.
Každá z vrstev má definována pravidla, která řídí komunikaci mezi účastníky (zahájení, provedení, ukončení přenosu).

Vazba každé vrstvy je omezena na jednu nižší vrstvu a jednu vyšší vrstvu (pokud existují).
Každá vrstva poskytuje své funkce nejbližší vyšší vrstvě přes softwarové rozhraní realizované jako komunikační protokol.
To lze chápat jako soubor pravidel pro komunikaci.

\secc Fyzická vrstva

Fyzická vrstva je základní vrstvou referenčního modelu ISO/OSI.
Fyzická vrstva je tvořena

logickou sběrnicí, po které jsou datové pakety přenášeny směrem ke všem účastníkům

komunikace.
Datové pakety jsou však určeny pouze těm, jejichž adresa je uvedena v adresovém poli přenášeného rámce.
Fyzická vrstva definuje rozložení pinů, použité konektory, napěťové úrovně, vlastnosti a specifikace kabelů, elektrické vlastnosti přenosového média i jeho mechanické vlastnosti.

\secc Spojová vrstva

Jelikož síť je obecně využívána mnoha zařízeními od různých výrobců, je každé ethernetové rozhraní těchto zařízení označeno unikátní adresou nazývanou MAC (z anglického „Media Access Control“), často označovanou také jako fyzická adresa.
MAC adresa je přiřazována síťové kartě bezprostředně při její výrobě.
Ethernetová MAC adresa se skládá z 48bitů převážně zapisovaných ve formátu hexadecimálních čísel 00-00-00-00-00-ab.
Důležité je, aby MAC adresa byla celosvětově jedinečná.
První polovinu MAC adresy přiřazuje centrální správce adresního prostoru, druhou polovinu MAC adresy zajišťuje přímo výrobce.

Spojová vrstva zajišťuje přenos dat v rámci jedné lokální sítě právě pomocí fyzických adres zařízení.
Jednotlivé bity přenášeného rámce se přenášejí po bitech po fyzickém médiu, samotnému přenosu informačních bitů pak předchází startovací posloupnost.
Startovací posloupnost, označovaná také jako preambule (sekvence střídajících se jedniček a nul), slouží k synchronizaci vysílací stanice a všech přijímacích stanic.
Datový rámec obsahuje adresu příjemce, odesílatele, typ zprávy, samotná data a kontrolní součet.

Spojová vrstva dále definuje přístupovou metodu k přenosovému médiu (kabelu).
Jelikož je přenosové médium sdíleno několika stanicemi, které mohou ve stejnou chvíli začít vysílat, je třeba definovat pravidla přístupu k tomuto přenosovému médiu.
Nejznámější přístupovou metodou je CSMA/CD (Carrier Sense Multiple Access/Collision Detection).
Každý z účastníků komunikace má v tomto případě stejné právo využít sdílené přenosové médium v jakémkoli okamžiku, kdy je médium nevyužito.
Pokud se však dvě zařízení rozhodnou odeslat data ve stejný okamžik dojde ke kolizi.
Pokud stanice detekují kolizi, vyšle signál JAM, kterým ohlásí i ostatním stanicím, že došlo ke kolizi a po náhodném čase vysílání opakuje, pokud je sdílené médium volné k použití.
Modernější varianty ethernetu však od sdíleného média a tedy od přístupové metody CSMA/CD ustupují a využívají přepínače s plně duplexním režimem provozu.

\secc Síťová vrstva

Úkolem síťové vrstvy (network layer) je zajistit především síťovou adresaci, směrování a předávání

Dat (datagramů).
Síťová vrstva je pak schopna přenášet data v jedné síti nebo mezi vícero sítěmi i technologicky rozdílných.

Předávání dat mezi jednotlivými sítěmi je obstaráno systémem bran a směrovačů.
Na síťové vrstvě pracuje množství protokolů.
Nejdůležitější z nich jsou Internet Protocol (IP), Internet Control Message Protocol (ICMP), NWLink, IPX

\secc IP protokol

Internet Protocol je zodpovědný za směrování datagramů (paketů) ze zdrojového zařízení do cílového zařízení přes jednu nebo více IP sítí.
Datagram se skládá z řídících dat a z uživatelských dat.
Řídící data zajišťují informace k doručení datagramů (adresu zdroje a cíle, kontrolní součty, informace o pořadí atd.).

Datagramy putují sítí zcela nezávisle.
IP protokol v doručování datagramů používá nespolehlivé spojení (službu).
To znamená, že všechny zařízení na síti se snaží datagram doručit do cíle podle svých možností, ale prakticky za nic neručí.

Datagram vůbec nemusí dorazit na místo určení, nebo může dorazit vícekrát a neručí se ani za pořadí doručených datagramů.

\secc ICMP

ICMP(anglicky Internet Control Message Protocol) se používá pro odeslání chybových zpráv, nebo za účelem diagnostiky sítě či směrování datagramů.

\secc Transportní vrstva

Účelem transportní vrstvy je zajistit spolehlivý přenos dat s požadovanou kvalitou spojení pro uživatelské počítačové programy.
Úkolem transportní vrstvy je doručit data k požadovanému aplikačnímu procesu na cílovém zařízení.
Mezi dvěma zařízeními může v jeden okamžik vzniknout několik spojení.

Identifikační adresa aplikačního procesu je tvořena zdrojovou adresou, cílovou adresou a číslem portu a je známa pod pojmem Socket.

Transportní vrstva obsahuje, jak jinak, větší množství protokolů.
Zde uvedeme jen dva protokoly a to TCP a UDP.

\secc TCP (Transmission Control Protocol)

Jeden z nejvíce využívaných protokolů v transportní vrstvě je TCP (Transmission Control Protocol).TCP protokol zajišťuje vytvoření spojení mezi dvěma zařízeními v síti, přes které obě zařízení mohou obousměrně komunikovat.
TCP protokol garantuje spolehlivý (bezchybný) přenos datagramů a to i ve správném pořadí.

\secc UDP (User Datagram Protocol)

UDP je jednodušší protokol založený na odesílání nezávislých zpráv.
Na rozdíl od TCP protokolu nevyžaduje UDP protokol sestavení přenosového kanálu.
Nepožaduje zajištění spolehlivého přenosu datagramů, ani jejich správné pořadí příjmu.
Hlavní výhodou UDP protokolu je jeho malá náročnost.
UDP protokol je zejména vhodný pro nasazení u časově kritických aplikací a u aplikací, které pracují systémem otázka – odpověď (DNS, SNMP, DHCP atd.).

\secc Prezentační vrstva (presentation layer)

{ \bf Úkolem prezentační vrstvy je transformovat data do tvaru, které používají aplikace.}

\secc Aplikační vrstva ( application layer)

Účelem aplikační vrstvy je poskytnout aplikacím přístup ke komunikačnímu systému a umožnit tak jejich spolupráci.

Na rozdíl od prezentační vrstvy, která se nezabývá vlastním významem přenášených dat, jsou

právě tyto informace aplikační vrstvou rozeznávány.

Stejně jako na nižších vrstvách i na aplikační vrstvě se můžeme setkat s různými protokoly.
Tyto protokoly mohou být vázány ke konkrétní aplikaci, ale existují i aplikační protokoly, které jsou v některých případech nezbytné pro správný chod sítě a s aplikací běžící na aplikační vrstvě nemají nic společného.
Případem takového protokolu je například DHCP protokol (Dynamic Host Configuration Protocol).
Dalšími známějšími protokoly aplikační vrstvy jsou protokoly HTTP, IMAP, SSH, POP3 a další.



















