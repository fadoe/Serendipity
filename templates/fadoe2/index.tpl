<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>

<div id="page">

    <div id="pageheader">
    
        <div id="HeadContainer">
        
            <div class="Head">
                <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle}</a></h1>
                <h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></h2>
            </div>
        
            <div class="NaviContainer">
        
                <div class="ListContainer">
            
                    <ul>
                        <li><a href="{$serendipityBaseURL}" title="Startseite" class="home">Startseite</a></li>
                        <li><a href="{$serendipityBaseURL}archives/" title="Archiv" class="archive">Archiv</a></li>
                    </ul>
                
                    <ul class="right">
                        <li><a href="{$serendipityBaseURL}admin" title="Login" class="admin">Admin</a></li>
                    </ul>
                
                </div><!-- /#ListContainer -->
            
            </div><!-- /#NaviContainer -->

            <div class="BreadcrumbContainer">
        
            </div><!-- /#BreadcrumbContainer -->

        </div><!-- /#HeadContainer -->

    </div><!-- /#pagehead -->

    <div id="pagemain">
    
        <div id="pagemain_main">
        
            <div id="pagemain_middle">
            
                {$CONTENT}
                
            </div><!-- /#pagemain_middle -->
            
            <div id="pagemain_left">
            
                {serendipity_printSidebar side="left"}
                
            </div><!-- /#pagemain_left -->
            
        </div><!-- /#pagemain_main -->
        
        <div id="pagemain_right">
        
            {serendipity_printSidebar side="right"}
        
        </div><!-- /#pagemain_right -->

{$raw_data}

{serendipity_hookPlugin hook="frontend_footer"}

    <div id="pagefooter">
        <p>&copy; 2009 Falk Döring | Template-Design mit freundlicher Hilfe von <a href="http://www.yellowled.de/">Yellowled</a></p>
    </div><!-- /#pagefooter -->

</div><!-- /#page -->

</body>
</html>
