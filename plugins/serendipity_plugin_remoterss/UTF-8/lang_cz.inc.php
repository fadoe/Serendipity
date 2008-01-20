<?php # $Id: lang_cz.inc.php 1427 2007-12-20 00:43:00 VladaAjgl $

/**
 *  @version $Revision: 1427 $
 *  @author Vladimír Ajgl <vlada@ajgl.cz>
 *  EN-Revision: Revision of lang_en.inc.php
 */

@define('PLUGIN_REMOTERSS_TITLE',                   'Cizí RSS/OPML kanál');
@define('PLUGIN_REMOTERSS_BLAHBLAH',                'Zobrazuje položky z cizího RSS/OPML kanálu (například Blogroll)');
@define('PLUGIN_REMOTERSS_NUMBER',                  'Počet příspěvků');
@define('PLUGIN_REMOTERSS_NUMBER_BLAHBLAH',         'Kolik příspěvků z RSS kanálu má být zobrazeno? (Přednastaveno: 0 = všechny příspěvky RSS kanálu)');
@define('PLUGIN_REMOTERSS_SIDEBARTITLE',            'Nadpis RSS kanálu');
@define('PLUGIN_REMOTERSS_SIDEBARTITLE_BLAHBLAH',   'Nadpis bloku v postranním sloupci s cizím RSS kanálem');
@define('PLUGIN_REMOTERSS_RSSURI',                  'RSS/OPML URI');
@define('PLUGIN_REMOTERSS_RSSURI_BLAHBLAH',         'URI adresa RSS/OPML kanálu, který chcete zobrazit');
@define('PLUGIN_REMOTERSS_NOURI',                   'Žádný RSS/OPML kanál nebyl vybrán');
@define('PLUGIN_REMOTERSS_RSSTARGET',               'RSS/OPML cíl odkazů');
@define('PLUGIN_REMOTERSS_RSSTARGET_BLAHBLAH',      'Cíl (target) odkazů z RSS kanálu. Tedy do jakého okna se mají odkazy otevírat. (Přednastaveno: _blank = nové okno)');
@define('PLUGIN_REMOTERSS_CACHETIME',               'Jak často aktualizovat RSS kanál?');
@define('PLUGIN_REMOTERSS_CACHETIME_BLAHBLAH',      'Obsah RSS kanálu je uchováván v cachi a je aktualizován pouze pokud je starší než X vteřin (Přednastaveno: 3 hodiny)');
@define('PLUGIN_REMOTERSS_FEEDTYPE',                'Typ kanálu');
@define('PLUGIN_REMOTERSS_FEEDTYPE_BLAHBLAH',       'Vyberte typ zobrazovaného kanálu');
@define('PLUGIN_REMOTERSS_BULLETIMG',               'Odrážka');
@define('PLUGIN_REMOTERSS_BULLETIMG_BLAHBLAH',      'Obrázek, který se má zobrazit před každým nadpisem z RSS');
@define('PLUGIN_REMOTERSS_DISPLAYDATE',             'Zobrazování data');
@define('PLUGIN_REMOTERSS_DISPLAYDATE_BLAHBLAH',    'Zobrazit pod nadpisem příspěvku datum?');

@define('PLUGIN_REMOTERSS_RSSLINK',                 'Používat RSS odkazy?');
@define('PLUGIN_REMOTERSS_RSSLINK_DESC',            'Mají být odkazy z RSS kanálu zobrazeny jako skutečné odkazy?');
@define('PLUGIN_REMOTERSS_RSSFIELD',                'Zobrazovaný element');
@define('PLUGIN_REMOTERSS_RSSFIELD_DESC',           'Který element RSS kanálu se má zobrazovat? (např. "title" = nadpis, "content:encoded" = tělo příspěvku, "description" = popis, ...)');
@define('PLUGIN_REMOTERSS_RSSESCAPE',               'Kódovat HTML výstup');
@define('PLUGIN_REMOTERSS_RSSESCAPE_DESC',          'Pokud je povoleno, HTML značky z RSS kanálu jsou kódovány. Pokud je tato volby zamítnuta, všechny HTML značky jsou v RSS kanálu ponechány a příslušně se zobrazují. Tato možnost představuje bezpečnostní riziku, pokud zobrazovaný RSS kanál není Váš nebo pokud mu stoprocentně nedůvěřujete!');

?>